<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오픈채팅</title>

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
<link href="product\p_fonts\ionicons\css\ionicons.css" rel="stylesheet">
<link href="product/common/styles.css" rel="stylesheet">

<style type="text/css">
.ftco-section {
	margin-top: 100px;
}

.bar {
	float: left;
	
}
.product-category{
	margin-bottom: 50px;
}

.chat_title{
	font-weight: bold;
}

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
</head>
<body class="goto-here">

<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>

	<section class="ftco-section">
	
		  <div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="product-category">
						<li><a href="createroomform.do" class="active">오픈 채팅방 만들기</a></li>
					</ul>
				</div>
			</div> 
			
			<!-- 상품 들어가는곳 -->
			<div class="row">
			<c:forEach items="${roomlist}" var="dto" varStatus="status">
				<%-- ${status.count} --%>
				<div class="col-md-6 col-lg-3 ftco-animate" style="max-width: 20%">
				<input type="hidden" value="${dto.chatcode }" id="chatcode">
				<input type="hidden" value="${dto.usercode }">
				<input type="hidden" value="${dto.ct_title }">
				<input type="hidden" value="${dto.ct_limit }">
				
				<c:url var="path" value="chatjoin.do">
						<c:param name="chatcode" value="${dto.chatcode}" />
				</c:url>
					<div class="product">
						<a href="${path}" class="img-prod"><img class="img-fluid"
							src="chat/images/10.png" alt="Colorlib Template"> 
						</a>
						<div class="text py-3 pb-4 px-3 text-center">
							<c:choose>
								<c:when test="${fn:length(dto.ct_title) gt 6}">
									<p class="price">${fn:substring(dto.ct_title,0,5)}...</p>
								</c:when>
								<c:otherwise>
									<p class="price">${dto.ct_title}</p>
								</c:otherwise>							
							</c:choose>
							<div class="d-flex">
								<div class="pricing">
									<h3 style="font-size:9px">
									<label>최대참가인원</label>
										<span class="price-sale">${dto.ct_limit}</span>
									</h3>
									<hr>
										<span class="price-sale" style="color:green; font-size: 9px">last message..</span>
									<h3>
                              			<span class="price-sale" style="color:gray; display: inline">${dto.last_message }</span>
                          		 	</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				</c:forEach>
				
			</div>
			
		</div>
		
	</section>

<!-- footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- footer -->

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
	
	<!-- SCIPTS -->
	<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>
	<script src="main/plugin-frameworks/bootstrap.min.js"></script>
	<script src="main/plugin-frameworks/swiper.js"></script>
	<script src="main/common/scripts.js"></script>
</body>
</html>