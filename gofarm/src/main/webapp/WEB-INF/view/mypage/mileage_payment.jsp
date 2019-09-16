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

  <title>마이페이지 - 마일리지 출금</title>

  <!-- Custom fonts for this template-->
  <link href="mypage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="mypage/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="mypage/css/sb-admin.css" rel="stylesheet">

<style type="text/css">
.m_chargelist li {
	display: inline;
	width: 130px;
	margin-top: 5px;
	margin-right: 50px;
}
table {
    table-layout: fixed;
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
    border-top: 2px solid #e1e1e1;
    color: #1d1d1d;
}

table tr td {
	box-sizing: border-box;
	position: relative;
	padding: 7px 0 7px 10px;
	border-bottom: 1px solid #e1e1e1;
	text-align: left;
}

div.g_content{
	margin-left:80px;
	margin-right:80px;
}

div.g_right{
	float: right;
}
table tr th {
    box-sizing: border-box;
    padding: 7px 0;
    height: 40px;
    border-bottom: 1px solid #e1e1e1;
    background-color: #f0f0f0;
    text-align: center;
}
.g_subtitle, .g_subtitle_blue {
    box-sizing: border-box;
    position: relative;
    min-height: 30px;
    margin-top: 15px;
    padding: 11px 0 8px;
    color: #2f2f2f;
    font-size: 15px;
    font-weight: 700;
}

.g_btn_wrap, .g_btn {
    margin: 45px 0;
    text-align: center;
}

.g_blue_table, .g_blue_table tr th, .g_blue_table tr td {
    border-color: #d5e2f2;
}

.g_blue_table tr th {
    background-color: #e8f2ff;
}
.box6 {
    padding: 15px;
    border: 1px solid #e1e1e1;
    background-color: #f0f0f0;
    margin-top: 10px;
}

ul {
    margin: 0;
    padding: 0;
    list-style: none;
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.g_notice_box1 {
    box-sizing: border-box;
    position: relative;
    background: #f0f0f0;
    padding: 15px 20px;
    border: 1px solid #e1e1e1;
    font-size: 12px;
    color: #636363;
}
.g_tab {
    position: relative;
    overflow: hidden;
    display: table;
    table-layout: fixed;
    width: 100%;
    margin: 20px 0;
}

.g_tab>*>a {
    display: block;
    padding: 10px 0;
    text-align: center;
    line-height: 22px;
}

a {
    color: inherit;
    text-decoration: none;
}

body, div, input, ul, li, dl, dt, dd, form, fieldset, label, strong, span, button, a, p {
    margin: 0;
    padding: 0;
    text-align: left;
}

.g_tab>.selected {
    border: 2px solid #666;
    border-bottom: 0;
    background-color: #FFF;
    font-weight: 700;
}

.g_tab>* {
    box-sizing: border-box;
    position: relative;
    display: table-cell;
    height: 45px;
    border-top: 1px solid #e1e1e1;
    border-left: 1px solid #e1e1e1;
    border-bottom: 2px solid #666;
    background-color: #f1f0f3;
    vertical-align: middle;
}

body {
    position: relative;
    height: 100%;
    color: #1d1d1d;
    font-family: '맑은 고딕','Malgun Gothic',돋움,dotum,sans-serif;
    font-size: 13px;
    letter-spacing: -0.08em;
}
</style>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.5.min.js" type="application/javascript"></script>
<script src="mypage/js/mileage_payment.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('div.g_tab a').on('click', function() {
		$('div.g_tab div').removeClass('selected');
		$(this).parent().addClass('selected');
	});
		
});
</script>
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
			<i class="fas fa-table"></i>마일리지 출금
		</div>
		<div class="card-body">
			<div class="g_content">
				<!-- ▼ 메뉴탭 //-->
				<div class="g_tab">
					<div class="selected">
						<a href="#" onclick="acyncMovePage('paymentPorm.do')">은행계좌 출금</a>
					</div>

					<div class="">
						<a href="#" onclick="acyncMovePage('paymentList.do')">마일리지 출금내역 보기</a>
					</div>

				</div>
				<!-- ▲ 메뉴탭 //-->

				<div id="payment_content"></div>
			</div>
		</div>
		<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
	</div>

	<p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

			</div>
			<!-- /.container-fluid -->
			
			<!-- Footer -->
			<jsp:include page="/WEB-INF/view/mypage/common/mypage_footer.jsp"></jsp:include>
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="mypage/vendor/jquery/jquery.min.js"></script>
  <script src="mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="mypage/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="mypage/vendor/datatables/jquery.dataTables.js"></script>
  <script src="mypage/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="mypage/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="mypage/js/demo/datatables-demo.js"></script>

</body>

</html>
