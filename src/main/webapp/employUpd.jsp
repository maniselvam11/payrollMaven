<%@page import="com.payroll.model.Employee"%>
<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
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
<% int empId=Integer.parseInt(request.getParameter("empId"));
EmployeeDaoImpl employDao=new EmployeeDaoImpl();
Employee employ=employDao.findEmployee(empId);
%>
<form action="empUpdate" method="post">

  <label for="empName">Employ Name</label>
<input type="text" id="empName" name="name"  autofocus="autofocus" value="<%=employ.getEmpName()%>"><br>

<label for="empDob">Employ DateOfBirth</label>
<input type="date" id="empDob" name="dob" value="<%=employ.getDob() %>"><br>

<label for="empDoj">Employ DateOfJoining</label>
<input type="date" id="empDoj" name="doj" value="<%=employ.getDoj() %>"><br>

<label for="empAddress">Address</label>
<input type="text" id="empAddress" name="address" value="<%=employ.getAddress() %>"><br>

<label for="empCity">City</label>
<input type="text" id="empCity" name="city" value="<%=employ.getCity()%>"><br>

<label for="empPin">Pincode</label>
<input type="number" id="empPin" name="pincode" value="<%=employ.getPincode() %>"><br>

<label for="empNo">Mobile Number</label>
<input type="number" id="empNo" name="mobile" value="<%=employ.getMobileNo() %>"><br>

<label for="empState">State</label>
<input type="text" id="empState" name="state" value="<%=employ.getState() %>" ><br>

<label for="empEmail">EmailId</label>
<input type="text" id="empEmail" name="email" value="<%=employ.getMailId() %>"><br>

<label for="empPan">Pan Number</label>
<input type="text" id="empPan" name="pan" value="<%=employ.getPanNo() %>"><br><br>


<label for="empDepart">Department Name</label>
<input type="text" id="deptName" name="dName" value="<%=employ.getDept().getDeptName() %>"><br><br>
<input type="submit">
</form>
</body>
</html>