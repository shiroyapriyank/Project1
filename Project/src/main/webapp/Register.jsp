<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>USER | Register</title>

<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/animate.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/custom.js"></script>

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
</head>
<body class="gray-bg">

	<div class="middle-box text-center loginscreen animated fadeInDown">
		<div>
			<div>

				<h1 class="logo-name">S+</h1>

			</div>
			<h3>Welcome to Shopping Site</h3>
			<p>Login in. To see it in action.</p>


			<div id="eror" class="alert alert-danger alert-dismissible fade in"
				style="display: none;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Password Doesn't Match</strong>
			</div>

			<span id="success"></span>
			<form class="m-t" name="form"
				action="<%=request.getContextPath()%>/Controller" method="post"
				onsubmit="return validate();">
				<input type="hidden" name="actionCode" value="register">
				<div class="form-group">
					<input type="text" class="form-control" id="userName"
						placeholder="Enter UserName" name="userName"
						onblur="checkuserName();" required="required">
				</div>

				<div class="form-group">
					<input type="email" class="form-control" id="userEmail"
						placeholder="Enter Email" name="userEmail" onblur="checkEmail();"
						required="required">
				</div>

				<div class="form-group">
					<input type="password" class="form-control" id="userPassword"
						placeholder="Enter password" name="userPassword"
						required="required">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="confirmPassword"
						placeholder="Confirm Password" name="confirmPassword"
						required="required">
				</div>
				<div class="form-group">
					<div class="checkbox i-checks">
						<label> <input type="checkbox"><i></i> Agree the
							terms and policy
						</label>
					</div>
				</div>

				<button type="submit" class="btn btn-primary block full-width m-b">Register</button>
				<p class="text-muted text-center">
					<small>Already have an account?</small>
				</p>
				<a href="<%=request.getContextPath()%>/Login.jsp"
					class="btn btn-sm btn-white btn-block">Login</a>
			</form>
		</div>
	</div>

	<script src="<%=request.getContextPath()%>/js/jquery-2.1.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script
		src="<%=request.getContextPath()%>/js/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
		});
	</script>
</body>
</html>