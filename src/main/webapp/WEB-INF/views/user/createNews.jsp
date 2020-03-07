<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/static/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

<!--================Login Box Area =================-->
<section class="login_box_area section-margin">
	<div class="container">
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
					<h3>Create News</h3>
					<h3>${message}</h3>
					<form:form enctype="multipart/form-data" action="/user/createNews"
						modelAttribute="news" class="row login_form" id="register_form">
						<div class="col-md-12 form-group">
							<input type="hidden" path="id" class="form-control" id="name"
								name="id" placeholder="Username" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Username'">
							<form:errors path="id" />
						</div>
						
						<div class="col-md-12 form-group">
							<input type="text" path="title" class="form-control" id="title"
								name="title" placeholder="title" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'title'">
							<form:errors path="title" />
						</div>
						
						<div class="col-md-12 form-group">
							<input type="text" path="description" class="form-control" id="description"
								name="description" placeholder="description" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Username'">
							<form:errors path="description" />
						</div>
						
						<div class="col-md-12 form-group">
							<input type="file" class="form-input" name="up_photo"
								onchange="openFile(this)" class="form-control"
								placeholder="thumbnail">
							<form:hidden path="thumbnail" />
							<div id="anh"></div>
						</div>
						
						<div class="col-md-12 form-group area">
								<form:textarea path="content" style=" height: 200px;"
									id="content" />
								<form:errors path="content" />
							</div>

						<div class="col-md-12 form-group">
							<button type="submit" value="submit"
								class="button button-register w-100">Upload</button>
						</div>
					</form:form>

			</div>
		</div>
	</div>
</section>
<!--================End Login Box Area =================-->
		<script type="text/javascript">
			var editor = '';
			$(document).ready(function() {
				editor = CKEDITOR.replace('content');
			});
		</script>