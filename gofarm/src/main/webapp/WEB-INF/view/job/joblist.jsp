<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>

<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_nav.css" rel="stylesheet">

<!--===============================================================================================-->
<title>구인 리스트</title>

<style type="text/css">
.arrow {
	border: solid black;
	border-width: 0px 5px 5px 0;
	display: inline-block;
	padding: 7px;
}

.right {
	transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
}

.joblistheader {
	background-color: #2e2e2e;
	color: white;
	font-size: 18px;
	font-weight: bolder;
}

.joblistrow {
	background-color: white;
}

.joblistrow:hover {
	background-color: #dfeff5;
	cursor: pointer;
}

table {
	border: 1px solid #8c8c8c;
}
</style>
</head>

<body style="background-color: #e6eff2;">

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>


	<div class="limiter">

		<div class="container"
			style="margin-top: 200px; margin-bottom: 200px;">

			<div class="wrap-table100">

				<div class="gu_list">
					<span style="color: black; font-size: 25px; margin-bottom: 10px;">채용정보&nbsp;&nbsp;<i
						class="arrow right"></i></span> <span
						style="color: black; font-size: 25px; margin-bottom: 10px;">&nbsp;&nbsp;<strong>구인
							리스트</strong></span>
				</div>

				<table class="table">

					<tr class="joblistheader">
						<td class="cell">&nbsp;</td>
						<td class="cell">회사명 &nbsp;</td>
						<td class="cell">근무 지역 &nbsp;</td>
						<td class="cell">모집 업종 &nbsp;</td>
						<td class="cell">모집 인원 &nbsp;</td>
						<td class="cell">작업 기간 &nbsp;</td>
						<td class="cell">등록일 &nbsp;</td>
						<td class="cell">마감일 &nbsp;</td>

					</tr>

					<c:forEach var="dto" items="${aList}">

						<c:url var="path" value="view.do">
							<c:param name="currentPage" value="${pv.currentPage }" />
							<c:param name="job" value="${dto.job}" />
						</c:url>

						<tr class="joblistrow"
							onclick="javascript:location.href='${path}'">
							<td class="cell">${dto.job}</td>
							<td class="cell">${dto.j_company}</td>

							<td class="cell" data-title="Age">${dto.j_area }</td>
							<td class="cell" data-title="Job Title">${dto.j_type }</td>
							<td class="cell" data-title="Age">${dto.j_recruitment }</td>
							<td class="cell" data-title="Location">${dto.j_term }</td>
							<td class="cell" data-title="Location">${dto.j_registration }</td>
							<td class="cell" data-title="Location">${dto.j_deadline }</td>
						</tr>

					</c:forEach>


				</table>
				<!-- 이전 출력 시작 -->
				<div class="pageList" align="center">
					<c:if test="${pv.startPage >1 }">
						<a href="jobsearch.do?currentPage=${pv.startPage-pv.blockPage }">이전</a>
					</c:if>
					<!-- 이전 출력끝 -->



					<!-- 페이지 출력시작 -->
					<c:forEach var="i" begin="${pv.startPage }" end="${pv.endPage }">
						<span> <c:url var="currPage" value="jobsearch.do">
								<c:param name="currentPage" value="${i }" />
							</c:url> <c:choose>
								<c:when test="${i==pv.currentPage }">
									<a href="${currPage }" class="pagecolor"> <c:out
											value="${i }" /></a>
								</c:when>
								<c:otherwise>
									<a href="${currPage }"><c:out value="${i}" /></a>
								</c:otherwise>
							</c:choose>

						</span>

					</c:forEach>
					<!-- 페이지 출력끝 -->

					<c:if test="${pv.totalPage>pv.endPage }">
						<a href="jobsearch.do?currentPage=${pv.startPage +pv.blockPage }">다음</a>
					</c:if>
				</div>
			</div>

		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- SCIPTS -->
	<script src="main/plugin-frameworks/bootstrap.min.js"></script>
	<script src="main/plugin-frameworks/swiper.js"></script>
	<script src="main/common/scripts.js"></script>
	<!----//End-footer--->
	<!---//End-wrap---->
</body>
</html>