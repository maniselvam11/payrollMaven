<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payroll</title>
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

<form action="empUpdate" method="post">

  <label for="empName">Employ Name</label>
<input type="text" id="empName" name="name"  placeholder=""><br>

<label for="empDob">Employ DateOfBirth</label>
<input type="date" id="empDob" name="dob" ><br>

<label for="empDoj">Employ DateOfJoining</label>
<input type="date" id="empDoj" name="doj" ><br>

<label for="empAddress">Address</label>
<input type="text" id="empAddress" name="address" ><br>

<label for="empCity">City</label>
<input type="text" id="empCity" name="city" ><br>

<label for="empPin">Pincode</label>
<input type="number" id="empPin" name="pincode" ><br>

<label for="empNo">Mobile Number</label>
<input type="number" id="empNo" name="mobile" ><br>

<label for="empState">State</label>
<input type="text" id="empState" name="state" ><br>

<label for="empEmail">EmailId</label>
<input type="text" id="empEmail" name="email" ><br>

<label for="empPan">Pan Number</label>
<input type="text" id="empPan" name="pan"><br><br>
<input type="submit">
</form>
</body>
</html>