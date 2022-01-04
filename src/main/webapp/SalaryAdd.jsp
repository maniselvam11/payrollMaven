<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
</head>
<body>
<script>
function salaryAdd(){
	var salaryAdd=document.getElementById("salaryInsert");
	salaryAdd.style.display=("block");
}</script>
<div>
<button  class="btn" style="width:10%; font-size : 20px;" onclick="salaryAdd()"><strong>Enter Salary Detail</strong></button>
<a href="SalaryShow.jsp"><button  class="btn" style="width:10%; font-size : 20px;" ><strong>Show Salary</strong></button></a>
</div>

<form action="salaryInsert" style="display :none;">
<h1><STRONG>ADMINISTRATOR &nbsp;</STRONG></h1>

<label for="employName">Employee Name</label>
<input type="text" name="eName" id="employName" pattern="[a-zA-Z]+" placeholder="enter employ Name"><br><br>
<label for="gradeName">Grade Name</label>
<input type="text" name="gName" id="gradeName" pattern="[a-zA-Z]+" placeholder="enter Grade Name"><br><br>
<label for="deptName">Department Name</label>
<input type="text" name="dName" id="deptName" pattern="[a-zA-Z]+" placeholder="enter Department Name"><br><br>
<label for="salDate">Salary Date</label>
<input type="date" name="salDate" id="salaryDate" ><br><br>
<label for="Basic">Department Name</label>
<input type="text" name="dName" id="deptName" pattern="[a-zA-Z]+" placeholder="enter Department Name"><br><br>

</body>
</html>