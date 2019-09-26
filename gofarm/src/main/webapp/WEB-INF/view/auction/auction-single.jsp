<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>경매</title>
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

/* body{
	background-color: #A2BBCA;
} */
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	function timecount(){
	
		var end = $('#end').val();
		console.log(end) //마감시간
	var endtimeArr = end.split(":");
		console.log(endtimeArr[0]);//마감시간 시
		console.log(endtimeArr[1]);//마감시간 분
		console.log(endtimeArr[2]);//마감시간 초
		
	 var nowtime = new Date();
		console.log(endtimeArr[0] -nowtime.getHours());//현재 시간 -마감 시간
		console.log(endtimeArr[1]- nowtime.getMinutes());//현재 분 -마감 분
		console.log(endtimeArr[2]-  nowtime.getSeconds());//현재 초 -마감 초
		
		var hour = endtimeArr[0] -nowtime.getHours();
		var minute = endtimeArr[1]- nowtime.getMinutes();
		var second = endtimeArr[2]-  nowtime.getSeconds();
		
	 	if(minute < 0){
			hour -= 1;
			minute += 60;
		}
		if (second < 0 ){
			minute -= 1;
			second +=60;
		} 
		
		console.log(hour);
		console.log(minute);
		console.log(second);
		
		$("#timetable").html(hour+": "+minute + ": " + second);
		console.log("실행중");
		var timer = setInterval(function(){
			$("#timetable").text(hour+": "+minute + ": "+ second);
			if(hour < 0){
				$("#timetable").html("경매종료");
				clearInterval(timer);
			} 
			second--;
			 if(minute < 0){
				hour -= 1;
				minute += 60;
			}
			if (second < 0 ){
				minute -= 1;
				second +=60;
			} 
			
			
		},1000);
		
		
	
};

$(document).ready(function() {

		$("#bidding").on('click' , function(){
			if("${sessionScope.loginOk}" !=""){
				console.log("로그인햇음");
				if("${dto.ctprice}" >= $("#price").val()){
					alert("현재가 보다 낮거나 같은 값의 입찰은 불가합니다.");
					return false;
				}
				alert("입찰이 완료 되었습니다. 마이페이지에서 확인하세요.");
			}else{
				alert("로그인이 필요합니다");
			}
		});

	
	

});
	</script>
</head>
<body class="goto-here">
	<!-- nav -->
	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
	<!-- END nav -->

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="/gofarm/profileUpload/${dto.au_file}" class="image-popup"><img
						src="/gofarm/profileUpload/${dto.au_file}" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
            <form action="auctionRecipe.do" method="get"  >
				<div class="goods-view-form-table-wrapper">
					<h3>${dto.au_name}</h3>
					<table class="goods-view-form-table">
						<tbody>
						<tr>
								<th scope="row" class="goods-view-form-table-heading">시작가</th>
								<td class="goods-price"><fmt:formatNumber value="${dto.stprice}" pattern="###,###"/> 원</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">현재가</th>
								<td class="goods-price" ><fmt:formatNumber value="${dto.ctprice}" pattern="###,###"/> 원</td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">시작일</th>
								<td class="goods-view-form-table-cell">${dto.st_time}</td>
							</tr>
							<input type="hidden" value="${dto.fin_time}" id="end">
							<tr>
								<th scope="row" class="goods-view-form-table-heading">남은시간</th>
								<td class="goods-view-form-table-cell" id="timetable"><script type="text/javascript">timecount();</script> </td>
							</tr>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">예상낙찰자</th>
								<td class="goods-view-form-table-cell">${user.nickname}</td>
							</tr>
							<tr>
							
								<th scope="row" class="goods-view-form-table-heading">입찰금액</th>
								<td class="goods-view-form-table-cell"><div
										class="input-group col-md-6 d-flex mb-3">
										<span class="input-group-btn mr-2">
										</span> <input type="text" id="price" name="price"
											class="form-control input-number" value="<fmt:formatNumber value="${dto.ctprice}" pattern="###,###"/>"  readonly="readonly">원
										<span class="input-group-btn ml-2">
											<input type="hidden" value="${dto.auctioncode}" name="auctioncode">
										</span>
									</div></td>
							</tr>
					
						</tbody>
					</table>
					<%-- <c:url var="path" value="auctionRecipe.do">
						<c:param name="prod_code" value="${dto.auctioncode}" />
						<c:param name="price" value=""  />
					</c:url> --%>
					
					<%-- <p>
					<input type="hidden" value="${dto.auctioncode}" >
					<a href="${path}" class="btn btn-black py-3 px-5">입찰하기</a>
					</p> --%>
					<c:if test="${dto.state eq 0}">
					<input type="submit" class="btn btn-black py-3 px-5" value="입찰하기" id="bidding">
					</c:if>
				<c:if test="${dto.state ne 0}">
					<input type="text" class="btn btn-black py-3 px-5" value="경매종료" readonly="readonly">
					</c:if>
					</div>
				</form>
					<table class="goods-view-form-table">
						<thead>
							<tr>
								<th scope="row" class="goods-view-form-table-heading">입찰자</th>
								<th scope="row" class="goods-view-form-table-heading">입찰금액</th>
								<th scope="row" class="goods-view-form-table-heading">입찰시간</th>
							</tr>
							<c:forEach items="${aurelist }" var="adto">
								<tr>
									<th scope="row">${adto.nickname }</th>
									<th scope="row"><fmt:formatNumber value="${adto.br_price}" pattern="###,###"/> 원</th>
									<th scope="row">${adto.br_date}</th>
								</tr>
							</c:forEach>
						</thead>
							
					</table>
					<c:url var="update" value="auctionUpdate.do">
						<c:param name="auctioncode" value="${dto.auctioncode}" />
					</c:url>
					<c:url var="delete" value="auctionDelete.do">
						<c:param name="auctioncode" value="${dto.auctioncode}" />
					</c:url>
					<%-- <c:if test="${dto.usercode == user.usercode}">
					<p>
					<input type="hidden" value="${dto.auctioncode}" >
					<a href="${update}" class="btn btn-green py-3 px-5">수정하기</a>
					</p>
					<p>
					<input type="hidden" value="${dto.auctioncode}" >
					<a href="${delete}" class="btn btn-red py-3 px-5">삭제하기</a>
					</p>
					</c:if> --%>
				</div>
			</div>
		<!-- </div> -->
	</section>

	<section class="goods-info">
		<div class="container">
			<ul class="goods-view-infomation-tab-group">
					<li class="goods-view-infomation-tab1"><a href="#product_info"
					class="goods-view-infomation-tab-anchor __active">상세정보</a></li>
					
			</ul>
		</div>

		<div class="container">
			<div id="product_info">
				<p>${dto.content}</p>
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
<!-- SCIPTS -->
<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>
<script src="main/plugin-frameworks/bootstrap.min.js"></script>
<script src="main/plugin-frameworks/swiper.js"></script>
<script src="main/common/scripts.js"></script>
</html>