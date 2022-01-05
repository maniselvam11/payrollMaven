<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
</head>
<body>
<h1><STRONG>ADMINISTRATOR &nbsp;</STRONG></h1>

<form action="salaryInsert" >
<label for="employId">Employee Id</label>
<input type="number" name="eId" id="employId" pattern="[a-zA-Z]+" placeholder="enter employ Id"><br><br>
<label for="gradeName">Grade Name</label>
<input type="text" name="gName" id="gradeName" pattern="[a-zA-Z]+" placeholder="enter Grade Name"><br><br>
<label for="deptName">Department Name</label>
<input type="text" name="dName" id="deptName" pattern="[a-zA-Z]+" placeholder="enter Department Name"><br><br>
<label for="salDate">Salary Date</label>
<input type="date" name="salDate" id="salaryDate" ><br><br>



<label for="taxDeducte">Do you want to Deducte professional</label>

<select name="tax" id="pf">
  <option value="yes">Yes</option>
  <option value="no">No</option>
 
</select>
<br><br>
<label for="monthBonus">This month bonus do you want to Add</label>

<select name="bonus" id="monthBonus">
  <option value="yes">Yes</option>
  <option value="no">No</option>
 
</select>
<br>
<input type="submit">

</body>
</html>