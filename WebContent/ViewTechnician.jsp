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


			List<User> list=UserDao.getAllTechnicians();  
			request.setAttribute("list",list);
			
			
        %>
        <%=userType %>
        
<jsp:include page="navbar.jsp" />

<div class="container">
  
<h3 class="text-center"><u>Technician View</u></h3>
            
  <table class="table table-bordered">
    
      <tr>
        <td><b>TechId</b></td>
        <td><b>Name</b></td>
        <td><b>Email</b></td>
        <td><b>Department</b></td>
        <td><b>Status</b></td>
         <% if(userType.equals("admin")){%>
        <td><b>Edit</b></td>
        <td><b>Delete</b></td>
        <%} %>
      </tr>
      
      
      	
      <c:forEach items="${list}" var="u">
      <tr>
	        <td>${u.getId()}</td>
	        <td>${u.getName()}</td>
	        <td>${u.getEmail()}</td>
	        <td>${u.getDepartment()}</td>
	        <td>${u.getStatus() == 1 ? 'Active' : 'NotActive'}</td>
	        <% if(userType.equals("admin")){%>
	        <td><a href="editComplaint.jsp?id=${c.getId()}"><span class="glyphicon glyphicon-pencil"></span></a></td>
	        <td><a href="deleteComp.jsp?id=${c.getId()}"><span class="glyphicon glyphicon-remove"></span></a></td>
	        <%} %>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
	</div>
</body>
</html>