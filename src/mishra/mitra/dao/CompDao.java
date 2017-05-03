package mishra.mitra.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import mishra.mitra.bean.Comp;
import mishra.mitra.bean.User;
import mishra.mitra.conn.DatabaseConn;

public class CompDao {

	public static int save(Comp c){  
	    int count=0;  
	    try{  
	        Connection con=DatabaseConn.getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        "insert into tbl_complaint(Comp_name,Comp_type,Comp_desc,Comp_dept,Comp_status,Comp_by,Assign_to) values(?,?,?,?,?,?,?)");
	        ps.setString(1, c.getName());
	        ps.setString(2, c.getType());
	        ps.setString(3, c.getDesc());  
	        ps.setString(4, c.getDept());
	        ps.setString(5, c.getStatus());
	        ps.setString(6, c.getCby());
	        ps.setString(7, c.getAssignTo());
	       // ps.setDate(8,(Date) c.getDate());
	        count=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return count;  
	}
	
	public static List<Comp> getAllRecords(){
		List<Comp> list=new ArrayList<Comp>();
		try{
			Connection con=DatabaseConn.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from tbl_complaint ");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Comp c=new Comp();
				c.setId(rs.getInt(1));
				c.setType(rs.getString(3));
				c.setName(rs.getString(2));
				c.setDept(rs.getString(5));
				c.setDesc(rs.getString(4));
				c.setStatus(rs.getString(6));
				c.setCby(rs.getString(7));
				c.setAssignTo(rs.getString(9));
				list.add(c);
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
		return list;
		
	}
	
	
	public static Comp getRecordById(int id){
		Comp c=null;
		try{
			Connection con=DatabaseConn.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from tbl_complaint where Comp_id=?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				c=new Comp();
				c.setId(rs.getInt("Comp_id"));
				c.setName(rs.getString("Comp_name"));
				c.setType(rs.getString("Comp_type"));
				c.setStatus(rs.getString("Comp_status"));
				c.setDept(rs.getString("Comp_dept"));
				c.setDesc(rs.getString("Comp_desc"));
				c.setAssignTo(rs.getString("Assign_to"));
				c.setCby(rs.getString("Comp_by"));
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return c;
	}
	public static int update(Comp c){  
	    int status=0;  
	    try{  
	        Connection con=DatabaseConn.getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"update tbl_complaint set Comp_name=?,Comp_type=?,Comp_desc=?,Comp_dept=?,Comp_status=?,Comp_by=?,Assign_to=? where Comp_id=?");  
	        ps.setString(1,c.getName());
	        ps.setString(2, c.getType());
	        ps.setString(3, c.getDesc());
	        ps.setString(4, c.getDept());
	        ps.setString(5, c.getStatus());
	        ps.setString(6, c.getCby());
	        ps.setString(7,c.getAssignTo());
	        ps.setInt(8, c.getId());
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	public static int delete(Comp c){  
	    int status=0;  
	    try{  
	        Connection con=DatabaseConn.getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from tbl_complaint where Comp_id=?");  
	        ps.setInt(1,c.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}
}
