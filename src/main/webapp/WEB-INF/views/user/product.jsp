<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Product</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="<c:url value='/resources/images/icons/favicon.png'/>" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/fonts/iconic/css/material-design-iconic-font.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/fonts/linearicons-v1.0.0/icon-font.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/animate/animate.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/css-hamburgers/hamburgers.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/animsition/css/animsition.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/select2/select2.min.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/daterangepicker/daterangepicker.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/slick/slick.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/MagnificPopup/magnific-popup.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/vendor/perfect-scrollbar/perfect-scrollbar.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/util.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/main.css'/>">
<!--===============================================================================================-->
</head>
<body class="animsition">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<!-- Cart -->
	<%@ include file="/WEB-INF/views/user/cart.jsp"%>



	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button
						class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" id="all"
						onclick="change()">All Products</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						id="women" onclick="loadProductByGender(this.id)">Women</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						id="men" onclick="loadProductByGender(this.id)">Men</button>
				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div
						class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i
							class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i
							class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Filter
					</div>

					<div
						class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i
							class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>

				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>

						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text"
							name="search-product" placeholder="Search">
					</div>
				</div>

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div
						class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">Sort By</div>

							<ul>
								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> Default </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> Popularity </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> Average rating </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04 filter-link-active">
										Newness </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> Price: Low to High
								</a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> Price: High to Low
								</a></li>
							</ul>
						</div>

						<div class="filter-col2 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">Price</div>

							<ul>
								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04 filter-link-active">
										All </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> $0.00 - $50.00 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> $50.00 - $100.00 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> $100.00 - $150.00 </a>
								</li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> $150.00 - $200.00 </a>
								</li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04"> $200.00+ </a></li>
							</ul>
						</div>

						<div class="filter-col3 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">Color</div>

							<ul>
								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #222;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link stext-106 trans-04"> Black </a>
								</li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #4272d7;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#"
									class="filter-link stext-106 trans-04 filter-link-active">
										Blue </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #b3b3b3;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link stext-106 trans-04"> Grey </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #00ad5f;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link stext-106 trans-04"> Green </a>
								</li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #fa4251;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link stext-106 trans-04"> Red </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #aaa;"> <i class="zmdi zmdi-circle-o"></i>
								</span> <a href="#" class="filter-link stext-106 trans-04"> White </a>
								</li>
							</ul>
						</div>

						<div class="filter-col4 p-b-27">
							<div class="mtext-102 cl2 p-b-15">Tags</div>

							<div class="flex-w p-t-4 m-r--5">
								<a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts </a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-12">
				<div class="row" id="data">
					<c:forEach var="s" items="${listP }">
						<div
							class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${s.gender }">
							<!-- Block2 -->
							<div class="block2">
								<div class="block2-pic hov-img0">
									<a href="detail?pid=${s.id }"><img src="<c:url value='/resources/images/${s.image }'/>"
										alt="IMG-PRODUCT"></a>
								</div>

								<div class="block2-txt flex-w flex-t p-t-14">
									<div class="block2-txt-child1 flex-col-l ">
										<a href="detail" id="${s.id }"
											class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
											${s.name } </a> <span class="stext-105 cl3"> $${s.price }
										</span>
									</div>

									<div class="block2-txt-child2 flex-r p-t-3">
										<a href="#"
											class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
											<img class="icon-heart1 dis-block trans-04"
											src="<c:url value="/resources/images/icons/icon-heart-01.png"/>"
											alt="ICON"> <img
											class="icon-heart2 dis-block trans-04 ab-t-l"
											src="<c:url value="/resources/images/icons/icon-heart-02.png"/>"
											alt="ICON">
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="flex-c-m flex-w w-full p-t-45">
				<a onclick="loadMore(this.id)" type="button" id="loadmore"
					class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					<button>Load More </button></a>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="/WEB-INF/views/user/footer.jsp"%>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
	<%@include file="/WEB-INF/views/user/modal1.jsp"%>

	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/animsition/js/animsition.min.js'/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='/resources/vendor/bootstrap/js/popper.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='/resources/vendor/select2/select2.min.js'/>"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/daterangepicker/moment.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/daterangepicker/daterangepicker.js'/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='/resources/vendor/slick/slick.min.js'/>"></script>
	<script src="<c:url value='/resources/js/slick-custom.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/parallax100/parallax100.js'/>"></script>
	<script>
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js'/>"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
				delegate : 'a', // the selector for gallery item
				type : 'image',
				gallery : {
					enabled : true
				},
				mainClass : 'mfp-fade'
			});
		});
	</script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/isotope/isotope.pkgd.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/sweetalert/sweetalert.min.js'/>"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(
				function() {
					var nameProduct = $(this).parent().parent().find(
							'.js-name-b2').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-b2');
						$(this).off('click');
					});
				});

		$('.js-addwish-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent().find(
							'.js-name-detail').html();

					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-detail');
						$(this).off('click');
					});
				});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent()
							.parent().find('.js-name-detail').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to cart !", "success");
					});
				});
	</script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="<c:url value='/resources/js/main.js'/>"></script>
	<script type="text/javascript">
	var soluong = 0;
	function loadMore(){
		soluong = soluong + 4;
		if(sex == "" ){
			$.ajax({
		        type: "POST",
		        data:{
		        	soluong: soluong,
		        },
		        url: "http://localhost:8080/BTLLTUDWEB/loadFourProducts",
	 	        success: function(res) {
	 	        	var data = document.getElementById("data");
	 	        	if(res != ""){
	 	        		res = res.substr(0, res.length - 1);
	 		            var str = res.split("+");
	        			for(let stringg of str){
	 		            	var pro = stringg.split(",");
	 		            	data.innerHTML +="<div class=\"col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item "+pro[5]+"\">\r\n"
	 		       			+ "						<!-- Block2 -->\r\n"
	 		   			+ "						<div class=\"block2\">\r\n"
	 		   			+ "							<div class=\"block2-pic hov-img0\">\r\n"
	 		   			+ "								<a href=\"detail?pid="+pro[0]+"\"><img src=\"<c:url value='/resources/images/"+pro[1]+"'/>\"\r\n"
	 		   			+ "									alt=\"IMG-PRODUCT\"></a>\r\n"
	 		   			+ "							</div>\r\n"
	 		   			+ "\r\n"
	 		   			+ "							<div class=\"block2-txt flex-w flex-t p-t-14\">\r\n"
	 		   			+ "								<div class=\"block2-txt-child1 flex-col-l \">\r\n"
	 		   			+ "									<a href=\"detail\"\r\n"
	 		   			+ "										class=\"stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6\">\r\n"
	 		   			+ "										"+pro[2]+" </a> <span class=\"stext-105 cl3\"> $"+pro[4]+" </span>\r\n"
	 		   			+ "								</div>\r\n"
	 		   			+ "\r\n"
	 		   			+ "								<div class=\"block2-txt-child2 flex-r p-t-3\">\r\n"
	 		   			+ "									<a href=\"#\"\r\n"
	 		   			+ "										class=\"btn-addwish-b2 dis-block pos-relative js-addwish-b2\">\r\n"
	 		   			+ "										<img class=\"icon-heart1 dis-block trans-04\"\r\n"
	 		   			+ "										src=\"<c:url value='/resources/images/icons/icon-heart-01.png'/>\"\r\n"
	 		   			+ "										alt=\"ICON\"> <img\r\n"
	 		   			+ "										class=\"icon-heart2 dis-block trans-04 ab-t-l\"\r\n"
	 		   			+ "										src=\"<c:url value='/resources/images/icons/icon-heart-02.png'/>\"\r\n"
	 		   			+ "										alt=\"ICON\">\r\n"
	 		   			+ "									</a>\r\n"
	 		   			+ "								</div>\r\n"
	 		   			+ "							</div>\r\n"
	 		   			+ "						</div>\r\n"
	 		   			+ "					</div>";
	 		            }
	 	        	}
	 	        	else{
	 	        		document.getElementById("loadmore").style.display = 'none';
	 	        		data.innerHTML += "<p style=\"margin-left: 500px; color: red; font-size: 20px\">Không còn sản phẩm nào !!</p>";
	 	        	}
		    	},
				error: function(xhr){
					alert("Loi");
				}
			});
		}
		else{
			$.ajax({
		        type: "POST",
		        data:{
		        	num: soluong,
		        	status: sex
		        },
		        url: "http://localhost:8080/BTLLTUDWEB/loadProducts",
	 	        success: function(res) {
	 	        	var data = document.getElementById("data");
	 	        	if(res != ""){
	 	        		res = res.substr(0, res.length - 1);
	 		            var str = res.split("+");
	        			for(let stringg of str){
	 		            	var pro = stringg.split(",");
	 		            	data.innerHTML +="<div class=\"col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item "+pro[5]+"\">\r\n"
	 		       			+ "						<!-- Block2 -->\r\n"
	 		   			+ "						<div class=\"block2\">\r\n"
	 		   			+ "							<div class=\"block2-pic hov-img0\">\r\n"
	 		   		+ "								<a href=\"detail?pid="+pro[0]+"\"><img src=\"<c:url value='/resources/images/"+pro[1]+"'/>\"\r\n"
 		   			+ "									alt=\"IMG-PRODUCT\"></a>\r\n"
	 		   			+ "							</div>\r\n"
	 		   			+ "\r\n"
	 		   			+ "							<div class=\"block2-txt flex-w flex-t p-t-14\">\r\n"
	 		   			+ "								<div class=\"block2-txt-child1 flex-col-l \">\r\n"
	 		   			+ "									<a href=\"detail\"\r\n"
	 		   			+ "										class=\"stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6\">\r\n"
	 		   			+ "										"+pro[2]+" </a> <span class=\"stext-105 cl3\"> $"+pro[4]+" </span>\r\n"
	 		   			+ "								</div>\r\n"
	 		   			+ "\r\n"
	 		   			+ "								<div class=\"block2-txt-child2 flex-r p-t-3\">\r\n"
	 		   			+ "									<a href=\"#\"\r\n"
	 		   			+ "										class=\"btn-addwish-b2 dis-block pos-relative js-addwish-b2\">\r\n"
	 		   			+ "										<img class=\"icon-heart1 dis-block trans-04\"\r\n"
	 		   			+ "										src=\"<c:url value='/resources/images/icons/icon-heart-01.png'/>\"\r\n"
	 		   			+ "										alt=\"ICON\"> <img\r\n"
	 		   			+ "										class=\"icon-heart2 dis-block trans-04 ab-t-l\"\r\n"
	 		   			+ "										src=\"<c:url value='/resources/images/icons/icon-heart-02.png'/>\"\r\n"
	 		   			+ "										alt=\"ICON\">\r\n"
	 		   			+ "									</a>\r\n"
	 		   			+ "								</div>\r\n"
	 		   			+ "							</div>\r\n"
	 		   			+ "						</div>\r\n"
	 		   			+ "					</div>";
	 		            }
	 	        	}
	 	        	else{
	 	        		document.getElementById("loadmore").style.display = 'none';
	 	        		data.innerHTML += "<p style=\"margin-left: 500px; color: red; font-size: 20px\">Không còn sản phẩm nào !!</p>";
	 	        	}
		    	},
				error: function(xhr){
					alert("Loi");
				}
			});
		}
	}
	
	var s = "loadmore";
	var sex = "";
	function loadProductByGender(y){
		soluong = 0;
		sex = y;
		let id = document.getElementById(s);
		if(y == "men"){
			s = "loadMore_Men";
		}
		else{
			if(y == "women"){
				s = "loadMore_Women";
			}
		}
		id.id = s;
		$.ajax({
	        type: "POST",
	        data:{
	        	num: soluong,
	        	status: y
	        },
	        url: "http://localhost:8080/BTLLTUDWEB/loadProducts",
 	        success: function(res) {
 	        	var data = document.getElementById("data");
 	        	if(res != ""){
 	        		var tam = "";
 	        		res = res.substr(0, res.length - 1);
 		            var str = res.split("+");
        			for(let stringg of str){
 		            	var pro = stringg.split(",");
 		            	tam += "<div class=\"col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item "+pro[5]+"\">\r\n"
 		       			+ "						<!-- Block2 -->\r\n"
 		   			+ "						<div class=\"block2\">\r\n"
 		   			+ "							<div class=\"block2-pic hov-img0\">\r\n"
 		   		+ "								<a href=\"detail?pid="+pro[0]+"\"><img src=\"<c:url value='/resources/images/"+pro[1]+"'/>\"\r\n"
		   			+ "									alt=\"IMG-PRODUCT\"></a>\r\n"
 		   			+ "							</div>\r\n"
 		   			+ "\r\n"
 		   			+ "							<div class=\"block2-txt flex-w flex-t p-t-14\">\r\n"
 		   			+ "								<div class=\"block2-txt-child1 flex-col-l \">\r\n"
 		   			+ "									<a href=\"detail\"\r\n"
 		   			+ "										class=\"stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6\">\r\n"
 		   			+ "										"+pro[2]+" </a> <span class=\"stext-105 cl3\"> $"+pro[4]+" </span>\r\n"
 		   			+ "								</div>\r\n"
 		   			+ "\r\n"
 		   			+ "								<div class=\"block2-txt-child2 flex-r p-t-3\">\r\n"
 		   			+ "									<a href=\"#\"\r\n"
 		   			+ "										class=\"btn-addwish-b2 dis-block pos-relative js-addwish-b2\">\r\n"
 		   			+ "										<img class=\"icon-heart1 dis-block trans-04\"\r\n"
 		   			+ "										src=\"<c:url value='/resources/images/icons/icon-heart-01.png'/>\"\r\n"
 		   			+ "										alt=\"ICON\"> <img\r\n"
 		   			+ "										class=\"icon-heart2 dis-block trans-04 ab-t-l\"\r\n"
 		   			+ "										src=\"<c:url value='/resources/images/icons/icon-heart-02.png'/>\"\r\n"
 		   			+ "										alt=\"ICON\">\r\n"
 		   			+ "									</a>\r\n"
 		   			+ "								</div>\r\n"
 		   			+ "							</div>\r\n"
 		   			+ "						</div>\r\n"
 		   			+ "					</div>";
 		            }
        			data.innerHTML = tam;
 	        	}
 	        	else{
 	        		document.getElementById(s).style.display = 'none';
 	        		data.innerHTML += "<p style=\"margin-left: 500px; color: red; font-size: 20px\">Không còn sản phẩm nào !!</p>";
 	        	}
	    	},
			error: function(xhr){
				alert("Loi");
			}
		});
	}
	
	function change(){
		sex = "";
		soluong = 0;
		$.ajax({
	        type: "POST",
	        data:{
	        	soluong: soluong,
	        },
	        url: "http://localhost:8080/BTLLTUDWEB/loadFourProducts",
 	        success: function(res) {
 	        	var data = document.getElementById("data");
 	        	if(res != ""){
 	        		var tam = "";
 	        		res = res.substr(0, res.length - 1);
 		            var str = res.split("+");
        			for(let stringg of str){
 		            	var pro = stringg.split(",");
 		            	tam +="<div class=\"col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item "+pro[5]+"\">\r\n"
 		       			+ "						<!-- Block2 -->\r\n"
 		   			+ "						<div class=\"block2\">\r\n"
 		   			+ "							<div class=\"block2-pic hov-img0\">\r\n"
 		   		+ "								<a href=\"detail?pid="+pro[0]+"\"><img src=\"<c:url value='/resources/images/"+pro[1]+"'/>\"\r\n"
		   			+ "									alt=\"IMG-PRODUCT\"></a>\r\n"
 		   			+ "							</div>\r\n"
 		   			+ "\r\n"
 		   			+ "							<div class=\"block2-txt flex-w flex-t p-t-14\">\r\n"
 		   			+ "								<div class=\"block2-txt-child1 flex-col-l \">\r\n"
 		   			+ "									<a href=\"detail\"\r\n"
 		   			+ "										class=\"stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6\">\r\n"
 		   			+ "										"+pro[2]+" </a> <span class=\"stext-105 cl3\"> $"+pro[4]+" </span>\r\n"
 		   			+ "								</div>\r\n"
 		   			+ "\r\n"
 		   			+ "								<div class=\"block2-txt-child2 flex-r p-t-3\">\r\n"
 		   			+ "									<a href=\"#\"\r\n"
 		   			+ "										class=\"btn-addwish-b2 dis-block pos-relative js-addwish-b2\">\r\n"
 		   			+ "										<img class=\"icon-heart1 dis-block trans-04\"\r\n"
 		   			+ "										src=\"<c:url value='/resources/images/icons/icon-heart-01.png'/>\"\r\n"
 		   			+ "										alt=\"ICON\"> <img\r\n"
 		   			+ "										class=\"icon-heart2 dis-block trans-04 ab-t-l\"\r\n"
 		   			+ "										src=\"<c:url value='/resources/images/icons/icon-heart-02.png'/>\"\r\n"
 		   			+ "										alt=\"ICON\">\r\n"
 		   			+ "									</a>\r\n"
 		   			+ "								</div>\r\n"
 		   			+ "							</div>\r\n"
 		   			+ "						</div>\r\n"
 		   			+ "					</div>";
 		            }
        			data.innerHTML = tam;
 	        	}
 	        	else{
 	        		document.getElementById("loadmore").style.display = 'none';
 	        		data.innerHTML += "<p style=\"margin-left: 500px; color: red; font-size: 20px\">Không còn sản phẩm nào !!</p>";
 	        	}
	    	},
			error: function(xhr){
				alert("Loi");
			}
		});
	}
	
	
	</script>
</body>
</html>