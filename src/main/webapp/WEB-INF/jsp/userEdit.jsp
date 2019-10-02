<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>User editor</p>
	<form:form action="/user" mrthod="post">
		<input type="text" name="userName" value="${user.getUsername()}">
			<div>
				<c:forEach items="${roles}" var="role">
					<label><c:out value="${role}"/><input type="checkbox" name="${role}"></label>
				</c:forEach>
			</div>
		<input type="hidden" name="userId" value="${user.getId()}">
		<button type="submit">Save</button>
	</form:form>
</body>
</html>

