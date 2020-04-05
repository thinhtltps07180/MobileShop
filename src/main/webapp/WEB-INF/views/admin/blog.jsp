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
			<div class="col-lg-12 stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Table with contextual classes</h4>
						<p class="card-description">
							Add class
							<code>.table-{color}</code>
						</p>
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Thumbnail</th>
									<th>Title</th>
									<th>Create Date</th>
									<th>Count Viewer</th>
									<th>Create by</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="r" items="${reviewList}">
									<tr>
										<td>${r.id}</td>
										<td class="rtn"><img
											src="/static/user/news/${r.thumbnail}" alt="image" /></td>
										<td >${r.title}</td>
										<c:set var="basecost" value="p.unitPrice" />
										<td>${r.createDate}</td>
										<td>${r.countViewer}</td>
										<td>${r.user.id}</td>
										<td><a href="/admin/edit/${p.id}">Edit</a></td>
										<td><a href="/admin/delete/${p.id}">Delete</a></td>
									</tr>
								</c:forEach>
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