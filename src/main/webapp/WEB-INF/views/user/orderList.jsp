<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--================Order Details Area =================-->
<section class="order_details section-margin--small">
	<div class="container">
		<div class="card-header">
		<div class="fas fa-table"></i> Orders Detail</div>
		</div>
		<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>OrderDate</th>
						<th>Amount</th>
						<th>OrderBy</th>
						
						<th>OrderDetails</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="ldt" items="${listDetailByUser}">
						<tr>
							
							<td>${ldt.orderDate}</td>
							<td>${ldt.amount}</td>
							<td>${ldt.user.id}</td>			
							<td>
							<a href="/user/orderDetail/${ldt.id}/${ldt.id}">Detail</a>

						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<div class="card-footer small text-muted">Updated yesterday at
		11:59 PM</div>
	</div>
</section>
<!--================End Order Details Area =================-->
