<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
    <title>구매 정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

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
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/plugin-frameworks/swiper.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_content.css" rel="stylesheet">

<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$("#payGo").on('click',function(){
		if(${detail.mileage} < $(".totalmoney").val()){
			alert("마일리지가 부족합니다. 충전후 이용해 주세요.");
			return false;
		}
		alert("결제 되었습니다. 마이페이지에서 확인하세요.");
	});
	/* 
	$("#totalmoney").on('change',function(){
	var total = $("#quantity").val() * ${pd_dto.pd_price};
	console.log(total);
	$("#quantity").val(total);
	}); */
	
/* 	$("#totalmoney").change(function(){
		alert("변경");
	});
	 */


});
function total(){
	/* alert("변경");
	alert($("#quantity").val());
	alert($("#totalmoney").val()); */
  var total = $("#quantity").val() *  $("#price").val();
 /*  alert(total); */
  $(".totalmoney").val(total);
}



</script>
  </head>
  <body class="goto-here">
  
 <jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include> 
    <br>
    <!-- END nav -->

    <div class="hero-wrap hero-bread" style="background-image: url('product/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">구매</a></span> <span>상세페이지</span></p>
            <h1 class="mb-0 bread">${pd_dto.pd_name}</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section bg-light">
      <div class="container">
      	<div class="row d-flex mb-5 contact-info">
          <div class="w-100"></div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
          	<input type="hidden" value="${pd_dto.pd_name}" id="pd_name" name="pd_name">
	            <p><span>상품명:</span>${pd_dto.pd_name}</p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>판매자:</span>${pd_dto.producer}</p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><span>원산지:</span>${pd_dto.origin}</p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
          	<input type="hidden" value="${pd_dto.pd_price}" id="price" >
	            <p><span>총금액:</span> <input type="text" value="<fmt:formatNumber value="${pd_dto.pd_price}" pattern="###,###"/>" class="totalmoney" readonly="readonly"> </p>
	          </div>
          </div>
        </div>
        <br>
        <div class="row block-9">
          <div class="col-md-6 order-md-last d-flex">
            <form action="productpay.do" class="bg-white p-5 contact-form" >
            <input type="hidden" value="${pd_dto.pd_name}" name="pd_name">
            <input type="hidden" value="${pd_dto.usercode}" name="pd_usercode">
            <input type="hidden" value="${pd_dto.pd_price}" class="totalmoney" name="price">
            <input type="hidden" value="${pd_dto.prod_code}" name="prod_code"> 
          <%--  <input type="text" value="${cnt}" name="cnt"> --%>
              <div class="form-group">
              <label><h4>이름</h4></label>
                <input type="text" class="form-control" placeholder="이름" value="${user.name}">
              </div>
              <div class="form-group">
              <label><h4>이메일</h4></label>
                <input type="text" class="form-control" placeholder="이메일" value="${user.email}">
              </div>
              <div class="form-group">
              <label><h4>주소</h4></label>
                <input type="text" class="form-control" placeholder="주소" value="${detail.user_home }">
              </div>
              <div class="form-group">
              <label><h4>주문수량</h4></label>
				<input type="number" id="quantity" name="cnt" class="form-control input-number" value="1" min="1" max="${pd_dto.pd_cnt}" onchange="total()">
              </div>
              <div class="form-group">
              <label><h4>배송시 요청사항</h4></label>
                <textarea name="" id="" cols="20" rows="5" class="form-control" placeholder="배송 시 요청사항"></textarea>
              </div>
               <div class="form-group">
               <label><h4>현재 마일리지</h4></label>
                <input type="text" class="form-control" placeholder="마일리지" value="<fmt:formatNumber value="${detail.mileage}" pattern="###,###"/>">
              </div>
              <div class="form-group">
                <input type="submit" value="구 매 하 기" class="btn btn-primary py-3 px-5" id="payGo">
              </div>
            </form>
          
          </div>

          <div class="col-md-6 d-flex">
          		<img alt="상품이미지" src="/gofarm/profileUpload/${pd_dto.pd_file}" >
          </div>
        </div>
      </div>
    </section>

   
    
  

  <!-- loader -->
  <jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include> 


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
  <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="product/p_js/google-map.js"></script> -->
  <script src="product/p_js/main.js"></script>
    
    
    <script src="main/plugin-frameworks/bootstrap.min.js"></script>
<script src="main/plugin-frameworks/swiper.js"></script>
<script src="main/common/scripts.js"></script>
  </body>
</html>
