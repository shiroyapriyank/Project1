<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (null == session.getAttribute("userName")) {
		String address = "/Login.jsp";
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(address);
		requestDispatcher.forward(request, response);
	}
%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Add Products</title>
<jsp:include page="allCSS.jsp"></jsp:include>
</head>
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
								class="text-muted text-xs block">Admin<b class="caret"></b></span>
						</span>
						</a>
						<ul class="dropdown-menu animated fadeInRight m-t-xs">
							<li><a
								href="<%=request.getContextPath()%>/Controller?actionCode=logOut">Logout</a></li>
						</ul>
					</div>
				</li>
			</div>
			<jsp:include page="sidebar.jsp"></jsp:include>
		</nav>

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<jsp:include page="header.jsp"></jsp:include>
			</div>
			<div class="wrapper wrapper-content">



				<div class="ibox-content">
					<form method="post" class="form-horizontal"
						action="<%=request.getContextPath()%>/Controller">
						<input type="hidden" name="actionCode" value="addProduct">
						
						<div class="form-group">
							<label class="col-sm-2 control-label">Product Name</label>
							<div class="col-sm-3">
								<input type="text" name="productName" class="form-control" required
									placeholder="Product Name" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">Product Description</label>
							<div class="col-sm-3">
								<textarea name="productDescription" class="form-control" required></textarea>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">Product Price</label>
							<div class="col-sm-3">
								<input type="text" name="productPrice" class="form-control" required
									placeholder="Product Price" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-2">
								<button class="btn btn-primary" type="submit">Add Product</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
</div>
		<jsp:include page="allJS.jsp"></jsp:include>
</body>
</html>