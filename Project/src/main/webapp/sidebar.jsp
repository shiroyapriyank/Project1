<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<ul class="nav metismenu" id="side-menu">

	<li><a href="#"><i class="fa fa-bar-chart-o"></i> <span
			class="nav-label">UserMaster</span><span class="fa arrow"></span></a>
		<ul class="nav nav-second-level collapse">
			<li><a id="invester"
				href="<%=request.getContextPath()%>/Controller?actionCode=viewUser">View
					Users</a></li>
		</ul></li>

	<li><a href="#"><i class="fa fa-edit"></i> <span
			class="nav-label">Products Management</span><span class="fa arrow"></span></a>
		<ul class="nav nav-second-level collapse">
		<li><a
				href="<%=request.getContextPath()%>/addProduct.jsp">Add Products</a></li>
			<li><a
				href="<%=request.getContextPath()%>/Controller?actionCode=getProduct">View Products</a></li>
		</ul></li>

	

</ul>

