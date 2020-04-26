
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- ================ start banner area ================= -->


<!-- ================ end banner area ================= -->

<!--================Login Box Area =================-->
<section class="login_box_area section-margin">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="login_box_img">
					<div class="hover">
						<h4>If you do not already have an account?</h4>
						<p>You can click on the button below to</p>
						<p>create an account for yourself</p>
						<a class="button button-account" href="/user/register">Create
							an Account</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="login_form_inner">
					<div class="alert alert-danger" role="alert">${alert}</div>
					<h3>Log in to enter</h3>
					<form method="post" class="row login_form" action="/user/login"
						id="contactForm">
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="id" name="id"
								placeholder="Username" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Username'">
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="password"
								name="password" placeholder="Password"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Password'">
						</div>
						<div class="col-md-12 form-group">
							<div class="creat_account">
								<input type="checkbox" id="f-option2" name="selector"> <label
									for="f-option2">Keep me logged in</label>
							</div>
						</div>
						<div class="col-md-12 form-group">
							<button type="submit" value="submit"
								class="button button-login w-100">Log In</button>
							<a href="/user/forget">Forgot Password?</a>
						</div>
					</form>



				</div>
			</div>
		</div>
	</div>
</section>
<!--================End Login Box Area =================-->