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
    background: #2ECC71;
    }
    
    table,th,td{
border:1px solid black;
border-collapse:collapse;
}
</style>
</head>
<body>

<h1><STRONG>ADMINISTRATOR &nbsp;</STRONG></h1>
<div>
<a href="SalaryAdd.jsp"><button  class="btn" style="width:10%; font-size : 20px;"><strong>Enter Salary Detail</strong></button></a>
<a href="SalaryEmploy.jsp?employId=0"><button  class="btn" style="width:10%; font-size : 20px;" ><strong>Employee Report</strong></button></a>
<br>
<br>
<button onclick="history.back()">Go Back</button>
</div>

</body>
</html>