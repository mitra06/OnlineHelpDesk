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
<%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("login.html");
        }
        %>

<jsp:include page="navbar.jsp" />
<div class="container">
  
<h3 class="text-center"><u>Track Complaints</u></h3>
            
  <table class="table table-bordered">
    
      <tr>
        <td>Sno</td>
        <td>Id</td>
        <td>Name</td>
        <td>Location</td>
        <td>Description</td>
        <td>Assigned To</td>
        <td>Status</td>
        <td>Edit</td>
        <td>Delete</td>
        
      </tr>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
        <td>July</td>
        <td><span class="glyphicon glyphicon-pencil"></span></td>
        <td><span class="glyphicon glyphicon-remove"></span></td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>