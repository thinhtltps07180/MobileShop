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
								<th scope="col">Promotion</th>
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
										<td>${p.promotion.name}</td>
									<c:set var="basecost" value="p.unitPrice" />
									<td><fmt:formatNumber pattern="##,###,###.####"
											value="${(p.unitPrice-(p.unitPrice/100*p.promotion.discount))*p.quantity}" /></td>
									<td></td>		
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