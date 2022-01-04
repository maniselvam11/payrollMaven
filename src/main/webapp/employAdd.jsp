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
    background: #2ECC71;
    }
    label{
    width:200px;
    display:inline-block;
    }
   
    </style>
    
  </head>
  <body>
  <br>
  <br>
  <br>
 

  <h3>Add Employee</h3>
  <br><br>

<form action="empAdd" method="post">
<label for="name">Name</label>
<input type="text" pattern="[a-zA-z\s]+" id="name" name="EmployeeName" placeholder="Enter your name"><br><br>
<label for="dob">DateOfBirth</label>
<input type="date" pattern="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\\d{4}" id="dob" name="dob" placeholder="enter your DOB"><br><br>
<label for="doj">DateOfJoining</label>
<input type="date" pattern="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\\d{4}" id="doj" name="doj" placeholder="Date Of Joining"><br><br>
<label for="address">Address</label>
<input type="text" pattern="[a-zA-z0-9/,\s]+" id="address" name="address" placeholder="Enter Address"><br><br>
<label for="city">City</label>
<input type="text" pattern="[a-zA-z]+" id="city" name="city" placeholder="Enter city"><br><br>
<label for="pincode">Pincode</label>
<input type="number" pattern="[0-9]+{6}" id="pincode" name="pincode" placeholder="pincode"><br><br>
<label for="mobileno">MobileNumber</label>
<input type="number" pattern="[0-9]{10}" id="mobileno" name="mobileNumber" placeholder="Enter MobileNumber"><br><br>
<label for="state">State</label>
<input type="text" pattern="[a-zA-z]+" id="state" name="state" placeholder="Enter State"><br><br>
<label for="mailId">MailId</label>
<input type="email" pattern="[a-z][a-z0-9]+[@][a-z]+[.][a-z]+" id="mailId" name="mailId" placeholder="Enter employ mail"><br><br>
<label for="panNumber">PanNumber</label>
<input type="text" pattern="[a-zA-z0-9]+{10}" id="panNumber" name="panNo" placeholder="Enter Pan Number"><br><br>
<label for="departmentName">Department Name</label>
<input type="text" pattern="[a-zA-z]+" name="deptName" placeholder="Enter Department Name"><br><br>
<input type="submit">

</form>
  

</div>

  
  </body>
  
  
</html>