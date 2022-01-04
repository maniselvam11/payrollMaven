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

<table >
<tr>
<td>Department Id</td>
<td>Department Name</td>
<td>Grade Name</td>
<td>Delete</td>
<td>edit</td>
</tr>



<% DepartmentsDaoImpl departDao=new DepartmentsDaoImpl();
List<Departments> departList=departDao.showDepartments();
for(int i=0;i<departList.size();i++)
{
	Departments departments=departList.get(i);
%>	
<tr>
<td><%=departments.getDeptId() %></td>
<td><%=departments.getDeptName() %></td>
<td><%=departments.getGrd().getGradeName()%></td>
<td><a href="departDel?deptId=<%= departments.getDeptId() %>">Delete</a></td>
<td><a href="DepartUpd.jsp?departId=<%= departments.getDeptId() %>">Edit</a></td>

</tr>
<%}%>
</table>

</body>
</html>