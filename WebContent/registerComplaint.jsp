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
<h3 class="text-center"><u>Register Your Complaint</u></h3>
<form class="form-horizontal" action="registerComp.jsp" method="post">
	<div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Category</label>
    <div class="col-sm-4"> 
    <select name="name" class="form-control" required>
    	<option value="">Select Category</option>
    	<option value="civilworks">Civil Works</option>
    	<option value="electrical">Electrical Works</option>
    	<option value="miscalleneous">Misc</option>
    </select>
      
    </div>
  </div>
  	<div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Type</label>
    <div class="col-sm-4"> 
    <select name="type" class="form-control" required>
    <option value="">Select Type</option>
    <option value="Urgent">Urgent</option>
    <option value="normal">Normal</option>
    </select>
    </div>
  </div>
    	<div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Department</label>
    <div class="col-sm-4">
    <select name="dept" class="form-control" required>
    <option value="">Select Department</option>
    <option value="civil">Civil Department</option>
    <option value="computerscienc">Computer Science</option>
    <option value="mechanical">Civil Department</option>
    <option value="electrical">Electrical Department</option>
    <option value="gymanisium">Civil Department</option>
    <option value="ec">Electronic Department</option>
    </select>
    </div>
  </div>
    	<div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Status</label>
    <div class="col-sm-4 "> 
     <select name="status" class="form-control" required>
    <option value="">Select Type</option>
    <option value="solved">Solved</option>
    <option value="working">Working</option>
    <option value="pending">Pending</option>
    </select>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint By</label>
    <div class="col-sm-4"> 
      <input type="text" name="cby" class="form-control" id="name" placeholder="Complaint By" value="<%=email%>" readonly>
    </div>
  </div>
    <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Date</label>
    <div class="col-sm-4"> 
      <input type="text" name="date" class="form-control" id="name" placeholder="Complaint Date" >
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Assigned Person</label>
    <div class="col-sm-4">
    <select name="assignTo" class="form-control" required>
    <option value="">Select Staff</option>
    <option value="solved">Sajan</option>
    <option value="working">Rajan</option>
    <option value="pending">Aashu</option>
    </select> 
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Description</label>
    <div class="col-sm-4"> 
      <textarea name="desc" class="form-control" id="desc" placeholder="Complaint Description" cols="5" rows="5" required></textarea>
    </div>
  </div>
  <div class="form-group"> 
    <div class=" col-sm-2 col-sm-offset-4">
      <input type="submit" class="form-control" name="register" value="Register">
  </div>
  <div class=" col-sm-1">
      <input type="reset" class="form-control" name="reset" value="Reset">
  </div>
  </div>
</form>
</div>
</body>
</html>