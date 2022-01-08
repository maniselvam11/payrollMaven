<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
</head>
<body>
<%EmployeeDaoImpl employeeDao=new EmployeeDaoImpl();
int empId=Integer.parseInt(request.getParameter("empId"));
employeeDao.deleteEmp(empId);
response.sendRedirect("EmpShow.jsp");
%>

</body>
</html>