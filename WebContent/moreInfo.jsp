<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>More Info</title>
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
select{
	padding:5px;
	cursor:pointer;
}
input:hover {
	background-color: lightblue;
}
</style>
</head>
<body>
<header>
	<c:choose>
	<c:when test="${empty name}">
			<jsp:forward page="home.jsp"/>
	</c:when>
	<c:otherwise>
			<a class="button" style="margin-right:10px" href=http://localhost:8080/Spending/home.jsp>Home</a>
			<a class="button" style="margin-right:10px" href=http://localhost:8080/Spending/info.jsp>Info</a>
			 <a class="button" href=http://localhost:8080/Spending/logout.jsp>Log Out</a>
	</c:otherwise>
	</c:choose>
			 <h1>Hello 
			 <c:out value="${name}" default="guest"/>
			 </h1>
		<h1>Where does all the money go?</h1>
	</header>
<form action="MoreInfo" method="get">
<formTags:select optionsList="${monthList }"/>
	Please select the month you want to check:<select name="month" >					
						<option value="1">January</option>
						<option value="2">February</option>
						<option value="3">March</option>
						<option value="4">April</option>
						<option value="5">May</option>
						<option value="6">June</option>
						<option value="7">July</option>
						<option value="8">August</option>
						<option value="9">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
	 </select>
	 <input type="submit" value="Submit">
	</form>
	<c:choose>
	<c:when test="${empty oldspendings }">
	<h3>
		Nothing shows up.
	</h3>
	</c:when>
	<c:otherwise>
	<h3>Month ${month}</h3> 
	<table align ="center" border="2"  cellpadding="5">
	<tr>
			<th>Id</th>
			<th>Spending</th>
			<th>Purpose</th>
			<th>Method</th>
			<th>Date</th>
		</tr>
		<tr>
		</tr>
		<c:forEach items="${oldspendings}" var="oldspending" varStatus="oldspendingCount">
						<tr>
							<td>${oldspendingCount.count }</td>
							<td>$ ${oldspending.spending}</td>
							<td>${oldspending.purpose}</td>
							<td>${oldspending.method}</td>
							<td>${oldspending.time}</td>
						</tr>
					</c:forEach>					
	</table>
	<h3>Your total spending of this month is ${oldTotal}</h3>
	</c:otherwise>
	</c:choose>
</body>
</html>