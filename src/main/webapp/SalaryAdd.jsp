<%@page import="com.payroll.model.Employee"%>
<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
   body {
    font-family: Arial, Helvetica, sans-serif;
    background-image: linear-gradient(to right, green , yellow);
    }
     .formSty{
    background-color: white;
  	padding: 0px 20px;
  	border-radius: 25px;
  	width:30%;
  	background-color: #B9B087 ;
  	margin-top:10%;
  	}
  	label{
    width:150px;
    display:inline-block;
    }
 
</style>
</head>
<body>
<%String salInvalid=(String)request.getAttribute("salaryInvalid");
if(salInvalid!=null){
%>
<center>
<h2><%=salInvalid %></h2>
<%session.removeAttribute("salaryInvalid"); %>
</center>
<%} %>


<center>
<h1><STRONG>ADMINISTRATOR &nbsp;</STRONG></h1>

<form action="salaryInsert" class="formSty" >
<br>
<label for="employId">EMPLOYEE ID</label>
<input type="number" name="eId" id="employId" min="1" pattern="[a-zA-Z\s]+" placeholder="enter employ Id"><br><br>
<label for="gradeName">GRADE NAME</label>
<input type="text" name="gName" id="gradeName" pattern="[a-zA-Z\s]+" placeholder="enter Grade Name"><br><br>
<label for="deptName">DEPARTMENT NAME</label>
<input type="text" name="dName" id="deptName" pattern="[a-zA-Z\s]+"><br><br>
<label for="salDate">SALARY DATE</label>
<input type="date" name="salDate" id="salaryDate" ><br><br>



<label for="taxDeducte">Professional Tax</label>

<select name="tax" id="pf">
  <option value="yes">Yes</option>
  <option value="no">No</option>
 
</select>

<br><br>
<label for="monthBonus">Month Bonus</label>

<select name="bonus" id="monthBonus">
  <option value="yes">Yes</option>
  <option value="no">No</option>
 
</select>
<br>
<br>
<input type="reset" class="btn btn-primary">
<input type="submit" class="btn btn-primary">
<button onclick="history.back()" class="btn btn-primary">BACK</button>
<a href="AdminControl.jsp"><button type="button" class="btn btn-primary"><strong>HOME</strong></button></a>
<br><br>
</center>
</form>
</body>
</html>
<script>
today();
function today(){
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    var yyyy1= today.getFullYear()+2;
    mindate =yyyy + '-' + mm + '-'+ dd  ;
    maxdate =yyyy1 + '-' + mm + '-'+ dd  ;
document.getElementById("salaryDate").setAttribute("min",mindate);
document.getElementById("salaryDate").setAttribute("max",maxdate);
}


</script>