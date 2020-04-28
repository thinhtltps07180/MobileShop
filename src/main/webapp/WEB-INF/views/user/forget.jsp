<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Forget Password</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Forget Password</li>
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
              <h1>Forget password?</h1>
              <form class="row tracking_form" action="/user/forget" method="post" novalidate="novalidate" enctype="multipart/form-data">
                  <div class="col-md-12 form-group">
                      <input type="text" class="form-control" id="id" name="id" placeholder="Your Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your ID'">
                  </div>
                  <div class="col-md-12 form-group">
                      <input type="email" class="form-control" id="email" name="email" placeholder="Your Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'your Email Address'">
                  </div>
                  <div class="col-md-12 form-group">
                      <button type="submit" value="submit" class="button button-tracking">Forget</button>
                      <a href="/user/login"><button class="button button-tracking" type="button">Cancel</button></a>
                  </div>
              </form>
          </div>
      </div>
  </section>
  <!--================End Tracking Box Area =================-->