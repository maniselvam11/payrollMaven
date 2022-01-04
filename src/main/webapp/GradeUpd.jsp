<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
</head>
<body>
<form action="gradeUpd" method="post">
  <label for="gradeName">Grade Name</label>
<input type="text" id="gradeName" name="name" ><br><br>

 <label for="gradeBasic">Basic Salary</label>
<input type="number" id="gradeBasic" name="basic"><br><br>

 <label for="gradeBonus">Bonus Salary</label>
<input type="number" id="gradeBonus" name="bonus" ><br><br>

 <label for="gradePf">Providient Fund</label>
<input type="number" id="gradePf" name="pf" ><br><br>

 <label for="gradePt">Professional Tax</label>
<input type="number" id="gradePt" name="pt" ><br><br>

<input type="submit">
</form>
</body>
</html>