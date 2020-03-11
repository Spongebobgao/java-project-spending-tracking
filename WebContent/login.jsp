<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
<style>
header {
	background-color: #008080;
	padding: 10px;
	text-align: center;
	font-size: 25px;
	color: white;
	height:200px;
}

form {
	padding: 20px;
}

body {
	background-color: #B5E0D6;
}
input{
	padding:5px;
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
input:focus {
  background-color: lightblue;
}
input:hover {
    background-color: lightblue;
}
</style>
</head>
<body>
	<header>
		<a class="button" style="margin-right:10px" href=http://localhost:8080/Spending/home.jsp>Home</a>
		<a class="button"  href=http://localhost:8080/Spending/register.jsp>Register</a>
		<h1>Please log in</h1>
	</header>
	<form action="Login" method="post" align="center">
		<div style="color: #FF0000;">${errorMessage}</div>
		<table align="center">
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="text" name="password" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="submit" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
