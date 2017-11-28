<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");%>
	<jsp:useBean id="course" class="JavaBean.ClassBean" scope="request"/>
	<jsp:setProperty name="course" property="*"/>
	<%
	Map<String,String> errs = course.check();
	if(errs.size()==0){
		course.add();
		response.sendRedirect("../main.jsp");
	}else{
		request.setAttribute("errs", errs);
		request.getRequestDispatcher("addCourse.jsp").forward(request, response);
	}
	%>
</body> 
</html>