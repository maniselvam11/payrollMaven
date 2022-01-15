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
  	border-radius: 20px;
  	width:30%;
  	margin-left: 440px;
  	background-color: #B9B087 ;
  	margin-top:10%;
  	}
    </style>
</head>
<body>


<form action="SalaryReport.jsp" class="formSty">
<br>
<center>
<label for="employId">EMPLOYEE ID</label>
<input type="number" name="eId" min="1"id="employId" pattern="[0-9]+" placeholder="enter employ Id"><br><br>
<a href="SalaryReport.jsp?eId=0"><button type="submit"   class="btn btn-primary">GENERATE REPORT</button></a>
 <input type="button" value="Go back!" onclick="history.go(-1)" class="btn btn-primary">
 </center>
 <br>
</form>
</body>
</html>