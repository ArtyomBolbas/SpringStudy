<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Security Example</title>
</head>
<body>
	<form action="/login" method="post">
		<div>
			<label> 
				User Name: 
				<input type="text" name="username" />
			</label>
		</div>
		<div>
			<label> 
				Password: 
				<input type="password" name="password" />
			</label>
		</div>
		<div>
			<input type="submit" value="Sign In" />
		</div>
	</form>
</body>
</html>