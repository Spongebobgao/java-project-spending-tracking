
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mysql.jdbc.Statement;


/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		try {
			Connection con = DBConnection.initialization();
			Statement stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user");
			String name = request.getParameter("name");
			while (rs.next()) {
				if (rs.getString(2).contentEquals(name)) {
					request.setAttribute("errorMessage", "The user name is already exits!");
					request.getRequestDispatcher("/register.jsp").forward(request, response);
					// response.sendRedirect("register.jsp");
					return;
				}
			}
			String password = request.getParameter("password");
			password = BCrypt.hashpw(password, BCrypt.gensalt());
			stmt.execute("INSERT INTO user(name,password) values('" + name + "','" + password + "')");
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("total", 0);
			response.sendRedirect("info.jsp");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
