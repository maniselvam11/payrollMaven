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
    background: #2ECC71;
    }
    
    label{
    width:200px;
    display:inline-block;
    }
    </style>
</head>
<body><center>
<%int deptId=Integer.parseInt(request.getParameter("departId"));
session.setAttribute("editDeptId", deptId);
DepartmentsDaoImpl departDao=new DepartmentsDaoImpl();
Departments department=departDao.findDepartment(deptId);
%>
<form action="deptUpd" >
<label for="deptName">Department Name</label>
<input type="text" id="deptName" name="name" autofocus="autofocus" value="<%=department.getDeptName() %>"><br><br>
<center><input type="submit"></center>
<button onclick="history.go(-1)">Go Back</button>
</form>
</center>
</body>
</html>