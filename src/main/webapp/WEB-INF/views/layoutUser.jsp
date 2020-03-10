<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/static/user/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/static/user/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="/static/user/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="/static/user/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="/static/user/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/static/user/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="/static/user/css/style.css">
<!-- Load thư viện flatform -->
<script src="https://apis.google.com/js/client:platform.js" async defer></script>
<!-- log out -->
<script>
	function signOut() {
		
		var auth2 = gapi.auth2.getAuthInstance();		
		auth2.signOut().then(function() {
	        document.getElementsByClassName("g-signin2").style.display = "block";
		});
		auth2.disconnect();		
	}
</script>
<!-- Gọi client_id -->
<meta name="google-signin-client_id"
	content="948184717663-rj08i17ctdkstbrevfdefokc3mgq1lgp.apps.googleusercontent.com">
<meta charset="UTF-8">
<title>Shop Gấu</title>
</head>
<body>

	<jsp:include page="layout/headerUser.jsp" />
	<tiles:insertAttribute name="body" />
	<jsp:include page="layout/footerUser.jsp" />

</body>

<!-- container-scroller -->
<!-- plugins:js -->
<script src="/static/user/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/static/user/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/static/user/vendors/skrollr.min.js"></script>
<script src="/static/user/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/static/user/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/static/user/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/static/user/vendors/mail-script.js"></script>
<script src="/static/user/js/main.js"></script>

</html>