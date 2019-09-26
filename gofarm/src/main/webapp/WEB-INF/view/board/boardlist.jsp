<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- SCIPTS -->
<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>

<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_nav.css" rel="stylesheet">

<title>자유게시판-구인/구직</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

.boardlistheader {
	background-color: #778899;
	color: white;
	font-size: 18px;
	font-weight: bolder;
}

.boardlistrow {
	background-color: white;
}

.boardlistrow:hover {
	background-color: #FFF8DC;
	cursor: pointer;
}

table {
	border: 1px solid #8c8c8c;
}
</style>
</head>
<body style="background-color: #FFFAF0;">
	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>

	<div class="container" style="margin-top: 200px; margin-bottom: 200px;">
		<div class="title">
			<span style="color: #696969; font-size: 25px; margin-bottom: 10px;">자유게시판&nbsp;&nbsp;<i
				class="arrow right"></i><strong>&nbsp;&nbsp;${category}</strong></span>
		</div>
		<table class="table">
			<thead>
				<tr class="boardlistheader">
					<th>&nbsp;</th>
					<th width="58%" style="text-align: center;">제목</th>
					<th width="15%">작성자</th>
					<th width="20%">날짜</th>
				</tr>
			</thead>
			<c:forEach var="dto" items="${aList}">
				<c:url var="path" value="board_view.do">
					<c:param name="currentPage" value="${pv.currentPage }" />
					<c:param name="boardcode" value="${dto.boardcode}" />
				</c:url>
				<tbody>
					<tr class="boardlistrow"
						onclick="javascript:location.href='${path}'">
						<th>${dto.boardcode }</th>
						<th>${dto.b_title }</th>
						<th>${dto.nickname }</th>
						<th>${dto.b_day }</th>
					</tr>
				</tbody>
			</c:forEach>

		</table>
		<hr />
		<div align="right">
			<a href="writeform.do?category=${category }"><input type="button" value="글쓰기"
				class="btn " style="cursor: pointer; background-color: #6495ED" /></a>
		</div>
		<div class="text-center">
			<div class="pageList" style="margin-bottom: 50px;">
				<c:if test="${pv.startPage >1 }">
					<a href="board_job.do?currentPage=${pv.startPage-pv.blockPage }">&laquo;</a>
				</c:if>
				<!-- 이전 출력끝 -->



				<!-- 페이지 출력시작 -->
				<c:forEach var="i" begin="${pv.startPage }" end="${pv.endPage }">
					<span> <c:url var="currPage" value="board_job.do">
							<c:param name="currentPage" value="${i }" />
						</c:url> <c:choose>
							<c:when test="${i==pv.currentPage }">
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

				<c:if test="${pv.totalPage>pv.endPage }">
					<a href="board_job.do?currentPage=${pv.startPage +pv.blockPage }">&raquo;</a>
				</c:if>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<script src="main/plugin-frameworks/bootstrap.min.js"></script>
	<script src="main/plugin-frameworks/swiper.js"></script>
	<script src="main/common/scripts.js"></script>
	<!----//End-footer--->
	<!---//End-wrap---->
</body>
</html>