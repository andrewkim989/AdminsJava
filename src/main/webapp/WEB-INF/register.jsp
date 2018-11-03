<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Register Page</title>
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
		#register {
			width: 500px;
			margin: 20px;
			padding: 22px;
			margin-left: 350px;
			background-color: rgb(247, 144, 116);
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
		<h1>Register for an Account</h1>
		<div id = "register">
		    <form:form method = "POST" action = "/register" modelAttribute = "user">
		        <p>
		            <form:label path = "username">Username:</form:label>
		            <form:errors path = "username"/><br>
		            <form:input path = "username"/>
		        </p>
		        <p>
		            <form:label path = "email">Email:</form:label>
		            <form:errors path = "email"/><br>
		            <form:input path = "email"/>
		        </p>
		        <p>
		            <form:label path = "password">Password:</form:label>
		            <form:errors path = "password"/><br>
		            <form:password path = "password"/>
		        </p>
		        <p>
		            <form:label path = "passwordConfirmation">Password Confirmation:</form:label>
		            <form:errors path = "passwordConfirmation"/><br>
		            <form:password path = "passwordConfirmation"/>
		        </p>
		        <input type = "submit" value = "Register!"/>
		        <br><br>
		        <a href = "/">Back</a>
		    </form:form>
		</div>
	</div>
</body>
</html>