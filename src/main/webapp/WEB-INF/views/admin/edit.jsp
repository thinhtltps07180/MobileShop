<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- partial -->
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

<div class="main-panel">
	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">Form elements</h3>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Forms</a></li>
					<li class="breadcrumb-item active" aria-current="page">Form
						elements</li>
				</ol>
			</nav>
		</div>
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Basic form elements</h4>
						<p class="card-description">Basic form elements</p>
						<h3>${message }</h3>

						<form:form enctype="multipart/form-data" action="/admin/update"
							modelAttribute="form" class="forms-sample">
							<div class="form-group">
								<label for="exampleInputName1"></label>
								<form:input path="id" type="hidden" class="form-control"
									id="exampleInputName1" placeholder="Name" />
								<form:errors path="name" />
							</div>
							<div class="form-group">
								<label for="exampleInputName1">Product name</label>
								<form:input path="name" type="text" class="form-control"
									id="exampleInputName1" placeholder="Name" />
								<form:errors path="name" />
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">UnitPrice</label>
								<form:input path="unitPrice" type="text" class="form-control"
									id="UnitPrice" placeholder="UnitPrice" />
								<form:errors path="unitPrice" />
							</div>
							<div class="form-group">
								<label for="exampleInputName2">Product name</label>
								<form:input path="quantity" type="text" class="form-control"
									id="exampleInputName2" placeholder="quantity" />
								<form:errors path="quantity" />
							</div>

							<div class="form-group">
								<form:select path="category.id">
									<form:option value="" label="--Please Select"></form:option>
									<!-- <option selected="selected" value="">--Please Select</option> -->
									<form:options items="${list}" itemValue="id" itemLabel="name" />
								</form:select>

								<form:errors path="category.id" />
							</div>

							<div class="form-group">
								<label>File upload</label> <input type="file" name="img[]"
									class="file-upload-default">
								<div class="input-group col-xs-12">
									<input type="file" class="form-input" name="up_photo"
										onchange="openFile(this)" class="form-control"
										placeholder="Image">
								</div>
								<form:hidden path="image" />
								<div id="anh"></div>

							</div>
							<button type="submit" class="btn btn-gradient-primary mr-2">Submit</button>
							<button class="btn btn-light">Cancel</button>
						</form:form>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
			<!-- partial:../../partials/_footer.html -->
			<footer class="footer">
				<div
					class="d-sm-flex justify-content-center justify-content-sm-between">
					<span
						class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright
						© 2017 <a href="https://www.bootstrapdash.com/" target="_blank">BootstrapDash</a>.
						All rights reserved.
					</span> <span
						class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted
						& made with <i class="mdi mdi-heart text-danger"></i>
					</span>
				</div>
			</footer>
			<!-- partial -->
		</div>
		<!-- main-panel ends -->