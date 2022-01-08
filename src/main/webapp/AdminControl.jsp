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
    background-image: url("images/work.jpg");
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
  padding: 14px 16px;
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
<DIV>
   
<marquee width="100%" direction="LEFT" height="100px" scrollamount="10" > <h1 style="color:rgb(240, 240, 240);" >
ADMIN CONTROLS
</marquee></h1>
</DIV>
<div class="navbar">

<div class="dropdown" >
<button class="dropbtn">
&#9776>EMPLOYEE      
<i class="fa fa-caret-down"></i>
</button>
<div class="dropdown-content" id="downNav">
<a href="EmpShow.jsp">Employee Show</a>
<a href="EmployAdd.jsp">Employee Add</a>
</div>
</div>

<div class="dropdown" >
<button class="dropbtn">
&#9776>DEPARTMENT
</button>
<div class="dropdown-content" id="downNav">
<a href="DepartShow.jsp">Department Show</a>
</div>
</div>


<div class="dropdown" >
<button class="dropbtn">
&#9776>GRADE
</button>
<div class="dropdown-content" id="downNav">
<a href="Grade.jsp">Grade Add</a>
<a href="GradeShow.jsp">Grade Show</a>
</div>
</div>

<div class="dropdown" >
<button class="dropbtn">
&#9776>LEAVE DETAIL
</button>
<div class="dropdown-content" id="downNav">
<a href="LeaveDetail.jsp">Leave Add</a>
<a href="LeaveShow.jsp">Leave Show</a>
</div>
</div>

<div class="dropdown" >
<button class="dropbtn">
&#9776>SALARY
</button>
<div class="dropdown-content" id="downNav">
<a href="Salary.jsp">Enter Salary Detail</a>
<a href="SalaryReport.jsp">Salary Report</a>
</div>
</div>


<div class="dropdown"  >
<button class="dropbtn">
&#9776>Contact 
</button>
</div>

<div class="dropdown" >
<button class="dropbtn">
&#9776>About Us
</button>
</div>

<div class="dropdown" style="float:right">
<button class="dropbtn">&#9776>LOGOUT</button>
</div>
</div>
</body>
</html>
