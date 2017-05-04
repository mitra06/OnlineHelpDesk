package mishra.mitra.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import mishra.mitra.bean.Comp;
import mishra.mitra.bean.User;
import mishra.mitra.conn.DatabaseConn;
public class UserDao {


	public static int save(User u){  
	    int count=0;  
	    try{  
	        Connection con=DatabaseConn.getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into tbl_user(User_name,User_email,User_password,User_type,User_department,User_status) values(?,?,?,?,?,?)");
	        ps.setString(1, u.getName());
	        ps.setString(2,u.getEmail());
	        ps.setString(3,u.getPassword());  
	        ps.setString(4, u.getType());
	        ps.setString(5, u.getDepartment());
	        ps.setInt(6, u.getStatus());
	        count=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return count;  
	}
	public static boolean validate(User u){    
	    boolean count=false;  
	    try{  
	        Connection con=DatabaseConn.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from tbl_user where User_email=? && User_password=? && User_type=? ");  
	        ps.setString(1, u.getEmail());
	        ps.setString(2, u.getPassword());
	        ps.setString(3, u.getType());
	        ResultSet rs=ps.executeQuery();  
	        count=rs.next();
	        
	    }catch(Exception e){System.out.println(e);}  
	    return count;
	}  
	
	public static List<User> getAllRecords(){  
	    List<User> list=new ArrayList<User>();  
	      
	    try{  
	        Connection con=DatabaseConn.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from tbl_user");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            User u=new User();  
	            u.setId(rs.getInt("User_id"));  
	            u.setName(rs.getString("User_name"));
	            u.setDepartment(rs.getString("User_department"));
	            u.setEmail(rs.getString("User_email"));
	            u.setPassword(rs.getString("User_password"));
	            u.setStatus(rs.getInt("User_status"));
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}

	public static List<User> getAllTechnicians(){  
	    List<User> list=new ArrayList<User>();  
	      
	    try{  
	        Connection con=DatabaseConn.getConnection();  
	        Statement stmt=con.createStatement();
	        String sql="select * from tbl_user where User_type='technician'";
	        ResultSet rs=stmt.executeQuery(sql);
	        while(rs.next()){  
	            User u=new User();  
	            u.setId(rs.getInt("User_id"));  
	            u.setName(rs.getString("User_name"));
	            u.setDepartment(rs.getString("User_department"));
	            u.setEmail(rs.getString("User_email"));
	            u.setStatus(rs.getInt("User_status"));
	             
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}

	public static User getRecordByUtype(String email){
		
		User u=null;
		try{
			Connection con=DatabaseConn.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from tbl_user where User_email=?");
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
			u=new User();
			u.setName(rs.getString("User_name"));
			u.setDepartment(rs.getString("User_department"));
			u.setEmail(rs.getString("User_email"));
			u.setPassword(rs.getString("User_password"));
			u.setType(rs.getString("User_type"));
			}
		   }
		   catch(Exception e){}
			return u;
		
	}
	public static int deleteTechnician(User u){  
	    int status=0;  
	    try{  
	        Connection con=DatabaseConn.getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from tbl_user where User_id=? and User_type='technician'");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}
	public static int deleteUser(User u){  
	    int status=0;  
	    try{  
	        Connection con=DatabaseConn.getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from tbl_user where User_id=?");  
	        ps.setInt(1,u.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}
	public static int UpdateUser(User u){
		int count=0;
		try{
			Connection con=DatabaseConn.getConnection();
			PreparedStatement ps=con.prepareStatement("update tbl_user set User_name=?,User_password=?,User_department=? where user_email=?");
			ps.setString(1, u.getName());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getDepartment());
			ps.setString(4, u.getEmail());
			count=ps.executeUpdate();
		}catch(Exception e){
			System.out.println(e);
		}
		return count;
	}
}
