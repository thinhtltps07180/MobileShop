<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.2.3/firebase.js"></script>
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
					<h2>${detail.unitPrice}</h2>
					<ul class="list">
						<li><a class="active" href="#"><span>Category</span> :
								${detail.category.name}</a></li>
						<li><a href="#"><span>Availibility</span> : In Stock</a></li>
					</ul>
					<p>${detail.description}</p>
					<div class="product_count">
						<label for="qty">Quantity:</label>
						<button
							onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
							class="increase items-count" type="button"></button>
						<input type="number" name="qty" id="sst" size="2" maxlength="12"
							value="1" title="Quantity:" class="input-text qty">
						<button class="reduced items-count" type="button"></button>
						<a class="button primary-btn" href="#">Add to Cart</a>
					</div>
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
				<p>Beryl Cook is one of Britainâs most talented and amusing
					artists .Berylâs pictures feature women of all shapes and sizes
					enjoying themselves .Born between the two world wars, Beryl Cook
					eventually left Kendrick School in Reading at the age of 15, where
					she went to secretarial school and then into an insurance office.
					After moving to London and then Hampton, she eventually married her
					next door neighbour from Reading, John Cook. He was an officer in
					the Merchant Navy and after he left the sea in 1956, they bought a
					pub for a year before John took a job in Southern Rhodesia with a
					motor company. Beryl bought their young son a box of watercolours,
					and when showing him how to use it, she decided that she herself
					quite enjoyed painting. John subsequently bought her a childâs
					painting set for her birthday and it was with this that she
					produced her first significant work, a half-length portrait of a
					dark-skinned lady with a vacant expression and large drooping
					breasts. It was aptly named âHangoverâ by Berylâs husband and</p>
				<p>It is often frustrating to attempt to plan meals that are
					designed for one. Despite this fact, we are seeing more and more
					recipe books and Internet websites that are dedicated to the act of
					cooking for one. Divorce and the death of spouses or grown children
					leaving for college are all reasons that someone accustomed to
					cooking for more than one would suddenly need to learn how to
					adjust all the cooking practices utilized before into a streamlined
					plan of cooking that is more efficient for one person creating less</p>
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
													<a id="rp" ng-click="reply(key)" class="float-left" href="#">Reply</a>
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
					<div class="single-search-product d-flex">
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
