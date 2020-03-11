<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="myTags" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="myTag" uri="simpleTags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
header {
	background-color: #008080;
	padding: 10px;
	text-align: center;
	font-size: 25px;
	color: white;
	height:200px;
}

body {
	background-color: #B5E0D6;
	text-align: center;
	font-size: 25px;
	height:200px''
}

.button {
	font-size: 20px;
	text-decoration: none;
	float: left; background-color : #EEEEEE;
	color: #333333;
	padding: 2px 6px 2px 6px;
	border-radius:5px;
	border-top: 1px solid #CCCCCC;
	border-right: 1px solid #333333;
	border-bottom: 1px solid #333333;
	border-left: 1px solid #CCCCCC;
	background-color: #EEEEEE;
	border-width: thin
}
</style>
</head>
<body>
	<header>
	<!--<myTags:header subtitle="what">I just want to print this</myTags:header>
	<myTag:simple/>-->
	<c:choose>
	<c:when test="${empty name}">
			<a class="button" style="margin-right:10px" href=http://localhost:8080/Spending/register.jsp>Register</a>
			<a class="button" style="margin-right:10px" href=http://localhost:8080/Spending/login.jsp>Log In</a>
	</c:when>
	<c:otherwise>
			<a class="button" style="margin-right:10px" href=http://localhost:8080/Spending/info.jsp>Info</a>
			 <a class="button" href=http://localhost:8080/Spending/logout.jsp>Log Out</a>
	</c:otherwise>
	</c:choose>
			 <h1>Hello 
			 <c:out value="${name}" default="guest"/>
			 </h1>
		<h1>Welcome to spending track website!</h1>
	</header>
</body>
</html>