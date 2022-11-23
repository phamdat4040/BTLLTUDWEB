<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

</head>

<body>
		<div class="shopping-cart">
			<div class="px-4 px-lg-0">

				<div class="pb-5">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

								<!-- Shopping cart table -->
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th scope="col" class="border-0 bg-light">
													<div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
												</th>
												<th scope="col" class="border-0 bg-light">
													<div class="p-2 px-3 text-uppercase">Size/Màu sắc</div>
												</th>
												<th scope="col" class="border-0 bg-light">
													<div class="py-2 text-uppercase">Đơn Giá</div>
												</th>
												<th scope="col" class="border-0 bg-light">
													<div class="py-2 text-uppercase">Số Lượng</div>
												</th>
												<th scope="col" class="border-0 bg-light">
													<div class="py-2 text-uppercase">Action</div>
												</th>
											</tr>
										</thead>
										<tbody id="cartItem">

											<c:if test="${cart != null }">
												<c:forEach var="o" items="${cart }">
													<tr>
														<th scope="row">
															<div class="p-2">
																<img
																	src="<c:url value='/resources/img/${o.products.image}'/>"
																	alt="" width="70" class="img-fluid rounded shadow-sm">
																<div class="ml-3 d-inline-block align-middle">
																	<h5 class="mb-0">
																		<a href="#" class="text-dark d-inline-block">${o.getProducts().name}</a>
																	</h5>
																	<span class="text-muted font-weight-normal font-italic"></span>
																</div>
															</div>
														</th>
														
														<td class="align-middle">
															<h5 class="mb-0" style="text-align: center;">
																<a href="#" class="text-dark d-inline-block">${o.product_Size.sizeName}-${o.product_Color.colorName}</a>
															</h5>
														</td>
														<td class="align-middle"><input id="price"
															name="price" value='${o.getProducts().price}'
															readonly="readonly"></td>
														<td class="align-middle">

															<button class="btnSub"
																onclick='tru(${o.id })'>-</button>
															<input readonly
															style="border: none; text-align: center; width: 50px"
															type="text" value='${o.soluong }'
															id='${o.id}' name="soluong">
															<button class="btnAdd"
																onclick='cong(${o.id })'>+</button>
														</td>
														<td class="align-middle"><a
															class="text-dark">
																<button class="btn btn-danger"
																	onclick='delItem(${o.id})'>Delete</button>
														</a></td>
													</tr>
												</c:forEach>
											</c:if>


										</tbody>
									</table>
								</div>
								<!-- End -->
							</div>
						</div>

						<div class="row py-5 p-4 bg-white rounded shadow-sm">
							<div class="col-lg-6">
								<div
									class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Voucher</div>
								<div class="p-4">
									<div class="input-group mb-4 border rounded-pill p-2">
										<input type="text" placeholder="Nhập Voucher"
											aria-describedby="button-addon3"
											class="form-control border-0">
										<div class="input-group-append border-0">
											<button id="button-addon3" type="button"
												class="btn btn-dark px-4 rounded-pill">
												<i class="fa fa-gift mr-2"></i>Sử dụng
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div
									class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành
									tiền</div>
								<div class="p-4">
									<ul class="list-unstyled mb-4">
										<li class="d-flex justify-content-between py-3 border-bottom"><strong
											class="text-muted">Tổng tiền hàng</strong><input id="total"
											name="total" value="${total}" readonly
											style="border: none; text-align: center; width: 50px"
											type="text" /></li>
										<li class="d-flex justify-content-between py-3 border-bottom"><strong
											class="text-muted">Phí vận chuyển</strong><strong>Free
												ship</strong></li>
										<li class="d-flex justify-content-between py-3 border-bottom"><strong
											class="text-muted">VAT</strong><strong>10 $</strong></li>
										<li class="d-flex justify-content-between py-3 border-bottom"><strong
											class="text-muted">Tổng thanh toán</strong> <b><input
												id="total1" name="total1" value="${total1}" readonly
												style="border: none; text-align: center; width: 50px"
												type="text" /></b></li>
									</ul>
									<a href="buy" class="btn btn-dark rounded-pill py-2 btn-block">Mua
										hàng</a>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

	<script type="text/javascript" src="<c:url value="/resources/js/ShoppingCart.js"/>"></script>
</body>
</html>
