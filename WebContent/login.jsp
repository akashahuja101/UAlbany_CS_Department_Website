<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
p.ex1 {
    padding: 2cm;
}

</style>
</head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery-1.11.3.min.js"></script>

<body>
<br><br><br><br><br><br><br><br><br>
	<div  class="col-md-4"></div>
	<div  class="col-md-4">
		<div class="form-top center_div">
			<div class="form-top-left">
				<h3 style="color: black">Log In</h3>
				<p style="color: black"></p>
			</div>
			<div class="form-top-right">
				<i class="fa fa-pencil"></i>
			</div>
		</div>

		<div  class="form-bottom">
			<form role="form" action="Login" method="post"
				class="registration-form center_div">

				<div class="form-group">
					<label style="color: black" class="" for="netid">Net ID</label> <input
						type="text" name="netid" placeholder="Net ID..."
						class="form-first-name form-control" id="form-first-name" required>
				</div>

				<div class="form-group">
					<label style="color: black" class="" for="pwd">Password</label> <input
						type="password" name="pwd" placeholder="Password"
						class="form-password form-control" id="form-password" required></input>
				</div>
				
				<input type="submit" class="btn btn-lg btn-default page-scroll"
					value="LogIn"><br><br>
					
					<div class="form-group">
					<label style="color: black" class="" for="register">Not Registered Yet?</label> <br><input
						type="button" onClick = "location.href = 'register.jsp'" class="btn btn-lg btn-default page-scroll" name="register" value="Register">
						
				</div>	
			
				</form>
		</div>
	</div>

</body>
</html>