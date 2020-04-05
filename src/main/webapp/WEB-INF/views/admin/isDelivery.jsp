<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

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
									<th>Order by</th>
									<th>Order Date</th>
									<th>Amount</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="o" items="${st}" varStatus="loopCounter">
									<tr>
										<td>${o.id}</td>
										<td>${o.user.id}</td>
										<td>${o.orderDate}</td>
										<c:set var="basecost" value="p.unitPrice" />
										<td><fmt:formatNumber pattern="##,###,###.####"
												value="${o.amount}" /></td>
										<td>${o.status.name}</td>
										<td><a class="check-list"
											href="/admin/checkOrders/${loopCounter.count}/${o.id}"
											id="${loopCounter.count}"><button
													style="font-size: 24px; color: red">
													<i class="fa fa-check"></i>
										</button></a></td>
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
	
	
	
	  <script>
  
$( "a.check-list" ).click(function( event ) {
	 var myId = $(this).attr('id');
	
  event.preventDefault();
  Swal.fire({
	  title: 'Are you sure?',
	  text: "You won't be able to revert this!",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'Yes, confirm it!',
	}).then((result) => {
	  if (result.value) {
	    Swal.fire(
	      'Congratulations!',
	      'Your file has been changed.',
	      'success'    
	    ).then(function() {
			let getId = myId;
	/* 		alert(getId); */
			var href = $("#"+getId).attr("href")
		/* 	alert(href) */
	    	window.location.href = href  
		})
	   
	  }
	 
	})
	
	return false;	
});

</script>