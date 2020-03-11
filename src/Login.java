
import java.awt.List;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int count= 0;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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
		doGet(request, response);
		try {
			Connection con = DBConnection.initialization();
			Statement stmt = (Statement) con.createStatement();
			//check if today is the first day of the month. if it is, set total to default and insert value to another table
			if (Calendar.getInstance().get(Calendar.DAY_OF_MONTH) == 1&&count==0) {
				stmt.execute("INSERT INTO monthly (userId, total) SELECT id, total FROM user");
				stmt.execute("Update user set total=default(total)");				
				count=1;
				System.out.println("this worked again"+count);
			}
			if (Calendar.getInstance().get(Calendar.DAY_OF_MONTH) == 2){
				count=0;
			}
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			ResultSet rs = stmt.executeQuery("select * from user where name='" + name + "'");
			if (rs.next()) {
				if (BCrypt.checkpw(password, rs.getString(3))) {
					float total =rs.getFloat(4);
					total=round(total,2);
					HttpSession session = request.getSession();
					session.setAttribute("id",rs.getString(1));
					session.setAttribute("name", name);
					session.setAttribute("total", total);
					int id = Integer.valueOf(session.getAttribute("id").toString());
					int month=Calendar.getInstance().get(Calendar.MONTH)+1;
					int year = Calendar.getInstance().get(Calendar.YEAR);
					//get all the spendings of the current month
					rs = stmt.executeQuery("select * from spendingdetail where userId='" + id + "' and MONTH(created) = '"+month+"' and YEAR(created) ='"+year+"'");
					ArrayList<DbRows> spendings = new ArrayList<DbRows>();
					while(rs.next()) {
						spendings.add(new DbRows(rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6).substring(0, rs.getString(6).indexOf(" "))));
					}
					//get all the spendings for the past months
					rs = stmt.executeQuery("select * from monthly where userId='" + id + "' and YEAR(created) ='"+year+"'");
					ArrayList<DbRows> monthlyspending = new ArrayList<DbRows>();
					while(rs.next()) {
						//monthlyspending.add(new DbRows(rs.getString(3),null,null,rs.getString(4).split("-")[1]));
						monthlyspending.add(new DbRows(rs.getString(3),null,null,String.valueOf(Integer.valueOf(rs.getString(4).split("-")[1])-1)));
					}
					session.setAttribute("spendings", spendings);
					session.setAttribute("monthlyspending", monthlyspending);
					response.sendRedirect("info.jsp");
					return;
				}
			}else {
			
			// set error message and redirect to the original page
			request.setAttribute("errorMessage", "The user name or password is not correct!");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			// response.sendRedirect("login.jsp");
			con.close();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	public static float round(float d, int decimalPlace) {
        return BigDecimal.valueOf(d).setScale(decimalPlace,BigDecimal.ROUND_HALF_UP).floatValue();
   }

}
