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
	background-image: url("images/work.jpg");
	

}

.big-btn { `
	
	position: absolute;
	top: 50%;
	left: 50%;
	 background-color: rgb(120, 120, 120);
	border: 1px solid ;
	color: black;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	cursor: pointer;
	display: block;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 12px;
		
}

.big-btn:hover {
	background-color: #9AB2A4;
}

a {
	text-decoration: none;
}
input{
height: 25px; width : 200px;
}

</style>
</head>
<body>
<%String userError=(String)session.getAttribute("invalid"); 
if(userError!=null){
	%>
	<h2 style="color:#0BE3C6 " ><%=userError %></h2>
<%}%>
	<center>
		<h1 style="color:#0BE3C6 "  >WELCOME</h1>
		&nbsp;&nbsp;&nbsp;

		<div id="welcomeform" style="display: block;" >
			<h1 style="color:#0BE3C6 "  >
				<strong>EMPLOYEE MANAGER</strong>
			</h1>
				&nbsp;
			<h1 style="color:#35DC00" >
				<STRONG>ADMINISTRATOR &nbsp; LOGIN</STRONG>
			</h1>
			<button class="big-btn" style="width: 10%; font-size: 20px;"
				 onclick="showform()">
				<strong>Login</strong>
			</button>
		</div>


		<script type="text/javascript">
			function showform() {
				var welcomeform = document.getElementById("welcomeform");
				welcomeform.style.display = "none";
				var loginform = document.getElementById("loginform");
				loginform.style.display = "block";
			}
		</script>
		<div id="loginform" style="display: none;">
			<form action="login" method="post">

				<div class="pageAlign">-

					<h2 style="color:#BDD3C7;">
						LOGIN<br>
					</h2>
					<label for="mailId" style="color: #35DC00;"><strong>EMAIL ID </strong></label><br> <input type="email"
						id="mailId" name="email" required placeholder="example@gmail.com"
						pattern="[a-z][a-z0-9]+[@][a-z]+[.][a-z]+" style="border-radius: 10px;"  autofocus>
							&nbsp;&nbsp;<br><br> 
							
							<label for="password" style="color:#35DC00;"><strong>PASSWORD</strong> </label> <br>
					<input type="password" id="password" name="pass" style="border-radius: 10px;left: 50%;right:50%;" required placeholder="*********"
						pattern="[A-Za-z0-9@#.!&]{8,16}">
					&nbsp;	&nbsp;<br><br>
					<button  style="border-radius: 8px;" type="submit"  >submit</button>
				</div>
			</form>


		</div>
	</center>
</body>
</html>