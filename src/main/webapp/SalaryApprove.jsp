<%@page import="com.payroll.model.Departments"%>
<%@page import="com.payroll.model.Employee"%>
<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Salary Approve</title>
<style type="text/css">
     body {
    font-family: Arial, Helvetica, sans-serif;
    background-image: linear-gradient(to right, green , yellow);
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
  	background-color: #B9B087 ;
  	margin-top:10%;
  	}
  	

</style>
</head>
<body>
<%int empId=Integer.parseInt(request.getParameter("eId"));
		EmployeeDaoImpl employDao=new EmployeeDaoImpl();
		Employee employ=employDao.findEmployee(empId);
		Departments department=employ.getDept();
		String departName=department.getDeptName();
		String grdName=employ.getGrade().getGradeName();%>
<form action="salaryInsert" class="formSty">
<div id="salsty">
<br>

		
		<label for="gradeName">EMPLOYEE ID</label>
		
		<input type="text" name="empId" value="<%=empId%>"><br><br>
<label for="gradeName">GRADE NAME</label>
<input type="text" name="gName" id="gradeName"  value="<%=grdName%>"><br><br>
<label for="deptName">DEPARTMENT NAME</label>
<input type="text" name="dName" id="deptName" value="<%=departName%>"><br><br>


<label for="taxDeducte">PROFESSIONAL TAX</label>

<select name="tax" id="pf">
  <option value="yes">Yes</option>
  <option value="no">No</option>
 
</select>

<br><br>
<label for="monthBonus">MONTH BONUS</label>

<select name="bonus" id="monthBonus">
  <option value="yes">Yes</option>
  <option value="no">No</option>
 
</select>
<br>
<br>
<input type="reset" class="btn btn-primary">
<button type="submit" class="btn btn-primary">Submit</button>
<button onclick="history.back()" class="btn btn-primary">BACK</button>
<a href="AdminControl.jsp"><button type="button" class="btn btn-primary"><strong>HOME</strong></button></a>
<br><br>
</div>
</form>





</body>
</html>