
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- ================ start banner area ================= -->
<style>
img#imgTB {
	width: 510px;
	height: 255px;
}

section.blog_area {
    padding: 50px;
}
img.author_img.rounded-circle {
    width: 315px;
    height: 252px;
}

img.author_img.rounded-circle {
    margin: 10px;
}



div#overflow {
	width: 500px;
	overflow: hidden;
	text-overflow: ellipsis;
	line-height: 25px;
	-webkit-line-clamp: 3;
	height: 75px;
	display: -webkit-box;
	-webkit-box-orient: vertical;
}
</style>

<!-- ================ end banner area ================= -->


<!--================Blog Categorie Area =================-->

<!--================Blog Categorie Area =================-->

<!--================Blog Area =================-->
<section class="blog_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog_left_sidebar">
					<c:forEach var="r" items="${reviewList}">
						<article class="row blog_item">
							<div class="col-md-12">
								<div class="blog_post">
									<img id="imgTB" src="/static/user/news/${r.thumbnail}" alt="">
									
									<div class="blog_details">
									<p>Author: ${r.user.id}</p>
										<a href="/user/singleblog/${r.id}">
											<h2>${r.title }</h2>
										</a>
										<p>${r.description }</p>
										<a class="button button-blog" href="/user/singleblog/${r.id}">View
											More</a>
											<a class="button button-blog" href="/user/reviewedit/${r.id}">Edit</a>
									</div>
								</div>
							</div>
						</article>
					</c:forEach>
					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<li class="page-item"><a href="#" class="page-link"
								aria-label="Previous"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-left"></span>
								</span>
							</a></li>
							<li class="page-item"><a href="#" class="page-link">01</a></li>
							<li class="page-item active"><a href="#" class="page-link">02</a>
							</li>
							<li class="page-item"><a href="#" class="page-link">03</a></li>
							<li class="page-item"><a href="#" class="page-link">04</a></li>
							<li class="page-item"><a href="#" class="page-link">09</a></li>
							<li class="page-item"><a href="#" class="page-link"
								aria-label="Next"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-right"></span>
								</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget author_widget">
						<img class="author_img rounded-circle"
							src="/static/Panel/scrape.png" alt="">
					</aside>
					<aside class="single_sidebar_widget ads_widget">
						<a href="#"> <img class="img-fluid"
							src="/static/user/img/blog/add.jpg" alt="">
						</a>
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget ads_widget">
						<a href="#"> <img class="img-fluid"
							src="/static/user/img/blog/add.jpg" alt="">
						</a>
						<div class="br"></div>
					</aside>
					
					
					
				</div>
			</div>
		</div>
	</div>
</section>
<!--================Blog Area =================-->

<!--================Instagram Area =================-->
<section class="instagram_area">
	<div class="container box_1620">
		<div class="insta_btn">
			<a class="btn theme_btn" href="#">Follow us on instagram</a>
		</div>
		<div class="instagram_image row m0">
			<a href="#"><img src="/static/user/img/instagram/ins-1.jpg"
				alt=""></a> <a href="#"><img
				src="/static/user/img/instagram/ins-2.jpg" alt=""></a> <a href="#"><img
				src="/static/user/img/instagram/ins-3.jpg" alt=""></a> <a href="#"><img
				src="/static/user/img/instagram/ins-4.jpg" alt=""></a> <a href="#"><img
				src="/static/user/img/instagram/ins-5.jpg" alt=""></a> <a href="#"><img
				src="/static/user/img/instagram/ins-6.jpg" alt=""></a>
		</div>
	</div>
</section>
<!--================End Instagram Area =================-->