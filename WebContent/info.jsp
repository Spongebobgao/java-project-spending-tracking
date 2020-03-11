<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="./main.js"></script>
<title>Info</title>
<style>
header {
	background-color: #008080;
	padding: 10px;
	text-align: center;
	font-size: 20px;
	color: white;
	height: 150px;
}

form {
	padding: 20px;
	text-align: center;
}

body {
	background-color: #B5E0D6;
}
select{
	padding:5px;
}
.button {
	font-size: 20px;
	text-decoration: none;
	float: left;
	background-color: #EEEEEE;
	color: #333333;
	padding: 2px 6px 2px 6px;
	border-radius: 5px;
	border-top: 1px solid #CCCCCC;
	border-right: 1px solid #333333;
	border-bottom: 1px solid #333333;
	border-left: 1px solid #CCCCCC;
	padding:5px;
}
input{
	padding:5px;
}

input:focus {
	background-color: lightblue;
}

input:hover {
	background-color: lightblue;
}
button:hover {
	background-color: lightblue;
}
.select:hover {
	background-color: lightblue;
}
</style>
</head>
<body>
	<header style="z-index:2;position:sticky;top:0">
	<c:if test ="${empty name }">
	<jsp:forward page="home.jsp"/>
	</c:if>
		<a class="button" style="margin-right: 10px"
			href=http://localhost:8080/Spending/home.jsp>Home</a> <a
			class="button" href=http://localhost:8080/Spending/logout.jsp>Log
			Out</a>
		<h1 style="text-align:center;position:relative;left:45%;transform:translateX(-50%)">Hello ${name} !</h1>
		<h2>Your total spending now is ${total}!</h2>
	</header>

	<form action="Save" method="post">
		<div style="color: #FF0000;">${errorMessage}</div>
		<table align="center">
			<tr>
				<td>Your new spending today:</td>
				<td><input id="newSpending" type="text" name="newSpending" value="0.00"></td>
			</tr>
			<tr>
				<td>What's the purpose:</td>
				<td>
						<input type="text" name="purpose" value="Grocery"></td>
			</tr>
			<tr>
				<td>What's the payment method:</td>
				<td><select class="select" style="width: 164px" name="method">
						<option value="paypal">Paypal</option>						
						<option value="lmax">Lin's amx</option>
						<option value="ldisc">Lin's disc</option>
						<option value="lboa">Lin's boa</option>
						<option value="lchase">Lin's chase</option>
						<option value="mboa">Ma's boa</option>
						<option value="mdisc">Ma's disc</option>
						<option value="mamx">Ma's amx</option>
						<option value="cash">Cash</option>
				</select></td>
			</tr>
		</table>
		<input type="submit" value="Submit">
	</form>
	<p style="text-decoration:underline;text-align:center;position:relative;left:50%;transform:translateX(-50%)">Press the button to check your spending detail.</p>
	<input type="button" style="position:relative;left:45%;transform:translateX(-50%)" onclick="change()" value="Toggle Details">
	<input type="button" style="position:relative;left:50%;transform:translateX(-50%)" onclick="window.location='moreInfo.jsp'" value="Other month's Details">
	<br>
	<br>
	<div id="records" style="display:none">
	<table align="center"><tr><td>
	<c:if test="${!spendings.isEmpty() }">
	<table   align="center" border="2"  cellpadding="5"  >
		<tr>
			<th>Id</th>
			<th>Spending</th>
			<th>Purpose</th>
			<th>Method</th>
			<th>Date</th>
		</tr>
		<tr>
		</tr>
		<c:forEach items="${spendings}" var="spending" varStatus="spendingCount">
						<tr>
							<td>${spendingCount.count }</td>
							<td>$ ${spending.spending}</td>
							<td>${spending.purpose}</td>
							<td>${spending.method}</td>
							<td>${spending.time}</td>
						</tr>
					</c:forEach>					
	</table>
	</c:if>
	</td><td>
	<c:if test="${!monthlyspending.isEmpty()}">
	<table   align="center" border="2"  cellpadding="5" >
		<tr>
			<th>Total Spending</th>
			<th>Month</th>
		</tr>
		<tr>
		</tr>
		<c:forEach items="${monthlyspending}" var="month" varStatus="status">
						<tr>
							<td>$ ${month.spending}</td>							
							<td>${month.time}</td>
						</tr>
					</c:forEach>					
	</table>
	</c:if>
	</td></tr>
	</table>
	</div>
</body>
</html>