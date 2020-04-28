
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!-- Font Awesome Icon -->
<link rel="stylesheet" href="/static/review/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="/static/review/css/style.css" />

<style>
a.post-img.top1 {
	height: 417px;
}

a.primary-button {
	color: white;
}

img.listImg {
	height: 205px;
}
</style>




	<!-- /SECTION -->

	<!-- SECTION -->

	<!-- /SECTION -->

	<!-- SECTION -->

	<!-- /SECTION -->

	<!-- SECTION -->

	<!-- /SECTION -->

	<!-- SECTION -->


	<!-- container -->
	<div class="container">

		<div class="section-title">
			<h2 class="title">Last Review</h2>
			<!-- row -->
			<div class="row">
				<div class="col-md-8">
					<!-- post -->
					<c:forEach var="r" items="${listMyBlog}">
						<div class="post post-row">
							<a class="post-img" href="/user/singleblog/${r.id}"><img
								class="listImg" src="/static/user/news/${r.thumbnail}" alt=""></a>
							<div class="post-body">
								<div class="post-category">
									<a class="primary-button" href="/user/updateNews/${r.id}">Edit Your review</a>
								</div>
								<h3 class="post-title">
									<a href="/user/singleblog/${r.id}">${r.title}</a>
								</h3>
								<ul class="post-meta">
									<li><a href="author.html">${r.user.id}</a></li>
									<li>${r.createDate}</li>
								</ul>
								<p>${r.description}</p>
							</div>
						</div>
					</c:forEach>
					<nav id="pagerId" aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link"
								href="/user/blog/0">First</a></li>
							<li class="page-item"><a class="page-link"
								href="/user/blog/${pageNo -1}">Previous</a></li>
							<li class="page-item"><a class="page-link"
								href="/user/blog/${pageNo +1}">Next</a></li>
							<li class="page-item"><a class="page-link"
								href="/user/blog/${lastPageCount}">Last</a></li>
						</ul>
					</nav>
					<!-- /post -->

					<!-- post -->

					<!-- /post -->

					<!-- post -->

					<!-- /post -->

					<!-- post -->

					<!-- /post -->

					<!-- post -->

					<!-- /post -->

					
				</div>
				<div class="col-md-4">
					<!-- galery widget -->
					<div class="aside-widget">
						<div class="section-title">
							<h2 class="title">Instagram</h2>
						</div>
						<div class="galery-widget">
							<ul>
								<li><a href="#"><img
										src="/static/review/img/galery-1.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="/static/review/img/galery-2.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="/static/review/img/galery-3.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="/static/review/img/galery-4.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="/static/review/img/galery-5.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="/static/review/img/galery-6.jpg" alt=""></a></li>
							</ul>
						</div>
					</div>
					<!-- /galery widget -->

					<!-- Ad widget -->
					<div class="aside-widget text-center">
						<a href="#" style="display: inline-block; margin: auto;"> <img
							class="img-responsive" src="/static/review/img/ad-1.jpg" alt="">
						</a>
					</div>
					<!-- /Ad widget -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>



	<script src="/static/review/js/jquery.min.js"></script>
	<script src="/static/review/js/bootstrap.min.js"></script>
	<script src="/static/review/js/jquery.stellar.min.js"></script>
	<script src="/static/review/js/main.js"></script>