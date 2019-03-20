<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.model.ProductDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if(session.getAttribute("userName")==null) {
	response.sendRedirect("/Project/Login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>


function checkOut() {


	/* declare an checkbox array */
	var chkArray = [];
	
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
	<input type="hidden" name="actionCode" value="addToCart" >
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
					ProductDetails product = new ProductDetails();
					List<ProductDetails> getproduct = (List<ProductDetails>)session.getAttribute("productDetails");
					Iterator<ProductDetails> it = getproduct.iterator();
					while (it.hasNext()) {
					product = it.next();
				%>
				<tr>
					<td><%=product.getProductName()%></td>
					<td><%=product.getProductDescription()%></td>
					<td><p>$<%=product.getProductPrice()%></p></td>
					<td><input type="number" name="quantity" value="1"></td>
					<td><input type="checkbox" id="addtoKart" name="selectedItems" class="addtoKart"
						value="<%=product.getProductId()%>"/></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<input type="button" class="btn btn-default" value="Add to cart" id="submit" onclick="checkOut();"/>
		</form>
	</div>
</body>
</html>