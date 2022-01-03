<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payroll</title>
<style>
label{
width:80px;
display:inline-block;
}
</style>

</head>
<body>
<form action="empUpdate">
  <label for="empName">Employ Name</label><br>
<input type="text" id="empName" name="name" >

<label for="empDob">Employ DateOfBirth</label><br>
<input type="date" id="empDob" name="dob" >

<label for="empDoj">Employ DateOfJoining</label><br>
<input type="date" id="empDoj" name="doj" >

<label for="empAddress">Address</label><br>
<input type="text" id="empAddress" name="address" >

<label for="empCity">City</label><br>
<input type="text" id=""empCity"" name="city" >

<label for="empPin">Pincode</label><br>
<input type="number" id="empPin" name="pincode" >

<label for="empNo">Mobile Number</label><br>
<input type="number" id="empNo" name="mobile" >

<label for="empState">State</label><br>
<input type="text" id="empState" name="state" >

<label for="empEmail">EmailId</label><br>
<input type="text" id="empEmail" name="email" >

<label for="empPan">Pan Number</label><br>
<input type="text" id="empPan" name="pan"><br><br>
<input type="submit">
</form>
</body>
</html>