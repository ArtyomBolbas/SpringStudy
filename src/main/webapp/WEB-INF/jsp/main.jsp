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
	<!--<div>
			<span><a href="/user">User list</a></span>
		</div> -->
		 <div class="form-row">
		 	<div class="form-group col-md-6">
				<form:form class="form-inline" method="get" action="filter">
					<input class="form-control" type="text" name="text" placeholder="Search by tag">
					<button class="btn btn-primary ml-2" type="submit">Search</button>
				</form:form>
			</div>
		</div>
		<!-- <div>
			<p>Список сообщений</p>
		</div> -->
		 <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    		Add new message
  		</a>
		<div class="collapse" id="collapseExample">
			<div class="form-group mt-3">
				<form:form method="post" action="main" enctype="multipart/form-data">
					<div class="form-group">
						<input class="form-control" type="text" name="text" placeholder="Введите сообщение">
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="tag" placeholder="Тег">
					</div>
					<div class="form-group">
						<div class="custom-file">
							<input id="customFile" type="file" name="file">
							<label class="custom-file-label" for="customFile">Choose file</label>
						</div>
					</div>
					<div class="form-group">
						<button class="btn btn-primary" type=submit>Добавить</button>
					</div>
				</form:form>
			</div>
		</div>
		<div class="card-columns">
			<c:forEach items="${messages}" var="message">
				<div class="card my-3">
					<c:if test="${not empty message.getFilename()}">
						<img class="card-img-top" src="/img/${message.getFilename()}">
					</c:if>
					<div class="m-2">
						<span>${message.getText()}</span>
						<i>${message.getTag()}</i>
					</div>
					<div class="card-footer text-muted">
						${message.getAuthorName()}
					</div>
				</div>
			</c:forEach>
		</div>
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