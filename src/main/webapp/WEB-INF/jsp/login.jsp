<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">
	<title>Spring Security Example</title>
</head>
<body>
	<!-- NAVIGATION AREA -->
	<jsp:include page="/WEB-INF/jsp/template/navigation.jsp"></jsp:include>
	<!-- --END-- NAVIGATION PAGE -->
	<div class="container mt-4">
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
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>