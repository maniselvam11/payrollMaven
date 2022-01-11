<%@page import="com.payroll.model.Leave"%>
<%@page import="com.payroll.dao.LeaveDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
<button onclick="history.go(-1)" class="btn btn-primary">GO BACK</button>
</center>
</form>
</body>
</html>