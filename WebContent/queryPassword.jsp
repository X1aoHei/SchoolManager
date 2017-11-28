<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
</head>
<body>
	<form action="queryPassword_do.jsp" method="post">
		要找回的账号：<input type="text" name="toquerypassword"></br>
		<input type="submit" value="找回">
		<input type="reset" value="重置">
	</form>
</body>
</html>