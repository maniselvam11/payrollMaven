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
<title>Insert title here</title>

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

<div id="showform" style="display:block;">
<button  class="btn" style="width:10%; font-size : 20px;" onclick="empShow()"><strong>Show Employee</strong></font></button>
</div>


<script>
function empShow(){
	  
	  var employAdd=document.getElementById("showform");
	  employAdd.style.display="none";
	  var employShow=document.getElementById("empShowForm");
	  employShow.style.display="block";
}



</script>


<div id="empShowForm" style="display: none;">
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

<%
EmployeeDaoImpl empDao=new EmployeeDaoImpl();
String emailId=request.getParameter("empEmail");
empDao.deleteEmp(emailId);

%>

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
<td><a href="empShow.jsp?empEmail=<%= emp.getMailId() %>">Delete</a></td>



<%} %> 
</table>

</form>





</div>
<br>
</body>
</html>