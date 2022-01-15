<%@page import="com.payroll.dao.LeaveDaoImpl"%>
<%@page import="com.payroll.dao.GradeDaoImpl"%>
<%@page import="com.payroll.dao.DepartmentsDaoImpl"%>
<%@page import="com.payroll.model.EmpSalary"%>
<%@page import="java.util.List"%>
<%@page import="com.payroll.dao.SalaryCalculateDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show SalaryEmploy</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
a{
text-decoration:none;
}
#search{
float: right;
margin-top:10px;
margin-right: 40px;
}
    </style>
</head>
<body>
<table>
<tr>
<td>Employee Id</td>
<td>Department Name</td>
<td>Grade Name</td>
<td>Total Leave</td>
<td>Salary Date</td>
<td>Gross Salary</td>
<td>Actual Salary</td>
</tr>

<%SalaryCalculateDaoImpl salaryCal=new SalaryCalculateDaoImpl();
List<EmpSalary> SalaryEmploy=salaryCal.showEmployee();
for(int i=0;i<SalaryEmploy.size();i++){
	EmpSalary salary=SalaryEmploy.get(i);
	LeaveDaoImpl leaveDao=new LeaveDaoImpl();
	int leave=leaveDao.leaveDays(salary.getEmp().getEmpId());
	%>

<tr>
<td><%=salary.getEmp().getEmpId() %></td>
<td><%=salary.getDept().getDeptName() %></td>
<td><%=salary.getGrade().getGradeName() %></td>
<td><%=leave %></td>
<td><%=salary.getSalaryDate() %></td>
<td><%=salary.getGross() %></td>
<td><%=salary.getSalary() %></td>
</tr>
<%} %>
</table>
<center>
<br>
<a href="AdminControl.jsp"><button type="button" class="btn btn-primary"><strong>Home Page</strong></button></a>
<input type="button" value="Go back!" onclick="history.go(-1)" class="btn btn-primary">
</center>

</body>
</html>