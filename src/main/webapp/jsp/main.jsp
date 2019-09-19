<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form method="post" action="add">
			<input type="text" name="text" placeholder="Введите сообщение">
			<input type="text" name="tag" placeholder="Тег">
			<button type=submit>Добавить</button>
		</form>
	</div>
	<div>
		<form method="get" action="filter">
			<input type="text" name="text">
			<button type="submit">Найти</button>
		</form>
	</div>
	<div><p>Список сообщений</p></div>
	<table>
		<c:forEach items="${messages}" var="message">
			<tr>
				<td>${message.getId()}</td>
				<td>${message.getText()}</td>
				<td>${message.getTag()}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>