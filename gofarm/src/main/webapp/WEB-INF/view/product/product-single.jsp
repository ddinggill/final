<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link href="plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="plugin-frameworks/swiper.css" rel="stylesheet">
<link href="fonts/ionicons.css" rel="stylesheet">
<link href="common/styles.css" rel="stylesheet">
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
					<a href="images/product-1.jpg" class="image-popup"><img
						src="images/product-1.jpg" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>

				<div class="goods-view-form-table-wrapper">
					<h3>상품이름</h3>
					<table class="goods-view-form-table">
						<tbody>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">판매가</th>
								<td class="goods-price">1,300원</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">판매단위</th>
								<td class="goods-view-form-table-cell">1봉</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">중량/용량</th>
								<td class="goods-view-form-table-cell">200g</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">배송비</th>
								<td class="goods-view-form-table-cell">2500원</td>
							</tr>

							<tr>
								<th scope="row" class="goods-view-form-table-heading">원산지</th>
								<td class="goods-view-form-table-cell">국산</td>
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
					<p>
						<a href="cart.html" class="btn btn-black py-3 px-5">구매하기</a>
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
				내용 
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
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/scrollax.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
</html>