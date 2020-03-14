<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
img#cartImg {
	height: 100px;
	width: 150px;
}
</style>
<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Shopping Cart</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Shopping
							Cart</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->

<section class="cart_area">
	<div class="container">
		<div class="cart_inner">
			<div class="table-responsive">
				<form action="/cart/update" method="post">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Id</th>
								<th scope="col">Product</th>
								<th scope="col">Price</th>
								<th scope="col">Quantity</th>
								<th scope="col">Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p"
								items="${sessionScope['scopedTarget.cartService'].items}">
								<tr>
									<td>${p.id}</td>
									<td>
										<div class="media">
											<div class="d-flex">
												<img id="cartImg" src="/static/admin/product/${p.image}"
													alt="">
											</div>
											<div class="media-body">
												<p>${p.name}</p>
											</div>
										</div>
									</td>
									<c:set var="basecost" value="p.unitPrice" />
									<td><fmt:formatNumber pattern="##,###,###.####"
											value="${p.unitPrice}" /></td>

									<td><input name="${p.id}" value="${p.quantity}"
										type="number" min="1"></td>
									<c:set var="basecost" value="p.unitPrice" />
									<td><fmt:formatNumber pattern="##,###,###.####"
											value="${p.unitPrice*p.quantity}" /></td>
									<td><a class="btn btn-primary" href="/cart/remove/${p.id}">Remove</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="buttons">
						<a class="btn btn-primary" href="/cart/clear">Clear</a>
						<button class="btn btn-primary">Update</button>
						<a class="btn btn-primary" href="/cart/accept">Accept</a>
				</form>
			</div>
		</div>
	</div>
</section>