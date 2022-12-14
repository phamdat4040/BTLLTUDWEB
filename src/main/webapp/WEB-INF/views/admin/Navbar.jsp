<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-xl">
	<div class="container h-100">
		<a class="navbar-brand" href="adminhome">
			<h1 class="tm-site-title mb-0">Product Admin</h1>
		</a>
		<button class="navbar-toggler ml-auto mr-0" type="button"
			data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars tm-nav-icon"></i>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mx-auto h-100">
				<li class="nav-item"><a class="nav-link active"
					href="adminhome"> <i class="fas fa-tachometer-alt"></i> Order
						List <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="products"> <i
						class="fas fa-shopping-cart"></i> Products Management
				</a></li>

				<li class="nav-item"><a class="nav-link" href="adminaccounts">
						<i class="far fa-user"></i> Accounts Management
				</a></li>
				<li class="nav-item"><a class="nav-link" href="home"
					target="_blank"> <i class="material-icons">computer</i> Go to
						view Shop
				</a></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link d-block"
					href="dangxuat"> Admin, <b>Logout</b>
				</a></li>
			</ul>
		</div>
	</div>

</nav>