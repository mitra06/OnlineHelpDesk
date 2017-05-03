<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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


%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="dashboard.jsp">OnLineHelpDesk</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a class="dropdown-toggle active" data-toggle="dropdown" href="#">Complaint
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="complaintlist.jsp">View Complaint</a></li>
          <li><a href="registerComplaint.jsp">Add Complaint</a></li>
        </ul>
      </li>
      <li><a href="ViewTechnician.jsp">Technician</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Department
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="viewDepartment.jsp">View Department</a></li>
          <% if(userType.equals("admin")){%>
          <li><a href="addDepartment.jsp">Add Department</a></li>
          <%} %>
        </ul>
      </li>
            <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Event
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">View Event</a></li>
          <li><a href="#">Add Event</a></li>
        </ul>
      </li>
      <% if(userType.equals("admin")){%>
            <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">MasterSetup
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">View Category</a></li>
          <li><a href="#">Add Categoryt</a></li>
        </ul>
      </li>
      <%} %>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span><%=email%></a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
<!-- Modal -->
<div class="col-sm-12">
<div id="myModal" class="modal fade col-sm-12" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
 
 
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Your Profile</h4>
      </div>
      <div class="modal-body col-sm-12">
        <form class="form-horizontal" action="" method="post">
				<div class="form-group">
			    <label class="col-sm-2 col-sm-offset-2 sr-only" for="id">User Id</label>
			    <div class="col-sm-4">
			    	<input type="hidden" name="id" class="form-control" placeholder="User Id" value=""/>
			    </div>
			  </div>
			  	<div class="form-group">
			    <label class="col-sm-3 col-sm-offset-2" for="name">Name</label>
			    <div class="col-sm-6">  
			    <input type="text" name="name" class="form-control" placeholder="User Name" value=""/>
			    
			    </div>
			  </div>
			  <div class="form-group">
			   <label class="col-sm-3 col-sm-offset-2" for="name">Email</label>
			   <div class="col-sm-6">
			   <input type="text" name="email" class="form-control" placeholder="User Email" value="">
			   </div>
			 </div>
				
			<div class="form-group">
			   <label class="col-sm-3 col-sm-offset-2" for="name">Password</label>
			   <div class="col-sm-6">
			   <input type="text" name="email" class="form-control" placeholder="User Password" value="">
			   </div>
			 </div>
			   <div class="form-group">
			    <label class="col-sm-3 col-sm-offset-2" for="name">Phone</label>
			    <div class="col-sm-6">
			    <input type="text" name="email" class="form-control" placeholder="User Phone" value="">
			
			  </div>
			  </div>
			   <div class="form-group">
			    <label class="col-sm-3 col-sm-offset-2" for="name">User Type</label>
			    <div class="col-sm-6">
			    <input type="text" name="email" class="form-control" placeholder="User Type" value="" readonly>
			    </div>
			  </div>
		   <div class="form-group">
		    <label class="col-sm-3 col-sm-offset-2" for="name">User Department</label>
		    <div class="col-sm-6">
		    <select name="status" class="form-control" required>
		    <option value=""></option>
		    <option value="">Computer Science</option>
		    <option value="">Electrical</option>
		    </select> 
		    </div>
		  </div>
  <div class="form-group"> 
    <div class=" col-sm-3 col-sm-offset-6">
      <input type="submit" class="form-control" name="add" value="UpdateYourself">
  </div>
  <div class=" col-sm-2">
      <input type="reset" class="form-control" name="reset" value="Reset">
  </div>
  </div>
</form>
      </div>
      <div class="modal-footer">
      </div>
    </div>

  </div>
</div>