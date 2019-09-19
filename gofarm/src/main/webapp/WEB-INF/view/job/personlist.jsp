<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="joblist/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="joblist/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="joblist/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="joblist/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="joblist/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="joblist/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="joblist/css/util.css">
<link rel="stylesheet" type="text/css" href="joblist/css/main.css">
<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="recruit/recruit.css" rel="stylesheet">
<!--===============================================================================================-->
<title>구직 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body >

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>


	<div class="limiter">

		<div class="container-table100" style="background-color:#A2BBCA;">

			<div class="wrap-table100" style="width: 55%;">

				<div class="gu_list">
					<span style="color: #696969; font-size: 25px; margin-bottom: 10px;">인력정보&nbsp;&nbsp;<i
						class="arrow right"></i><strong>&nbsp;&nbsp;구직 리스트</strong></span>
				</div>

				<table class="table">

					<tr class="row header" style="background-color: #A297BD;">
						<td class="cell">이름&nbsp;</td>
						<td class="cell">희망 근무 지역 &nbsp;</td>
						<td class="cell">희망 작물 &nbsp;</td>
						<td class="cell">등록일 &nbsp;</td>
					</tr>

					<c:forEach var="dto" items="${pList}">
						<tr class="row">


							<c:url var="path" value="viewperson.do">
								<c:param name="currentPage" value="${pd.currentPage }" />
								<c:param name="jobsearchcode" value="${dto.jobsearchcode}" />
							</c:url>
							<td class="cell"><a href="${path}">${dto.js_name }</a></td>
							<td class="cell" data-title="Location">${dto.js_area }</td>
							<td class="cell" data-title="Job Title">${dto.js_crop }</td>
							<td class="cell" data-title="Location">${dto.js_registration}</td>
						</tr>

					</c:forEach>


				</table>
				<!-- 이전 출력 시작 -->
				<div class="pageList">
					<c:if test="${pd.startPage >1 }">
						<a
							href="personsearch.do?currentPage=${pd.startPage-pd.blockPage }">&laquo;</a>
					</c:if>
					<!-- 이전 출력끝 -->



					<!-- 페이지 출력시작 -->
					<c:forEach var="i" begin="${pd.startPage }" end="${pd.endPage }">
						<span> <c:url var="currPage" value="personsearch.do">
								<c:param name="currentPage" value="${i }" />
							</c:url> <c:choose>
								<c:when test="${i==pd.currentPage }">
									<a href="${currPage }" class="pagecolor"> <c:out
											value="${i }" /></a>
								</c:when>
								<c:otherwise>
									<a href="${currPage }"><c:out value="${i }" /></a>
								</c:otherwise>
							</c:choose>

						</span>

					</c:forEach>
					<!-- 페이지 출력끝 -->

					<c:if test="${pd.totalPage>pd.endPage }">
						<a
							href="personsearch.do?currentPage=${pd.startPage +pd.blockPage }">&raquo;</a>
					</c:if>
				</div>
			</div>

		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>


	<!--===============================================================================================-->
	<script src="joblist/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="joblist/vendor/bootstrap/js/popper.js"></script>
	<script src="joblist/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="joblist/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="joblist/js/main.js"></script>

</body>
</html>