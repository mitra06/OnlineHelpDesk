<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String email=(String)session.getAttribute("email");

//redirect user to login page if not logged in
if(email==null){
    response.sendRedirect("login.html");
}


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
          <li><a href="addDepartment.jsp">Add Department</a></li>
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
            <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">MasterSetup
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">View Category</a></li>
          <li><a href="#">Add Categoryt</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span><%=email%></a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
