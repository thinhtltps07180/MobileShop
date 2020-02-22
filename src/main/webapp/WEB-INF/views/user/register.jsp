<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Register</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Register</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->

<!--================Login Box Area =================-->
<section class="login_box_area section-margin">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="login_box_img">
					<div class="hover">
						<h4>Already have an account?</h4>
						<p>There are advances being made in science and technology
							everyday, and a good example of this is the</p>
						<a class="button button-account" href="login.html">Login Now</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="login_form_inner register_form_inner">
					<h3>Create an account</h3>
					
					<form class="row login_form" action="#/" id="register_form">
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="Username" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Username'">
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="email" name="email"
								placeholder="Email Address" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Email Address'">
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="password"
								name="password" placeholder="Password"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Password'">
						</div>
						<div class="col-md-12 form-group">
							<div class="form-group">
								<label>File upload</label> <input type="file" name="img[]"
									class="file-upload-default">
							</div>
						</div>
						<div class="col-md-12 form-group">
							<input type="file" class="form-input" name="up_photo"
								onchange="openFile(this)" class="form-control"
								placeholder="Photo">
							<form:hidden path="photo" />
						</div>
						<div class="col-md-12 form-group">
							<button type="submit" value="submit"
								class="button button-register w-100">Register</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================End Login Box Area =================-->