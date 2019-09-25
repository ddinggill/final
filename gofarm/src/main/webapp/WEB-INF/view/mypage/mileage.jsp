<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>마이페이지 - 내 마일리지</title>

<!-- Custom fonts for this template-->
  <link href="mypage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="mypage/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="mypage/css/sb-admin.css" rel="stylesheet">
  
  <!-- mileage css-->
  <link href="mypage/css/mileage.css" rel="stylesheet">
  
</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.js"></script> -->
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.5.min.js" type="application/javascript"></script>
<!-- mileage JavaScript-->
<!-- <script src="mypage/js/mileage.js"></script> -->
<script type="text/javascript">
$(document).ready(function() {
	$('#my_mileage_2').append('${userDetail_dto.mileage}');
});
</script>
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
            <i class="fas fa-table"></i>마일리지
          </div>
          <div class="card-body">
          <div class="my_mileage">
				<p id="my_mileage_1">내 마일리지</p>
				<p id="my_mileage_2"></p>
				<p id="mileage_btn">
					<input type="button" id="mileage_charge_btn" value="충전하기" onClick="location.href='mileage_charge.do'" /> 
					<input type="button" id="mileage_payment_btn" value="출금하기" onClick="location.href='mileage_payment.do'" />
				</p>
			</div>
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  	<th>번호</th>
                    <th>이전 마일리지</th>
                    <th>마일리지 증감량</th>
                    <th>마일리지 증감내용</th>
                    <th>현재 마일리지</th>
                    <th>일자</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                 	<th>번호</th>
                    <th>이전 마일리지</th>
                    <th>마일리지 증감량</th>
                    <th>마일리지 증감내용</th>
                    <th>현재 마일리지</th>
                    <th>일자</th>
                  </tr>
                </tfoot>
                <tbody id="tbody">
					<c:forEach items="${mileage_dto}" var="dto" varStatus="status">
						<tr>
							<td>${status.count}</td>

							<td>${dto.m_total-dto.m_list}</td>
							<c:choose>
								<c:when test="${dto.m_list} > 0"><td>+${dto.m_list}</td></c:when>
								<c:otherwise><td>${dto.m_list}</td></c:otherwise>
							</c:choose>
							<td>${dto.m_content}</td>
							<td>${dto.m_total}</td>
							<td>${dto.m_day}</td>
						</tr>
					</c:forEach>
                </tbody>
              </table>
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
