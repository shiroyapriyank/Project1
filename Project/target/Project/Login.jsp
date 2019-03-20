<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#userPassword').on("cut copy paste", function(e) {
			e.preventDefault();
		});
	});
</script>
</head>

<body>
	<div class="container">
		<h2>Login</h2>
		<% if((request.getParameter("success")+"sent").contains("1"))
			{
			%>
			<div class="alert alert-dismissable alert-success">
					<i class="fa fa-fw fa-check"></i>&nbsp; Thank You For Registration.
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				</div>
			<%}  else if((request.getParameter("failed")+"sent").contains("1"))  
			{%>
			<div class="alert alert-dismissable alert-danger">
					<i class="fa fa-fw fa-check"></i>&nbsp; UserName or Password Incorrect.
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				</div>
				<%}%>
		<form action="<%=request.getContextPath()%>/Controller" autocomplete="off" method="post">
			<input type="hidden" name="actionCode" value="login">
			<div class="form-group">
				<label for="email">UserName:</label> <input type="text"
					class="form-control" id="userName" placeholder="Enter UserName"
					name="userName">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="userPassword" placeholder="Enter password"
					name="userPassword">
			</div>
			<div class="checkbox">
				<label><input type="checkbox" name="remember">
					Remember me</label>
			</div>
			<button type="submit" class="btn btn-default">Login</button>
			<a href="<%=request.getContextPath()%>/Register.jsp"
				class="btn btn-primary">Register</a>
		</form>
	</div>
</body>
</html>