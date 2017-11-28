<%@page import="JavaBean.TeacherBean"%>
<%@page import="Bpo.TeacherBpo"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>根据职工名查询</title>
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
	#err{
	color:red;
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
		<div id="text07"><a href="getBytdept.jsp">根据职工号查询</a></div>
		<div id="text08"><a href="class/addCourse.jsp">增加一个课程</a></div>
		<div id="text09"><a href="class/magCourse.jsp">管理课程信息</a></div>
		<div id="text10"><a href="class/getCourse.jsp">查询课程信息</a></div>
		
	</div>
	<div id="aside01">
			<%request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");%>
		  <%String tname = request.getParameter("querytname");
		  String err="";
		  String nullerr = "";
		  
		  %>
		  <jsp:useBean id="teas" class="Bpo.TeacherBpo" scope="session"/>
		<%List<TeacherBean> teach = teas.getBytname(tname); %>
		
		
	
		<%-- <%TeacherBean teas = TeacherBpo.getBytname(tname);%> --%>
		<table>
			<tr><td>职工号</td><td>职工名</td><td>性别</td><td>所属研究室</td><td>职称</td><td>研究方向</td></tr>
			<%
			if(tname==null||tname.equals("")){
				nullerr = "您输入的教研室为空，请您重新输入";
			}else if(teach.size()!=0){
				for(int i=0;i<teach.size();i++){
					TeacherBean tea = teach.get(i);
				 %>
					<tr><td><%=tea.getTno() %></td><td><%=tname %></td><td><%=tea.getSex() %></td><td><%=tea.getTdept() %></td><td><%=tea.getTpost() %></td><td><%=tea.getTdirect() %></td></tr>
					<%}
			}else{
				err = "未查询到该用户，请重新输入";
			}%>
			
			
			
		</table>
		<div id="err">
		<%=err %>
		<%=nullerr %>
		</div>
	</div>
	

	<div id="footer">版权信息：<%="山东建筑大学" %>&nbsp;&nbsp;联系邮箱：<%="1719749848@qq.com" %></div>




	
</body>
</html>