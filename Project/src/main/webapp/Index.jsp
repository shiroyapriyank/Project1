<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	if (null == session.getAttribute("userName")) {
		String address = "/Login.jsp";
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(address);
		requestDispatcher.forward(request, response);
	}
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin | Dashboard</title>

<jsp:include page="allCSS.jsp"></jsp:include>
</head>
<body>
<body>
	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="sidebar-collapse">
			<li class="nav-header">
				<div class="dropdown profile-element">
					<span><img alt="image" class="img-circle"
						src="<%=request.getContextPath()%>/img/profile_small.jpg" /> </span> <a
						data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
						class="clear"> <span class="block m-t-xs"><%=session.getAttribute("userName")%>
								<strong class="font-bold"></strong> </span> <span
							class="text-muted text-xs block">Art Director <b
								class="caret"></b></span>
					</span>
					</a>
					<ul class="dropdown-menu animated fadeInRight m-t-xs">
						<li><a href="#">Profile</a></li>
						<li><a
							href="<%=request.getContextPath()%>/Controller?actionCode=logOut">Logout</a></li>
					</ul>
				</div>
			</li>
		</div>
		<jsp:include page="sidebar.jsp"></jsp:include> </nav>

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<jsp:include page="header.jsp"></jsp:include>
			</div>
			<div class="wrapper wrapper-content">
				<div id="content" class="row">
					<div class="col-lg-3">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Users</h5>
							</div>
							<div class="ibox-content">
								<h1 class="no-margins">10</h1>
								<div class="stat-percent font-bold text-success">
									98% <i class="fa fa-bolt"></i>
								</div>
								<small>Total User</small>
							</div>
						</div>
					</div>

					<div class="col-lg-3">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Products</h5>
							</div>
							<div class="ibox-content">
								<h1 class="no-margins">100</h1>
								<div class="stat-percent font-bold text-navy">
									44% <i class="fa fa-level-up"></i>
								</div>
								<small>New Products</small>
							</div>
						</div>
					</div>

				</div>






			</div>



		</div>
	</div>

	<jsp:include page="allJS.jsp"></jsp:include>


	<script>
		$(document).ready(function() {
			setTimeout(function() {
				toastr.options = {
					closeButton : true,
					progressBar : true,
					showMethod : 'slideDown',
					timeOut : 3000
				};
				toastr.success('How May I help You?', 'Welcome Admin');

			}, 1300);

		});
	</script>
</body>
</html>