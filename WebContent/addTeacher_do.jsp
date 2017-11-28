<%@page import="java.sql.SQLException"%>
<%@page import="JavaBean.TeacherBean"%>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加教师信息</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");
	  response.setCharacterEncoding("utf-8");%>
	<jsp:useBean id="addTeacher" class="JavaBean.TeacherBean" scope="request"/>
	<jsp:setProperty name="addTeacher" property="*"/>
	 <%
	 Map<String,String> errs = addTeacher.check();
	 if(errs.size()==0){
			addTeacher.add();
			response.sendRedirect("main.jsp");
		}else{
			request.setAttribute("errs", errs);
			request.getRequestDispatcher("addTeacher.jsp").forward(request, response);
		}
	 %> 
	
	  
</body>
</html>