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
    background-image: linear-gradient(to right, green , yellow);
    }
    
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
a{
text-decoration:none;
}
    </style>
</head>
<body>
<%String deleteError=(String)session.getAttribute("delete");
if(deleteError!=null){
%>
	<h2><%=deleteError %></h2>
<%} %>

<div id="empShowForm" >
<h2>EMPLOYEE</h2>
<form >
<table >
<tr>
<td>EMPLOYEE NAME</td>
<td>DATE OF BIRTH</td>
<td>DATE OF JOINING</td>
<td>ADDRESS</td>
<td>CITY</td>
<td>PINCODE</td>
<td>MOBILE NUMBER</td>
<td>STATE</td>
<td>EMAIL ID</td>
<td>PAN NUMBER</td>
<td>DEPARTMENT NAME</td>
<td>DELETE</td>
<td>EDIT</td>

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
<td><a href="empDel?empId=<%= emp.getEmpId() %>">DELETE</a></td>
<td><a href="EmployUpd.jsp?empId=<%= emp.getEmpId() %>">EDIT</a></td>
</tr>
<%} %> 

</table>
<center>
<button onclick="history.go(-1)">Go Back</button>

<a href="AdminControl.jsp"><button type="button"><strong>HOME</strong></button></a>
</center>
</form>

</div>
<br>
</body>
</html>