<%@page import="JavaBean.ClassBean"%>
<%@page import="Bpo.ClassBpo" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<header><div id="text"><img src="../image/01.jpg" width="50" height="50"/></div><jsp:include page="../addone.jsp"></jsp:include></header>
	<div id="section">
		<div id="text01"><a href="../addStudent.jsp">增加一个学生</a></div>
		<div id="text02"><a href="../magStudent.jsp">管理学生信息</a></div>
		<div id="text03"><a href="../addTeacher.jsp">增加一个教师</a></div>
		<div id="text04"><a href="../magTeacher.jsp">管理教师信息</a></div>
		<div id="text05"><a href="../query.jsp">根据职工号查询</a></div>
		<div id="text06"><a href="../getBytname.jsp">根据职工名查询</a></div>
		<div id="text07"><a href="../getBytdept.jsp">根据所属教研室查询</a></div>
		<div id="text08"><a href="addCourse.jsp">增加一个课程</a></div>
		<div id="text09"><a href="magCourse.jsp">管理课程信息</a></div>
		<div id="text10"><a href="getCourse.jsp">查询课程信息</a></div>
		
	</div>
	<div id="aside01">
		<jsp:useBean id="course11" class="Bpo.ClassBpo"/>
		<%
		List<ClassBean> list = course11.get();
		%>
		<table width='800' border='0' cellspacing='0' cellpadding='0' align='center'>
		<tr><td>课号</td><td>课程名</td><td>学分</td><td>先修学号</td><td>操作</td></tr>
		<%
		
		
		for(int i=0;i<list.size();i++){
			ClassBean cour = null;
			 cour = list.get(i);
		
		%>
		
		<tr>
			<td><%=cour.getCourseid() %></td>
			<td><%=cour.getCname() %></td>
			<td><%=cour.getCcredit() %></td>
			<td><%=cour.getCpre() %></td>
			<td><a href="updateCourse_show.jsp?courseid=<%=cour.getCourseid()%>">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="delCourse_do.jsp?courseid=<%=cour.getCourseid()%>">删除</a></td>
			
		</tr>
		<%} %>
		</table>
	</div>
	<div id="footer">版权信息：<%="山东建筑大学" %>&nbsp;&nbsp;联系邮箱：<%="1719749848@qq.com" %></div>
</body>
</html>