<%@page import="Bpo.TeacherBpo"%>
<%@page import="com.sun.org.glassfish.external.arc.Taxonomy"%>
<%@page import="JavaBean.TeacherBean"%>
<%@page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改教师信息</title>
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
		height:400px;
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
		height:400px;
		background-color: green;
		text-align: center;
		
	}

	#button{
	text-align: center;
	}
</style>
</head>
<body>

	<header><div id="text"><img src="image/01.jpg" width="50" height="50"/></div><jsp:include page="addone.jsp"></jsp:include></header>
	<div id="section">
		<div id="text01"><a href="addStudent.jsp">增加一个学生</a></div>
		<div id="text02"><a href="magStudent.jsp">管理学生信息</a></div>
		<div id="text03"><a href="addTeacher.jsp">增加一个教师</a></div>
		<div id="text04"><a href="magTeacher.jsp">管理教师信息</a></div>
		<div id="text05"><a href="query.jsp">根据职工号查询</a></div>
		<div id="text06"><a href="getBytname.jsp">根据职工名查询</a></div>
		<div id="text07"><a href="getBytdept.jsp">根据职工所属教研室查询</a></div>
		<div id="text08"><a href="class/addCourse.jsp">增加一个课程</a></div>
		<div id="text09"><a href="class/magCourse.jsp">管理课程信息</a></div>
		<div id="text10"><a href="class/getCourse.jsp">查询课程信息</a></div>
		
	</div>
	<div id="aside01">
		<jsp:useBean id="tea" class="Bpo.TeacherBpo"/>
	<%
	String tno = request.getParameter("tno");
	TeacherBean tea1 = tea.getBytno(tno);
	%>
	
	<%
		Map<String,String> errs = (Map<String,String>)request.getAttribute("errs");
		String tnoerr = "";
		
		if(errs!=null){
			tnoerr = errs.get("tnoerr");
			if(tnoerr==null){
				tnoerr = "";
				
			}
			
		}
		
		%>
	<form action="/04/savaTeacherdo" method="post">
		<table>
			<tr><td>职工号：</td><td><input type="text" name="tno" value="<%=tea1.getTno()%>"><%=tnoerr %></td></tr>
			<tr><td>职工名：</td><td><input type="text" name="tname" value="<%=tea1.getTname()%>"></td></tr>
			<tr><td>性别：</td><td><input type="text" name="sex" value="<%=tea1.getSex()%>"></td></tr>
			<tr><td>所属教研室：</td><td><input type="text" name="tdept" value="<%=tea1.getTdept()%>"></td></tr>
			<tr><td>职称：</td><td><input type="text" name="tpost" value="<%=tea1.getTpost()%>"></td></tr>
			<tr><td>研究方向：</td><td><input type="text" name="tdirect" value="<%=tea1.getTdirect()%>"></td></tr>
			<tr><td><input type="submit" value="保存"></td><td><input type="reset" value="重置"></td></tr>
		</table>
	</form>
	</div>
	

	<div id="footer">版权信息：<%="山东建筑大学" %>&nbsp;&nbsp;联系邮箱：<%="1719749848@qq.com" %></div>





	
</body>
</html>