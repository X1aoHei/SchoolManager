
<%@page import="util.DBConnection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.io.IOException" %>
<%@page import="jdbc.StudentCRUD" %>
<%@page import="javax.servlet.ServletException" %>
<%@page import="javax.servlet.annotation.WebServlet" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	
	Connection conn = null;
	PreparedStatement ps = null;
	
	String sql="insert into student values(?,?,?,?,?,?)";
	String stuid = request.getParameter("addstuid");
	String sname=request.getParameter("addsname"); 
	String sex = request.getParameter("addsex");
	String age = request.getParameter("addage");
	String birthday = request.getParameter("addbirthday");
	String classname = request.getParameter("addclassname");
	try{
		StudentCRUD.add(stuid,sname,sex,age,birthday,classname);
		response.sendRedirect("main.jsp");
	}catch(SQLException e){
		out.println("错误:"+e.getMessage());
	}
	
	
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生信息</title>
</head>
<body>

</body>
</html>