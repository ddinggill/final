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

<title>마이페이지 - 구인</title>

<!-- Custom fonts for this template-->
<link href="mypage/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="mypage/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="mypage/css/sb-admin.css" rel="stylesheet">
<link href="mypage/css/job.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
						<i class="fas fa-table"></i> 내 구인글
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="tab" id="tab" style="border-radius: 5px;">
									<tbody>
										<tr>
											<td class="t1">회사명</td>
											<td class="t2">${job_dto.j_company}</td>
											<td class="t1">등록일</td>
											<td class="t2">${job_dto.j_registration}</td>
										</tr>
										<tr>
											<td class="t1">근무지역</td>
											<td class="t2">${job_dto.j_area}</td>
											<td class="t1">마감일</td>
											<td class="t2">${job_dto.j_deadline}</td>
										</tr>

										<tr>
											<td class="t1">모집인원</td>
											<td class="t2">${job_dto.j_recruitment}</td>
											<td class="t1">경력</td>
											<td class="t2">${job_dto.j_career}</td>
										</tr>
										<tr>
											<td class="t1">성별</td>
											<td class="t2">${job_dto.j_gender}</td>
											<td class="t1">구인연령</td>
											<td class="t2">${job_dto.j_age}</td>
										</tr>
										<tr>
											<td class="t1">모집 업종</td>
											<td class="t2" colspan="4">${job_dto.j_type}</td>
										</tr>
										<tr>
											<td class="t1">작업 기간</td>
											<td class="t2" colspan="4">${job_dto.j_term}</td>
										</tr>
										<tr>
											<td class="t1">지원 정보</td>
											<td class="t2" colspan="4">${job_dto.j_info}</td>
										</tr>
										<tr>

											<td class="t1">작업지 주소</td>
											<td class="t2" colspan="4">${job_dto.j_address}</td>
										</tr>
										<tr>
											<td colspan="5">
												<div class="detail">
													<p class="datail_title">상세 내용</p>
													<p>${job_dto.content}</p>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="5">
												<div class="memo">
													<p class="memo_title">우대 사항</p>
													${job_dto.j_preferential}
												</div>
											</td>
										</tr>
									</tbody>
							</table>
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
	<!-- Bootstrap core JavaScript-->
	<script src="mypage/vendor/jquery/jquery.min.js"></script>
	<script src="mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>