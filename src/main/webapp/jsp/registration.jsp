<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Security Example</title>
</head>
<body>
	<p>Registration page</p>

	<c:out value="${message}"></c:out>

	<form:form action="/registration" method="post">
		<div>
			<label> User name: <input type="text" name="username" />
			</label>
		</div>
		<div>
			<label> Password: <input type="password" name="password" />
			</label>
		</div>
		<div>
			<input type="submit" value="Sign In" />
		</div>
	</form:form>

</body>
</html>