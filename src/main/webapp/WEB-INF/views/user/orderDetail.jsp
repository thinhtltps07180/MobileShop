<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Order Confirmation</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Shop
							Category</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->

<!--================Order Details Area =================-->
<section class="order_details section-margin--small">
	<div class="container">
		<p class="text-center billing-alert">Thank you. Your order has
			been received.</p>
		<div class="row mb-5">
			<div class="col-md-6 col-xl-6 mb-6 mb-xl-0">
				<div class="confirmation-card">
					<h3 class="billing-title">Order Info</h3>
					<table class="order-rable">
						<tr>
							<td>Order number</td>
							<td>: ${order.id}</td>
						</tr>
						<tr>
							<td>Date</td>
							<td>: ${order.orderDate}</td>
						</tr>
						<tr>
							<td>Total</td>
							<td>: ${order.amount}</td>
						</tr>
						<tr>
							<td>OrderBy</td>
							<td>: ${order.user.id}</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="col-md-6 col-xl-6 mb-6 mb-xl-0">
				<div class="confirmation-card">
					<h3 class="billing-title">Shipping Address</h3>
					<table class="order-rable">
						<tr>
							<td>Address receiver</td>
							<td>: ${order.user.address}</td>
						</tr>
						<tr>
							<td>Receiver</td>
							<td>: ${order.user.name}</td>
						</tr>
						<tr>
							<td>Phone Number</td>
							<td>: ${order.user.phoneNumber}</td>
						</tr>
						<tr>
							<td>Payment method</td>
							<td>: Check payments</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="order_details_table">
			<h2>Order Details</h2>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Product</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ldt" items="${listDetail}">
							<tr>
								<td>${ldt.product.name}</td>
								<td>${ldt.quantity}</td>							
								<td>${ldt.unitPrice}</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
<!--================End Order Details Area =================-->