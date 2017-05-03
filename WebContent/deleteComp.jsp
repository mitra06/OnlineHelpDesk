<%@page import="mishra.mitra.dao.CompDao"%>  
<jsp:useBean id="c" class="mishra.mitra.bean.Comp"></jsp:useBean>  
<jsp:setProperty property="*" name="c"/>  
<%  
 CompDao.delete(c);
response.sendRedirect("complaintlist.jsp");  
%>