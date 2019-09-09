<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>판매</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">


<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,700"
	rel="stylesheet">

<!-- Stylesheets -->

<link href="product/p_plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="product/p_plugin-frameworks/swiper.css" rel="stylesheet">
<link href="product/p_fonts/ionicons\css\ionicons.css" rel="stylesheet">
<link href="product/common/styles.css" rel="stylesheet">
<style type="text/css">
.ftco-section {
	margin-top: 100px;
}

.bar {
	float: left;
}

.product-category {
	margin-bottom: 50px;
}

.goods-view-infomation-tab-group, .goods-view-infomation-tab-group2{
	border-bottom: 1px solid #D8D8D8;
}

.goods-view-infomation-tab-group li {
	display: inline-block;
	/* background-color: yellow; */
	/* padding: 15px 40px 15px 40px; */
	text-align: center;
	width: 150px;
	padding: 15px 0px 15px 0px;
	font-family: 'Nanum Gothic Coding', monospace;
	border-top: 1px solid #D8D8D8;
	border-left: 1px solid #D8D8D8;
	border-right: 1px solid #D8D8D8;
}

.goods-view-infomation-tab-group .goods-view-infomation-tab1{
	background-color: #5FB404;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight: bold;
	color: white;
}

.goods-view-infomation-tab-group2 .goods-view-infomation-tab2{
	background-color: #5FB404;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight: bold;
	color: white;
}

.goods-view-infomation-tab-group2 li {
	display: inline-block;
	/* background-color: yellow; */
	/* padding: 15px 40px 15px 40px; */
	text-align: center;
	width: 150px;
	padding: 15px 0px 15px 0px;
	font-family: 'Nanum Gothic Coding', monospace;
	border-top: 1px solid #D8D8D8;
	border-left: 1px solid #D8D8D8;
	border-right: 1px solid #D8D8D8;
}

.goods-view-form-table {
	margin-top: 20px;
	margin-bottom: 20px;
	height: 300px;
	width: 500px;
}

.goods-view-form-table tr {
	border-bottom: 1px solid #E6E6E6;
}

.goods-view-form-table td {
	text-align: center;
}

.goods-price {
	font-weight: bold;
}

#quantity {
	width: 50px;
}

.goods-view-form-table-heading {
	width: 30%;
}

</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body class="goto-here">
	<!-- nav -->
	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
	<!-- END nav -->

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="${pd_dto.pd_file}" class="image-popup"><img
						src="${pd_dto.pd_file}" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>

				<div class="goods-view-form-table-wrapper">
					<h3>${pd_dto.pd_name}</h3>
					<table class="goods-view-form-table">
						<tbody>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">판매가</th>
								<td class="goods-price">${pd_dto.pd_price}</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">남은 수량</th>
								<td class="goods-view-form-table-cell">${pd_dto.pd_cnt} 개</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">원산지</th>
								<td class="goods-view-form-table-cell">${pd_dto.origin}</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">배송비</th>
								<td class="goods-view-form-table-cell">2500원</td>
							</tr>

							<tr>
								<th scope="row" class="goods-view-form-table-heading">판매자</th>
								<td class="goods-view-form-table-cell">${pd_dto.producer}</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">수량</th>
								<td class="goods-view-form-table-cell"><div
										class="input-group col-md-6 d-flex mb-3">
										<span class="input-group-btn mr-2">
											<button type="button" class="quantity-left-minus btn"
												data-type="minus" data-field="">
												<i class="ion-ios-remove"></i>
											</button>
										</span> <input type="text" id="quantity" name="quantity"
											class="form-control input-number" value="1" min="1" max="100">
										<span class="input-group-btn ml-2">
											<button type="button" class="quantity-right-plus btn"
												data-type="plus" data-field="">
												<i class="ion-ios-add"></i>
											</button>
										</span>
									</div></td>
							</tr>

						</tbody>
					</table>
					<c:url var="path" value="productPay.do">
						<c:param name="prod_code" value="${pd_dto.prod_code}" />
					</c:url>
					<p>
					<input type="hidden" value="${pd_dto.prod_code}" >
					<a href="${path}" class="btn btn-black py-3 px-5">구매하기</a>
					</p>

				</div>
			</div>
		</div>
	</section>

	<section class="goods-info">
		<div class="container">
			<ul class="goods-view-infomation-tab-group">
				<a href="#product_info"
					class="goods-view-infomation-tab-anchor __active">
					<li class="goods-view-infomation-tab1">상세정보</li>
				</a>
				<a href="#product_review" class="goods-view-infomation-tab-anchor">
					<li class="goods-view-infomation-tab2">고객후기 <span>(0)</span></li>
				</a>
			</ul>

		</div>

		<div class="container">
			<div id="product_info">
				<p>${pd_dto.pd_detail}</p>
			</div>
		</div>
		
		<div class="container">
			<ul class="goods-view-infomation-tab-group2">
				<a href="#product_info" class="goods-view-infomation-tab-anchor __active">
					<li class="goods-view-infomation-tab1">상세정보</li>
				</a>
				<a href="#product_review" class="goods-view-infomation-tab-anchor">
					<li class="goods-view-infomation-tab2">고객후기 <span>(0)</span></li>
				</a>
			</ul>

		</div>

		<div class="container">
			<div id="product_review">
				내용
			</div>
		</div>

	</section>
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
<script src="product/p_js/jquery.min.js"></script>
<script src="product/p_js/jquery-migrate-3.0.1.min.js"></script>
<script src="product/p_js/popper.min.js"></script>
<script src="product/p_js/bootstrap.min.js"></script>
<script src="product/p_js/jquery.easing.1.3.js"></script>
<script src="product/p_js/jquery.waypoints.min.js"></script>
<script src="product/p_js/jquery.stellar.min.js"></script>
<script src="product/p_js/owl.carousel.min.js"></script>
<script src="product/p_js/jquery.magnific-popup.min.js"></script>
<script src="product/p_js/aos.js"></script>
<script src="product/p_js/jquery.animateNumber.min.js"></script>
<script src="product/p_js/bootstrap-datepicker.js"></script>
<script src="product/p_js/scrollax.min.js"></script>
<!-- <script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!-- <script src="product/js/google-map.js"></script> -->
<script src="product/p_js/main.js"></script>
</html>