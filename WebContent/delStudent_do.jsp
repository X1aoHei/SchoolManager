<%@page import="org.eclipse.jdt.internal.compiler.ast.MagicLiteral"%>
<%@page import="jdbc.StudentCRUD"%>
<%@page import="jdbc.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");
	  response.setCharacterEncoding("utf-8");%>
	<%String stuid = request.getParameter("stuid");%>
	<%boolean successflag = StudentCRUD.del(stuid);
	  if(successflag==true){
		  response.sendRedirect("magStudent.jsp");
	  }%>
	
</body>
</html>