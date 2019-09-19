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

#product_review{
	width: 100%;
}

table.type08 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    margin: 20px 10px;
    width: 100%;
}

table.type08 thead th {
    padding: 10px;
    font-weight: bold;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 2px solid black;
    background: #82EB5A;
}
table.type08 tbody th {
    width: 15%;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    background: #ececec;
}
table.type08 td {
    width: 60%;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
.title{
	width: 20%;
}
#star{
	width: 10%;
}

#reviewList{
display: none;
}
#reviewbtn{
display: none;
}

</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
			$('#godetail').click(function(){
				$('#detailInfo').css('display' , "none");
				$('#reviewList').css('display' , 'block');
				$('#detailbtn').css('display' , "none");
				$('#reviewbtn').css('display' , "block");
			});		
		
		$('#goreview').click(function(){
			$('#detailInfo').css('display' , "block");
			$('#reviewList').css('display' , 'none');
			$('#reviewbtn').css('display' , "none");
			$('#detailbtn').css('display' , "block");
		});		
		
		
		$("#reviewDelBtn").click(function(){
			alert("삭제되었습니다. 마이페이지에서 확인하세요.");
		});
		
	});
	
	function pop(){
		alert("삭제되었습니다. 마이페이지에서 확인하세요.");
	};
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
					<a href="product/images/${pd_dto.pd_file}" class="image-popup"><img
						src="product/images/${pd_dto.pd_file}" class="img-fluid"
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
								<th scope="row" class="goods-view-form-table-heading">남은수량</th>
								<td class="goods-view-form-table-cell"><div
										class="input-group col-md-6 d-flex mb-3">
										<span class="input-group-btn mr-2">
											
										</span> <input type="text" id="quantity" name="cnt"
											class="form-control input-number" value="${pd_dto.pd_cnt}"  >
										<span class="input-group-btn ml-2">
											
										</span>
									</div></td>
							</tr>

						</tbody>
					</table>
					<c:url var="path" value="productPay.do">
						<c:param name="prod_code" value="${pd_dto.prod_code}" />
					</c:url>
					<c:url var="update" value="productUpdate.do">
						<c:param name="prod_code" value="${pd_dto.prod_code}" />
					</c:url>
					<c:url var="delete" value="productDelete.do">
						<c:param name="prod_code" value="${pd_dto.prod_code}" />
					</c:url>
					<c:if test="${pd_dto.pd_cnt eq 0} ">
					<p>
					<input type="hidden" value="${pd_dto.prod_code}" >
					<a href="${path}" class="btn btn-black py-3 px-5">구매하기</a>
					</p>
					</c:if>
					<c:if test="${pd_dto.pd_cnt ne 0}" >
					<p>
					<input type="hidden" value="${pd_dto.prod_code}" >
					<a href="${path}" class="btn btn-black py-3 px-5">구매하기</a>
					</p>
					</c:if>
					
					<c:if test="${pd_dto.usercode == user.usercode}">
					<p>
					<input type="hidden" value="${pd_dto.prod_code}" >
					<a href="${update}" class="btn btn-green py-3 px-5">수정하기</a>
					</p>
					<p>
					<input type="hidden" value="${pd_dto.prod_code}" >
					<a href="${delete}" class="btn btn-red py-3 px-5">삭제하기</a>
					</p>
					</c:if>
				</div>
			</div>
		</div>
	</section>

	<section class="goods-info">
		<div class="container" id="detailbtn">
			<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab1" ><a  class="goods-view-infomation-tab-anchor __active"  >상세정보</a></li>
					<li class="goods-view-infomation-tab2" id="godetail"><a  class="goods-view-infomation-tab-anchor" 
					>고객후기</a></li>
			</ul>
		</div>

		<div class="container"  id="detailInfo">
			<div id="product_info">
				<p>${pd_dto.pd_detail}</p>
			</div>
		</div>

		<div class="container" id="reviewbtn">
			<ul class="goods-view-infomation-tab-group2">
					<li class="goods-view-infomation-tab1" id="goreview"  ><a  class="goods-view-infomation-tab-anchor __active"   >상세정보</a></li>
					<li class="goods-view-infomation-tab2"><a  class="goods-view-infomation-tab-anchor" 
					 >고객후기</a> </li>
			</ul>
		</div>

		<div class="container"  id="reviewList">
			<div id="product_review">
				<table class="type08">
  					  <thead>
  						  <tr>
    					    <th scope="cols">제목</th>
      					    <th scope="cols">내용</th>
      					    <th id="star">평점</th>
							 <th scope="cols">수정</th>
							  <th scope="cols">삭제</th>
 						  </tr>
   					 </thead>
   				 <tbody>
   				 <c:forEach items="${review}" var="review">
  					  <tr>
    				    <th scope="row">${review.re_title}</th>
    				    <td>${review.content}</td>
    				    <td>&starf; ${review.re_star}</td>
    				    <c:choose>
    				    	<c:when test="${review.re_user eq sessionScope.loginOk.usercode}">
    				    	<c:url var="reviewUpd" value="reviewUpdate.do">
								<c:param name="re_code" value="${review.re_code}" />
							</c:url>
    				    	<c:url var="reviewDel" value="reviewDelete.do">
								<c:param name="re_code" value="${review.re_code}" />
							</c:url>
    				    	
    				    	
    				    	<td><a href="${reviewUpd}" ><input type="button" value="수정"></a></td> 
    				  		  <td><a href="${reviewDel}" onclick="pop()"><input type="button" value="삭제" id="reviewDelBtn"></a></td> 
    				    	</c:when>
    				    	<c:otherwise>
    				    		<td></td> 
    				   			 <td></td> 
    				    	</c:otherwise>
    				    </c:choose>
  					  </tr>
				</c:forEach>
  			  </tbody>
			</table>
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

<script src="main/plugin-frameworks/bootstrap.min.js"></script>
<script src="main/plugin-frameworks/swiper.js"></script>
<script src="main/common/scripts.js"></script>

</html>