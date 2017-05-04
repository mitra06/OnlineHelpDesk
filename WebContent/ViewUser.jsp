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
<title>||Technician||</title>

</head>
<body>
<%@page import="mishra.mitra.dao.*,mishra.mitra.bean.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("login.html");
        }
        
        User u=UserDao.getRecordByUtype(email);
        String userType=u.getType();


			List<User> list=UserDao.getAllRecords();  
			request.setAttribute("list",list);
			
			
        %>
        <%=userType %>
        
<jsp:include page="navbar.jsp" />

<div class="container">
  
<h3 class="text-center text-danger"><u>User View</u></h3>
            
  <table class="table table-responsive">
    <thead style="background-color:#2ecc71;text-align:center;color:white;">
      <tr>
        <td><b>UId</b></td>
        <td><b>Name</b></td>
        <td><b>Email</b></td>
        <td><b>Password</b></td>
        <td><b>Department</b></td>
        <td><b>Status</b></td>
         <% if(userType.equals("admin")){%>
        <td><b>Delete</b></td>
        <%} %>
      </tr>
      </thead>
      
      	<tbody style="text-align:center;">
      <c:forEach items="${list}" var="u">
      <tr>
	        <td>${u.getId()}</td>
	        <td>${u.getName()}</td>
	        <td>${u.getEmail()}</td>
	        <td>${u.getPassword()}</td>
	        <td>${u.getDepartment()}</td>
	        <td>${u.getStatus() == 1 ? 'Active' : 'NotActive'}</td>
	        <% if(userType.equals("admin")){%>
	        <td><a href="DeleteUser.jsp?id=${u.getId()}"><span class="glyphicon glyphicon-remove"></span></a></td>
	        <%} %>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
	</div>
</body>
</html>