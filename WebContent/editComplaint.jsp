<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
   <title>|Modify|Complaint|</title>

</head>
<body>
<%@page import="mishra.mitra.dao.*,mishra.mitra.bean.*"%>  
  
<%  
String email=(String)session.getAttribute("email");

//redirect user to login page if not logged in
if(email==null){
    response.sendRedirect("login.html");
}
User u=UserDao.getRecordByUtype(email);
String userType=u.getType();
String id=request.getParameter("id");  
Comp c= CompDao.getRecordById(Integer.parseInt(id));  
%>  
  <%=userType %>
  <jsp:include page="navbar.jsp" />


<div class="container">
<h3 class="text-center"><u>Modified Your Complaint</u></h3>
<form class="form-horizontal" action="editComp.jsp" method="post">
	<div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Category</label>
    <div class="col-sm-4"> 
      <input type="hidden" name="id" class="form-control" id="id" value="<%=c.getId() %>">
      <input type="text" name="name" class="form-control" id="name" value="<%=c.getName() %>" >
    </div>
  </div>
  	<div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Type</label>
    <div class="col-sm-4"> 
      
    <select name="type" class="form-control" required>
    <option value="<%=c.getType()%>"><%=c.getType() %></option>
    <option value="Urgent">Urgent</option>
    <option value="normal">Normal</option>
    </select>
      
    </div>
  </div>
    	<div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Department</label>
    <div class="col-sm-4"> 
      <input type="text" name="dept" class="form-control" id="dept" value="<%=c.getDept() %>" >
    </div>
  </div>
    	<div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Status</label>
    <div class="col-sm-4 "> 
    <select name="status" class="form-control" required>
    <option value="<%=c.getStatus()%>"><%=c.getStatus() %></option>
    <option value="Urgent">Urgent</option>
    <option value="normal">Normal</option>
    </select>
      
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Modify By</label>
    <div class="col-sm-4"> 
      <input type="text" name="cby" class="form-control" id="name" value="<%=c.getCby() %>" value="<%=email%>" >
    </div>
  </div>
    <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Date</label>
    <div class="col-sm-4"> 
      <input type="text" name="date" class="form-control" id="name" placeholder="Complaint Date" >
    </div>
  </div>
  <% if(userType.equals("admin")){ %>
  <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Assigned Person</label>
    <div class="col-sm-4"> 
      <input type="text" name="assignTo" class="form-control" id="assignTo" value="<%=c.getAssignTo() %>">
    </div>
  </div>
  <%}else{} %>
  <div class="form-group">
    <label class="col-sm-2 col-sm-offset-2" for="name">Complaint Description</label>
    <div class="col-sm-4"> 
      <textarea name="desc" class="form-control" id="desc" value="" cols="5" rows="5"><%=c.getDesc() %></textarea>
    </div>
  </div>
  <div class="form-group"> 
    <div class=" col-sm-2 col-sm-offset-4">
      <input type="submit" class="form-control" name="modify" value="Modify">
  </div>
  <div class=" col-sm-1">
      <input type="reset" class="form-control" name="reset" value="Reset">
  </div>
  </div>
</form>
</div>
</body>
</html>