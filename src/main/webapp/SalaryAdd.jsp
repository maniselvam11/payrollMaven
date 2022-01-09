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
    
    table,th,td{
border:1px solid black;
border-collapse:collapse;
}
</style>
</head>
<body>
<%String salInvalid=(String)request.getAttribute("salaryInvalid");
if(salInvalid!=null){
%>
<center>
<h2><%=salInvalid %></h2>
</center>
<%} %>
<center>
<h1><STRONG>ADMINISTRATOR &nbsp;</STRONG></h1>

<form action="salaryInsert" >
<label for="employId">EMPLOYEE ID</label>
<input type="number" name="eId" id="employId" pattern="[a-zA-Z\s]+" placeholder="enter employ Id"><br><br>
<label for="gradeName">GRADE NAME</label>
<input type="text" name="gName" id="gradeName" pattern="[a-zA-Z\s]+" placeholder="enter Grade Name"><br><br>
<label for="deptName">DEPARTMENT NAME</label>
<input type="text" name="dName" id="deptName" pattern="[a-zA-Z\s]+"  placeholder="enter Department Name"><br><br>
<label for="salDate">SALARY DATE</label>
<input type="date" name="salDate" id="salaryDate" ><br><br>



<label for="taxDeducte">Do You Want To Deducte Professional</label>

<select name="tax" id="pf">
  <option value="yes">Yes</option>
  <option value="no">No</option>
 
</select>

<br><br>
<label for="monthBonus">This Month Bonus Do You Want To Add</label>

<select name="bonus" id="monthBonus">
  <option value="yes">Yes</option>
  <option value="no">No</option>
 
</select>
<br>
<br>
<input type="reset">
<input type="submit">
<button onclick="history.back()">BACK</button>
<a href="AdminControl.jsp"><button type="button"><strong>HOME</strong></button></a>
</center>
</form>

</body>
</html>