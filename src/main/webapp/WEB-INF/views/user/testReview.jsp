
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
</style>



<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div id="hot-post" class="row hot-post">
			<div class="col-md-8 hot-post-left">
				<!-- post -->
				<div class="post post-thumb">
					<a class="post-img top1" href="blog-post.html"><img
						src="/static/user/news/${top1.thumbnail}" alt=""></a>
					<div class="post-body">
						<div class="post-category">
							<a href="category.html">Lifestyle</a>
						</div>
						<h3 class="post-title title-lg">
							<a href="blog-post.html">${top1.title}</a>
						</h3>
						<ul class="post-meta">
							<li><a href="author.html">${top1.user.id}</a></li>
							<li>${top1.createDate}</li>
						</ul>
					</div>
				</div>
				<!-- /post -->
			</div>
			<div class="col-md-4 hot-post-right">
				<!-- post -->
				<c:forEach var="r" items="${top2}">
					<div class="post post-thumb">
						<a class="post-img" href="blog-post.html"><img
							src="/static/user/news/${r.thumbnail}" alt=""></a>
						<div class="post-body">
							<div class="post-category">
								<a href="category.html">Lifestyle</a>
							</div>
							<h3 class="post-title">
								<a href="blog-post.html">Sed ut perspiciatis, unde omnis
									iste natus error sit</a>
							</h3>
							<ul class="post-meta">
								<li><a href="author.html">John Doe</a></li>
								<li>20 April 2018</li>
							</ul>
						</div>
					</div>
				</c:forEach>
				<!-- /post -->
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->

<!-- /SECTION -->

<!-- SECTION -->

<!-- /SECTION -->

<!-- SECTION -->

<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-8">
				<!-- post -->
				<div class="post post-row">
					<a class="post-img" href="blog-post.html"><img
						src="/static/review/img/post-13.jpg" alt=""></a>
					<div class="post-body">
						<div class="post-category">
							<a href="category.html">Travel</a> <a href="category.html">Lifestyle</a>
						</div>
						<h3 class="post-title">
							<a href="blog-post.html">Mel ut impetus suscipit tincidunt.
								Cum id ullum laboramus persequeris.</a>
						</h3>
						<ul class="post-meta">
							<li><a href="author.html">John Doe</a></li>
							<li>20 April 2018</li>
						</ul>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam...</p>
					</div>
				</div>
				<!-- /post -->

				<!-- post -->
				<div class="post post-row">
					<a class="post-img" href="blog-post.html"><img
						src="/static/review/img/post-1.jpg" alt=""></a>
					<div class="post-body">
						<div class="post-category">
							<a href="category.html">Travel</a>
						</div>
						<h3 class="post-title">
							<a href="blog-post.html">Sed ut perspiciatis, unde omnis iste
								natus error sit</a>
						</h3>
						<ul class="post-meta">
							<li><a href="author.html">John Doe</a></li>
							<li>20 April 2018</li>
						</ul>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam...</p>
					</div>
				</div>
				<!-- /post -->

				<!-- post -->
				<div class="post post-row">
					<a class="post-img" href="blog-post.html"><img
						src="/static/review/img/post-5.jpg" alt=""></a>
					<div class="post-body">
						<div class="post-category">
							<a href="category.html">Lifestyle</a>
						</div>
						<h3 class="post-title">
							<a href="blog-post.html">Postea senserit id eos, vivendo
								periculis ei qui</a>
						</h3>
						<ul class="post-meta">
							<li><a href="author.html">John Doe</a></li>
							<li>20 April 2018</li>
						</ul>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam...</p>
					</div>
				</div>
				<!-- /post -->

				<!-- post -->
				<div class="post post-row">
					<a class="post-img" href="blog-post.html"><img
						src="/static/review/img/post-6.jpg" alt=""></a>
					<div class="post-body">
						<div class="post-category">
							<a href="category.html">Fashion</a> <a href="category.html">Lifestyle</a>
						</div>
						<h3 class="post-title">
							<a href="blog-post.html">Sed ut perspiciatis, unde omnis iste
								natus error sit</a>
						</h3>
						<ul class="post-meta">
							<li><a href="author.html">John Doe</a></li>
							<li>20 April 2018</li>
						</ul>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam...</p>
					</div>
				</div>
				<!-- /post -->

				<!-- post -->
				<div class="post post-row">
					<a class="post-img" href="blog-post.html"><img
						src="/static/review/img/post-7.jpg" alt=""></a>
					<div class="post-body">
						<div class="post-category">
							<a href="category.html">Health</a> <a href="category.html">Lifestyle</a>
						</div>
						<h3 class="post-title">
							<a href="blog-post.html">Ne bonorum praesent cum, labitur
								persequeris definitionem quo cu?</a>
						</h3>
						<ul class="post-meta">
							<li><a href="author.html">John Doe</a></li>
							<li>20 April 2018</li>
						</ul>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam...</p>
					</div>
				</div>
				<!-- /post -->

				<div class="section-row loadmore text-center">
					<a href="#" class="primary-button">Load More</a>
				</div>
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