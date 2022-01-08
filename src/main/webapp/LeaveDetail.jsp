<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
</head>
<style>
  body {
    font-family: Arial, Helvetica, sans-serif;
    background: #2ECC71;
    }
    a{
    text-decoration: none;
    }
       
    label{
    width:200px;
    display:inline-block;
    }

</style>
</head>
<body>
<script type="text/javascript">
function LeaveAdd(){
	var leaveAdd=document.getElementById("LeaveAdd");
	leaveAdd.style.display="block";
}

</script>
<div>
<button  class="btn" style="width:10%; font-size : 20px;" onclick="LeaveAdd()"><strong>Leave Add</strong></button>
<a href="LeaveShow.jsp"><button  class="btn" style="width:10%; font-size : 20px;" ><strong>Show Leave</strong></button></a>
</div>
<div id="LeaveAdd" style="display :none;">

<form action="LeaveAdd" >
<h2>Add Leave</h2>
<label for="employId">Employee Id</label>
<input type="number" name="empId" id="employId" pattern="[0-9]+" placeholder="enter employ ID"><br><br>

<label for="leaveDate">Leave Date</label>
<input type="date" name="lDate" id="leaveDate" ><br><br>

<label for="leaveReason">Leave Reason</label>
<input type="text" name="reason" id="leaveReason" placeholder="enter leave reason"><br><br>
<input type="submit">

<button onclick="history.back()">Go Back</button>
<br>
<br>
<a href="AdminControl.jsp"><button type="button"><strong>Home Page</strong></button></a>
</form>

</div>
</body>
</html>