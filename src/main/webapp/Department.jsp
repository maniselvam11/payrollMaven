<%@page import="com.payroll.model.Departments"%>
<%@page import="java.util.List"%>
<%@page import="com.payroll.dao.DepartmentsDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
<style type="text/css">
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
<h2>Show Department</h2>
<form >
<table >
<tr>
<td>Department Id</td>
<td>Department Name</td>
<td>Grade Name</td>
<td>Edit</td>
<td>Delete</td>
</tr>
<% DepartmentsDaoImpl departDao=new DepartmentsDaoImpl();
List<Departments> departList=departDao.showDepartments();
for(int i=0;i<departList.size();i++)
{
	Departments department=departList.get(i);
%>	
<tr>
<td><%=department.getDeptId() %></td>
<td><%=department.getDeptName() %></td>
<td><%=department.getGrd().getGradeName() %></td>

<% DepartmentsDaoImpl depart=new DepartmentsDaoImpl();
depart.updateDept(department.getDeptId(), department.getDeptName());
%>


</tr>
<%}%>
</table>

</body>
</html>