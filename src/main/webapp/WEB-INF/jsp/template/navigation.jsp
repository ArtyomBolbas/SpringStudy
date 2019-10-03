<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="/">Sweater</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link" href="/">Home</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/main">Messages</a>
			</li>
			<sec:authentication var="userPrin" property="principal" />
			<sec:authorize access="isAuthenticated()">
				<c:if test="${userPrin.isAdmin()}">
					<li class="nav-item">
						<a class="nav-link" href="/user">User list</a>
					</li>
				</c:if>
			</sec:authorize>
		</ul>
		<sec:authorize access="isAuthenticated()">
			<c:if test="${userPrin.isAdmin()}">
				<div class="navbar-text">Admin</div>
			</c:if>
			<c:if test="${!userPrin.isAdmin()}">
				<div class="navbar-text"><%=request.getUserPrincipal().getName().toString()%></div>
			</c:if>
		</sec:authorize>
	</div>
</nav>
