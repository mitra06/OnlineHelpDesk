<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<title>||HelpDesk||</title>

</head>
<body>
<%@page import="java.sql.*,mishra.mitra.dao.*,mishra.mitra.bean.*,mishra.mitra.conn.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("login.html");
        }
        

        User u=UserDao.getRecordByUtype(email);
        String userType=u.getType();

        
    


			List<Comp> list=CompDao.getAllRecords();  
			request.setAttribute("list",list);
        %>
        
        
<jsp:include page="navbar.jsp" />

<div class="container">
  
<h3 class="text-center"><u>Track Complaints</u></h3>
            
  <table class="table table-bordered">
    
      <tr>
        <td><b>CompId</b></td>
        <td><b>Name</b></td>
        <td><b>Department</b></td>
        <td><b>Description</b></td>
        <td><b>Complaint By</b></td>
        <td><b>Complaint Type</b></td>
        <td><b>Status</b></td>
        <td><b>Assign To</b></td>
        <td><b>Edit</b></td>
        <td><b>Delete</b></td>
        
      </tr>
      
      
      	
      
      
<%
		try{
		Connection con=DatabaseConn.getConnection();	
		PreparedStatement ps=null;
		if(userType.equals("admin")){
			ps=con.prepareStatement("SELECT * FROM `tbl_complaint`");
		}else{
		  ps=con.prepareStatement("SELECT * FROM `tbl_complaint` where Comp_dept IN (SELECT User_department from tbl_user WHERE User_email=?)");
		ps.setString(1, email);
		}
		ResultSet rs= ps.executeQuery();
		while(rs.next()){

%>
	  <tr>
	        <td><%= rs.getInt("Comp_id")%></td>
	        <td><%= rs.getString("Comp_name")%></td>
	        <td><%= rs.getString("Comp_dept")%></td>
	        <td><%= rs.getString("Comp_desc")%></td>
	        <td><%= rs.getString("Comp_by")%></td>
	        <td><%= rs.getString("Comp_type")%></td>
	        <td><%= rs.getString("Comp_status")%></td>
	        <td><%= rs.getString("Assign_to")%></td>
	        <td><a href="editComplaint.jsp?id=${c.getId()}"><span class="glyphicon glyphicon-pencil"></span></a></td>
	        <td><a href="deleteComp.jsp?id=${c.getId()}"><span class="glyphicon glyphicon-remove"></span></a></td>
	      <%}
		}catch(Exception e){
			System.out.println(e);
		}
		%>
	      </tr>
      
    </tbody>
  </table>
	</div>
</body>
</html>