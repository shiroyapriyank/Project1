<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Successfully checkout Page</title>
</head>
<body>


	<div class="container">
		<div class="page-header">
			<h1>Order Placed Successfully</h1>
		</div>
		<p>
			Thank you for your Purchase
			<mark>
				<%=session.getAttribute("userName")%></mark>
			.<br>
		</p>
		<p>
			Your Order Number is:
			<code>
				1547Re52
				</code>
					.
					</p>
	</div>
</body>
</html>