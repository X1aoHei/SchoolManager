<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="JavaBean.TeacherBean" %>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理教师信息</title>
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
		<div id="text08"><a href="class/addCourse.jsp">增加一个课程</a></div>
		<div id="text09"><a href="class/magCourse.jsp">管理课程信息</a></div>
		<div id="text10"><a href="class/getCourse.jsp">查询课程信息</a></div>
	</div>
	<div id="aside01">
		<jsp:useBean id="tea" class="Bpo.TeacherBpo"/>
		<%
		List<TeacherBean> list = tea.get();
		%>
		<table width='800' border='0' cellspacing='0' cellpadding='0' align='center'>

			<tr>
				<td>职工号</td>
				<td>职工名</td>
				<td>性别</td>
				<td>所属教研室</td>
				<td>职称</td>
				<td>研究方向</td>
				<td>操作</td>
			</tr>
			<%
		
		
		for(int i=0;i<list.size();i++){
			TeacherBean Tea = null;
			 Tea = list.get(i);
		
		%>
			<tr>
				
				
				<td><%=Tea.getTno() %></td>
				<td><%=Tea.getTname() %></td>
				<td><%=Tea.getSex() %></td>
				<td><%=Tea.getTdept() %></td>
				<td><%=Tea.getTpost() %></td>
				<td><%=Tea.getTdirect() %></td>

				 <td><a href="updateTeacher_show.jsp?tno=<%=Tea.getTno()%>">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="delTeacher_do.jsp?tno=<%=Tea.getTno()%>">删除</a></td>
				
			</tr>
			<%} %>
		</table>
	</div>
	<div id="footer">版权信息：<%="山东建筑大学" %>&nbsp;&nbsp;联系邮箱：<%="1719749848@qq.com" %></div>
</body>
</html>