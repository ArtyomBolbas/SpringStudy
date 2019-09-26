<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Welcome</h1>
	
	
	<c:url value="/hello.jsp" var="helloURL"/>
	<p>Click <a href="${helloURL}">Link to welcome page</a></p>
</body>
</html>