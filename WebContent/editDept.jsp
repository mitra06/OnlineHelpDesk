<%@page import="mishra.mitra.dao.DeptDao"%>  
<jsp:useBean id="d" class="mishra.mitra.bean.Department"></jsp:useBean>  
<jsp:setProperty property="*" name="d"/>  
<%  

int i=DeptDao.update(d);  
if(i>0){  
response.sendRedirect("viewDepartment.jsp");  
}else{  
out.println("Something went wrong");  
}  

%>