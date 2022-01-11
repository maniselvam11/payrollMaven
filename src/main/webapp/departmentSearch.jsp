<%@page import="com.payroll.model.Departments"%>
<%@page import="java.util.List"%>
<%@page import="com.payroll.dao.DepartmentsDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Department Search</title>
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
<h2>Search Department</h2>
<table>
<tr>
<td>Department ID</td>
<td>Department Name</td>
<td>Grade Name</td>
</tr>

<%String name=request.getParameter("deptName");
DepartmentsDaoImpl departmentDao=new DepartmentsDaoImpl();
List<Departments> departmentList=departmentDao.searchDepartment(name);
for(int i=0;i<departmentList.size();i++)
{
Departments depart=departmentList.get(i);
%>
<tr>
<td><%=depart.getDeptId() %></td>
<td><%=depart.getDeptName() %></td>
<td><%=depart.getGrd().getGradeName() %></td>
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