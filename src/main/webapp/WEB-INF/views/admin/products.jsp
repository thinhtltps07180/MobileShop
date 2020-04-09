<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href=" https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href=" https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" />


<script src="https://code.jquery.com/jquery-3.3.1.js" defer ></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" defer></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" defer></script>

<style>
label {
    margin-top: 15px;
}
</style>


<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>


<!-- Body -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Products Tables</h3>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Tables</a></li>
					<li class="breadcrumb-item active" aria-current="page">Products
						tables</li>
				</ol>
			</nav>
		</div>
		<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Products list</h4>
						<a href="/admin/create"><button type="submit" class="btn btn-gradient-primary mr-2">New Product</button></a>
						<table id="example" class="table table-striped">
							<thead>
								<tr>
									<th></th>
									<th>Product Name</th>
									<th>UnitPrice</th>
									<th>Quantity</th>
									<th>Category</th>
									<th>Promotion</th>
									<th></th>

								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${productList}">
									<tr>
										<td class="py-1"><img
											src="/static/admin/product/${p.image}" alt="image" /></td>
										<td>${p.name}</td>
										<c:set var="basecost"
											value="p.unitPrice" />
										<td><fmt:formatNumber pattern="##,###,###.####"
										value="${p.unitPrice}" /></td>
										<td>${p.quantity}</td>
										<td>${p.category.name}</td>
										<td>${p.promotion.name}</td>
										<td><a href="/admin/edit/${p.id}">Edit</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
				<div
					class="d-sm-flex justify-content-center justify-content-sm-between">
					<span
						class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright
						© 2017 <a href="https://www.bootstrapdash.com/" target="_blank">BootstrapDash</a>.
						All rights reserved.
					</span> <span
						class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted
						& made with <i class="mdi mdi-heart text-danger"></i>
					</span>
				</div>
			</footer>