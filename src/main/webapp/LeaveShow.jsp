<%@page import="com.payroll.model.Employee"%>
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
</head>
<body>
<table>
<tr>
<td>Employee Name</td>
<td>Leave Date</td>
<td>Reason</td>
</tr>

<%LeaveDaoImpl leaveDao=new LeaveDaoImpl();
List<Leave> leaveList=leaveDao.showLeaveDetail();
for(int i=0;i<leaveList.size();i++){
Leave leave=leaveList.get(i);

%>
<tr>
<td><%=leave.getEmploy().getEmpName()%></td>
<td><%=leave.getLeaveDt() %></td>
<td><%=leave.getLeaveReason() %></td>
</tr>
<%}%>
</table>
<a href="AdminControl.jsp"><button type="button"><strong>Home Page</strong></button></a>
<br>

<form>
 <input type="button" value="Go back!" onclick="history.go(-1)">
</form>
</body>
</html>