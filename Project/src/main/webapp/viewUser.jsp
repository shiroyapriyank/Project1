<%@page import="java.util.Iterator"%>
<%@page import="com.model.UserDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (null == session.getAttribute("userName")) {
		String address = "/Login.jsp";
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(address);
		requestDispatcher.forward(request, response);
	}
	List<UserDetails> list = (List<UserDetails>) session.getAttribute("listOfUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>View Users</title>
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
							<li><a href="#">Profile</a></li>
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

				<%
					if (list != null) {
						Iterator<UserDetails> it = list.iterator();
				%>
				<div class="ibox-content">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>User Id</th>
									<th>User Name</th>
									<th>User Email</th>

								</tr>
							</thead>

							<%
								while (it.hasNext()) {
										UserDetails user = null;
										user = it.next();
							%>
							<tr>
								<td><%=user.getUserId()%></td>
								<td><%=user.getUserName()%></td>
								<td><%=user.getUserEmail()%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>

				<%
					}
				%>
			</div>
		</div>
	</div>

	<jsp:include page="allJS.jsp"></jsp:include>



</body>
</html>