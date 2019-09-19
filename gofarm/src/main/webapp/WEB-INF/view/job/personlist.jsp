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
<title>구직 리스트</title>

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

.personlistheader {
	background-color: #2e2e2e;
	color: white;
	font-size: 18px;
	font-weight: bolder;
}

.personlistrow {
	background-color: white;
}

.personlistrow:hover {
	background-color: #fff6d9;
	cursor: pointer;
}

table {
	border: 1px solid #8c8c8c;
}

</style>
</head>

<body style="background-color: #FDF5E6;">

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>


	<div class="limiter">

		<div class="container"
			style="margin-top: 200px; margin-bottom: 200px;">

			<div class="wrap-table100">

				<div class="gu_list">
					<span style="color: black; font-size: 25px; margin-bottom: 10px;">인력정보&nbsp;&nbsp;<i
						class="arrow right"></i></span> <span
						style="color: black; font-size: 25px; margin-bottom: 10px;"><strong>&nbsp;&nbsp;구직
							리스트</strong></span>
				</div>

				<table class="table">

					<tr class="personlistheader">
						<td class="cell">&nbsp;</td>
						<td class="cell" width="20%">이름&nbsp;</td>
						<td class="cell" width="23%">희망 근무 지역 &nbsp;</td>
						<td class="cell" width="23%">희망 작물 &nbsp;</td>
						<td class="cell" width="23%">등록일 &nbsp;</td>
					</tr>

					<c:forEach var="dto" items="${pList}">


						<c:url var="path" value="viewperson.do">
							<c:param name="currentPage" value="${pd.currentPage }" />
							<c:param name="jobsearchcode" value="${dto.jobsearchcode}" />
						</c:url>
						<tr class="personlistrow"
							onclick="javascript:location.href='${path}'">
							<td class="content">${dto.jobsearchcode }</td>
							<td class="content">${dto.js_name }</td>
							<td class="content" data-title="Location">${dto.js_area }</td>
							<td class="content" data-title="Job Title">${dto.js_crop }</td>
							<td class="content" data-title="Location">${dto.js_registration}</td>
						</tr>

					</c:forEach>


				</table>
				<!-- 이전 출력 시작 -->
				<div class="pageList" align="center">
					<c:if test="${pd.startPage >1 }">
						<a
							href="personsearch.do?currentPage=${pd.startPage-pd.blockPage }"  style="font-size: 15px;">&laquo;</a>
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
	<!-- SCIPTS -->
	<script src="main/plugin-frameworks/bootstrap.min.js"></script>
	<script src="main/plugin-frameworks/swiper.js"></script>
	<script src="main/common/scripts.js"></script>
	<!----//End-footer--->
	<!---//End-wrap---->
</body>
</html>