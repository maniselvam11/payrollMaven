<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
<style type="text/css">

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
function gradeAdd()
{
	var gradeAdd=document.getElementById("gradeAdd");
	gradeAdd.style.display="block";
}
</script>
<div>
<button  class="btn" style="width:10%; font-size : 20px;" onclick="gradeAdd()"><strong>Grade Add</strong></button>
<a href="GradeShow.jsp"><button  class="btn" style="width:10%; font-size : 20px;" ><strong>Show Grade</strong></font></button></a>
</div>
<form action="gradeAdd">
<div id="gradeAdd" style="display :none;">
<h2>Add Grade</h2>
<label for="gradeNa">Grade Name</label>
<input type="text" name="gradeName" id="gradeNa" pattern="[a-zA-z\s]+" placeholder="enter grade Name" autofocus="autofocus"><br><br>
<label for="gradeBasic">BasicSalary</label>
<input type="number" name="basic" id="gradeBasic" pattern="[0-9]+" placeholder="enter basic salary"><br><br>
<label for="gradeBonus">GradeBonus</label>
<input type="number" name="bonus" id="gradeBonus" pattern="[0-9]+" placeholder="enter bonus amount"><br><br>
<label for="gradePf">GradePf</label>
<input type="number" name="pf" id="gradePf" pattern="[0-9]+" placeholder="enter providient fund "><br><br>
<label for="gradePt">GradePt</label>
<input type="number" name="pt" id="gradePt" pattern="[0-9]+" placeholder="enter Professional tax "><br><br>
<input type="submit">
<button onclick="history.go(-1)">Go Back</button>

</div>
</form>
</body>
</html>