<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">




<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
<link rel="stylesheet" type="text/css"
	href=" https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css" />


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	defer></script>
<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"
	defer></script>
<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"
	defer></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"
	defer></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"
	defer></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"
	defer></script>
<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"
	defer></script>
<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"
	defer></script>
<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"
	defer></script>


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
<style>
td#cf {
	width: 14%;
}
.table th, .table td {
white-space: normal;
border-top: 10px solid #FFFFFF;
}
</style>
<!-- Body -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Check review from user</h3>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Tables</a></li>
					<li class="breadcrumb-item active" aria-current="page">Check review</li>
				</ol>
			</nav>
		</div>
		<div class="row">
			<div class="col-12 grid-margin">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Review pending</h4>
						<div class="table-responsive">
							<table id="example" class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>Thumbnail</th>
										<th>Title</th>
										<th>Create Date</th>
										<th>Create by</th>
										<th>Confirm Review</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="r" items="${reviewList}"
										varStatus="loopCounter">
										<tr>
											<td>${r.id}</td>
											<td class="rtn"><img
												src="/static/user/news/${r.thumbnail}" alt="image" /></td>
											<td id="title">${r.title}</td>
											<td>
											<fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd" />
											</td>
											<td>${r.user.id}</td>
											
											<td id="cf"><a class="check-list"
												href="/admin/checkReview/${loopCounter.count}/${r.id}"
												id="${loopCounter.count}"><button
														style="font-size: 24px; color: red; margin-left: 33px;">
														<i class="fa fa-check"></i>
											</button></a></td>
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
	}).then((result) =>
	{
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