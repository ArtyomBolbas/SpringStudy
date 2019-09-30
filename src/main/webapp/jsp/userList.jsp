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
	<p>List of users</p>
	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Role</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">
				<tr>
					<td>${user.getUsername()}</td>
					<td>${user.getRoles()}</td>
					<td><a href="/user/${user.getId()}">edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>
