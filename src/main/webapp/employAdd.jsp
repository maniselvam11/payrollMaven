<%@page import="com.payroll.model.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title>payroll</title>
    <link rel="stylesheet" href="styles.css" />
    
    <style>
    
     body {
    font-family: Arial, Helvetica, sans-serif;
    background-image: linear-gradient(to right, green , yellow);
    }
    label{
    width:200px;
    display:inline-block;
    }
    .empDiv{
    text-align: center;
    }
     .formSty{
    background-color: white;
    border: 0px solid red;
  	padding: 0px 20px;
  	border-radius: 25px;
  	width:30%;
  	margin-left: 440px;
  	background-color: #B9B087 ;
  	}
   
    </style>
    
  </head>
  <body>
  <div class="empDiv">
 
  <h3>Employee ADD</h3>
  

<form action="empAdd" class="formSty" >
<br>
<label for="name">NAME</label>
<input type="text" pattern="[a-zA-z\s]+" id="name" name="EmployeeName" placeholder="Enter your name" autofocus="autofocus"><br><br>
<label for="dob" >DATE OF BIRTH</label>
<input type="date" pattern="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\\d{4}" id="dob" name="dob" placeholder="enter your DOB"><br><br>
<label for="doj">DATE OF JOINING</label>
<input type="date" pattern="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\\d{4}" id="doj" name="doj" placeholder="Date Of Joining"><br><br>
<label for="address">ADDRESS</label>
<input type="text" pattern="[a-zA-z0-9/,\s]+" id="address" name="address" placeholder="Enter Address"><br><br>
<label for="city">CITY</label>
<input type="text" pattern="[a-zA-z]+" id="city" name="city" placeholder="Enter city"><br><br>
<label for="pincode">PINCODE</label>
<input type="number"  maxlength="6" id="pincode" name="pincode" placeholder="pincode"><br><br>
<label for="mobileno">MOBILE NUMBER</label>
<input type="number" pattern="[0-9]{10}" id="mobileno" maxlength="10" name="mobileNumber" placeholder="Enter MobileNumber"><br><br>
<label for="state">STATE</label>
<input type="text" pattern="[a-zA-z]+" id="state" name="state" placeholder="Enter State"><br><br>
<label for="mailId">EMAIL ID</label>
<input type="email" pattern="[a-z][a-z0-9]+[@][a-z]+[.][a-z]+" id="mailId" name="mailId" placeholder="Enter employ mail"><br><br>
<label for="panNumber">PAN NUMBER</label>
<input type="text" pattern="[a-zA-z0-9]+{10}" maxlength="10" id="panNumber" name="panNo" placeholder="Enter Pan Number"><br><br>
<label for="departmentName">DEPARTMENT NAME</label>
<input type="text" pattern="[a-zA-z]+" name="deptName" placeholder="Enter Department Name"><br><br>
<div>
<center>
<input type="submit">

<input type="reset">
</center>
</form>
  <br>
<a href="AdminControl.jsp"><button type="button"><strong>HOME</strong></button></a>


 <input type="button" value="Go back!" onclick="history.go(-1)">
<br><br>
</div>
</div>
</body>
  
  
</html>
<script>
 today();
 function today(){
     var today = new Date();
     var dd = String(today.getDate()).padStart(2, '0');
     var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
     var yyyy = today.getFullYear();
     var yyyy1= today.getFullYear()-24;
 mindate =yyyy1 + '-' + mm + '-'+ dd  ;
 maxdate =yyyy + '-' + mm + '-'+ dd  ;
 document.getElementById("dob").setAttribute("max",maxdate);
 document.getElementById("dob").setAttribute("min",mindate);
 document.getElementById("doj").setAttribute("max",maxdate);
 document.getElementById("doj").setAttribute("min",mindate);
 
 }
</script>