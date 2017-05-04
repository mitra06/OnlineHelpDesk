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
	<h3 class="text-center text-danger"><u>DashBoard</u></h3>
	<div class="col-sm-6">
	<div class="panel panel-danger">
		<!-- Default panel contents -->
		<div class="panel-heading">Recent 5 complaints</div>
		<div class="panel-body">		
			<!-- Table -->
		<table class="table">
			<thead style="background-color:#2ecc71;text-align:center;color:white;">
				<tr>
					<th>Complaint Name</th>
					<th>Department</th>
					<th>Complaint By</th>
					<th>Complaint Type</th>
				</tr>
			</thead>
			<tbody style="text-align:center;">
				<tr>
					<td>1</td>
					<td>John</td>
					<td>Carter</td>
					<td>johncarter@mail.com</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Peter</td>
					<td>Parker</td>
					<td>peterparker@mail.com</td>
				</tr>
				<tr>
					<td>3</td>
					<td>John</td>
					<td>Rambo</td>
					<td>johnrambo@mail.com</td>
				</tr>
			</tbody> 
		</table>
	</div>
	<div class="panel-footer">
		<span class="glyphicon glyphicon-chevron-right">View</span>
	</div>
</div>
</div>
	<div class="col-sm-6">
		<div class="panel panel-info">
		<!-- Default panel contents -->
		<div class="panel-heading">Complaints from Departments</div>
		<div class="panel-body">		
			<!-- Table -->
		<table class="table">
			<thead style="background-color:#2ecc71;text-align:center;color:white;">
				<tr>
					<th>Department</th>
					<th>Total Complaint</th>
					<th>Solved Complaint</th>
					<th>Not Solved</th>
				</tr>
			</thead>
			<tbody style="text-align:center;">
				<tr>
					<td>1</td>
					<td>John</td>
					<td>Carter</td>
					<td>johncarter@mail.com</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Peter</td>
					<td>Parker</td>
					<td>peterparker@mail.com</td>
				</tr>
				<tr>
					<td>3</td>
					<td>John</td>
					<td>Rambo</td>
					<td>johnrambo@mail.com</td>
				</tr>
			</tbody> 
		</table>
	</div>
	
	<div class="panel-footer">
		<span class="glyphicon glyphicon-chevron-right">View</span>
	</div>
</div>
</div>
	<div class="col-sm-6">
		<div class="panel panel-success">
		<!-- Default panel contents -->
		<div class="panel-heading">Upcoming Events</div>
		<div class="panel-body">		
			<!-- Table -->
		<table class="table">
			<thead style="background-color:#2ecc71;text-align:center;color:white;">
				<tr>
					<th>Event Name</th>
					<th>Department</th>
					<th>Solved Complaint</th>
					<th>Not Solved</th>
				</tr>
			</thead>
			<tbody style="text-align:center;">
				<tr>
					<td>1</td>
					<td>John</td>
					<td>Carter</td>
					<td>johncarter@mail.com</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Peter</td>
					<td>Parker</td>
					<td>peterparker@mail.com</td>
				</tr>
				<tr>
					<td>3</td>
					<td>John</td>
					<td>Rambo</td>
					<td>johnrambo@mail.com</td>
				</tr>
			</tbody> 
		</table>
	</div>
	
	<div class="panel-footer">
		<span class="glyphicon glyphicon-chevron-right">View</span>
	</div>
</div>
	</div>
</div>
</body>
</html>