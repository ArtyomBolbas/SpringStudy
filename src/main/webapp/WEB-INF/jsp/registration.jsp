<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">
	<title>Registration page</title>
</head>
<body>
	<!-- NAVIGATION AREA -->
	<jsp:include page="/WEB-INF/jsp/template/navigation.jsp"></jsp:include>
	<!-- --END-- NAVIGATION PAGE -->
	<div class="container mt-4">
		<div class="mb-2">
			<p>Registration page</p>
		</div>
		<c:out value="${message}"></c:out>
	
		<form:form action="/registration" method="post">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label" for="inputLogin">User Name:</label>
				<div class="col-sm-5">
					<input class="form-control" id="inputLogin" type="text" name="username" placeholder="Login"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label" for="inputPassword">Password:</label> 
				<div class="col-sm-5">
					<input class="form-control" id="inputPassword" type="password" name="password" placeholder="Password"/>
				</div>
			</div>
			<div class="form-group row">
				<div class="col"></div>
				<div class="col">
					<button type="submit" class="btn btn-primary">Create</button>
				</div>
			</div>
		</form:form>
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