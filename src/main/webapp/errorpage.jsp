<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
</head>
<body>
<%String message=request.getParameter("message");
String url=request.getParameter("url");%>
<h1><%=message %></h1>
<a href="<%=url%>"><h2>Go Back</h2></a>


</body>
</html>