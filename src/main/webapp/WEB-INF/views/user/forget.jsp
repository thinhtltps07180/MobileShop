<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Forgot</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Forgot
							password</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->


<!--================Tracking Box Area =================-->
<section class="tracking_box_area section-margin--small">
	<div class="container">
		<div class="tracking_box_inner">
			<p>If you forgot your password while still remembering your
				account and email, press the button and find your password again!</p>
			<form class="row tracking_form" action="/user/forget" method="post"
				novalidate="multipart/form-data">
				<div class="col-md-12 form-group">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="Your Username" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Username'">
				</div>
				<div class="col-md-12 form-group">
					<input type="email" class="form-control" id="email" name="email"
						placeholder="Your Email Address" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Email Address'">
				</div>
				<div class="col-md-12 form-group">
					<button type="submit" value="submit" class="button button-tracking">Forgot
						password</button>
				</div>
				<div class="col-md-12 form-group">
					<p>{message}</p>
				</div>

			</form>
		</div>
	</div>
</section>
<!--================End Tracking Box Area =================-->
