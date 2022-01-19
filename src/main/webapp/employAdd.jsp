<%@page import="com.payroll.model.Departments"%>
<%@page import="com.payroll.dao.DepartmentsDaoImpl"%>
<%@page import="com.payroll.model.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.payroll.dao.EmployeeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title>payroll</title>
    

    <link rel="stylesheet" href="styles.css" />
    
    
    <style>
    
     body {
    font-family: Arial, Helvetica, sans-serif;
    background-image: url("images/employ.jpg");
    background-repeat: no-repeat;
	background-size: cover;
    }
    label{
    width:200px;
    display:inline-block;
    }
    .empDiv{
    text-align: center;
    }
     .formSty {
    background-color: white;
    border: 0px solid #ddbfbf;
    padding: 0px 20px;
    border-radius: 25px;
    width: 30%;
    margin-left: 440px;
    background-color: #ccd1d4;
}
   
    </style>
    
  </head>
  <body>
  
  <%String empAdd=(String)session.getAttribute("employInvalid");
  if(empAdd!=null){
	  %>
	  <h2><%=empAdd %></h2>
  <%} %>
  
  
    <%String emp=(String)session.getAttribute("employalready");
  if(emp!=null){
	  %>
	  <h2><%=emp %></h2>
  <%} %>
  
  <div class="empDiv">
 
  <h3>Employee ADD</h3>
  

<form action="empAdd" class="formSty" method="get" >
<br>
<div>
<label for="name">NAME</label>
<input type="text" pattern="[a-zA-z\s]+" id="name" name="EmployeeName" placeholder="Enter your name" autofocus="autofocus"><br><br>
<label for="dob" >DATE OF BIRTH</label>
<input type="date" pattern="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\\d{4}" id="dob" name="dob" placeholder="enter your DOB"><br><br>
<label for="doj">DATE OF JOINING</label>
<input type="date" pattern="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\\d{4}" id="doj" name="doj" placeholder="Date Of Joining"><br><br>
<label for="address">ADDRESS</label>
<input type="text" pattern="[a-zA-z0-9/,\s]+" id="address" name="address" placeholder="Enter Address"><br><br>
<label for="city">CITY</label>
<input type="text" pattern="[a-zA-z]+" id="city" name="city" placeholder="Enter city"><br><br>
<label for="pincode">PINCODE</label>
<input type="number"  maxlength="6" id="pincode" name="pincode" placeholder="pincode"><br><br>
<label for="mobileno">MOBILE NUMBER</label>
<input type="number" pattern="[0-9]{10}" id="mobileno" maxlength="10" name="mobileNumber" placeholder="Enter MobileNumber"><br><br>
<label for="state">STATE</label>
<input type="text" pattern="[a-zA-z]+" id="state" name="state" placeholder="Enter State"><br><br>
<label for="mailId">EMAIL ID</label>
<input type="email" pattern="[a-z][a-z0-9]+[@][a-z]+[.][a-z]+" id="mailId" name="mailId" placeholder="Enter employ mail"><br><br>
<label for="panNumber">PAN NUMBER</label>
<input type="text" pattern="[a-zA-z0-9]+{10}" maxlength="10" id="panNumber" name="panNo" placeholder="Enter Pan Number"><br><br>
<label for="departId">DEPARTMENT ID</label>
<input type="number" min="1" pattern="[0-9]+" name="deptId" placeholder="Enter Department Id"><br><br>
<label for="gradeId">GRADE ID</label>
<input type="number" min="1" pattern="[0-9]+" name="grdId" placeholder="Enter grade Id"><br><br>


</div>



<div>
<center>
<button type="submit" class="btn btn-primary">Submit</button>

<input type="reset" class="btn btn-primary">
</center>
</form>
  <br>
<a href="AdminControl.jsp" ><button type="button" class="btn btn-primary"><strong>HOME</strong></button></a>


 <input type="button" value="Go back!" onclick="history.go(-1)" class="btn btn-primary">
<br><br>
</div>
</div>
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
    var yyyy1= today.getFullYear()-10;
maxdate =yyyy + '-' + mm + '-'+ dd  ;
mindate =yyyy1 + '-' + mm + '-'+ dd  ;
document.getElementById("doj").setAttribute("max",maxdate);
document.getElementById("doj").setAttribute("min",mindate);
}
</script>