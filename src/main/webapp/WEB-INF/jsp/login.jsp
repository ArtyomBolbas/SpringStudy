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
	<p>Login page</p>

	<c:if test="${param.error != null}">
		Invalid user name and password
	</c:if>
	<c:if test="${param.logout != null}">
		You have been logged out
	</c:if>

	<form:form action="/login" method="post">
		<div>
			<label> User Name: <input type="text" name="username" />
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
	
	<c:url value="/registration" var="registrationURL"/>
	<p>
		<a href="${registrationURL}">Add new USER</a>
	</p>
</body>
</html>