<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payroll</title>
</head>
<body>
<script type="text/javascript">
function gradeAdd(){
	var gradeAdd=document.getElementById("");
	
}

</script>


<div>
<button  class="btn" style="width:10%; font-size : 20px;" onclick="gradeAdd()"><strong>Grade Add</strong></font></button>
<button  class="btn" style="width:10%; font-size : 20px;" onclick="gradeShow()"><strong>Show Grade</strong></font></button>
</div>
<div id="gradeAdd">
<h2>Add Grade</h2>
<label for="gradeNa">Grade Name</label>
<input type="text" name="gradeName" id="gradeNa" pattern="[a-zA-z\s]+" placeholder="enter grade Name"><br><br>
<label for="gradeBasic">BasicSalary</label>
<input type="number" name="basic" id="gradeBasic" pattern="[0-9]+" placeholder="enter basic salary"><br><br>
<label for="gradeBonus">GradeBonus</label>
<input type="number" name="bonus" id="gradeBonus" pattern="[0-9]+" placeholder="enter bonus amount"><br><br>
<label for="gradePf">GradePf</label>
<input type="number" name="pf" id="gradePf" pattern="[0-9]+" placeholder="enter providient fund "><br><br>
<label for="gradePt">GradePt</label>
<input type="number" name="bonus" id="gradePt" pattern="[0-9]+" placeholder="enter Professional tax "><br><br>
<input type="submit">
</div>



</body>
</html>