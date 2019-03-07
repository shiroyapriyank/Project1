<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<script>
	function checkuserName() {

		var userName = $("#userName").val();
		$.ajax({
			type : 'post',
			url : '../Project/Controller',
			data : {
				userName : userName,
				actionCode : "checkUserName"
			},
			success : function(data) {
				$("#success").html(data);
				if (data != '') {
					$('#userName').val('');
				}
			}
		});
	}
	function checkEmail() {

		var userEmail = $("#userEmail").val();
		$.ajax({
			type : 'post',
			url : '../Project/Controller',
			data : {
				userEmail : userEmail,
				actionCode : "checkUserName"
			},
			success : function(data) {
				$("#success").html(data);
				if (data != '') {
					$('#userEmail').val('');
				}
			}
		});
	}

	$('#userPassword, #confirmPassword').on('keyup', function () {
		  if ($('#userPassword').val() == $('#confirmPassword').val()) {
		    $('#success').html('Matching').css('color', 'green');
		  } else 
		    $('#success').html('Not Matching').css('color', 'red');
		});
</script>
<body>
	<div class="container">
		<h2>Register Page</h2>
		<span id="success"></span>
		<form action="<%=request.getContextPath()%>/Controller" method="post">
			<input type="hidden" name="actionCode" value="register">
			<div class="form-group">
				<label for="userName">UserName:</label> <input type="text"
					class="form-control" id="userName" placeholder="Enter UserName"
					name="userName" onblur="checkuserName();">
			</div>

			<div class="form-group">
				<label for="userEmail">Email:</label> <input type="email"
					class="form-control" id="userEmail" placeholder="Enter Email"
					name="userEmail" onblur="checkEmail();">
			</div>

			<div class="form-group">
				<label for="userPassword">Password:</label> <input type="password"
					class="form-control" id="userPassword" placeholder="Enter password"
					name="userPassword">
			</div>
			<div class="form-group">
				<label for="userPassword">Confirm Password:</label> <input
					type="password" class="form-control" id="confirmPassword"
					placeholder="Confirm Password" name="confirmPassword">
			</div>
			<div class="checkbox">
				<label><input type="checkbox" name="remember">
					Remember me</label>
			</div>
			<button type="submit" class="btn btn-default">Register</button>
			<a href="<%=request.getContextPath()%>/Login.jsp"
				class="btn btn-primary">Login</a>
		</form>
	</div>
</body>
</html>