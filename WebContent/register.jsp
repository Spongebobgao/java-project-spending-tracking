<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
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
	text-align:center;
}
.button {
  font-size:20px;
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
input{
	padding:5px;
}
</style>
</head>


<body>
<header>
	<a class="button" href=http://localhost:8080/Spending/home.jsp>Home</a>
	<h1>Please register first</h1>			
</header>

<form action="Register" method="post" align="center">
<div style="color: #FF0000;">${errorMessage}</div>
		<table align="center">
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="text" name="password"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="submit" /></td>
			</tr>
		</table>

	</form>
</body>
</html>