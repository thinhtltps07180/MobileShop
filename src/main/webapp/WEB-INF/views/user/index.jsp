<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script
	ssrc="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
img#dt {
	height: 499px;
}

img#newId {
	background-color: #f2f2f2;
}

img#bestId {
	height: 269px;
	background-color: #f2f2f2;
}

img.card-img.rounded-0 {
	height: 243px;
	width: 350px;
}

img.card-img-top {
	height: 191px;
}

h5.card-title {
	height: 80px;
}

img.card-img-top {
	padding-top: 10px;
}

a#buttonSSS {
    margin-bottom: 20px;
}
</style>

<main class="site-main"> <!--================ Hero banner start =================-->
<section class="hero-banner">
	<div class="container">
		<div class="row no-gutters align-items-center pt-60px">
			<div class="col-5 d-none d-sm-block">
				<div class="hero-banner__img">
					<img class="img-fluid" src="/static/user/img/home/hero-banner.png"
						alt="">
				</div>
			</div>
			<div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
				<div class="hero-banner__content">
					<h4>Shop is fun</h4>
					<h1>Browse Our Premium Product</h1>
					<p>Us which over of signs divide dominion deep fill bring
						they're meat beho upon own earth without morning over third. Their
						male dry. They are great appear whose land fly grass.</p>
					<a class="button button-hero" href="#">Browse Now</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================ Hero banner start =================--> <!--================ Hero Carousel start =================-->
<section class="section-margin mt-0">
	<div class="owl-carousel owl-theme hero-carousel">
		<div class="hero-carousel__slide">
			<img id="dt" src="/static/admin/product/iphone.png" alt=""
				class="img-fluid"> <a href="/user/categoryByIphone/0"
				class="hero-carousel__slideOverlay">
				<h3> IPhone 11 64GB</h3>
				<p>Ihphone</p>
			</a>
		</div>
		<div class="hero-carousel__slide">
			<img id="dt" src="/static/admin/product/XAM.png" alt=""
				class="img-fluid"> <a href="/user/categoryByXiaomi/0"
				class="hero-carousel__slideOverlay">
				<h3>xiaomi redmi note 8</h3>
				<p>XIAOMI</p>
			</a>
		</div>
		<div class="hero-carousel__slide">
			<img id="dt" src="/static/admin/product/SS.png" alt=""
				class="img-fluid"> <a href="/user/categoryBySamSung/0"
				class="hero-carousel__slideOverlay">
				<h3>samsung galaxy note</h3>
				<p>SAMSUM</p>
			</a>
		</div>
	</div>
</section>
<!--================ Hero Carousel end =================--> <!-- ================ trending product section start ================= -->
<section class="section-margin calc-60px">
	<div class="container">
		<div class="section-intro pb-60px">
			<p>Popular Item in the market</p>
			<h2>
				New <span class="section-intro__style">Product</span>
			</h2>
		</div>
		<div class="row">
			<c:forEach var="n" items="${newList}">
				<div class="col-md-6 col-lg-4 col-xl-3">
					<div class="card text-center card-product">
						<div class="card-product__img">
							<img id="newId" class="card-img"
								src="/static/admin/product/${n.image }" alt="">
							<ul class="card-product__imgOverlay">
								<li><button>
										<i class="ti-search"></i>
									</button></li>
								<li><button>
										<a href="/user/singleproduct/${n.id}"><i
											class="ti-shopping-cart"></i></a>
									</button></li>
								<li><button>
										<i class="ti-heart"></i>
									</button></li>
							</ul>
						</div>
						<div class="card-body">
							<p>${n.category.name}</p>
							<h4 class="card-product__title">
								<a href="single-product.html">${n.name}</a>
							</h4>
							<c:set var="basecost" value="p.unitPrice" />
							<p class="card-product__price">
								<fmt:formatNumber pattern="##,###,###.####"
									value="${n.unitPrice}" />
							</p>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
</section>
<!-- ================ trending product section end ================= -->


<!-- ================ offer section start ================= -->
<section class="offer" id="parallax-1" data-anchor-target="#parallax-1"
	data-300-top="background-position: 20px 30px"
	data-top-bottom="background-position: 0 20px">
	<div class="container">
		<div class="row">
			<div class="col-xl-5">
				<div class="offer__content text-center">
					<h3>Up To 50% Off</h3>
					<h4>Winter Sale</h4>
					<p>Him she'd let them sixth saw light</p>
					<a class="button button--active mt-3 mt-xl-4" href="#">Shop Now</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- ================ offer section end ================= --> <!-- ================ Best Selling item  carousel ================= -->
<section class="section-margin calc-60px">
	<div class="container">
		<div class="section-intro pb-60px">
			<p>Popular Item in the market</p>
			<h2>
				Best <span class="section-intro__style">Sellers</span>
			</h2>
		</div>
		<
		<div class="container">

			<div class="row">
				<c:forEach var="n" items="${trendList}">
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img id="bestId" class="card-img"
									src="/static/admin/product/${n.image }" alt="">
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-search"></i>
										</button></li>
									<li><button>
											<a href="/user/singleproduct/${n.id}"><i
												class="ti-shopping-cart"></i></a>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
								<p>${n.category.name}</p>
								<h4 class="card-product__title">
									<a href="single-product.html">${n.name}</a>
								</h4>
								<c:set var="basecost" value="p.unitPrice" />
								<p class="card-product__price">
									<fmt:formatNumber pattern="##,###,###.####"
										value="${n.unitPrice}" />
								</p>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</section>
<!-- ================ Best Selling item  carousel end ================= -->

<!-- ================ Blog section start ================= -->
<section class="blog">
	<div class="container">
		<div class="section-intro pb-60px">
			<p>Popular Item in the market</p>
			<h2>
				Latest <span class="section-intro__style">News</span>
			</h2>
		</div>

		<div class="row">
			<c:forEach var="r" items="${reviewList}">
				<div class="card col-md-4" style="width: 18rem;">

					<a href="/user/singleblog/${r.id}"><img class="card-img-top"
						src="/static/user/news/${r.thumbnail}" alt="Card image cap">
					</a>

					<div class="card-body">
						<ul class="card-blog__info">
							<li><a href="#">${r.user.id}</a></li>
							<li><a href="#"><i class="ti-comments-smiley"></i>
									Comments</a></li>
						</ul>
						<h5 class="card-title">${r.title}</h5>
						<p class="card-text">${r.description}</p>
					</div>
					<a id="buttonSSS" href="/user/singleblog/${r.id}" class="btn btn-primary">Read
						More</a>
				</div>
			</c:forEach>



		</div>
	</div>
</section>
<!-- ================ Blog section end ================= --> <!-- ================ Subscribe section start ================= -->
<section class="subscribe-position">
	<div class="container">
		<div class="subscribe text-center">
			<h3 class="subscribe__title">Get Update From Anywhere</h3>
			<p>Bearing Void gathering light light his eavening unto dont
				afraid</p>
			<div id="mc_embed_signup">
				<form target="_blank"
					action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
					method="get" class="subscribe-form form-inline mt-5 pt-1">
					<div class="form-group ml-sm-auto">
						<input class="form-control mb-1" type="email" name="EMAIL"
							placeholder="Enter your email" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Your Email Address '">
						<div class="info"></div>
					</div>
					<button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe
						Now</button>
					<div style="position: absolute; left: -5000px;">
						<input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1"
							value="" type="text">
					</div>

				</form>
			</div>

		</div>
	</div>
</section>
<!-- ================ Subscribe section end ================= --> </main>