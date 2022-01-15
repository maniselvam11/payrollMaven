<%@page import="com.payroll.model.Employee"%>
<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payroll</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
     body {
    font-family: Arial, Helvetica, sans-serif;
    background-image: linear-gradient(to right, green , yellow);
    }
    label{
    width:200px;
    display:inline-block;
    }
    .updSty{
    text-align: center;
  
    }
    .formSty{
    background-color: white;
    border: 2px solid red;
  	padding: 0px 20px;
  	border-radius: 25px;
  	width:30%;
  	margin-left: 440px;
  	background-color: #B9B087 ;}

</style>

</head>
<body>
<% int empId=Integer.parseInt(request.getParameter("empId"));
EmployeeDaoImpl employDao=new EmployeeDaoImpl();
Employee employ=employDao.findEmployee(empId);
%>
<form action="empUpdate" class="updSty">
<h2>EMPLOYEE UPDATE</h2><br><br>
<div class="formSty">
<br>
  <label for="empName">EMPLOYEE NAME</label>
<input type="text" id="empName" name="name"  autofocus="autofocus" value="<%=employ.getEmpName()%>"><br><br>

<label for="empDob">DATE OF BIRTH</label>
<input type="date" id="empDob" name="dob" value="<%=employ.getDob() %>"><br><br>

<label for="empDoj">DATE OF JOINING</label>
<input type="date" id="empDoj" name="doj" value="<%=employ.getDoj() %>"><br><br>

<label for="empAddress">ADDRESS</label>
<input type="text" id="empAddress" name="address" value="<%=employ.getAddress() %>"><br><br>

<label for="empCity">CITY</label>
<input type="text" id="empCity" name="city" value="<%=employ.getCity()%>"><br><br>

<label for="empPin">PINCODE</label>
<input type="number" maxlength="6" id="empPin" name="pincode" value="<%=employ.getPincode() %>"><br><br>

<label for="empNo">MOBILE NUMBER</label>
<input type="number" id="empNo" maxlength="10" name="mobile" value="<%=employ.getMobileNo() %>"><br><br>

<label for="empState">STATE</label>
<input type="text" id="empState" name="state" value="<%=employ.getState() %>" ><br><br>

<label for="empEmail">EMAIL ID</label>
<input type="text" id="empEmail" name="email" value="<%=employ.getMailId() %>"><br><br>

<label for="empPan">PAN NUMBER</label>
<input type="text" id="empPan"  maxlength="10" name="pan" value="<%=employ.getPanNo() %>"><br><br>


<label for="empDepart">DEPARTMENT ID</label>

<input type="text" id="deptName" name="dId" value="<%=employ.getDept().getDeptId() %>"><br><br>
<center>
<input type="submit" class="btn btn-primary">
<button onclick="history.go(-1)" class="btn btn-primary">GO BACK</button>
</center>
<br>
</div>
</form>

</body>
</html>
<script>
today();
function today(){
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    var yyyy1= today.getFullYear()-24;
maxdate =yyyy1 + '-' + mm + '-'+ dd  ;

document.getElementById("dob").setAttribute("max",maxdate);

}
</script>
<script>
today();
function today(){
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    var yyyy1= today.getFullYear()-1;
maxdate =yyyy + '-' + mm + '-'+ dd  ;
mindate =yyyy1 + '-' + mm + '-'+ dd  ;
document.getElementById("doj").setAttribute("max",maxdate);
document.getElementById("doj").setAttribute("min",mindate);
}
</script>