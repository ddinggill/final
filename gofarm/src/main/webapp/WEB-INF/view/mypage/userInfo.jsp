<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>마이페이지 - 회원정보</title>

<!-- Custom fonts for this template-->
<link href="mypage/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="mypage/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="mypage/css/sb-admin.css" rel="stylesheet">
<!-- mileage_payment css-->
<link href="mypage/css/userInfo.css" rel="stylesheet">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.5.min.js" type="application/javascript"></script>

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
						<i class="fas fa-table"></i> 회원 정보
					</div>
					<div class="card-body">
						<div class="g_content">
							<!-- ▼ 회원 기본 정보 //-->
							<div class="g_subtitle">회원 기본 정보</div>
							<table class="g_blue_table">
								<tbody>
									<tr>
										<th>아이디</th><td colspan="3"><span>${loginOk.userid}</span></td>
										<th>패스워드</th><td colspan="3"><span>${loginOk.userpw}</span></td>
									</tr>
									<tr>
										<th>이름</th><td colspan="3"><span>${loginOk.name}</span></td>
										<th>닉네임</th><td colspan="3"><span>${loginOk.nickname}</span></td>
									</tr>
									<tr>
										<th>생년월일</th><td colspan="3"><span>${loginOk.birth}</span></td>
										<th>전화번호</th><td colspan="3"><span>${loginOk.phone}</span></td>
									</tr>
									<tr>
										<th>이메일</th><td colspan="7"><span>${loginOk.email}</span></td>
									</tr>
								</tbody>
							</table>
							<div><input class="inputBtn" type="button" value="기본정보 수정" id="basicInfoMod" onClick="location.href='infochange.do'"></div>
							<!-- ▲ 회원 기본 정보 //-->

							<c:if test="${loginOk.userlvl == 1 }">
								<ul class="box6 g_list">
									<li>기본 회원으로는 저희 홈페이지를 사용하는데 많은 제약이 있습니다</li>
									<li>더 많은 기능을 사용하기 위해서는 상세회원으로 전환하셔야 합니다.
										<p id="mileage_btn">
											<input class="inputBtn" type="button" id="userChangeBtn" value="상세회원전환하기" onClick="location.href='detailsignup.do'" />
										</p>
									</li>
								</ul>
							</c:if>


							<!-- ▼ 회원 상세 정보 //-->
							<c:if test="${loginOk.userlvl == 2 }">
								<div class="g_subtitle">회원 상세 정보</div>
								<table class="g_blue_table">
									<tbody>
										<tr>
											<th colspan="1">은행명</th><td colspan="3"><span>${userDTO.bank}</span></td>
										</tr>
										<tr>
											<th colspan="1">계좌 번호</th><td colspan="3"><span>${userDTO.account}</span></td>
										</tr>
										<tr>
											<th colspan="1">주소</th><td colspan="3"><span>${userDTO.user_home}</span></td>
										</tr>
									</tbody>
								</table>
								<div><input class="inputBtn" type="button" value="상세정보 수정" id="detailInfoMod" onClick="location.href='detailInfochange.do'"></div>
							</c:if>
							<!-- ▲ 회원 상세 정보 //-->
							<div class="g_finish"></div>

						</div>
					</div>
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
