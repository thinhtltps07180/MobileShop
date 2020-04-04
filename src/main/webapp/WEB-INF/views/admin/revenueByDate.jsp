<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="/static/admin/assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="/static/admin/assets/images/favicon.png" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<!-- Body -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Chart-js</h3>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Charts</a></li>
					<li class="breadcrumb-item active" aria-current="page">Chart-js</li>
				</ol>
			</nav>
		</div>
		<div class="row">
			<div class="col-lg-10 offset-md-1 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Line chart</h4>
						<canvas id="bar-chart" width="800" height="450"></canvas>
					</div>
				</div>
			</div>
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
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Revenue</th>
									<th>Min (Product price)</th>
									<th>Max (Product price)</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="array" items="${data}">
									<tr>
										<td>${array[0]}</td>
										<td>${array[1]}</td>
										<td><fmt:formatNumber pattern="##,###,###.####"
												value="${array[2]}" /> VND</td>
										<td><fmt:formatNumber pattern="##,###,###.####"
												value="${array[3]}" /> VND</td>
										<td><fmt:formatNumber pattern="##,###,###.####"
												value="${array[4]}" /> VND</td>
									</tr>
									
								</c:forEach>
								<a href="/admin/export">Export</a>
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- content-wrapper ends -->
	<!-- partial:../../partials/_footer.html -->
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
	<!-- partial -->
</div>
<!-- endinject -->
<!-- Plugin js for this page -->
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="/static/admin/assets/js/hoverable-collapse.js"></script>
<script src="/static/admin/assets/js/misc.js"></script>
<!-- endinject -->

<script>
    new Chart(document.getElementById("bar-chart"), {
        type: 'bar',
        data: {
          labels: [    	
          <c:forEach var="array" items="${data}">
          ["${array[0]}"],
          </c:forEach>],
          datasets: [
            {
              label: "Revenue By Date (vnd)",
              backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850,#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850,#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
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
          legend: { display: false },
          title: {
            display: true,
            text: 'Revenue By Date (vnd)'
          }
        }
    });
    </script>

