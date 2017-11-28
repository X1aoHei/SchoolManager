<%@page import="jdbc.AdminOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户资料</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");%>
	<%
	String name = (String)session.getAttribute("name");
	AdminOperation user = AdminOperation.getinformation(name);
	%>
	<form action="/04/modifyInformationServlet" method="post">
	<table>
		<tr><td>用户名：</td><td><input type="text" name="name" value="<%=name%>"></td></tr>
		<tr><td>年龄：</td><td><input type="text" name="age" value="<%=user.getAge()%>"></td></tr>
		<tr><td>班级信息：</td><td><input type="text" name="classname" value="<%=user.getClassname()%>"></td></tr>
		<tr><td><input type="submit" value="保存"></td><td><input type="reset" value="重置"></td></tr>
	</table>
	</form>
</body>
</html>