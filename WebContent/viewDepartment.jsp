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

			List<Department> list=DeptDao.getAllRecord();  
			request.setAttribute("list",list);
        %>
        
        
<jsp:include page="navbar.jsp" />

<div class="container">
  
<h3 class="text-center"><u>Department Listing</u></h3>
            
  <table class="table table-bordered">
    
      <tr>
        <td><b>DepartmentId</b></td>
        <td><b>DeaprtmentName</b></td>
        <td><b>DepartmentHead</b></td>
        <td><b>DepartmentStatus</b></td>
        <td><b>DepartmentDescription</b></td>
        <% if(userType.equals("admin")){%>
        <td><b>Edit</b></td>
        <td><b>Delete</b></td>
        <%} %>
      </tr>
      
      
      	
      <c:forEach items="${list}" var="d">
      <tr>
	        <td>${d.getId()}</td>
	        <td>${d.getName()}</td>
	        <td>${d.getDhead()}</td>
	        <td>${d.getStatus() == 1 ? 'Active' : 'DeActive'}</td>
	        <td>${d.getDesc()}</td>
	        <% if(userType.equals("admin")){%>
	        <td><a href="editDepartment.jsp?id=${d.getId()}"><span class="glyphicon glyphicon-pencil"></span></a></td>
	        <td><a href="deleteDepartment.jsp?id=${d.getId()}"><span class="glyphicon glyphicon-remove"></span></a></td>
	        <%} %>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
	</div>
</body>
</html>