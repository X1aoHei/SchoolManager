<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" errorPage="error.jsp"  %>
<%@page import="jdbc.AdminOperation"%>
<%@page session="true" %>
<%-- <%
	String name=request.getParameter("name");
    String password=request.getParameter("password");
    boolean successflag=AdminOperation.validlogin(name, password);
    if(successflag==true){
    	session.setAttribute("name", name);
    	/* session.setAttribute("successflag", successflag); */
    	request.getRequestDispatcher("main.jsp").forward(request, response);
    }else{
    	throw new Exception("用户名或密码不正确，登陆失败！");
    }
%> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>校验登陆是否成功</title>
	</head>
	<body>
		<jsp:useBean id="admin" class="jdbc.AdminOperation" scope="session"/>
		<jsp:setProperty name="admin" property="name" />
		<jsp:setProperty name="admin" property="password"/>
		<%
	    boolean successflag=admin.validlogin();
	    if(successflag==true){
	    	session.setAttribute("name", admin.getName());
	    	response.sendRedirect("main.jsp");
	    }else{
	    	throw new Exception("用户名或密码不正确，登陆失败！");
	    }
		%>
	</body>
</html>