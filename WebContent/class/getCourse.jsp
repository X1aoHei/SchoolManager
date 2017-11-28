<%@page import="JavaBean.ClassBean" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询课程信息</title>
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
		background-color: white;
		text-align: center;
		
	}
	#operation{
		background-color: #CCCCCC;
		
	}
	#operation a{
		color: #B23AEE;
	}

	#button{
	text-align: center;
	}
	#error{
	color:red;
	}
	table tr:first-child{background:#0066CC; color:#fff;font-weight:bold;} 
	table{border-top:1pt solid #C1DAD7;border-left:1pt solid #C1DAD7;margin: 0 auto;} 
	td{ padding:5px 10px; text-align:center;border-right:1pt solid #C1DAD7;border-bottom:1pt solid #C1DAD7;}
	tr:nth-of-type(odd){ background:#F5FAFA;} 
	tr:hover{ background: #E0F0F0;} 
</style>
</head>
<body>
	<header><div id="text"><img src="/04/image/01.jpg" width="50" height="50"/></div><jsp:include page="../addone.jsp"></jsp:include></header>
	<div id="section">
		<div id="text01"><a href="/04/addStudent.jsp">增加一个学生</a></div>
		<div id="text02"><a href="/04/magStudent.jsp">管理学生信息</a></div>
		<div id="text03"><a href="/04/addTeacher.jsp">增加一个教师</a></div>
		<div id="text04"><a href="/04/magTeacher.jsp">管理教师信息</a></div>
		<div id="text05"><a href="/04/query.jsp">根据职工号查询</a></div>
		<div id="text06"><a href="/04/getBytname.jsp">根据职工名查询</a></div>
		<div id="text07"><a href="/04/getBytdept.jsp">根据所属教研室查询</a></div>
		<div id="text08"><a href="/04/class/addCourse.jsp">增加一个课程</a></div>
		<div id="text09"><a href="/04/class/magCourse.jsp">管理课程信息</a></div>
		<div id="text10"><a href="/04/class/getCourse.jsp">查询课程信息</a></div>
		
	</div>
	
	<div id="aside01">
	
		<div id="operation">
			<%
				List<ClassBean> lists = (List<ClassBean>)request.getAttribute("lists");
				Map<String,String> map = (Map<String,String>)request.getAttribute("err");
				String null0 = "";
				String null2 = "";
				String nullcourse = "";
				String error = "";
				if(map!=null){
					null0 = map.get("null0");
					if(null0==null){
						null0 = "";
						
					}
					null2 = map.get("null2");
					if(null2==null){
						null2 = "";
						
					}
					nullcourse = map.get("nullcourse");
					if(nullcourse==null){
						nullcourse = "";
					}
					
					error = map.get("error");
					if(error==null){
						error = "";
					}
				}
				
				String courseid = (String)request.getParameter("courseid");
				if(courseid==null)courseid="";
				String cname = (String)request.getParameter("cname");
				if(cname==null)cname=""; 
			%>
		<form action="/04/getbyCourseid_do" method="post">
			<div id="error">
			<%=null0 %>
			<%=null2 %>
			<%=nullcourse %>
			<%=error %>
			</div>
			<input type="text" name="courseid" value="<%=courseid%>"> &nbsp;&nbsp;&nbsp;<input type="text" name="cname" value="<%=cname%>">&nbsp;&nbsp;&nbsp;<input type="submit" value="查询">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
			<table>
				<tr><td>课号</td><td>课程名</td><td>学分</td><td>先修学号</td></tr>
				<%
				if(lists!=null){
					for(int i=0;i<lists.size();i++){
						ClassBean course = lists.get(i);
				
					
				%>
				<tr><td><%=course.getCourseid() %></td><td><%=course.getCname() %></td><td><%=course.getCcredit() %></td><td><%=course.getCpre() %></td></tr>
				<%} }%>
			</table>
		</form>
		</div>
		
	</div>
	
	<div id="footer">版权信息：<%="山东建筑大学" %>&nbsp;&nbsp;联系邮箱：<%="1719749848@qq.com" %></div>
</body>
</html>