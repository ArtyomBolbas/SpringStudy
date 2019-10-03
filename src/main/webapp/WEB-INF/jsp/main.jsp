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
	<title>Sweater</title>
	<!-- <link rel="stylesheet" href="/static/css/style.css"> -->
</head>
<body>
	<!-- NAVIGATION AREA -->
	<jsp:include page="/WEB-INF/jsp/template/navigation.jsp"></jsp:include>
	<!-- --END-- NAVIGATION PAGE -->
	<div class="container mt-4">
		<div>
			<form:form action="/logout" method="POST">
				<input type="submit" value="Sign Out" />
			</form:form>
			<span><a href="/user">User list</a></span>
		</div>
		<div>
			<form:form method="post" action="main" enctype="multipart/form-data">
				<input type="text" name="text" placeholder="Введите сообщение">
				<input type="text" name="tag" placeholder="Тег">
				<input type="file" name="file">
				<button type=submit>Добавить</button>
			</form:form>
		</div>
		<div>
			<form:form method="get" action="filter">
				<input type="text" name="text">
				<button type="submit">Найти</button>
			</form:form>
		</div>
		<div>
			<p>Список сообщений</p>
		</div>
		<table>
			<c:forEach items="${messages}" var="message">
				<tr>
					<td>${message.getId()}</td>
					<td>${message.getText()}</td>
					<td>${message.getTag()}</td>
					<td>${message.getAuthorName()}</td>
					<td><c:if test="${not empty message.getFilename()}">
							<img src="/img/${message.getFilename()}">
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
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