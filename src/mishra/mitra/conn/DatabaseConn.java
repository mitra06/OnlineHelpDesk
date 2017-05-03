package mishra.mitra.conn;
import java.sql.*;
import java.sql.DriverManager;

public class DatabaseConn {

	public static Connection getConnection(){
		
		Connection con=null;
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/helpdesk","root","");
		}catch(Exception e){
			System.out.println(e);
		}
		return con;
	}
	
}
