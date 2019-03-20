<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.model.ProductDetails"%>
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
<title>Home Page</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
.main_div {
	position: relative;
	float: left;
}

#cart_val {
	text-align: center;
}

.plus {
	position: absolute;
	right: 6px;
	cursor: pointer;
	top: 0;
}

.minus {
	position: absolute;
	left: 6px;
	cursor: pointer;
}
</style>
<script>
	function updateval(t,a) {
		var p = $('#'+a).val();
		if (p > 0) {
			if (t == 'plus') {
				$('#'+a+'').val(+p + 1);
			} else if (p != 1) {
				$('#'+a).val(p - 1);
			} else {
				alert('1 is minimum val of cart');
			}
		}
	}

	
	/* function checksub() {
		var len = $("input[name='check[]']:checked").length;
		if (len > 0) {
			alert('good');
		} else {
			alert('check atleast one');
		}
	} */

	function checkOut() {
		var chkArray = [];
		var len = $("input[name='selectedItems']:checked").length;
		if (len > 0) {
			/* look for all checkboes that have a class 'chk' attached to it and check if it was checked */
			$(".addtoKart:checked").each(function() {
				chkArray.push($(this).val());
			});

			$.ajax({
				type : 'post',
				url : '../Project/Controller',
				data : {
					userId : chkArray,
					actionCode : "addToCart"
				},
				success : function(data) {
					localStorage.setItem('selectedItems', data);
					window.location.href = "../Project/Checkout.jsp";
				}
			});

		} else {
			alert('check atleast one');
		}
		/* declare an checkbox array */
		

	}
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
				<a class="navbar-brand" href="#myPage">HOME</a>
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
	<div class="container">
		<form id="form-1" method="post">
			<input type="hidden" name="actionCode" value="addToCart">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Product_Name</th>
						<th>Description</th>
						<th>Price</th>
						<th>Quantity</th>
					</tr>
				</thead>
				<tbody>


					<%
						Integer number = 1;
						ProductDetails product = new ProductDetails();
						List<ProductDetails> getproduct = (List<ProductDetails>) session.getAttribute("productDetails");
						Iterator<ProductDetails> it = getproduct.iterator();
						while (it.hasNext()) {
							product = it.next();
					%>
					<tr>
						<td><%=product.getProductName()%></td>
						<td><%=product.getProductDescription()%></td>
						<td><p>$<%=product.getProductPrice()%></p><input type="checkbox" name="total[]" class="hidden" value="<%=product.getProductPrice()%>"></td>
						<td><div class="main_div">
								<span class="minus" onclick="updateval('minus','<%=number %>')">-</span> <input
									type="text" style="text-align: center;"  id="<%=number %>" name="cart_val" value="1" readonly>
								<span class="plus" onclick="updateval('plus','<%=number %>')">+</span>
							</div></td>
						<td><input type="checkbox" id="addtoKart"
							name="selectedItems" class="addtoKart"
							value="<%=product.getProductId()%>" /></td>
					</tr>
					<%
					number++;
						}
						
					%>
				</tbody>
			</table>
			<input type="button" class="btn btn-default" value="Add to cart"
				id="submit" onclick="checkOut();" />
		</form>
	</div>
</body>
</html>