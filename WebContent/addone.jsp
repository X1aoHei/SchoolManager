<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<%response.setHeader("refresh", "1");%>
	<%
	  String username = (String)session.getAttribute("name");
	  String time = (new java.util.Date()).toString();%>
	  用户：<%=username %></br>
	  时间：<%=time %></br>
<a href="/04/updatePassword.jsp">修改密码</a>
<a href="/04/modifyInformation.jsp?name=<%=username %>">修改资料</a>
<a href="/04/destroyAdmin.jsp">注销</a>

	  
	
