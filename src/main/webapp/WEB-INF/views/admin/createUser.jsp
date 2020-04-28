<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- partial -->
<style>
span[id*=errors] {
	color: red;
	font-style: italic;

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
			<h3 class="page-title">Create New User</h3>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Forms</a></li>
					<li class="breadcrumb-item active" aria-current="page">Form
						User</li>
				</ol>
			</nav>
		</div>
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">User form</h4>
						<p class="card-description">User form elements</p>
						<h3>${message }</h3>

						<form:form enctype="multipart/form-data"
							action="/admin/addNewUser" modelAttribute="formUser"
							class="forms-sample">
							<div class="form-group">
								<label for="exampleInputName1">User name</label>
								<form:input path="id" type="text" class="form-control"
									id="exampleInputName1" placeholder="Name" />
								<form:errors path="id" />
							</div>
							<div class="form-group">
								<label for="exampleInputName2">Name</label>
								<form:input path="name" type="text" class="form-control"
									id="exampleInputName6" placeholder="name" />
								<form:errors path="name" />
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">Password</label>
								<form:input path="password" type="password" class="form-control"
									id="password" placeholder="password" />
								<form:errors path="password" />
							</div>
							<div class="form-group">
								<label for="exampleInputName2">Email</label>
								<form:input path="email" type="text" class="form-control"
									id="exampleInputName2" placeholder="email" />
								<form:errors path="email" />
							</div>
							<div class="form-group">
								<label for="exampleInputName2">Eddress</label>
								<form:input path="address" type="text" class="form-control"
									id="exampleInputName3" placeholder="address" />
								<form:errors path="address" />
							</div>
							<div class="form-group">
								<label for="exampleInputName2">Phone Number</label>
								<form:input path="phoneNumber" type="text" class="form-control"
									id="exampleInputName4" placeholder="phoneNumber" />
								<form:errors path="phoneNumber" />
							</div>

							<div class="form-group">
								<form:select path="role.id">
									<form:option value="" label="--Please Select"></form:option>
									<!-- <option selected="selected" value="">--Please Select</option> -->
									<form:options items="${listRole}" itemValue="id"
										itemLabel="name" />
								</form:select>
								<form:errors path="role.id" />
							</div>
							<div class="form-group">
								<label>File upload</label> <input type="file" name="img[]"
									class="file-upload-default">
								<div class="input-group col-xs-12">
									<input type="file" class="form-input" name="up_photo"
										onchange="openFile(this)" class="form-control"
										placeholder="Image">
								</div>
								<form:hidden path="photo" />
								<div id="anh"></div>

							</div>
							<button type="submit"
								class="btn btn-gradient-primary mr-2 ">Submit</button>
							<a href="/admin/users"><button class="btn btn-light" type="button">Cancel</button></a>
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

		<script type="text/javascript">
			var editor = '';
			$(document).ready(function() {
				editor = CKEDITOR.replace('description');
			});
		</script>
		