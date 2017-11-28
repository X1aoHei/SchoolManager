<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除教师信息</title>
</head>
<body>
	<jsp:useBean id="tea1" class="JavaBean.TeacherBean"/>
	<jsp:setProperty name="tea1" property="*"/>
	<%
	boolean successflag = tea1.del();
	if(successflag = true){
		response.sendRedirect("magTeacher.jsp");
	}
	%>
</body>
</html>