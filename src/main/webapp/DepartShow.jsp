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
<h2>Department</h2>

<table >
<tr>
<td>DEPARTMENT ID</td>
<td>DEPARTMENT NAME</td>
<td>GRADE NAME</td>
<td>DELETE</td>
<td>EDIT</td>
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
<td><a href="departDel?deptId=<%= departments.getDeptId() %>">DELETE</a></td>
<td><a href="DepartUpd.jsp?departId=<%= departments.getDeptId() %>">EDIT</a></td>

</tr>
<%}%>
</table>
<center>
<br>
<a href="AdminControl.jsp"><button type="button"><strong>Home Page</strong></button></a>
<input type="button" value="Go back!" onclick="history.go(-1)">
</center>

</body>
</html>