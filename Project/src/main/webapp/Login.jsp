<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>USER | Login</title>

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
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet">
</head>

<body class="gray-bg">
	<div class="middle-box text-center loginscreen animated fadeInDown">
		<div>
			<div>

				<h1 class="logo-name">S+</h1>

			</div>

			<h3>Welcome to Shopping Site</h3>
			<p>Login in. To see it in action.</p>
			<%
				if ((request.getParameter("success") + "sent").contains("1")) {
			%>
			<div class="alert alert-dismissable alert-success">
				<i class="fa fa-fw fa-check"></i>&nbsp; Thank You For Registration.
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
			</div>
			<%
				} else if ((request.getParameter("failed") + "sent").contains("1")) {
			%>
			<div class="alert alert-dismissable alert-danger">
				<i class="fa fa-fw fa-check"></i>&nbsp; UserName or Password
				Incorrect.
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
			</div>
			<%
				}
			%>
			<form class="m-t" role="form"
				action="<%=request.getContextPath()%>/Controller" method="post">
				<input type="hidden" name="actionCode" value="login">
				<div class="form-group">
					<input type="text" class="form-control" id="userName"
						placeholder="Enter UserName" name="userName" required />
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="userPassword"
						placeholder="Enter password" name="userPassword" required />
				</div>
				<div class="checkbox">
					<label><input type="checkbox" name="remember">
						Remember me</label>
				</div>
				<button type="submit" class="btn btn-primary block full-width m-b">Login</button>
				<a href="<%=request.getContextPath()%>/jsp/forget.jsp"><small>Forgot
						password?</small></a>
				<p class="text-muted text-center">
					<small>Do not have an account?</small>
				</p>
				<a href="<%=request.getContextPath()%>/Register.jsp"
					class="btn btn-sm btn-white btn-block">Create an account</a>
			</form>
		</div>
</div>
		<script src="<%=request.getContextPath()%>/js/jquery-2.1.1.js"></script>
		<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>