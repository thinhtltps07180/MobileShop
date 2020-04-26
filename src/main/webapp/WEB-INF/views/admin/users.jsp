<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Body -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">User table</h3>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Tables</a></li>
					<li class="breadcrumb-item active" aria-current="page">User
						tables</li>
				</ol>
			</nav>
		</div>
		<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">User Table</h4>
						<a href="/admin/addUser"><button type="submit" class="btn btn-gradient-primary mr-2">New user</button></a>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Photo</th>
									<th>UserID</th>
									<th>User Name</th>
									<th>Email</th>
									<th>Role</th>
									<th>Address</th>
									<th>Phone Number</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${listUsers}">
									<tr>
										<td class="py-1"><img src="/static/user/photo/${u.photo}"
											alt="image" /></td>
										<td>${u.id}</td>
										<td>${u.name}</td>
										<td>${u.email}</td>

										<td><c:if test="${u.role.id == 2}">
												<label style="width: 70px;"
													class="badge badge-gradient-success">${u.role.name}</label>
											</c:if>
											<c:if test="${u.role.id == 1}">
												<label style="width: 70px;"
													class="badge badge-gradient-warning">${u.role.name}</label>
											</c:if>
											</td>
											<td>${u.address}</td>
											<td>${u.phoneNumber}</td>
										<td><a href="/admin/editUser/${u.id}">Edit</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>