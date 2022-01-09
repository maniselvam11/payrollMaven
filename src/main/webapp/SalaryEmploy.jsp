<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
    background-image: linear-gradient(to right, green , yellow);
    }
    </style>
</head>
<body>


<form action="SalaryReport.jsp">
<label for="employId">EMPLOYEE ID</label>
<input type="number" name="eId" id="employId" pattern="[0-9]+" placeholder="enter employ Id"><br><br>
<center>
<a href="SalaryReport.jsp?eId="><button type="submit" class="btn"  ><strong>GENERATE REPORT</strong></button></a>
 <input type="button" value="Go back!" onclick="history.go(-1)">
 </center>
</form>
</body>
</html>