<%@page import="com.payroll.model.Departments"%>
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
    
    label{
    width:200px;
    display:inline-block;
    }
    .formSty{
    background-color: white;
  	padding: 0px 20px;
  	border-radius: 25px;
  	width:30%;
  	margin-top:10%;
  	background-color: #B9B087 ;
  	}
    </style>
</head>
<body><center>
<%int deptId=Integer.parseInt(request.getParameter("departId"));
session.setAttribute("editDeptId", deptId);
DepartmentsDaoImpl departDao=new DepartmentsDaoImpl();
Departments department=departDao.findDepartment(deptId);
%>
<form action="deptUpd"  >
<br><br>
<div class="formSty">
<br>
<label for="deptName">DEPARTMENT NAME</label>
<input type="text" id="deptName" name="name" autofocus="autofocus" value="<%=department.getDeptName() %>"><br><br>
<center><input type="submit"> <button onclick="history.go(-1)">GO BACK</button></center>
<br>
</div>
</form>
</center>
</body>
</html>