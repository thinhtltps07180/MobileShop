<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.2.3/firebase.js"></script>
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
<script>
	// Your web app's Firebase configuration
	var firebaseConfig = {
		apiKey : "AIzaSyDB411qvOhcf7qNgYkTorWcSiqKdEbJWiE",
		authDomain : "project2-3b884.firebaseapp.com",
		databaseURL : "https://project2-3b884.firebaseio.com",
		projectId : "project2-3b884",
		storageBucket : "project2-3b884.appspot.com",
		messagingSenderId : "651041813286",
		appId : "1:651041813286:web:9da62be3f621508f4b07e7",
		measurementId : "G-GE3J6R6ZD3"
	};
	// Initialize Firebase
	firebase.initializeApp(firebaseConfig);
</script>

<style>
</style>
<!--================Single Product Area =================-->
<div class="product_image_area">
	<div class="container">
		<div class="row s_product_inner">
			<div class="col-lg-6">
				<div class="owl-carousel owl-theme s_Product_carousel">
					<div class="single-prd-item">
						<img class="img-fluid" src="/static/admin/product/${detail.image}"
							alt="">
					</div>
				</div>
			</div>
			<div class="col-lg-5 offset-lg-1">
				<div class="s_product_text">
					<h3>${detail.name}</h3>
					<h2>
						<c:set var="basecost" value="detail.unitPrice" />
						<fmt:formatNumber pattern="##,###,###.####"
							value="${detail.unitPrice}" />
						VND
					</h2>
					<ul class="list">
						<li><a class="active" href="#"><span>Category</span> :
								${detail.category.name}</a></li>
						<li><a href="#"><span>Quantity</span> :
								${detail.quantity}</a></li>
					</ul>
					<c:set var="quantity" scope="session" value="${detail.quantity}" />
					<c:if test="${quantity > 0}">
						<p>
							Status:
							<c:out value="Available" />
						<p>
						<div class="product_count">
							<hr>
							<jsp:include page="../cart/info.jsp"></jsp:include>
							<hr>
							<a class="button primary-btn" href="/cart/add/${detail.id}">Add
								to Cart</a>
						</div>

					</c:if>
					<c:if test="${quantity <= 0}">
						<p>
							Status:
							<c:out value="Unvailable" />
						<p>
					</c:if>

					<div class="card_area d-flex align-items-center">
						<a class="icon_btn" href="#"><i class="lnr lnr lnr-diamond"></i></a>
						<a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<!--================End Single Product Area =================-->

<!--================Product Description Area =================-->
<section class="product_description_area">
	<div class="container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">Description</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">Specification</a></li>
			<li class="nav-item"><a class="nav-link active" id="contact-tab"
				data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
				aria-selected="false">Comments</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<p>${detail.description}</p>
			</div>
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr>
								<td>
									<h5>Width</h5>
								</td>
								<td>
									<h5>128mm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Height</h5>
								</td>
								<td>
									<h5>508mm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Depth</h5>
								</td>
								<td>
									<h5>85mm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Weight</h5>
								</td>
								<td>
									<h5>52gm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Quality checking</h5>
								</td>
								<td>
									<h5>yes</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Freshness Duration</h5>
								</td>
								<td>
									<h5>03days</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>When packeting</h5>
								</td>
								<td>
									<h5>Without touch of hand</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Each Box contains</h5>
								</td>
								<td>
									<h5>60pcs</h5>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade show active" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">
				<div ng-app="app" ng-controller="ctrl">
					<div class="row">
						<ul>
							<li ng-repeat="(key , value) in messages">
								<div class="col-lg-12">
									<div class="comment_list">
										<div class="review_item">
											<div class="media">
												<div class="d-flex">
													<img src="/static/user/img/product/review-1.png" alt="">
												</div>
												<div class="media-body">
													<h4>{{value.author}}</h4>
													<h5>{{value.posted|date}}</h5>
													<a id="rp" ng-click="reply(key)" class="float-left"
														href="#">Reply</a>
												</div>
											</div>
											<p>{{value.text}}</p>
										</div>
										<ul>
											<li ng-repeat="(key , value) in value.replies">
												<div class="review_item reply">
													<div class="media">
														<div class="d-flex">
															<img src="/static/user/img/product/review-2.png" alt="">
														</div>
														<div class="media-body">
															<h4>Brake Ruiz</h4>
															<h5>{{value.replied|date}}</h5>
															<a class="float-left" href="#">Reply</a>
														</div>
													</div>
													<p>{{value.text}}</p>
												</div>
											</li>
										</ul>

									</div>
								</div>
							</li>
						</ul>
					</div>
					<input ng-model="message" class="form-control"
						placeholder="Comments" />
					<button class="primary-btn text-uppercase" ng-click="send()">Send</button>
				</div>
			</div>

		</div>
	</div>
</section>
<!--================End Product Description Area =================-->

<!--================ Start related Product area =================-->
<section class="related-product-area section-margin--small mt-0">
	<div class="container">
		<div class="section-intro pb-60px">
			<p>Popular Item in the market</p>
			<h2>
				The<span class="section-intro__style">Product</span> of the same
				type
			</h2>
		</div>
		<div class="row mt-30">
			<c:forEach var="p" items="${detail.category.products}">
				<div class="col-md-6 box col-lg-4">
					<div class="card text-center card-product">
						<div class="card-product__img">
							<a href="/user/singleproduct/${p.id}"> <img class="card-img"
								id="cartImg" src="/static/admin/product/${p.image}" alt="">
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
		</div>
	</div>

</section>
<!--================ end related Product area =================-->
<script>
	app = angular.module("app", []);
	app.controller("ctrl", function($scope) {
		$db = firebase.database();
		$scope.reply = function(key) {
			var text = prompt("Nhap reply");
			var path = 'comments/${detail.id}/' + key + '/replies/'
					+ Date.now();
			$db.ref(path).update({
				text : text,
				replied : Date.now(),
				authorrep : '${user.id}'
			});
		}
		var path = "comments/${detail.id}/" + Date.now();
		$scope.send = function() {

			$db.ref(path).update({
				text : $scope.message,
				posted : Date.now(),
				author : '${user.id}'
			}, function(error) {
				if (error) {
					alert("Error")
				}
			})

		}

		var path2 = 'comments/${detail.id}/';
		$db.ref(path2).on('value', function(response) {
			$scope.messages = response.val();
			$scope.$digest();
		})
	})
</script>
