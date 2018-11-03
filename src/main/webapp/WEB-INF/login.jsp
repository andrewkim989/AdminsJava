<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Sign In</title>
	<link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
	<style>
		#wrapper {
			padding-left: 70px;
			background-color: lightgrey;
			height: 640px;
		}
		h1 {
			text-align: center;
			padding-top: 10px;
			padding-right: 50px;
		}
		#login {
			width: 500px;
			margin: 20px;
			padding: 22px;
			background-color: rgb(224, 166, 150);
			border-radius: 10px;
			display: inline-block;
			vertical-align: top;
		}
		#register {
			width: 500px;
			margin: 20px;
			padding: 22px;
			background-color: rgb(232, 135, 109);
			border-radius: 10px;
			display: inline-block;
			vertical-align: top;
		}
		input[type = text] {
			padding: 3px 5px;
			border: 1px solid #ccc;
			border-radius: 4px;
			width: 250px;
			box-sizing: border-box;
		}
		input[type = password] {
			padding: 3px 5px;
			border: 1px solid #ccc;
			border-radius: 4px;
			width: 250px;
			box-sizing: border-box;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>Welcome! Please sign in below! </h1>
	    <div id = "login">
	    	<c:if test="${logoutMessage != null}">
		        <c:out value="${logoutMessage}"></c:out>
		    </c:if>
			<h2>Login here!</h2>
			<c:if test="${errorMessage != null}">
		        <c:out value="${errorMessage}"></c:out>
		    </c:if>
		    <form method = "POST" action = "/login">
		        <p>
		            Username:<br>
		            <input type = "text" name = "username"/>
		        </p>
		        <p>
		            Password:<br>
		            <input type = "password" name = "password"/>
		        </p>
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        <input type = "submit" value = "Login!"/>
		    </form>
		</div>
		
		<div id = "register">
			<h2>Don't have an account?</h2>
			<a href = "/register">Sign up for an account here!</a>
		</div>
	</div>
</body>
</html>