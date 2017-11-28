<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");%>
	<%
	Map<String,String> errs = (Map<String,String>)request.getAttribute("errs");
	String nameerr = "";
	String passworderr = "";
	String checkpassworderr = "";
	if(errs!=null){
		nameerr = errs.get("nameerr");
		if(nameerr==null){
			nameerr="";
		}
		passworderr = errs.get("passworderr");
		if(passworderr==null){
			passworderr = "";
		}
		checkpassworderr = errs.get("checkpassworderr");
		if(checkpassworderr==null){
			checkpassworderr = "";
		}
	}
	%>
	<form action="adduser_do.jsp" method="post">
		<table>
			
			<tr><td>账号：</td><td><input type="text" name="name" ><%=nameerr %></td></tr>
			<tr><td>密码：</td><td><input type="text" name="password" ><%=passworderr %></td></tr>
			<tr><td>确认密码：</td><td><input type="text" name="checkpassword" ><%=checkpassworderr %></td></tr>
			<tr><td>年龄：</td><td><input type="text" name="age" ></td></tr>
			<tr><td>班级信息：</td><td><input type="text" name="classname" ></td></tr>
			<tr><td><input type="submit" value="注册"></td><td><input type="reset" value="重置"></td></tr>
		</table>
	</form>
</body>
</html>