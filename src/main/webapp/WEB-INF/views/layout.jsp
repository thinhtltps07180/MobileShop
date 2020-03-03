<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript" src="/static/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<!-- plugins:css -->
<link rel="stylesheet"
	href="/static/admin/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="/static/admin/assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="/static/admin/assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="/static/admin/assets/images/favicon.png" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="layout/headeradmin.jsp" />
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="layout/navadmin.jsp" />
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>

<!-- container-scroller -->
<!-- plugins:js -->
<script src="/static/admin/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="/static/admin/assets/vendors/chart.js/Chart.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="/static/admin/assets/js/off-canvas.js"></script>
<script src="/static/admin/assets/js/hoverable-collapse.js"></script>
<script src="/static/admin/assets/js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<script src="/static/admin/assets/js/dashboard.js"></script>
<script src="/static/admin/assets/js/todolist.js"></script>
<!-- End custom js for this page -->
</html>