<%@page import="mishra.mitra.dao.UserDao"%>  
<jsp:useBean id="u" class="mishra.mitra.bean.User"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=UserDao.save(u);  
if(i>0){  
response.sendRedirect("dashboard.jsp");  
}else{  
response.sendRedirect("adduser-error.jsp");  
}  
%>  