<%@page import="java.util.List"%>
<%@page import="com.payroll.model.Grade"%>
<%@page import="com.payroll.dao.GradeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>search grade</title>
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
<h2>Search Grade</h2>
<table>
<tr>
<td>Grade ID</td>
<td>Grade Name</td>
<td>Basic</td>
<td>Bonus</td>
<td>Provident Fund</td>
<td>Professional Tax</td>
</tr>

<%
String name=request.getParameter("gradeName");
GradeDaoImpl gradeDao=new GradeDaoImpl();
List<Grade> listGrade=gradeDao.searchGrade(name);
for(int i=0;i<listGrade.size();i++){

	Grade grade=listGrade.get(i);
%>

<tr>
<td><%=grade.getGradeId() %></td>
<td><%=grade.getGradeName() %></td>
<td><%=grade.getGradeBasic() %></td>
<td><%=grade.getGradeBonus() %></td>
<td><%=grade.getGradePf() %></td>
<td><%=grade.getGradePt() %></td>
</tr>
<%} %>
</table>

</body>
</html>