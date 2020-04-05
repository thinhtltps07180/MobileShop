<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
						<h4 class="card-title">Categorye</h4>
						
						<table class="table table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>Category Name</th>									
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${list}">
									<tr>
										<td>${p.id}</td>
										<td>${p.name}</td>
										
										<td><a href="/admin/editCategory/${p.id}">Edit</a></td>
										<td><a href="/admin/deleteCategory/${p.id}">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>