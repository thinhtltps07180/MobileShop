<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand logo_h" href="index.html"><img
					src="/static/user/img/logo.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
						<li class="nav-item active"><a class="nav-link"
							href="index.html">Home</a></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Shop</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="category">Shop
										Category</a></li>
								<li class="nav-item"><a class="nav-link"
									href="singleproduct">Product Details</a></li>
								<li class="nav-item"><a class="nav-link" href="checkout">Product
										Checkout</a></li>
								<li class="nav-item"><a class="nav-link"
									href="confirmation">Confirmation</a></li>
								<li class="nav-item"><a class="nav-link" href="cart">Shopping
										Cart</a></li>
								<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
							</ul></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="blog">Blog</a></li>
								<li class="nav-item"><a class="nav-link" href="createNews">Create
										Blog</a></li>
								<li class="nav-item"><a class="nav-link" href="singleblog">Blog
										Details</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
						<li class="nav-item"><a class="nav-link" href="contact">About</a></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
								<li class="nav-item"><a class="nav-link" href="register">Register</a></li>
								<li class="nav-item"><a class="nav-link"
									href="trackingorder">Tracking</a></li>
							</ul></li>
					</ul>

					<ul class="nav-shop">
						<li class="nav-item"><button>
								<i class="ti-search"></i>
							</button></li>
						<li class="nav-item">
							<button>
								<a class="nav-link" href="cart"></a> <i class="ti-shopping-cart"></i>

								<span class="nav-shop__circle">3</span>
							</button>
						</li>
						<li class="nav-item"><a class="button button-header" href="#">Buy
								Now</a></li>
						<li><a href="#" onclick="signOut();">Sign out</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</header>