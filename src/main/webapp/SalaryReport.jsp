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
</style>
</head>
<body>
<h1><STRONG>ADMINISTRATOR &nbsp;</STRONG></h1>


<div>
<table>
<tr>
<td>EMPLOYEE ID</td>
<td>DEPARTMENT ID</td>
<td>TOTAL LEAVE</td>
<td>GRADE ID</td>
<td>SALARY DATE</td>
<td>GROSS SALARY</td>
<td>TOTAL SALARY</td>

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
<center>
 <input type="button" value="Go back!" onclick="history.go(-1)">
 </center>
</form>
<script>
function showReport(){
	var report=document.getElementById("report");
	report.style.display="block";
	
	
}</script>
</html>
