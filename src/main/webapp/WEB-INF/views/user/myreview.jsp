<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.table th img, .table td img {
	width: 36px;
	height: 36px;
	border-radius: 100%;
}
</style>
<!-- Body -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Basic Tables</h3>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Tables</a></li>
					<li class="breadcrumb-item active" aria-current="page">Basic
						tables</li>
				</ol>
			</nav>
		</div>
		<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Striped Table</h4>
						<p class="card-description">
							Add class
							<code>.table-striped</code>
						</p>
						<table class="table table-striped">
							<thead>
								<tr>
									<th></th>
									<th>Product Name</th>
									<th>UnitPrice</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="r" items="${reviewList}">
									<tr>
										<td class="py-1"><img
											src="/static/user/news/${r.thumbnail}" alt="image" /></td>
										<td>${r.title}</td>
										<td>${r.description}</td>
										<td><a href="/user/reviewedit/${r.id}">Edit</a></td>
										<td><a href="/user/reviewdelete/${r.id}">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>b
				</div>
			</div>
		</div>
	</div>