<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Getting Started: Serving Web Content</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<%-- 	<p th:text="'Hello, ' + ${name} + '!'" /> --%>
<h2>Hello</h2>
	<h2><c:out value="${name}" /></h2>
</body>
</html>