<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		
		
		
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" type="text/css" href=" https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css"/>


    <script src = "https://code.jquery.com/jquery-3.3.1.js"  ></script>
    <script src = "https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" defer  ></script>
    <script src = "https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js" defer ></script>
    <script src = "https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js" defer ></script>
    <script src = " https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js" defer ></script>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js" defer ></script>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"  defer></script>
    <script src = "https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js" defer ></script>
    <script src = "https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js" defer ></script>
    <script src = "https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js" defer ></script>
    
    
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>



<script>
$(document).ready(function() {
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    } );
} );

</script>
<!-- Body -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Orders Tables</h3>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Tables</a></li>
					<li class="breadcrumb-item active" aria-current="page">orders 
						tables</li>
				</ol>
			</nav>
		</div>
		<div class="row">
<div class="col-12 grid-margin">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Recent Orders</h4>
						<div class="table-responsive">
							<table id="example" class="table">
								<thead>
									<tr>
										<th>OrderBy</th>
										<th>OrderDate</th>
										<th>Status</th>
										<th>Amount</th>
										<th>Detail</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="o" items="${listOrder}">
									<tr>
										<td><img
											src="/static/user/photo/${o.user.photo}"
											class="mr-2" alt="image">${o.user.name}</td>
										<td>${o.orderDate}</td>
										<td>
								<c:if test="${o.status.id == 1}">
									<label style="width:70px;" class="badge badge-gradient-success">${o.status.name}</label>
								</c:if>
								<c:if test="${o.status.id == 2}">
									<label style="width:70px;" class="badge badge-gradient-primary">${o.status.name}</label>
								</c:if>
								<c:if test="${o.status.id == 3}">
									<label style="width:70px;" class="badge badge-gradient-info">${o.status.name}</label>
								</c:if>
								<c:if test="${o.status.id == 4}">
									<label style="width:70px;" class="badge badge-gradient-danger">${o.status.name}</label>
								</c:if>
								<c:if test="${o.status.id == 5}">
									<label style="width:70px;" class="badge badge-gradient-warning">${o.status.name}</label>
								</c:if>
										</td>
										<td><fmt:formatNumber pattern="##,###,###.####"
										value="${o.amount}" /></td>
										<td><a href="/admin/orderDetail/${o.id}/${o.id}">Detail</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
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
				� 2017 <a href="https://www.bootstrapdash.com/" target="_blank">BootstrapDash</a>.
				All rights reserved.
			</span> <span
				class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted
				& made with <i class="mdi mdi-heart text-danger"></i>
			</span>
		</div>
	</footer>
	
	

  
