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
    background: #2ECC71;
    }


  .btn{`
  position: absolute;
  top: 50%;
  left: 50%;
  background-color: #4CAF50; 
  border: 1px solid green;
  color: black;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  cursor: pointer;
  align:center;
  display: block;
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
  
}

.btn:hover {
  background-color: #3e8e41;
}
a{
text-decoration: none;
}


</style>
</head>
<body>
<DIV>
   
<marquee width="100%" direction="LEFT" height="100px" scrollamount="10"> <h1>
ADMIN CONTROLS

</marquee></h1>
</DIV>

<div>
<center style="align:center;">

<br>

<a href="Employ.jsp"><button type="button" class="btn"  name="emp" ><strong>EMPLOYEE</strong></button></a>

<br>

<a href="DepartShow.jsp"><button type="button" class="btn"name="add" ><font size="3"><strong>DEPARTMENT</strong></font></button></a>
<br>

<a href="Grade.jsp"><button type="button" class="btn"name="add" ><font size="3"><strong>GRADE</strong></font></button></a>
<br>
<a href="LeaveDetail.jsp"><button type="button" class="btn" name="add" ><font size="3"><strong>LEAVE DETAIL</strong></font></button></a>

<br>

<a href="Salary.jsp"><button type="button" class="btn" name="add" ><font size="3"><strong>SALARY</strong></font></button></a>


 </center>
 </div>


</body>
</html>