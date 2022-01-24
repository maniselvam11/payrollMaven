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
  <style type="text/css">
     body {
    font-family: Arial, Helvetica, sans-serif;
    background-image: url("images/pexels-anna-nekrashevich-6801874.jpg");
    background-repeat: no-repeat;
	background-size: cover;
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
  	margin-left: 440px;
  	background-color: #b4b7c3 ;
  	margin-top:10%;
  	}

</style>
</head>
<body>
<%int leaveId=Integer.parseInt(request.getParameter("leaveId"));
HttpSession session1=request.getSession();
session1.setAttribute("leaveId", leaveId);
LeaveDaoImpl leaveDao=new LeaveDaoImpl();
Leave leave=leaveDao.findLeave(leaveId);
%>
<form action="leaveUpd" class="formSty">
<center>
<label for="leaveDt">LEAVE DATE</label>
<input type="date" id="leaveDt"  name="leaveDate" value="<%=leave.getLeaveDt() %>"><br><br>
<label for="leaveRs">REASON</label>
<input type="text" id="leaveRs"  name="reason" value="<%=leave.getLeaveReason() %>"><br><br>
<input type="submit" class="btn btn-primary">

</form>
<button onclick="history.go(-1)" class="btn btn-primary">GO BACK</button>
<a href="AdminControl.jsp"><button type="button" class="btn btn-primary">HOME</button></a>

</center>
</body>
</html>