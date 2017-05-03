<%@page import="mishra.mitra.dao.UserDao"%>  
<jsp:useBean id="u" class="mishra.mitra.bean.User" scope="session"></jsp:useBean>

<jsp:setProperty property="*" name="u"/>  
<%  
boolean status=UserDao.validate(u);  
if(status){  
out.println("You r successfully logged in");
session.setAttribute("email",u.getEmail());
//session.setAttribute("session","TRUE");  
response.sendRedirect("dashboard.jsp"); 
}  
else  
{  
out.print("Sorry, email or password error");  
}  
%>  