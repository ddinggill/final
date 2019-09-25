<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>마이페이지 - 마일리지 충전</title>

  <!-- Custom fonts for this template-->
  <link href="mypage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="mypage/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="mypage/css/sb-admin.css" rel="stylesheet">
  
<style type="text/css">
	.m_chargelist li {
	display:inline;
    width: 130px;
    margin-top: 5px;
    margin-right: 50px;
</style>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.5.min.js" type="application/javascript"></script>
<script src="mypage/js/mileage_charge.js"></script>
</head>

<body id="page-top">
	<!-- Navbar -->
	<jsp:include page="/WEB-INF/view/mypage/common/mypage_nav.jsp"></jsp:include>
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/view/mypage/common/mypage_sidebar.jsp"></jsp:include>
		<div id="content-wrapper">
			<div class="container-fluid">
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>마일리지 충전
          </div>
          
          <div> 
          	<input type="hidden" id="userName" value="${userDTO.name}" /> 
          	<input type="hidden" id="userEmail" value="${userDTO.email}" /> 
          	<input type="hidden" id="userHome" value="${userDTO.user_home}" /> 
          	<input type="hidden" id="userPhone" value="${userDTO.phone}" /> 
          	<input type="hidden" id="sysdate" value="${sysdate}" /> 
          </div>
          <div class="card-body">
             <div id="charge_main">
				<p id="my_mileage_charge">충전금액 선택</p>
				<div id="my_mileage_charge_list">
					<ul class="m_chargelist">
						<li><input type="radio" name="selectPrice" id="selectPrice1"
							value="3000" class="g_radio" checked="checked">
							<label for="selectPrice1">3,000 원</label></li>
						<li><input type="radio" name="selectPrice" id="selectPrice2"
							value="5000" class="g_radio"> <label for="selectPrice2">5,000
								원</label></li>
						<li><input type="radio" name="selectPrice" id="selectPrice3"
							value="10000" class="g_radio"> <label
							for="selectPrice3">10,000 원</label></li>
						<li><input type="radio" name="selectPrice" id="selectPrice4"
							value="30000" class="g_radio"> <label
							for="selectPrice4">30,000 원</label></li>
						<li><input type="radio" name="selectPrice" id="selectPrice5"
							value="50000" class="g_radio"> <label
							for="selectPrice5">50,000 원</label></li>
						<li><input type="radio" name="selectPrice" id="selectPrice6"
							value="100000" class="g_radio"> <label
							for="selectPrice6">100,000 원</label></li>
						<li><input type="radio" name="selectPrice"
							id="priceD" value="0" class="g_radio"> <input
							type="text" id="price_custom" name="price_custom"
							placeholder="직접입력" maxlength="7" class="g_text">
							<label for="priceD">원</label>
							</li>
					</ul>
				</div>
				<p id="mileage_btn">
					<input type="button" id="bootPay_btn" value="충전하기" /> 
				</p>
				<form id="f_mileage_charge" action="mileage_charge_end.do">
				</form>
			</div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

			</div>
			<!-- /.container-fluid -->
			
			<!-- Footer -->
			<jsp:include page="/WEB-INF/view/mypage/common/mypage_footer.jsp"></jsp:include>
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /#wrapper -->

  <!-- logOut -->
  <jsp:include page="/WEB-INF/view/mypage/common/mypage_logOut.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript-->
  <script src="mypage/vendor/jquery/jquery.min.js"></script>
  <script src="mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
