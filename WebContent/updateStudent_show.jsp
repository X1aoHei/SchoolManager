<%@page import="util.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.StudentCRUD"%>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.Student"%>
<%String stuid = request.getParameter("stuid");
Student stu000 = StudentCRUD.get(stuid);
			
	
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生信息</title>
</head>
<body>
	<form action="saveStudent_do.jsp" method="post">
		<table>
			<tr>
				<td>学号：</td>
				<td><input type="text" name="updatestuid" value="<%=stuid %>"/></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="updatesname" value="<%=stu000.getSname() %>"/></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><input type="text" name="updatesex" value="<%=stu000.getSex() %>" /></td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td><input type="text" name="updateage" value="<%=stu000.getAge()  %>"/></td>
			</tr>
			<tr>
				<td>出生日期：</td>
				<td><input type="text" name="updatebirthday" value="<%=stu000.getBirthday()%>"/></td>
			</tr>
			<tr>
				<td>班级信息：</td>
				<td><input type="text" name="updateclassname" value="<%=stu000.getClassname()%>"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="修改"/></td>
				<td><input type="reset" value="重置"/></td>
			</tr>
		</br>
		
	</form>
</body>
</html>