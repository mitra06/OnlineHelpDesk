<%@page import="mishra.mitra.dao.UserDao"%>  
<jsp:useBean id="u" class="mishra.mitra.bean.User"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  

int i=UserDao.UpdateUser(u);  
if(i>0){  
response.sendRedirect("complaintlist.jsp");  
}else{  
out.println("Something went wrong");  
}  

%>