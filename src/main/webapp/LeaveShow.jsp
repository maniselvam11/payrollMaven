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
</head>
<body>
<%String deleteLeave=(String)request.getAttribute("deleteLeave");
if(deleteLeave!=null){
%>
<center>
<h2><%=deleteLeave %></h2></center>
<%} %>

<%String updLeave=(String)request.getAttribute("updLeave");
if(updLeave!=null){
%>
<center>
<h2><%=updLeave %></h2>
</center>
<%} %>

<table>
<tr>
<td>EMPLOYEE NAME</td>
<td>LEAVE DATE</td>
<td>REASON</td>
<td>DELETE</td>
<td>EDIT</td>
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
<td><a href="empLeave?leaveId=<%=leave.getLeaveId() %>">DELETE</a></td>
<td><a href="leaveUpd.jsp?leaveId=<%=leave.getLeaveId() %>">EDIT</a></td>
</tr>
<%}%>
</table>
<center>
<a href="AdminControl.jsp"><button type="button"><strong>Home Page</strong></button></a>
<input type="button" value="Go back!" onclick="history.go(-1)">
</center>
</form>
</body>
</html>