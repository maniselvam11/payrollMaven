<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Payroll</title>
    <style>
    body {
    font-family: Arial, Helvetica, sans-serif;
    background: #2ECC71;
    }
    
    
    .big-btn{`
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
  
  display: block;
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
  
}
.big-btn:hover {
  background-color: #3e8e41;
}
 a { 
 text-decoration: none; 
 }
      
    </style>
  </head>
  <body>
      
      <center>
      <h1>WELCOME</h1>
</br></br></br>

<div id="welcomeform" style="display:block;">
<h1><strong>EMPLOYEE MANAGER</strong></h1>
<br>
<h1><STRONG>ADMINISTRATOR &nbsp; LOGIN</STRONG></h1>
<button  class="big-btn" style="width:10%; font-size : 20px;" onclick="showform()"><strong>Login</strong></button>
</div>


<script type="text/javascript">
function showform()
{
	var welcomeform=document.getElementById("welcomeform");
	welcomeform.style.display="none";
	var loginform=document.getElementById("loginform");
	loginform.style.display="block";
	}
</script>
<div id="loginform" style="display :none;">
<form action="login" method="post">

	<div class="pageAlign">
	
   <h2> LOGIN<br></h2>
	
    Mail Id : <input type="email" name="email" required placeholder="example@gmail.com" pattern="[a-z][a-z0-9]+[@][a-z]+[.][a-z]+" autofocus><br><br>
    password: <input type="password" name="pass" required pattern="[A-Za-z0-9@#.!&]{8,16}"><br><br><br>
    <button type="submit" >submit</button>
    </div>
</form>


</div>
</center>
  </body>
</html>