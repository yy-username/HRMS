<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${requestScope.message}</h1>
	<form action="login">
		<input type="text" name="username"/> <br/>
		<input type="password" name="password"/> <br/>
		<input type="submit" value="登录"/>
		<input type="reset" value="重置"/>
	</form>
</body>
</html>