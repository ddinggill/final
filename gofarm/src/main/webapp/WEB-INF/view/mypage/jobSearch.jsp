<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>마이페이지 - 구직</title>

<!-- Custom fonts for this template-->
<link href="mypage/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="mypage/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="mypage/css/sb-admin.css" rel="stylesheet">
<link href="mypage/css/jobSearch.css" rel="stylesheet">

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
						<i class="fas fa-table"></i> 내 구직글
					</div>
					<div class="card-body">
						<div>
							<table class="tab" id="tab" style="border-radius: 5px;">
									<tbody>
										<tr>
											<td class="t1">이름</td>
											<td class="t2">${jobSearch_dto.js_name}</td>
											<td class="t1">등록일</td>
											<td class="t2">${jobSearch_dto.js_registration}</td>
										</tr>
										<tr>
											<td class="t1">희망 근무 지역</td>
											<td class="t2">${jobSearch_dto.js_area}</td>
											<td class="t1">희망 작물</td>
											<td class="t2">${jobSearch_dto.js_crop}</td>
										</tr>

										<tr>
											<td class="t1">희망 근무 시간</td>
											<td class="t2">${jobSearch_dto.js_time}</td>
											<td class="t1">희망 급여</td>
											<td class="t2">${jobSearch_dto.js_salary}</td>
										</tr>
										<tr>
											<td class="t1">거주지</td>
											<td class="t2" colspan="4">${jobSearch_dto.js_address}</td>
											
										</tr>
										<tr>
											<td class="t1">전화번호</td>
											<td class="t2">${jobSearch_dto.js_phone}</td>
										</tr>
										<tr>
											<td colspan="5">
												<div class="detail">
													<p class="datail_title">상세 소개</p>
													<p>${jobSearch_dto.js_intro}</p>
												</div>
											</td>
										</tr>
									</tbody>
							</table>
						</div>

						<p id="list_title">열람한 구인자 리스트</p>
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>번호</th>
										<th>이름</th>
										<th>구인글 바로가기</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>번호</th>
										<th>이름</th>
										<th>구인글 바로가기</th>
									</tr>
								</tfoot>
								<tbody id="tbody">
									<c:forEach items="${jobCheck_dto}" var="dto" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${dto.j_info}</td>
											<td><a href="view.do?currentPage=1&job=${dto.job}">${dto.j_info}님의 구인글로 이동하기</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
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
