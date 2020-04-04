
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<style>
img#cartImg {
	height: 255px;
	width: 271.48px;
}

nav#pagerId {
	padding-left: 311px;
}

img#cartImg {
	background-color: #f2f2f2;
}
</style>
<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Shop Category</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Shop
							Category</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->


<!-- ================ category section start ================= -->
<section class="section-margin--small mb-5">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">Browse Categories</div>
					<ul class="main-categories">
						<li class="common-filter"><c:forEach var="c"
								items="${categoryList}">
								<form action="#">
									<ul>
										<a href="/user/category/0/${c.id}"><li class="filter-list"><input
												class="pixel-radio" id="men" name="brand"><label>${c.name}<span></span></label></li></a>
									</ul>
								</form>
							</c:forEach></li>
					</ul>
				</div>
				<div class="sidebar-filter">
					<div class="top-filter-head">Product Filters</div>
					<div class="common-filter">
						<div class="head">Brands</div>
						<form action="#">
							<ul>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="apple" name="brand"><label for="apple">Apple<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="asus" name="brand"><label for="asus">Asus<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="gionee" name="brand"><label
									for="gionee">Gionee<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="micromax" name="brand"><label
									for="micromax">Micromax<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="samsung" name="brand"><label
									for="samsung">Samsung<span>(19)</span></label></li>
							</ul>
						</form>
					</div>
					<div class="common-filter">
						<div class="head">Color</div>
						<form action="#">
							<ul>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="black" name="color"><label for="black">Black<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="balckleather" name="color"><label
									for="balckleather">Black Leather<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="blackred" name="color"><label
									for="blackred">Black with red<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="gold" name="color"><label for="gold">Gold<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="spacegrey" name="color"><label
									for="spacegrey">Spacegrey<span>(19)</span></label></li>
							</ul>
						</form>
					</div>
					<div class="common-filter">
						<div class="head">Price</div>
						<div class="price-range-area">
							<div id="price-range"></div>
							<div class="value-wrapper d-flex">
								<div class="price">Price:</div>
								<span>$</span>
								<div id="lower-value"></div>
								<div class="to">to</div>
								<span>$</span>
								<div id="upper-value"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select onChange="window.location.href=this.value">
							<option value="/user/category/0" selected="selected">Default
								sorting</option>
							<option value="/user/categorySortDesc/0"><a>DESC
									sorting</a></option>
							<option value="/user/categorySortAsc/0">ASC sorting</option>
						</select>
					</div>
					<div>
						<div class="input-group filter-bar-search">
							<input type="text" id="search" placeholder="Search">
							<div class="input-group-append">
								<button type="button">
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<hr>
				<jsp:include page="../cart/info.jsp"></jsp:include>
				<hr>
				<section class="lattest-product-area pb-40 category-list">
					<div class="row" id="parent">

						<c:forEach var="p" items="${productList}">
							<div class="col-md-6 box col-lg-4">
								<div class="card text-center card-product">
									<div class="card-product__img">
										<a href="/user/singleproduct/${p.id}"> <img
											class="card-img" id="cartImg"
											src="/static/admin/product/${p.image}" alt="">
											<ul class="card-product__imgOverlay">
												<li><button>
														<i class="ti-search"></i>
													</button></li>
												<li><a href="/cart/add/${pageNo}/${p.id}"><button>
															<i class="ti-shopping-cart"></i>
														</button></a></li>
												<li><button>
														<i class="ti-heart"></i>
													</button></li>
											</ul></a>
									</div>
									<div class="card-body">
										<p id="name">${p.category.name}</p>
										<c:set var="quantity" scope="session" value="${p.quantity}" />
										<c:if test="${quantity > 0}">
											<p>
												Status:
												<c:out value="Available" />
											<p>
										</c:if>
										<c:if test="${quantity <= 0}">
											<p>
												Status:
												<c:out value="Unvailable" />
											<p>
										</c:if>
										<h4 class="card-product__title">
											<a href="#">${p.name}</a>
										</h4>
										<c:set var="basecost" value="p.unitPrice" />
										<p class="card-product__price">
											<fmt:formatNumber pattern="##,###,###.####"
												value="${p.unitPrice}" />
										</p>

									</div>
								</div>
							</div>
						</c:forEach>

						<nav id="pagerId" aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link"
									href="/user/category/0">First</a></li>
								<li class="page-item"><a class="page-link"
									href="/user/category/${pageNo -1}">Previous</a></li>
								<li class="page-item"><a class="page-link"
									href="/user/category/${pageNo +1}">Next</a></li>
								<li class="page-item"><a class="page-link"
									href="/user/category/${lastPageCount}">Last</a></li>
							</ul>
						</nav>
					</div>
				</section>
				<!-- End Best Seller -->
			</div>
		</div>
	</div>
</section>
<!-- ================ category section end ================= -->

<!-- ================ top product area start ================= -->
<section class="related-product-area">
	<div class="container">
		<div class="section-intro pb-60px">
			<p>Popular Item in the market</p>
			<h2>
				Top <span class="section-intro__style">Product</span>
			</h2>
		</div>
		<div class="row mt-30">
			<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
				<div class="single-search-product-wrapper">
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-1.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-2.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-3.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
				<div class="single-search-product-wrapper">
					<div id="box" class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-4.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-5.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-6.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
				<div class="single-search-product-wrapper">
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-7.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-8.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-9.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
				<div class="single-search-product-wrapper">
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-1.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-2.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
					<div class="single-search-product d-flex">
						<a href="#"><img
							src="/static/user/img/product/product-sm-3.png" alt=""></a>
						<div class="desc">
							<a href="#" class="title">Gray Coffee Cup</a>
							<div class="price">$170.00</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- ================ top product area end ================= -->

<!-- ================ Subscribe section start ================= -->
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
<!-- ================ Subscribe section end ================= -->
<script>
	var $search = $("#search").on('input', function() {
		var matcher = new RegExp($(this).val(), 'gi');
		$('.box').show().not(function() {
			return matcher.test($(this).find('#name').text())
		}).hide();
	})
</script>