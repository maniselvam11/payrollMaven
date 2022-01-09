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
    <title>payroll</title>

</head>
<body>
<% String negative=(String)session.getAttribute("negativeValue");
if(negative!=null) {
%>
<h2><%=negative %></h2>
<%} %>

<h2>SHOW GRADE</h2>
<table>
<tr>
<td>GRADE NAME</td>
<td>GRADE BONUS</td>
<td>GRADE BASIC</td>
<td>PROVIDENT FUND</td>
<td>PROFESSIONAL TAX</td>
<td>DELETE</td>
<td>EDIT</td>
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
	<td><a href="GradeDel?gradeId=<%= gradeId %>">DELETE</a></td>
	<td><a href="GradeUpd.jsp?gradeId=<%= gradeId %>">EDIT</a></td>
	
	</tr>
	

<%} %>
</table>
<br>
<center>
<a href="AdminControl.jsp"><button type="button"><strong>Home Page</strong></button></a>

 <input type="button" value="Go back!" onclick="history.go(-1)">
 </center>
 
</body>
</html>