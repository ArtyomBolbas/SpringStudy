<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sweater</title>
<link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
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
</body>
</html>