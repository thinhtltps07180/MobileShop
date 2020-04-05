
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.2.3/firebase.js"></script>
<!--================Blog Area =================-->
<style>
img.author_img.rounded-circle {
	height: 100px;
	width: 180px;
}

img#cmtPhoto {
	width: 60px;
	height: 60px;
}

img#cmtPhotoRep {
	width: 60px;
	height: 60px;
}

.comment-list.left-padding {
	border-style: inset;
	width: 663px;
}

.single-comment.justify-content-between.d-flex {
	margin-top: 10px;
}

a#rp {
	width: 68px;
}

.khung {
	margin: 10px;
}


img.author_img.rounded-circle {
    margin: 10px;
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
<section
	class="blog_area single-post-area py-80px section-margin--small">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 posts-list">
				<div class="single-post row">
					<div class="col-lg-12">
						<div class="feature-img">
							<img class="img-fluid"
								src="/static/user/news/${detail.thumbnail}" alt="">
						</div>
					</div>
					<div class="col-lg-3  col-md-3">
						<div class="blog_info text-right">
							<ul class="blog_meta list">
								<li><a href="#">Author: ${detail.user.id} <i
										class="lnr lnr-user"></i>
								</a></li>
								<li>
									<p></p> <a href="#"><fmt:formatDate type="date"
											value="${detail.createDate}" /> <i
										class="lnr lnr-calendar-full"></i> </a>
								</li>
							</ul>
							<ul class="social-links">
								<li><a href="#"> <i class="fab fa-facebook-f"></i>
								</a></li>
								<li><a href="#"> <i class="fab fa-twitter"></i>
								</a></li>
								<li><a href="#"> <i class="fab fa-github"></i>
								</a></li>
								<li><a href="#"> <i class="fab fa-behance"></i>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-9 col-md-9 blog_details">
						<h2>${detail.title }</h2>
						<p>${detail.description }
						<p>${detail.content }</p>
					</div>

				</div>
				<div class="comments-area" ng-app="app" ng-controller="ctrl">
					<div class="comment-list">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">

								<ul>
									<li ng-repeat="(key , value) in messages">
										<div class="khung">
											<div class="thumb">
												<img id="cmtPhoto" src="/static/user/photo/{{value.photo}}"
													alt="">
											</div>
											<div class="desc">
												<h5>
													<a href="#">{{value.author}}</a>
												</h5>
												<p class="date">{{value.posted|date}}</p>
												<p class="comment">{{value.text}}!</p>
											</div>
											<div class="reply-btn">
												<a id="rp" ng-click="reply(key)" href=""
													class="btn-reply text-uppercase">reply</a>
											</div>
										</div>

										<div class="comment-list left-padding">
											<div class="single-comment justify-content-between d-flex">
												<div class="user justify-content-between d-flex">
													<ul>
														<li ng-repeat="(key , value) in value.replies">
															<div class="thumb">
																<img id="cmtPhotoRep"
																	src="/static/user/photo/{{value.photoRep}}" alt="">
															</div>
															<div class="desc">
																<h5>
																	<a href="#">{{value.authorrep}}</a>
																</h5>
																<p class="date">{{value.replied|date}}</p>
																<p class="comment">{{value.text}}!</p>
															</div>
														</li>
													</ul>
												</div>

											</div>

										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<input ng-model="message" class="form-control"
						placeholder="Comments" />
					<button class="primary-btn text-uppercase" ng-click="send()">Send</button>
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
							src="/static/user/photo/${detail.user.photo}" alt="">
						<h4>${detail.user.name}</h4>
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

					</aside>


				</div>
			</div>
		</div>
	</div>
</section>
<!--================Blog Area =================-->
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
				authorrep : '${user.id}',
				photoRep : '${user.photo}'
			});
		}
		var path = "comments/${detail.id}/" + Date.now();
		$scope.send = function() {

			$db.ref(path).update({
				text : $scope.message,
				posted : Date.now(),
				author : '${user.id}',
				photo : '${user.photo}'
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