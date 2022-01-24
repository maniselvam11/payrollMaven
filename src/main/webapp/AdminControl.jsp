<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<title>payroll management</title>

<style>
 body {
    font-family: Arial, Helvetica, sans-serif;
    background-image: url("images/pexels-tima-miroshnichenko-6693655.jpg");
    background-size: cover;
    }
.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 4px 10px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
  
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

</style>
</head>
<body>


   
<marquee width="100%" direction="LEFT" height="100px" scrollamount="10" > 
<h1 style="color:rgb(240, 240, 240);" >
ADMIN CONTROLS
</h1>
</marquee>


<div class="navbar">
<div class="dropdown" >
<button class="dropbtn">
&#9776>EMPLOYEE      
<i class="fa fa-caret-down"></i>
</button>
<div class="dropdown-content" id="downNav">
<a href="EmpShow.jsp">Show Active Employ</a>
<a href="EmployAdd.jsp">ADD Employee </a>
<a href="EmpShowInactive.jsp">Show In-Active Employ</a>
</div>
</div>

<div class="dropdown" >
<button class="dropbtn" >
&#9776>DEPARTMENT
</button>
<div class="dropdown-content" id="downNav">
<a href="DepartmentAdd.jsp">ADD Department </a>
<a href="DepartShow.jsp">Department Show</a>
</div>
</div>


<div class="dropdown" >
<button class="dropbtn">
&#9776>GRADE
</button>
<div class="dropdown-content" id="downNav">
<a href="Grade.jsp">ADD Grade</a>
<a href="GradeShow.jsp">Grade Show</a>
</div>
</div>

<div class="dropdown" >
<button class="dropbtn">
&#9776>LEAVE DETAIL
</button>
<div class="dropdown-content" id="downNav">
<a href="LeaveDetail.jsp">ADD Leave</a>
<a href="LeaveShow.jsp">Leave Show</a>
</div>
</div>

<div class="dropdown" >
<button class="dropbtn">
&#9776>SALARY
</button>
<div class="dropdown-content" id="downNav">
<a href="SalaryAdd.jsp?employId=0">Enter Salary Detail</a>
<a href="SalaryEmploy.jsp">Salary Report</a>
<a href="ShowSalaryEmploy.jsp">Show Salary Detail</a>
</div>
</div>


<div class="dropdown" style="float:right">
<a href="index.jsp">
<button class="dropbtn">&#9776>LOGOUT</button></a>
</div>
</div>
</body>
</html>
