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
				actionCode : "checkEmail"
			},
			success : function(data) {
				$("#success").html(data);
				if (data != '') {
					$('#userEmail').val('');
				}
			}
		});
	}

	function validate() {
		var x = document.forms["form"]["confirmPassword"].value;
		var y = document.forms["form"]["userPassword"].value;
		var z = x.length;
		if ((x != y || !x)) {
			$('#userPassword').val('');
			$('#confirmPassword').val('');
			$('#eror').show();
			return false;
		}
	}
</script>
<body>
	<div class="container">
		<h2>Register Page</h2>
		
		<div id="eror" class="alert alert-danger alert-dismissible fade in" style="display: none;">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<strong>Password Doesn't Match</strong> 
		</div>
		<span id="success"></span>
		<form name="form" action="<%=request.getContextPath()%>/Controller"
			autocomplete="off" method="post" onsubmit="return validate();">
			<input type="hidden" name="actionCode" value="register">
			<div class="form-group">
				<label for="userName">UserName:</label> <input type="text"
					class="form-control" id="userName" placeholder="Enter UserName"
					name="userName" onblur="checkuserName();" required="required">
			</div>

			<div class="form-group">
				<label for="userEmail">Email:</label> <input type="email"
					class="form-control" id="userEmail" placeholder="Enter Email"
					name="userEmail" onblur="checkEmail();" required="required">
			</div>

			<div class="form-group">
				<label for="userPassword">Password:</label> <input type="password"
					class="form-control" id="userPassword" placeholder="Enter password"
					name="userPassword" required="required">
			</div>
			<div class="form-group">
				<label for="userPassword">Confirm Password:</label> <input
					type="password" class="form-control" id="confirmPassword"
					placeholder="Confirm Password" name="confirmPassword"
					required="required">
			</div>
			<button type="submit" class="btn btn-default">Register</button>
			<a href="<%=request.getContextPath()%>/Login.jsp"
				class="btn btn-primary">Login</a>
		</form>
	</div>
</body>
</html>