<%@page import="com.payroll.model.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>search employee</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
     body {
    font-family: Arial, Helvetica, sans-serif;
    background-image: linear-gradient(to right, green , yellow);
    }
    
table {
  border-collapse: collapse;
  width: 100%;
}

 td,th {
  text-align: left;
  padding: 8px;
}
tr:hover{
background-color: lime;
}

tr:nth-child(even) {
background-color: #f2f2f2;
}
</style>
</head>
<body>

<h2>Search Employee</h2>
<table>
<tr>
<td>EMPLOY ID</td>
<td>EMPLOY NAME</td>
<td>DOB</td>
<td>DOJ</td>
<td>ADDRESS</td>
<td>CITY</td>
<td>PINCODE</td>
<td>MOBILE NO</td>
<td>STATE</td>
<td>EMAIL</td>
<td>PAN NUMBER</td>
<td>STATUS</td>
<td>DEPARTMENT NAME</td>

</tr>


<div id="empInfo">
<%String name=request.getParameter("empName");
EmployeeDaoImpl employDao=new EmployeeDaoImpl();

List<Employee> employeeList=employDao.searchEmployee(name);
for(int i=0;i<employeeList.size();i++)
{
	Employee employ=employeeList.get(i);
	%>
	<tr>
	<td><%=employ.getEmpId() %></td>
	<td><%=employ.getEmpName() %></td>
	<td><%=employ.getDob() %></td>
	<td><%=employ.getDoj() %></td>
	<td><%=employ.getAddress() %></td>
	<td><%=employ.getCity() %></td>
	<td><%=employ.getPincode() %></td>
	<td><%=employ.getMobileNo() %></td>
	<td><%=employ.getState() %></td>
	<td><%=employ.getMailId() %></td>
	<td><%=employ.getPanNo() %></td>
	<td><%=employ.getStatus() %></td>
	<td><%=employ.getDept().getDeptName() %></td>
	</tr>
	
</div>
<%} %>
</table>
<center>
<br>
<a href="AdminControl.jsp"><button type="button" class="btn btn-primary"><strong>Home Page</strong></button></a>
<input type="button" value="Go back!" onclick="history.go(-1)" class="btn btn-primary">
</center>
</body>
</html>