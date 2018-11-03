<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>User Page</title>
	<link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: rgb(126, 214, 192);
		}
		h1 {
			display: inline-block;
		}
		#top {
			padding: 20px;
			padding-left: 70px;
		}
		#topright {
			display: inline-block;
			padding-left: 500px;
		}
		#blackline {
			background-color: black;
			height: 3px;
		}
		#main {
			padding: 10px;
			padding-left: 150px;
			background-color: rgb(170, 224, 210);
			height: 550px;
		}
		#main a {
			font-size: 22px;
		}
		h4 {
			display: inline-block;
		}
		p {
			display: inline-block;
			padding-left: 20px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "top">
			<h1>Welcome, <c:out value="${user.username}"></c:out>!</h1>
			
			<div id = "topright">
				<form id = "logoutForm" method="POST" action="/logout">
			        <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
			        <input type = "submit" value = "Logout!" />
			    </form>
			</div>
		</div>
		<div id = "blackline"></div>
		<div id = "main">
			<br>
			<h4>Name:</h4> <p>${user.username}</p><br>
			<h4>Email:</h4> <p>${user.email}</p><br>
			<h4>Sign up date:</h4> <p>${time}</p><br>
			<h4>Last signed in:</h4> <p>${t}</p><br>
			<c:if test = "${user.roles.get(0).name.equals('ROLE_ADMIN')}">
				<a href = "/admin">Admin Page</a>
			</c:if>
		</div>
	</div>
</body>
</html>