

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class MoreInfo
 */
@WebServlet("/MoreInfo")
public class MoreInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoreInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			
			Connection con = DBConnection.initialization();
			Statement stmt = (Statement) con.createStatement();
			int month = Integer.parseInt(request.getParameter("month"));
			
			HttpSession session = request.getSession();
			session.setAttribute("month",month);
			int id =  Integer.valueOf(session.getAttribute("id").toString());
			ResultSet rs = stmt.executeQuery("select * from spendingdetail where userId='"+id+"'and MONTH(created)='"+month+"'");
			ArrayList<DbRows> oldspendings = new ArrayList<DbRows>();
			while(rs.next()) {
				oldspendings.add(new DbRows(rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6).substring(0, rs.getString(6).indexOf(" "))));
			}
			month++;
			rs = stmt.executeQuery("select * from monthly where userId='"+id+"'and MONTH(created)='"+ month +"'");
			if(rs.next()) {
				Float oldTotal = rs.getFloat(3);
				session.setAttribute("oldTotal",oldTotal);
			}
			session.setAttribute("oldspendings",oldspendings);
			session.setAttribute("chilcked", true);
	
			
			response.sendRedirect("moreInfo.jsp");
			}catch(Exception e){
				System.out.println(e);
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);		
	}

}
