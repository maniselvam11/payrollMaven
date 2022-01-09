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
    background-image: linear-gradient(to right, green , yellow);
    }
    label{
    width:200px;
    display:inline-block;
    }
     .formSty{
    background-color: white;
    border: 0px solid red;
  	padding: 0px 20px;
  	border-radius: 25px;
  	width:30%;
  	margin-left: 440px;
  	background-color: #B9B087 ;
  	margin-top:10%;
  	}

</style>
</head>
<body>
<%int gradeId=Integer.parseInt(request.getParameter("gradeId"));
session.setAttribute("gradeId", gradeId);
GradeDaoImpl gradeDao=new GradeDaoImpl();
Grade grade=gradeDao.findGrade(gradeId);

%>

<form action="gradeUpd" class="formSty" >
<br>
<label for="gradeName">GRADE NAME</label>
<input type="text" id="gradeName" min="1" name="name" value="<%=grade.getGradeName() %>" autofocus="autofocus"><br><br>

 <label for="gradeBasic">BASIC SALARY</label>
<input type="number" id="gradeBasic" min="1" name="basic" value="<%=grade.getGradeBasic()%>"><br><br>

 <label for="gradeBonus">BONUS SALARY</label>
<input type="number" id="gradeBonus" min="1" name="bonus" value="<%=grade.getGradeBonus()%>" ><br><br>

 <label for="gradePf">PROVIDENT FUND</label>
<input type="number" id="gradePf" min="1" name="pf" value="<%=grade.getGradePf()%>"><br><br>

 <label for="gradePt">PROFESSIONAL TAX</label>
<input type="number" id="gradePt" min="1" name="pt" value="<%=grade.getGradePt() %>" ><br><br>
<center>
<input type="submit">
<input type="reset">
<button onclick="history.back()">BACK</button>
<a href="AdminControl.jsp"><button type="button"><strong>HOME</strong></button></a>
<br>
</center>
<br>
</form>
</body>
</html>