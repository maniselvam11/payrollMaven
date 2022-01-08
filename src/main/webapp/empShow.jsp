<%@page import="com.payroll.model.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
<%@page import="com.payroll.Interface.EmployeeDao"%>
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
    background: #2ECC71;
    }
    
    table,th,td{
border:1px solid black;
border-collapse:collapse;
}
    </style>



</head>
<body>






<div id="empShowForm" >
<h2>Show Employee</h2>
<form >
<table >
<tr>
<td>Employee Name</td>
<td>Date Of Birth</td>
<td>Date Of Joining</td>
<td>Address</td>
<td>City</td>
<td>Pincode</td>
<td>MobileNumber</td>
<td>State</td>
<td>MailId</td>
<td>PanNumber</td>
<td>Department Name</td>
<td>Delete</td>
<td>Edit</td>

</tr>


<%EmployeeDaoImpl employeeDao=new  EmployeeDaoImpl();
List<Employee> employeeList=employeeDao.showEmployee();
for(int i=0;i<employeeList.size();i++)
{
	Employee emp=employeeList.get(i);
%>
<tr>

<td><%= emp.getEmpName() %></td>
<td><%= emp.getDob() %></td>
<td><%= emp.getDoj() %></td>
<td><%= emp.getAddress() %></td>
<td><%= emp.getCity() %></td>
<td><%= emp.getPincode() %></td>
<td><%= emp.getMobileNo() %></td>
<td><%= emp.getState() %></td>
<td><%= emp.getMailId() %></td>
<td><%= emp.getPanNo() %></td>
<td><%= emp.getDept().getDeptName()%></td>
<td><a href="empDel?empId=<%= emp.getEmpId() %>">Delete</a></td>
<td><a href="EmployUpd.jsp?empId=<%= emp.getEmpId() %>">Edit</a></td>
</tr>
<%} %> 

</table>

<button onclick="history.go(-1)">Go Back</button>

<a href="AdminControl.jsp"><button type="button"><strong>Home Page</strong></button></a>
</form>

</div>
<br>
</body>
</html>