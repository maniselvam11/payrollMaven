<%@page import="com.payroll.model.Employee"%>
<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
<%@page import="com.payroll.dao.GradeDaoImpl"%>
<%@page import="com.payroll.model.EmpSalary"%>
<%@page import="com.payroll.dao.SalaryCalculateDaoImpl"%>
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
<h1><STRONG>ADMINISTRATOR &nbsp;</STRONG></h1>


<div>
<table>
<tr>
<td>Employee Id</td>
<td>Department Id</td>
<td>Total Leave</td>
<td>Grade Id</td>
<td>Salary Date</td>
<td>Gross Salary</td>
<td>Total Salary</td>

<%int employId=Integer.parseInt(request.getParameter("eId"));
EmployeeDaoImpl employeeDao=new EmployeeDaoImpl();
Employee employ=employeeDao.findEmployee(employId);
if(employ!=null)
{
SalaryCalculateDaoImpl salaryCal=new SalaryCalculateDaoImpl();
EmpSalary salary=salaryCal.salaryDetail(employId);
GradeDaoImpl gradeDao=new GradeDaoImpl();
int gradeId=gradeDao.findGradeID(salary.getGradeId());
int empId=employeeDao.findEmployeeID(salary.getEmpId());
%>
</tr>

<tr>
<td><%= empId %></td>
<td><%= salary.getDeptId().getDeptId()%></td>
<td><%= salary.getTotalLeave() %></td>
<td><%=  gradeId%></td>
<td><%= salary.getSalaryDt() %></td>
<td><%= salary.getGross() %></td>
<td><%= salary.getSalary() %></td>
</tr>
<%} %>
</table>

</div>
<a href="AdminControl.jsp"><button type="button"><strong>Home Page</strong></button></a>
<br>

<form>
 <input type="button" value="Go back!" onclick="history.go(-1)">
</form>
<script>
function showReport(){
	var report=document.getElementById("report");
	report.style.display="block";
	
	
}</script>
</html>
