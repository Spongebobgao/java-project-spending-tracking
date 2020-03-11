import java.sql.*;

public class DBConnection {
//	public static void main(String args[]){ 
//		try{  
//			Connection con=DriverManager.getConnection(  
//			"jdbc:mysql://localhost:3306/contactdb","root","password");  
//			 
//			Statement stmt=con.createStatement();  
//			ResultSet rs=stmt.executeQuery("select * from contact");  
//			while(rs.next())
//				System.out.println(rs.getString(2));  
//			con.close();  
//			}catch(Exception e){ 
//				System.out.println(e);}  
//		    }	
	public static Connection initialization() throws SQLException, ClassNotFoundException {
		// this try catch is important. this is to register the driver
		try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spending", "root", "password");
		return con;
	}
}
