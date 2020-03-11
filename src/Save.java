
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;


/**
 * Servlet implementation class Save
 */
@WebServlet("/Save")
public class Save extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Save() {
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
		doGet(request, response);
		try {
			Connection con = DBConnection.initialization();
			Statement stmt = (Statement) con.createStatement();
			HttpSession session = request.getSession();
			float newSpending = Float.valueOf(request.getParameter("newSpending"));
			if(newSpending!=0) {
				if(newSpending<0) {
					request.setAttribute("errorMessage", "The amount can not be negative!");
					request.getRequestDispatcher("/info.jsp").forward(request, response);
				}else {
					float amount = Float.valueOf(session.getAttribute("total").toString())
							+ newSpending;
					String name = session.getAttribute("name").toString();
					stmt.execute("update user set total='" + amount + "'where name='" + name + "'");
					int id = Integer.valueOf(session.getAttribute("id").toString());
					String purpose = request.getParameter("purpose");
					String modifiedPurpose=purpose.replaceAll("'", "''");
					String method = request.getParameter("method");
					stmt.executeUpdate("insert into spendingdetail(userId,spending,purpose,method) values ('"+id+"','"+newSpending+"','"+modifiedPurpose+"','"+method+"')");
					amount=round(amount,2);
					session.setAttribute("total", amount);
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					String formatted = df.format(new Date());
					@SuppressWarnings("unchecked")
					ArrayList<DbRows> spendings=(ArrayList<DbRows>)session.getAttribute("spendings");
					spendings.add(new DbRows(request.getParameter("newSpending"),purpose,method,formatted));
					session.setAttribute("spendings", spendings);
					response.sendRedirect("info.jsp");
				}
			}else {
			response.sendRedirect("info.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	public static float round(float d, int decimalPlace) {
        return BigDecimal.valueOf(d).setScale(decimalPlace,BigDecimal.ROUND_HALF_UP).floatValue();
   }

}
