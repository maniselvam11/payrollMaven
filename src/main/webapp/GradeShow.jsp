<%@page import="com.payroll.model.Grade"%>
<%@page import="java.util.List"%>
<%@page import="com.payroll.dao.GradeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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
    <title>payroll</title>

</head>
<body>
<h2>Show Grade</h2>
<table>
<tr>
<td>Grade Name</td>
<td>Grade Bonus</td>
<td>Grade Basic</td>
<td>Providient Fund</td>
<td>Professional Tax</td>
<td>Delete</td>
<td>Edit</td>
</tr>


<%GradeDaoImpl gradeDao=new GradeDaoImpl();
int gradeId=0;
List<Grade> gradeList=gradeDao.showGrade();
for(int i=0;i<gradeList.size();i++){
	Grade grade=gradeList.get(i);
	gradeId=gradeDao.findGradeID(grade);
	%>
	<tr>
	<td><%= grade.getGradeName() %></td>
	<td><%= grade.getGradeBonus() %></td>
	<td><%= grade.getGradeBasic() %></td>
	<td><%= grade.getGradePf() %></td>
	<td><%= grade.getGradePt() %></td>
	<td><a href="GradeDel?gradeId=<%= gradeId %>">Delete</a></td>
	<td><a href="GradeUpd.jsp?gradeId=<%= gradeId%>">Edit</a></td>
	
	</tr>
	

<%} %>
</table>
<a href="AdminControl.jsp"><button type="button"><strong>Home Page</strong></button></a>

 <input type="button" value="Go back!" onclick="history.go(-1)">
</body>
</html>