<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<style>
span.nav-shop__circle {
    height: 16px;
    margin: -10px;
    width: 44px;
}
</style>
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
									href="/user/category/0">Shop Category</a></li>
								<c:if test="${sessionScope.user != null}">
									<li class="nav-item"><a class="nav-link"
										href="/user/orderList">Order</a></li>
								</c:if>
							</ul></li>
						<li class="nav-item submenu dropdown"><a href="/user/blog"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="/user/blog">Reviews</a></li>
								<c:if test="${sessionScope.user != null}">
									<li class="nav-item"><a class="nav-link"
										href="/user/createNews">Create Reviews</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/user/myBlog">My Reviews</a></li>
								</c:if>

								<div class="product_count">
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
						<a href="/user/cart"><li class="nav-item"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle">${sessionScope['scopedTarget.cartService'].count} items</span></button> </li></a>
					
						<li class="nav-item"><a class="button button-header"
							href="/user/category/0">Buy Now</a></li>
						<li><a href="/user/login"> <%
 	if (session.getAttribute("user") == null) {
 		out.print("Login");
 	}
 %>
						</a>
						<li><a href="/user/logout"> <%
 	if (session.getAttribute("user") != null) {
 		out.print("Logout");
 	}
 %>
						</a></li>
						<li><a href="/user/edit"> <%
 	if (session.getAttribute("user") != null) {
 		out.print("My Profile");
 	}
 %>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</header>