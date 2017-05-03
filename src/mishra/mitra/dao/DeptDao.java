package mishra.mitra.dao;
import java.sql.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import mishra.mitra.conn.*;
import mishra.mitra.bean.Department;
import mishra.mitra.bean.User;
public class DeptDao {
	public static int save(Department d){
		int count=0;
		try{
			Connection conn=DatabaseConn.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into tbl_department(Dept_name,Dept_desc,Dept_head,Dept_status) values(?,?,?,?)");
			ps.setString(1, d.getName());
			ps.setString(2, d.getDesc());
			ps.setString(3, d.getDhead());
			ps.setInt(4, d.getStatus());
			count=ps.executeUpdate();
		}catch(Exception e){
			
		}
		
		return count;
	}
	
	public static int update(Department d){
		int count=0;
		try{
			Connection conn=DatabaseConn.getConnection();
			PreparedStatement ps=conn.prepareStatement("update tbl_department set Dept_name=?,Dept_desc=?,Dept_head=?,Dept_status=? where Dept_id=?");
			ps.setString(1, d.getName());
			ps.setString(2, d.getDesc());
			ps.setString(3, d.getDhead());
			ps.setInt(4, d.getStatus());
			ps.setInt(5, d.getId());
			count=ps.executeUpdate();
		}catch(Exception e){
			
		}
			
		return count;
	}

	public static List<Department> getAllRecord(){
		List<Department> list=new ArrayList<Department>();
		try{
			Connection conn=DatabaseConn.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from tbl_department");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Department d=new Department();
				d.setId(rs.getInt("Dept_id"));
				d.setName(rs.getString("Dept_name"));
				d.setDesc(rs.getString("Dept_desc"));
				d.setDhead(rs.getString("Dept_head"));
				d.setStatus(rs.getInt("Dept_status"));
				list.add(d);
			}
		}catch(Exception e){
			
		}
		return list;
	}
	public static int delete(Department d){
		int count=0;
		try{
			Connection conn=DatabaseConn.getConnection();
			PreparedStatement ps=conn.prepareStatement("delete from tbl_department where Dept_id=?");
			ps.setInt(1, d.getId());
			count=ps.executeUpdate();
		}catch(Exception e){
			
		}
		return count;
		
	}
	public static Department getRecordByID(int id){
		Department d=null;
		try{
			Connection conn=DatabaseConn.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from tbl_department where Dept_id=? ");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				d=new Department();
				d.setId(rs.getInt("Dept_id"));
				d.setName(rs.getString("Dept_name"));
				d.setDesc(rs.getString("Dept_desc"));
				d.setDhead(rs.getString("Dept_head"));
				d.setStatus(rs.getInt("Dept_status"));
			}
		}catch(Exception e){
			
		}
		return d;
	}
}