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
    $('#example1').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'print',
                title: 'Recent Orders by day '
            },

            'copy', 'csv', 'excel', 'pdf'
        ]
    } );
} );

</script>

<script>
$(document).ready(function() {
    $('#example2').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'print',
                title: 'Recent Orders by month '
            },
            'copy', 'csv', 'excel', 'pdf'
        ]
    } );
} );

</script>
<script>
$(document).ready(function() {
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'print',
                title: 'Recent Orders by month '
            },
            'copy', 'csv', 'excel', 'pdf'
        ]
    } );
} );

</script>
<div class="main-panel">
	<div class="content-wrapper">
		<div class="row" id="proBanner">
			<div class="col-12">
				<span class="d-flex align-items-center purchase-popup">
					<p>Revenue by day , month , year.</p> <i
					class="mdi mdi-close" id="bannerClose"></i>
				</span>
			</div>
		</div>
		<div class="page-header">
			<h3 class="page-title">
				<span class="page-title-icon bg-gradient-primary text-white mr-2">
					<i class="mdi mdi-home"></i>
				</span> Dashboard
			</h3>
			<nav aria-label="breadcrumb">
				<ul class="breadcrumb">
					<li class="breadcrumb-item active" aria-current="page"><span></span>Overview
						<i
						class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
					</li>
				</ul>
			</nav>
		</div>
		<div class="row">
			<div class="col-md-4 stretch-card grid-margin">
				<div class="card bg-gradient-danger card-img-holder text-white">
					<div class="card-body">
						<img src="/static/admin/assets/images/dashboard/circle.svg"
							class="card-img-absolute" alt="circle-image">
						<h4 class="font-weight-normal mb-3">
							Daily Sales By Day <i
								class="mdi mdi-chart-line mdi-24px float-right"></i>
						</h4>
						<h4 class="font-weight-normal mb-3">
							${dayNow}-${monthNow}-${yearNow} <i
								class="mdi mdi-chart-bar mdi-24px float-right"></i>
						</h4>
						<c:forEach var="array" items="${sumOrder}">
							<h3 class="mb-5">${array[1]} Order</h3>
						</c:forEach>
						<c:forEach var="array" items="${rnvDay}">
							<h3 class="mb-5">
								<fmt:formatNumber pattern="##,###,###.####" value="${array[1]}" />
								VND
							</h3>
						</c:forEach>
						<h6 class="card-text">Increased by 28%</h6>
					</div>
				</div>
			</div>
			<div class="col-md-4 stretch-card grid-margin">
				<div class="card bg-gradient-info card-img-holder text-white">
					<div class="card-body">
						<img src="/static/admin/assets/images/dashboard/circle.svg"
							class="card-img-absolute" alt="circle-image">
						<h4 class="font-weight-normal mb-3">
							Daily Sales By Day <i
								class="mdi mdi-chart-line mdi-24px float-right"></i>
						</h4>
						<h4 class="font-weight-normal mb-3">
							${dayNow}-${monthNow}-${yearNow} <i
								class="mdi mdi-chart-bar mdi-24px float-right"></i>
						</h4>
						<c:forEach var="array" items="${sumOrderM}">
							<h3 class="mb-5">${array[1]} Order</h3>
						</c:forEach>
						<c:forEach var="array" items="${rnvMonth}">
							<h3 class="mb-5">
								<fmt:formatNumber pattern="##,###,###.####" value="${array[1]}" />
								VND
							</h3>
						</c:forEach>
						<h6 class="card-text">Increased by 38%</h6>
					</div>
				</div>
			</div>
			<div class="col-md-4 stretch-card grid-margin">
				<div class="card bg-gradient-success card-img-holder text-white">
					<div class="card-body">
						<img src="/static/admin/assets/images/dashboard/circle.svg"
							class="card-img-absolute" alt="circle-image">
						<h4 class="font-weight-normal mb-3">
							Daily Sales By Year <i
								class="mdi mdi-chart-line mdi-24px float-right"></i>
						</h4>
						<h4 class="font-weight-normal mb-3">
							${yearNow} <i class="mdi mdi-chart-bar mdi-24px float-right"></i>
						</h4>
						<c:forEach var="array" items="${sumOrderYear}">
							<h3 class="mb-5">${array[1]} Order</h3>
						</c:forEach>
						<c:forEach var="array" items="${rnvYear}">
							<h3 class="mb-5">
								<fmt:formatNumber pattern="##,###,###.####" value="${array[1]}" />
								VND
							</h3>
						</c:forEach>
						<h6 class="card-text">Increased by 60%</h6>
					</div>
				</div>
			</div>


		</div>
		<div class="row">
			<div class="col-md-7 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="chartjs-size-monitor">
							<div class="chartjs-size-monitor-expand">
								<div class=""></div>
							</div>
							<div class="chartjs-size-monitor-shrink">
								<div class=""></div>
							</div>
						</div>
						<div class="clearfix">
							<h4 class="card-title float-left">Daily Sales Statistics
								bar-char</h4>
							<div id="visit-sale-chart-legend"
								class="rounded-legend legend-horizontal legend-top-right float-right">

							</div>
						</div>
						<canvas id="barchart" class="mt-4 chartjs-render-monitor"
							style="display: block; height: 298px; width: 596px;" width="745"
							height="372"></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-5 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="chartjs-size-monitor">
							<div class="chartjs-size-monitor-expand">
								<div class=""></div>
							</div>
							<div class="chartjs-size-monitor-shrink">
								<div class=""></div>
							</div>
						</div>
						<h4 class="card-title">Daily Sales Statistics pie-char</h4>
						<canvas id="piechart" class="chartjs-render-monitor"
							style="display: block; height: 350px; width: 391px;">
						</canvas>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-6 grid-margin">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Recent Orders</h4>
						<div class="table-responsive">
							<table id="example1" class="table">
								<thead>
									<tr>
										<th>UserId</th>
										<th>Quantity</th>
										<th>Total</th>
										<th>Min</th>
										<th>Max</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="array" items="${rnvCus}">
										<tr>
											<td>${array[0]}</td>
											<td><fmt:formatNumber pattern="##,###,###.####"
													value="${array[1]}" /></td>
											<td><fmt:formatNumber pattern="##,###,###.####"
													value="${array[2]}" /></td>
											<td><fmt:formatNumber pattern="##,###,###.####"
													value="${array[3]}" /></td>
											<td><fmt:formatNumber pattern="##,###,###.####"
													value="${array[4]}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
						<div class="col-6 grid-margin">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Recent Orders</h4>
						<div class="table-responsive">
							<table id="example2" class="table">
								<thead>
									<tr>
										<th>UserId</th>
										<th>Quantity</th>
										<th>Total</th>
										<th>Min</th>
										<th>Max</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="array" items="${rnvCusMonth}">
										<tr>
											<td>${array[0]}</td>
											<td><fmt:formatNumber pattern="##,###,###.####"
													value="${array[1]}" /></td>
											<td><fmt:formatNumber pattern="##,###,###.####"
													value="${array[2]}" /></td>
											<td><fmt:formatNumber pattern="##,###,###.####"
													value="${array[3]}" /></td>
											<td><fmt:formatNumber pattern="##,###,###.####"
													value="${array[4]}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
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
											<td><img src="/static/user/photo/${o.user.photo}"
												class="mr-2" alt="image">${o.user.name}</td>
											<td>${o.orderDate}</td>
											<td><c:if test="${o.status.id == 1}">
													<label style="width: 70px;"
														class="badge badge-gradient-success">${o.status.name}</label>
												</c:if> <c:if test="${o.status.id == 2}">
													<label style="width: 70px;"
														class="badge badge-gradient-primary">${o.status.name}</label>
												</c:if> <c:if test="${o.status.id == 3}">
													<label style="width: 70px;"
														class="badge badge-gradient-info">${o.status.name}</label>
												</c:if> <c:if test="${o.status.id == 4}">
													<label style="width: 70px;"
														class="badge badge-gradient-danger">${o.status.name}</label>
												</c:if> <c:if test="${o.status.id == 5}">
													<label style="width: 70px;"
														class="badge badge-gradient-warning">${o.status.name}</label>
												</c:if></td>
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
	<!-- content-wrapper ends -->
	<!-- partial:partials/_footer.html -->
	<footer class="footer">
		<div
			class="d-sm-flex justify-content-center justify-content-sm-between">
			<span
				class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright
				© 2017 <a href="https://www.bootstrapdash.com/" target="_blank">BootstrapDash</a>.
				All rights reserved.
			</span> <span
				class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted
				&amp; made with <i class="mdi mdi-heart text-danger"></i>
			</span>
		</div>
	</footer>
	<!-- partial -->
