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
<head>
<meta charset="ISO-8859-1">
<title>Check Out Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function totalValue() {
			var price = $("input[name='total[]']:checked").val();
			var total = 0;
			 $("input:checked[name='total[]']").each(function(index, el){
				 total += parseFloat(el.value);
			    });
			$("#total").html(total);
	}

	$(document).ready(function() {
		var data = localStorage.getItem('selectedItems');
		alert(data);
		//document.getElementById("cartItems").innerHTML = data;
		$("#cartItems").html(data);
		totalValue();
		$('input[type="button"]').click(function(e) {
			$(this).closest('tr').remove()
			totalValue();
			//totalValue();
		})

		$(function(){
		    var rowCount = $('#productTable').length;
		    if(rowCount < 1){
		        $('#finalizeButton').attr('disabled','disabled');
		    } else {
		        $('#finalizeButton').removeAttr('disabled');
		    }
		});
	});
</script>

</head>
<body>


	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>Welcome to Shopping Cart</h1>
		<p></p>
	</div>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="<%=request.getContextPath()%>/Home.jsp">Home</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a>Welcome <%=session.getAttribute("userName")%></a></li>
					<li><a
						href="<%=request.getContextPath()%>/Controller?actionCode=logOut">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="cartItems"></div>
	<a href="<%=request.getContextPath()%>/Success.jsp"
		class="btn btn-default" id="finalizeButton">Check Out</a>
</body>
</html>