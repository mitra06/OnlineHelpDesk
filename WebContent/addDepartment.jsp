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
<title>Add||Department</title>

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
<h3 class="text-center"><u>Add Department</u></h3>
<form class="form-horizontal" action="addDept.jsp" method="post">
	<div class="form-group">
    <label class="col-sm-2 col-sm-offset-2 sr-only" for="name">Department Id</label>
    <div class="col-sm-4">
    	<input type="hidden" name="id" class="form-control" placeholder="Department Id"/>
    </div>
  </div>
  	<div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Department Name</label>
    <div class="col-sm-4">  
    <input type="text" name="name" class="form-control" placeholder="Department Name"/>
    
    </div>
  </div>
   <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Department Head</label>
    <div class="col-sm-4">
    <input type="text" name="dhead" class="form-control" placeholder="Department head">
    </div>
  </div>
   <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Department Status</label>
    <div class="col-sm-4">
    <select name="status" class="form-control" required>
    <option value="">Status</option>
    <option value="1">Active</option>
    <option value="0">DeActive</option>
    </select> 
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Department Description</label>
    <div class="col-sm-4"> 
      <textarea name="desc" class="form-control" id="desc" placeholder="Department Description" cols="5" rows="5" required></textarea>
    </div>
  </div>
  <div class="form-group"> 
    <div class=" col-sm-2 col-sm-offset-4">
      <input type="submit" class="form-control" name="add" value="AddDepartment">
  </div>
  <div class=" col-sm-1">
      <input type="reset" class="form-control" name="reset" value="Reset">
  </div>
  </div>
</form>
</div>
</body>
</html>