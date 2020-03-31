
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
<section class="blog_categorie_area">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
				<div class="categories_post">
					<img class="card-img rounded-0"
						src="/static/user/img/blog/cat-post/cat-post-3.jpg" alt="post">
					<div class="categories_details">
						<div class="categories_text">
							<a href="single-blog.html">
								<h5>Social Life</h5>
							</a>
							<div class="border_line"></div>
							<p>Enjoy your social life together</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================Blog Categorie Area =================-->

<!--================Blog Area =================-->
<section class="blog_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog_left_sidebar">
					<c:forEach var="r" items="${listMyBlog}">
						<article class="row blog_item">

							<div class="col-md-3">
								<div class="blog_info text-right">
									<div class="post_tag">
										<a href="#">Food,</a> <a class="active" href="#">Technology,</a>
										<a href="#">Politics,</a> <a href="#">Lifestyle</a>
									</div>
									<ul class="blog_meta list">
										<li><a href="#">Mark wiens <i class="lnr lnr-user"></i>
										</a></li>
										<li><a href="#">12 Dec, 2017 <i
												class="lnr lnr-calendar-full"></i>
										</a></li>
										<li><a href="#">1.2M Views <i class="lnr lnr-eye"></i>
										</a></li>
										<li><a href="#">06 Comments <i class="lnr lnr-bubble"></i>
										</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-9">
								<div class="blog_post">
									<img id="imgTB" src="/static/user/news/${r.thumbnail}" alt="">
									<div class="blog_details">
										<a href="/user/singleblog/${r.id}">
											<h2>${r.title }</h2>
										</a>
										<p>${r.description }</p>
										<div id="overflow">
											<p>${r.content }</p>
										</div>
										<a class="button button-blog" href="/user/singleblog/${r.id}">View
											More</a>
										<a class="button button-blog" href="/user/updateNews/${r.id}">Edit
											Review</a>
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
					<aside class="single_sidebar_widget search_widget">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search Posts"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="lnr lnr-magnifier"></i>
								</button>
							</span>
						</div>
						<!-- /input-group -->
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget author_widget">
						<img class="author_img rounded-circle"
							src="/static/user/img/blog/author.png" alt="">
						<h4>Charlie Barber</h4>
						<p>Senior blog writer</p>
						<div class="social_icon">
							<a href="#"> <i class="fab fa-facebook-f"></i>
							</a> <a href="#"> <i class="fab fa-twitter"></i>
							</a> <a href="#"> <i class="fab fa-github"></i>
							</a> <a href="#"> <i class="fab fa-behance"></i>
							</a>
						</div>
						<p>Boot camps have its supporters andit sdetractors. Some
							people do not understand why you should have to spend money on
							boot camp when you can get. Boot camps have itssuppor ters andits
							detractors.</p>
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget popular_post_widget">
						<h3 class="widget_title">Popular Posts</h3>
						<div class="media post_item">
							<img src="/static/user/img/blog/popular-post/post1.jpg"
								alt="post">
							<div class="media-body">
								<a href="single-blog.html">
									<h3>Space The Final Frontier</h3>
								</a>
								<p>02 Hours ago</p>
							</div>
						</div>
						<div class="media post_item">
							<img src="/static/user/img/blog/popular-post/post2.jpg"
								alt="post">
							<div class="media-body">
								<a href="single-blog.html">
									<h3>The Amazing Hubble</h3>
								</a>
								<p>02 Hours ago</p>
							</div>
						</div>
						<div class="media post_item">
							<img src="/static/user/img/blog/popular-post/post3.jpg"
								alt="post">
							<div class="media-body">
								<a href="single-blog.html">
									<h3>Astronomy Or Astrology</h3>
								</a>
								<p>03 Hours ago</p>
							</div>
						</div>
						<div class="media post_item">
							<img src="/static/user/img/blog/popular-post/post4.jpg"
								alt="post">
							<div class="media-body">
								<a href="single-blog.html">
									<h3>Asteroids telescope</h3>
								</a>
								<p>01 Hours ago</p>
							</div>
						</div>
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget ads_widget">
						<a href="#"> <img class="img-fluid"
							src="/static/user/img/blog/add.jpg" alt="">
						</a>
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget post_category_widget">
						<h4 class="widget_title">Post Catgories</h4>
						<ul class="list cat-list">
							<li><a href="#" class="d-flex justify-content-between">
									<p>Technology</p>
									<p>37</p>
							</a></li>
							<li><a href="#" class="d-flex justify-content-between">
									<p>Lifestyle</p>
									<p>24</p>
							</a></li>
							<li><a href="#" class="d-flex justify-content-between">
									<p>Fashion</p>
									<p>59</p>
							</a></li>
							<li><a href="#" class="d-flex justify-content-between">
									<p>Art</p>
									<p>29</p>
							</a></li>
							<li><a href="#" class="d-flex justify-content-between">
									<p>Food</p>
									<p>15</p>
							</a></li>
							<li><a href="#" class="d-flex justify-content-between">
									<p>Architecture</p>
									<p>09</p>
							</a></li>
							<li><a href="#" class="d-flex justify-content-between">
									<p>Adventure</p>
									<p>44</p>
							</a></li>
						</ul>
						<div class="br"></div>
					</aside>
					<aside class="single-sidebar-widget newsletter_widget">
						<h4 class="widget_title">Newsletter</h4>
						<p>Here, I focus on a range of items and features that we use
							in life without giving them a second thought.</p>
						<div class="form-group d-flex flex-row">
							<div class="input-group">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fa fa-envelope" aria-hidden="true"></i>
									</div>
								</div>
								<input type="text" class="form-control"
									id="inlineFormInputGroup" placeholder="Enter email address"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter email'">
							</div>
							<a href="#" class="bbtns">Subcribe</a>
						</div>
						<p class="text-bottom">You can unsubscribe at any time</p>
						<div class="br"></div>
					</aside>
					<aside class="single-sidebar-widget tag_cloud_widget">
						<h4 class="widget_title">Tag Clouds</h4>
						<ul class="list">
							<li><a href="#">Technology</a></li>
							<li><a href="#">Fashion</a></li>
							<li><a href="#">Architecture</a></li>
							<li><a href="#">Fashion</a></li>
							<li><a href="#">Food</a></li>
							<li><a href="#">Technology</a></li>
							<li><a href="#">Lifestyle</a></li>
							<li><a href="#">Art</a></li>
							<li><a href="#">Adventure</a></li>
							<li><a href="#">Food</a></li>
							<li><a href="#">Lifestyle</a></li>
							<li><a href="#">Adventure</a></li>
						</ul>
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