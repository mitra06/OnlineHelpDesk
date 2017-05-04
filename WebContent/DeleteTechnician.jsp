<%@page import="mishra.mitra.dao.UserDao"%>  
<jsp:useBean id="u" class="mishra.mitra.bean.User"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  

UserDao.deleteTechnician(u);
response.sendRedirect("ViewTechnician.jsp");  
%>