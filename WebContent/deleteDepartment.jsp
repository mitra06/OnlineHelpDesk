<%@page import="mishra.mitra.dao.DeptDao"%>  
<jsp:useBean id="d" class="mishra.mitra.bean.Department"></jsp:useBean>  
<jsp:setProperty property="*" name="d"/>  
<%  

DeptDao.delete(d);
response.sendRedirect("viewDepartment.jsp");  
%>