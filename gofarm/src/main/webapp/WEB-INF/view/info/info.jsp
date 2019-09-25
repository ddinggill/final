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

<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>
<style type="text/css">
.goods-info {
	margin-top: 100px;
}

.bar {
	float: left;
}

.product-category {
	margin-bottom: 50px;
}

.goods-view-infomation-tab-group{
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
	background-color: #FFFFFF;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight: bold;
	color: black;
}

.goods-view-infomation-tab-group .on{
	background-color: #5FB404;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight: bold;
	color: white;
}



#product_review{
	width: 100%;
}

#product_review2{
	width: 100%;
}

.title{
	width: 20%;
}
#star{
	width: 10%;
}

#detailInfo2, #detailInfo3{
	display: none;
}

</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
			$('#godetail').click(function(){
				$('#detailInfo').css('display' , 'block');
				$('#detailInfo2').css('display' , 'none');
				$('#detailInfo3').css('display' , 'none');
				$("#godetail").addClass("on");
				$("#godetail2").removeClass("on");
				$("#godetail3").removeClass("on");
			});
			
			$('#godetail2').click(function(){
				$('#detailInfo').css('display' , 'none');
				$('#detailInfo2').css('display' , 'block');
				$('#detailInfo3').css('display' , 'none');
				$("#godetail").removeClass("on");
				$("#godetail2").addClass("on");
				$("#godetail3").removeClass("on");
			});		
		
			$('#godetail3').click(function(){
				$('#detailInfo').css('display' , 'none');
				$('#detailInfo2').css('display' , 'none');
				$('#detailInfo3').css('display' , 'block');
				$("#godetail").removeClass("on");
				$("#godetail2").removeClass("on");
				$("#godetail3").addClass("on");
			});		
		
	
	});

</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body class="goto-here">
	<!-- nav -->
	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
	<!-- END nav -->

	<section class="goods-info">
		<div class="container" id="detailbtn">
			<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab1 on" id="godetail">
						<a class="goods-view-infomation-tab-anchor" >귀농절차</a>
					</li>
					<li class="goods-view-infomation-tab1" id="godetail2">
						<a class="goods-view-infomation-tab-anchor" >통계</a>
					</li>
					<li class="goods-view-infomation-tab1" id="godetail3">
						<a class="goods-view-infomation-tab-anchor" >실태조사결과</a>
					</li>
			</ul>
		</div>

		<div class="container"  id="detailInfo">
			<div id="product_info">
				<img alt="" src="info/images/step.jpg">
			</div>
		</div>

		
		<div class="container"  id="detailInfo2">
			<div id="product_review">
				<img alt="" src="info/images/image_2.png">
			</div>
				
		</div>
		

		<div class="container"  id="detailInfo3">
			<div id="product_review2">
				<img alt="" src="info/images/image_12.png">
				<img alt="" src="info/images/image_13.png">
				<img alt="" src="info/images/image_14.png">
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

<script src="product/p_js/main.js"></script>

<script src="main/plugin-frameworks/bootstrap.min.js"></script>
<script src="main/plugin-frameworks/swiper.js"></script>
<script src="main/common/scripts.js"></script>

</html>