<%@page import="jdbc.StudentCRUD"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<%request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");%>
<%String stuid = request.getParameter("updatestuid");
  String sname = request.getParameter("updatesname");
  String sex = request.getParameter("updatesex");
  String age = request.getParameter("updateage");
  String birthday = request.getParameter("updatebirthday");
  String classname = request.getParameter("updateclassname");%>
<%boolean successflag = StudentCRUD.update(stuid,sname, sex, age, birthday, classname);
  if(successflag==true){
	  request.getRequestDispatcher("magStudent.jsp").forward(request, response);
  }else{
	  throw new Exception("修改失败！");
  }%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存学生信息</title>
</head>
<body>

</body>
</html>