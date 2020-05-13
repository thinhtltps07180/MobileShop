<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
span[id*=errors] {
	color: red;
	font-style: italic;
	background-image: url("/static/images/anifire.gif");
	background-repeat: no-repeat;
	padding-left: 25px;
}
</style>
<script>
	var openFile = function(field) {
		var reader = new FileReader();
		reader.onload = function() {
			console.log(reader.result);
			var img = new Image(150, 150);
			img.onload = function() {
				document.getElementById("anh").appendChild(img);
			}
			img.src = reader.result;
		};
		reader.readAsDataURL(field.files[0]);
	};
</script>

<!-- ================ start banner area ================= -->
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
					<h3>Update an account</h3>
					<h3>${message }</h3>
						<form:form enctype="multipart/form-data" action="/user/updateUser"
							modelAttribute="userEdit" class="forms-sample">
						<div class="col-md-12 form-group">
							<form:input type="text" path="id" class="form-control" id="name"
								name="id" placeholder="Username" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Username'" />
							<form:errors path="id" />
						</div>
						<div class="col-md-12 form-group">
							<form:input path="password" type="password" class="form-control"
								id="password" name="password" placeholder="Password"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Password'" />
							<form:errors path="password" />
						</div>
						<div class="col-md-12 form-group">
							<form:input path="name" type="text" class="form-control" id="name"
								name="name" placeholder="Your Name"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Your Name'" />
							<form:errors path="name" />
						</div>
						<div class="col-md-12 form-group">
							<form:input path="email" type="email" class="form-control" id="email"
								name="email" placeholder="Email" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Email'" />
							<form:errors path="email" />
						</div>
						<div class="col-md-12 form-group">
							<form:input path="phoneNumber" type="number" class="form-control"
								id="phoneNumber" name="phoneNumber"
								placeholder="Your PhoneNumber" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Your PhoneNumber'" />
							<form:errors path="phoneNumber" />
						</div>
						<div class="col-md-12 form-group">
							<form:input path="address" type="text" class="form-control"
								id="address" name="address" placeholder="Eddress"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Address'"/>
							<form:errors path="address" />
						</div>

						<div class="col-md-12 form-group">
							<input type="file" class="form-input" name="up_photo"
								onchange="openFile(this)" class="form-control"
								placeholder="Photo">
							<form:hidden path="photo" />
							<div id="anh"></div>
						</div>

						<div class="col-md-12 form-group">
							<button type="submit" value="submit"
								class="button button-register w-100">Update</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================End Login Box Area =================-->