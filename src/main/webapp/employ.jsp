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
    
    }
    .topnav{
     background-image: url("images/image1.jpg") ;
     
  background-size: cover;
  height:200%;
  
    }
    
    .empNav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 20px 59px;
  text-decoration: none;
  font-size: 18px;
}
.empNav a:hover {
  background-color: #ddd;
  color: black;
}

.empNav{

  overflow: hidden;
  background-color: #333;

}
    
</style>
</head>
<body class="topnav">
<div class="sideNav" id="downNav">
 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<a href="EmpShow.jsp">Employee Show</a>
<a href="EmployAdd.jsp">Employee Add</a>

</div>
</body>
</html>