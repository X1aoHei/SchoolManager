<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page session="true" %>
<%String name = (String)session.getAttribute("name");
 if(name==null||name.equals("")){
	  response.sendRedirect("index.jsp");
  } %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生信息</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	header{
		width:1000px;
		background-color: red;
		height: 150px;
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
		<form action="addStudent_do.jsp" method="post">
		
			
			学号：<input type="text" name="addstuid"></br>
			姓名：<input type="text" name="addsname"></br>
			性别：<input type="text" name="addsex"></br>
			年龄：<input type="text" name="addage"></br>
			生日：<input type="text" name="addbirthday"></br>
			班级：<input type="text" name="addclassname"></br>
			<div id="button">
			<input type="submit" value="添加">
			<input type="reset" value="重置">
			</div>
		
		</form>
	</div>
	

	<div id="footer">版权信息：<%="山东建筑大学" %>联系邮箱：<%="1719749848@qq.com" %></div>
</body>
</html>