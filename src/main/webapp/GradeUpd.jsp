<%@page import="java.util.List"%>
<%@page import="com.payroll.model.Grade"%>
<%@page import="com.payroll.dao.GradeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
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
    label{
    width:200px;
    display:inline-block;
    }

</style>
</head>
<body>
<%int gradeId=Integer.parseInt(request.getParameter("gradeId"));
GradeDaoImpl gradeDao=new GradeDaoImpl();
Grade grade=gradeDao.findGrade(gradeId);

%>

<form action="gradeUpd" method="post">
<label for="gradeName">Grade Name</label>
<input type="text" id="gradeName" name="name" value="<%=grade.getGradeName() %>" autofocus="autofocus"><br><br>

 <label for="gradeBasic">Basic Salary</label>
<input type="number" id="gradeBasic" name="basic" value="<%=grade.getGradeBasic()%>"><br><br>

 <label for="gradeBonus">Bonus Salary</label>
<input type="number" id="gradeBonus" name="bonus" value="<%=grade.getGradeBonus()%>" ><br><br>

 <label for="gradePf">Providient Fund</label>
<input type="number" id="gradePf" name="pf" value="<%=grade.getGradePf()%>"><br><br>

 <label for="gradePt">Professional Tax</label>
<input type="number" id="gradePt" name="pt" value="<%=grade.getGradePt() %>" ><br><br>

<input type="submit">
</form>
<button onclick="history.back()">Go Back</button>
<br>
<br>
<a href="AdminControl.jsp"><button type="button"><strong>Home Page</strong></button></a>


</body>
</html>