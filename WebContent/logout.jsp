<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Goodbye</title>
<style>
body {
	background-color: #B5E0D6;
	text-align: center;
	font-size: 35px;
}

.button {
	font-size: 20px;
	text-decoration: none;
	float:left;
	background-color: #EEEEEE;
	color: #333333;
	border-radius:5px;
	padding: 2px 6px 2px 6px;
	border-top: 1px solid #CCCCCC;
	border-right: 1px solid #333333;
	border-bottom: 1px solid #333333;
	border-left: 1px solid #CCCCCC;
}
</style>
</head>
<body>
	<div>
		<a class="button" style="margin-right:10px" href=http://localhost:8080/Spending/home.jsp>Home</a>
		<a class="button" href=http://localhost:8080/Spending/login.jsp>Log
			In</a>
	</div>
	<br> Good Bye!
	<%
		session.invalidate();
	%>
</body>
</html>