<%@page import="com.payroll.model.Departments"%>
<%@page import="com.payroll.dao.DepartmentsDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Grade Assign</title>
</head>
<body>
<%int deptId=Integer.parseInt(request.getParameter("deptId"));
		DepartmentsDaoImpl departDao=new DepartmentsDaoImpl();
		Departments depart=departDao.findDepartment(deptId);
		%>

<div>
<label for="departmentName">DEPARTMENT NAME</label>
<input type="text" pattern="[a-zA-z]+" name="deptName"value="<%=depart.getDeptName()%>"><br><br>
<label for="gradeName">GRADE NAME</label>
<input type="text" pattern="[a-zA-z]+" name="grdName"value="<%=depart.getGrd().getGradeName()%>"><br><br>
</div>
</body>
</html>