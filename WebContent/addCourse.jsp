<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加一个课程信息</title>
</head>
<body>
	<%
	Map<String,String> errs = (Map<String,String>)request.getAttribute("errs"); 
	String courseiderr = "";
	String cpreerr = "";
	if(errs!=null){
		courseiderr = errs.get("courseiderr");
		if(courseiderr==null){courseiderr="";}
		cpreerr = errs.get("cpreerr");
		if(cpreerr==null){cpreerr = "";}
	}
	%>
	<form action="addCourse_do.jsp" method="post">
		<table>
			<tr><td>课号</td><td><input type="text" name="courseid"><%=courseiderr %></td></tr>
			<tr><td>课程名</td><td><input type="text" name="cname"></td></tr>
			<tr><td>学分</td><td><input type="text" name="ccredit"></td></tr>
			<tr><td>先修课号</td><td><input type="text" name="cpre"><%=cpreerr %></td></tr>
			
			<tr><td><input type="submit" value="添加"></td><td><input type="reset" value="重置"></td></tr>
		</table>
	</form>
</body>
</html>