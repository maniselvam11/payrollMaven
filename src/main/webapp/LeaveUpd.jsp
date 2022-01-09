<%@page import="com.payroll.model.Leave"%>
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
<%int leaveId=Integer.parseInt(request.getParameter("leaveId"));
HttpSession session1=request.getSession();
session1.setAttribute("leaveId", leaveId);
LeaveDaoImpl leaveDao=new LeaveDaoImpl();
Leave leave=leaveDao.findLeave(leaveId);
%>
<form action="leaveUpd">
<center>
<label for="leaveDt">LEAVE DATE</label>
<input type="date" id="leaveDt"  name="leaveDate" value="<%=leave.getLeaveDt() %>"><br><br>
<label for="leaveDt">REASON</label>
<input type="date" id="leaveDt"  name="reason" value="<%=leave.getLeaveReason() %>"><br><br>
<input type="submit">
<button onclick="history.go(-1)">GO BACK</button>
</center>
</form>
</body>
</html>