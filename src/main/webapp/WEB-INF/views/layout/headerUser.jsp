<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand logo_h" href="/user/index"><img
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
							href="/user/index">Home</a></li>
						<li class="nav-item submenu dropdown"><a href="/user/index"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Shop</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link"
									href="/user/category">Shop Category</a></li>								
								
								<li class="nav-item"><a class="nav-link" href="/user/login">Login</a></li>
							</ul></li>
						<li class="nav-item submenu dropdown"><a href="/user/blog"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="/user/blog">Reviews</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/user/createNews">Create Reviews</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/user/singleblog">Reviews Details</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="/user/contact">Contact</a></li>
						<li class="nav-item"><a class="nav-link" href="/user/contact">About</a></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="/user/login">Login</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/user/register">Register</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/user/trackingorder">Tracking</a></li>
							</ul></li>
					</ul>

					<ul class="nav-shop">
						<li class="nav-item"><button>
								<i class="ti-search"></i>
							</button></li>
						<li class="nav-item">
							<button>
								<a class="nav-link" href="/user/cart"> <i
									class="ti-shopping-cart"></i> <span class="nav-shop__circle">3</span></a>
							</button>
						</li>
						<li class="nav-item"><a class="button button-header" href="#">Buy
								Now</a></li>
						<li><a href="/user/login"><%if(session.getAttribute("user") == null) { 
						out.print("Login"); 
						} 
						 %>
						</a>
						
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">${user.id}</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link"
									href="/user/checkout"></a></li>
								<li class="nav-item"><a class="nav-link"
									href="/user/confirmation">Confirmation</a></li>
								<li class="nav-item"><a class="nav-link" href="/user/cart">t</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/user/trackingorder"></a></li>
							</ul></li>
					
						</li>
						<li><a href="/home/logout">
						<%if(session.getAttribute("user") != null) { 
						out.print("Logout"); 
						} 
						 %>
						</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</header>