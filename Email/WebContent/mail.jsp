<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${sessionScope.user.email}</h2>
	<c:forEach items="${sessionScope.emailList}" var="email">
		<div>
			<div>${email.sender}</div>
			<div>${email.emailTitle}</div>
			<div>
				<fmt:formatDate value="${email.sendTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</div>
		</div>
	</c:forEach>
</body>
</html>