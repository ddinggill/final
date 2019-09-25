<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
    <title>상품 수정</title>
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
<script type="text/javascript">

$(document).ready(function() {

		$("#poppop").click(function(){
			alert("수정되었습니다. 마이페이지에서 확인하세요.");
		});

});
function pop(){
	alert("수정되었습니다. 마이페이지에서 확인하세요.");
};

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
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">상품</a></span> <span>수정페이지</span></p>
            <h1 class="mb-0 bread">${pd_dto.pd_name}</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section bg-light">
      <div class="container">
      	
        <br>
        <div class="row block-9">
          <div class="col-md-12 order-md-last d-flex">
            <form action="productUpdatePro.do"  class="bg-white p-5 contact-form"  enctype="multipart/form-data" method="post">
           	<input type="text" value="${pd_dto.prod_code}" name="prod_code">
              <div class="form-group">
              <label><h4>상품명</h4></label>
                <input type="text" class="form-control" placeholder="ex)풍년쌀 골드 10kg 등" name="pd_name" value="${pd_dto.pd_name}">
              </div>
              <!--  <div class="form-group">
               <label><h4>상품 이미지</h4></label>
                <input type="file" class="form-control" placeholder="상품의 메인 이미지" name="upload"  >
              </div> -->
              <div class="form-group">
              <label><h4>생산자</h4></label>
                <input type="text" class="form-control" placeholder="ex)회사명 및 개인 사업자명" name="producer" value="${pd_dto.producer}" >
              </div>
              <div class="form-group">
              <label><h4>원산지</h4></label>
                <input type="text" class="form-control" placeholder="ex)전라남도 완도군" name="origin"value="${pd_dto.origin}" >
              </div>
              <div class="form-group">
              <label><h4>회사 전화번호</h4></label>
                <input type="text" class="form-control" placeholder="문의전화 번호" name="pd_phone" value="${pd_dto.pd_phone}" >
              </div>
              <div class="form-group">
              <label><h4>판매개수</h4></label>
				<input type="number" id="quantity" name="pd_cnt" class="form-control input-number" value="1" min="1" value="${pd_dto.pd_cnt}"  >
              </div>
              <div class="form-group">
              <label><h4>상세내용</h4></label>
                <textarea   cols="50" rows="20" class="form-control" placeholder="상품의 상세내용" name="pd_detail"  >${pd_dto.pd_detail}</textarea>
              </div>
               <div class="form-group">
               <label><h4>가격</h4></label>
                <input type="text" class="form-control" placeholder="상품의 개당 가격" name="pd_price" value="${pd_dto.pd_price}" >
              </div>
              
              <div class="form-group">
               <input type="submit" value="등 록 하 기" class="btn btn-primary py-3 px-5" id="poppop">
              </div>
            </form>
          
          </div>

          <!-- <div class="col-md-6 d-flex">
          		<img alt="상품이미지" src="" >
          </div> -->
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
