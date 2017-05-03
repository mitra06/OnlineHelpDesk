<%@page import="mishra.mitra.dao.CompDao"%>  
<jsp:useBean id="c" class="mishra.mitra.bean.Comp"></jsp:useBean>  
<jsp:setProperty property="*" name="c"/>  
<%  

int i=CompDao.update(c);  
if(i>0){  
response.sendRedirect("complaintlist.jsp");  
}else{  
out.println("Something went wrong");  
}  

%>