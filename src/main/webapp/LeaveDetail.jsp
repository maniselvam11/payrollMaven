<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
</head>
<style>
  body {
    font-family: Arial, Helvetica, sans-serif;
    background-image: linear-gradient(to right, green , yellow);
    }
    a{
    text-decoration: none;
    }
       
    label{
    width:200px;
    display:inline-block;
    }
      .formSty{
    background-color: white;
    border: 0px solid red;
  	padding: 0px 20px;
  	border-radius: 25px;
  	width:30%;
  	margin-left: 440px;
  	background-color: #B9B087 ;
  	margin-top: 10%;
  	}
   

</style>
</head>
<body>
<form action="LeaveAdd" class="formSty"  >
<h2>ADD LEAVE</h2>
<label for="employId">EMPLOYEE ID</label>
<input type="number" name="empId" id="employId" pattern="[0-9]+" placeholder="enter employ ID"><br><br>

<label for="leaveDate">LEAVE DATE</label>
<input type="date" name="lDate" id="leaveDate" ><br><br>

<label for="leaveReason"> REASON</label>
<input type="text" name="reason" id="leaveReason" placeholder="enter leave reason"><br><br>
<center>
<input type="submit">

<button onclick="history.back()">BACK</button>

<a href="AdminControl.jsp"><button type="button"><strong>HOME</strong></button></a>

</center>
<br>
</form>


</body>
</html>