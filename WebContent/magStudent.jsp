
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="jdbc.StudentCRUD"%>
<%@page import="java.util.List"%>
<%@page import="jdbc.Student" %>
<%@page import="util.DBConnection" %>
<%String name = (String)session.getAttribute("name");
if(name==null||name.equals("")){
	  response.sendRedirect("index.jsp");
  } %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理学生信息</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	header{
		width:1000px;
		background-color: red;
		height: 150px;
		color:yellow;
	}
	#section{
		width:200px;
		height:800px;
		background-color: yellow;
		float: left;
		text-align: center;
	}
	#footer{
		background-color: blue;
		width:1000px;
		
		margin-top: 400px;
	}
	#aside01{
		float: left;
		width:800px;
		height:800px;
		background-color: white;
		text-align: center;
		
	}

	#button{
	text-align: center;
	}
	
table tr:first-child{background:#0066CC; color:#fff;font-weight:bold;} 
table{border-top:1pt solid #C1DAD7;border-left:1pt solid #C1DAD7;margin: 0 auto;} 
td{ padding:5px 10px; text-align:center;border-right:1pt solid #C1DAD7;border-bottom:1pt solid #C1DAD7;}
tr:nth-of-type(odd){ background:#F5FAFA;} 
tr:hover{ background: #E0F0F0;} 
</style>
</head>
<body>
	
	<header><div id="text"><img src="image/01.jpg" width="50" height="50"/></div><jsp:include page="addone.jsp" flush="true"/></header>
	<div id="section">
		<div id="text01"><a href="addStudent.jsp">增加一个学生</a></div>
		<div id="text02"><a href="magStudent.jsp">管理学生信息</a></div>
		<div id="text03"><a href="addTeacher.jsp">增加一个教师</a></div>
		<div id="text04"><a href="magTeacher.jsp">管理教师信息</a></div>
		<div id="text05"><a href="query.jsp">根据职工号查询</a></div>
		<div id="text06"><a href="getBytname.jsp">根据职工名查询</a></div>
		<div id="text07"><a href="getBytdept.jsp">根据所属教研室查询</a></div>
	</div>
	<div id="aside01">
		<%List<Student> stus = StudentCRUD.get();%>
		<table width='800' border='0' cellspacing='0' cellpadding='0' align='center'>

			<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>年龄</td>
				<td>出生日期</td>
				<td>班级信息</td>
				<td>操作</td>
			</tr>
			<%for(int i=0;i<stus.size();i++){
				Student stu = stus.get(i);	
			 %>
			<tr>
				
				
				<td><%=stu.getStuid() %></td>
				<td><%=stu.getSname() %></td>
				<td><%=stu.getSex() %></td>
				<td><%=stu.getAge() %></td>
				<td><%=stu.getBirthday() %></td>
				<td><%=stu.getClassname() %></td>

				 <td><a href="updateStudent_show.jsp?stuid=<%=stu.getStuid()%>">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="delStudent_do.jsp?stuid=<%=stu.getStuid() %>">删除</a></td>
				
			</tr>
			<%} %>
		</table>
	</div>
	

	<div id="footer">版权信息：<%="山东建筑大学" %>&nbsp;&nbsp;联系邮箱：<%="1719749848@qq.com" %></div>
</body>
</html>