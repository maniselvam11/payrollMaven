<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
<%@page import="com.payroll.model.Leave"%>
<%@page import="java.util.List"%>
<%@page import="com.payroll.dao.LeaveDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
</head>
<body>
<h2>Show Leave Detail</h2>
<table>
<tr>
<td>Employee Id</td>
<td>Leave Date</td>
<td>Reason</td>
</tr>
<%LeaveDaoImpl leaveDao=new LeaveDaoImpl();
List<Leave> leaveList=leaveDao.showLeaveDetail();
EmployeeDaoImpl employeeDao=new EmployeeDaoImpl();
for(int i=0;i<leaveList.size();i++){
	Leave leave=leaveList.get(i);
	int empId=employeeDao.findEmployeeID(leave.getEmploy());
	%>
	
	<tr>
	<td><%= empId %></td>
	<td><%= leave.getLeaveDt() %></td>
	<td><%= leave.getLeaveReason() %></td>
	</tr>
<%}%>

</table>

</body>
</html>