</div>

<script>
    new Chart(document.getElementById("barchart"), {
        type: 'bar',
        data: {
          labels: [    	
          <c:forEach var="array" items="${data}">
          ["${array[0]}"],
          </c:forEach>],
          datasets: [
            {
              label: "Revenue By Date (vnd)",
              backgroundColor: ["#FF0000", "#FE642E","#0000FF","#4B8A08","#2E2E2E", "#DF01A5","#F4FA58","#e8c3b9","#c45850,#3e95cd", "#8e5ea1","#3cba6f","#e8c3b1","#c45850"],
              data: [
                 
              	<c:forEach var="array" items="${data}">
              	<c:set var="basecost"
					value="array.[2]" />
				<fmt:formatNumber groupingUsed = "false" maxFractionDigits = "0"
				value= "${array[2]}" /> ,
                 </c:forEach>

					]
            }
          ]
        },
        options: {
          legend: { display: false },
          title: {
            display: true,
            text: 'Revenue By Date (vnd)'
          }
        }
    });
    </script>


<script>
    new Chart(document.getElementById("piechart"), {
        type: 'pie',
        data: {
          labels: [    	
          <c:forEach var="array" items="${data}">
          ["${array[0]}"],
          </c:forEach>],
          datasets: [
            {
              label: "Revenue By Date (vnd)",
              backgroundColor: ["#FF0000", "#FE642E","#0000FF","#4B8A08","#2E2E2E", "#DF01A5","#F4FA58","#e8c3b9","#c45850,#3e95cd", "#8e5ea1","#3cba6f","#e8c3b1","#c45850"],
              data: [
                 
              	<c:forEach var="array" items="${data}">
              	<c:set var="basecost"
					value="array.[2]" />
				<fmt:formatNumber groupingUsed = "false" 
				value= "${array[2]}" />,
                 </c:forEach>

					]
            }
          ]
        },
        options: {
          title: {
            display: true,
            text: 'Revenue By Date (vnd)'
          }
        }
    });
    </script>