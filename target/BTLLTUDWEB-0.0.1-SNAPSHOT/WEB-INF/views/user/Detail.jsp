<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/styleDetail.css"/>"
	rel="stylesheet" type="text/css" />
<style>
#snackbar {
	visibility: hidden;
	width: 350px;
	height: 120px;
	margin-left: -125px;
	text-align: center;
	border-radius: 5px;
	border: 1px solid black;
	padding: 16px;
	position: fixed;
	z-index: 1000;
	left: 50%;
	bottom: 300px;
	font-size: 20px;
	background: #339933;
}

#snackbar.show {
	visibility: visible;
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

.gallery-wrap .img-big-wrap img {
	height: 450px;
	width: auto;
	display: inline-block;
	cursor: zoom-in;
}

.gallery-wrap .img-small-wrap .item-gallery {
	width: 60px;
	height: 60px;
	border: 1px solid #ddd;
	margin: 7px 2px;
	display: inline-block;
	overflow: hidden;
}

.gallery-wrap .img-small-wrap {
	text-align: center;
}

.gallery-wrap .img-small-wrap img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
	border-radius: 4px;
	cursor: zoom-in;
}

.img-big-wrap img {
	width: 100% !important;
	height: auto !important;
}

* {
	margin: 0;
	padding: 0;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

a {
	color: #03658c;
	text-decoration: none;
}

ul {
	list-style-type: none;
}

body {
	font-family: 'Roboto', Arial, Helvetica, Sans-serif, Verdana;
	background: #dee1e3;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="home">Shoes</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExampleDefault"
				aria-controls="navbarsExampleDefault" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-end"
				id="navbarsExampleDefault">
				<ul class="navbar-nav m-auto">
					<c:if test="${user.username == 'admin' }">
						<li class="nav-item"><a class="nav-link" href="#">Manager
								Account</a></li>
					</c:if>

					<c:if test="${user != null }">
						<li class="nav-item"><a class="nav-link" href="#">Hello
								${user.username}</a></li>
						<li class="nav-item"><a class="nav-link"
							href="dangxuat/logout">Logout</a></li>
					</c:if>
					<c:if test="${user == null }">
						<li class="nav-item"><a class="nav-link" href="login">Login</a>
						</li>
					</c:if>
				</ul>

				<form action="search" method="get" class="form-inline my-2 my-lg-0">
					<div class="input-group input-group-sm">
						<input name="txt" type="text" class="form-control"
							aria-label="Small" aria-describedby="inputGroup-sizing-sm"
							placeholder="Search...">
						<div class="input-group-append">
							<button type="submit" class="btn btn-secondary btn-number">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
					<a class="btn btn-success btn-sm ml-3" href="showCart"> <i
						class="fa fa-shopping-cart"></i> Cart <span
						class="badge badge-light">3</span>
					</a>
				</form>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="card bg-light mb-3">
					<div class="card-header bg-primary text-white text-uppercase">
						<i class="fa fa-list"></i> Categories
					</div>
					<ul class="list-group category_block">
						<c:forEach items="${listC}" var="o">
							<li class="list-group-item text-white"><a href="#">${o.name}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="card bg-light mb-3">
					<div class="card-header bg-success text-white text-uppercase">Last
						product</div>
					<div class="card-body">
						<img class="img-fluid"
							src="<c:url value="/resources/img/${last.image}"/>" />
						<h5 class="card-title">${last.name}</h5>
						<p class="card-text">${last.description}</p>
						<p class="bloc_left_price">${last.price}$</p>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="container">
					<div class="card">
						<div class="row">
							<aside class="col-sm-5 border-right">
								<article class="gallery-wrap">
									<div class="img-big-wrap">
										<div>
											<a href="#"><img class="card-img-top"
												src="<c:url value='/resources/img/${p.image}'/>"
												alt="Card image cap"></a>
										</div>
									</div>
									<!-- slider-product.// -->
									<div class="img-small-wrap">
										<c:forEach var="s" items="${listimage }">
											<div class="item-gallery">
												<a href="#"><img class="card-img-top"
													src="<c:url value='/resources/images/${s.name}'/>"
													alt="Card image cap"></a>
											</div>
										</c:forEach>
									</div>
									<!-- slider-nav.// -->
								</article>
								<!-- gallery-wrap .end// -->
							</aside>
							<aside class="col-sm-7">
								<article class="card-body p-5">
									<h3 class="title mb-3">${p.name}</h3>

									<p class="price-detail-wrap">
										<span class="price h3 text-warning"> <span class="num">${p.price}$</span>
										</span>
										<!--<span>/per kg</span>-->
									</p>
									<!-- price-detail-wrap .// -->
									<dl class="item-property">
										<dt>Description</dt>
										<dd>
											<p>${p.description}</p>
										</dd>
									</dl>
									<hr>
									<form>
										<div class="row">
											<div class="col-sm-5">
												<dl class="param param-inline">
													<dt>Quantity:</dt>
													<dd>
														<input type="number" id="quantity" name="quantity" min="1"
															max="5" value="1">
													</dd>
												</dl>
												<!-- item-property .// -->
											</div>
										</div>
										<!-- row.// -->
										<div class="row">
											<div class="col-sm-8">
												<div class="alert alert-warning" id="alertSize" role="alert"
													style="text-align: center; display: none;">Choose
													Size !!</div>
												<dl class="param param-inline">
													<dt>Size:</dt>
													<dd>
														<input type="radio" id="size" name="size" value="XS">
														<label for="XS" style="margin-right: 10px">XS</label> <input
															type="radio" id="size" name="size" value="S"> <label
															for="S" style="margin-right: 10px">S</label> <input
															type="radio" id="size" name="size" value="M"> <label
															for="M" style="margin-right: 10px">M</label> <input
															type="radio" id="size" name="size" value="L"> <label
															for="L" style="margin-right: 10px">L</label> <input
															type="radio" id="size" name="size" value="XL"> <label
															for="XL">XL</label>
													</dd>
												</dl>
												<!-- item-property .// -->
											</div>
											<!-- col.// -->
										</div>
										<!-- row.// -->
										<div class="row">
											<div class="col-sm-6">
												<div class="alert alert-warning" id="alertColor"
													role="alert" style="text-align: center; display: none;">
													Choose Color !!</div>
												<dl class="param param-inline">
													<dt>Color:</dt>
													<dd>
														<input type="radio" id="color" name="color" value="Black">
														<label for="black" style="margin-right: 6px">Black</label>
														<input type="radio" id="color" name="color" value="White">
														<label for="white" style="margin-right: 6px">White</label>
													</dd>
												</dl>
												<!-- item-property .// -->
											</div>
											<!-- col.// -->
										</div>
										<!-- row.// -->
									</form>

									<hr>
									<a class="btn btn-lg btn-primary text-uppercase">Buy now</a> <a
										class="btn btn-lg btn-outline-primary text-uppercase"
										onclick="addItems()"> <i class="fas fa-shopping-cart"></i>
										Add to cart
									</a>
								</article>
								<!-- card-body.// -->
							</aside>
							<!-- col.// -->
						</div>
						<!-- row.// -->
					</div>
					<!-- card.// -->


				</div>
			</div>
		</div>
	</div>

	<div class="bg-success text-white" id="snackbar">
		<div>
			<i class="fa fa-check-circle"></i>
		</div>
		<strong>Đã thêm sản phẩm vào giỏ hàng</strong>
	</div>
	<script type="text/javascript">
    	var mau = -1, co = -1, dem = 0;
    	function addItems(){
    		if(${user != null}){
    			var quantity = document.getElementById("quantity").value;
                var size = document.getElementsByName("size");
                for (var i = 0; i < size.length; i++){
                    if (size[i].checked === true){
                        co = i;
                        break;
                    }
                }
                var color = document.getElementsByName("color");
                for (var i = 0; i < color.length; i++){
                    if (color[i].checked === true){
                        mau = i;
                        break;
                    }
                }
                if(co == -1){
                	document.getElementById("alertSize").style.display = "inline-block";
                }
                else{
                	document.getElementById("alertSize").style.display = "none";
                	if(mau == -1){
                		document.getElementById("alertColor").style.display = "inline-block";
                	}
                	else{
                		document.getElementById("alertColor").style.display = "none";
                		mau = mau +1;
                        co = co + 1;
                        $.ajax({
                			type: "POST",
                	        data:{
                	        	quantity: quantity,
                	        	co: co,
                	        	mau: mau,
                	        	pid: ${p.id}
                	        },
                	        url: "http://localhost:8080/BTLLTUDWEB/add",
                	         success: function(result) {
                	        	 var x = document.getElementById("snackbar");
                	    		  x.className = "show";
                	    		  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
                	    	},
                			error: function(xhr){
                				alert("Loi");
                			}
                		});
                	}
                }
                
    		}
    		else{
    			window.location="http://localhost:8080/BTLLTUDWEB/login/dangnhap";
    		}
    	}
    </script>
</html>
