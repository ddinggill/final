<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>


<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_nav.css" rel="stylesheet">

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

.noticelistheader {
	background-color: #2e2e2e;
	color: white;
	font-size: 18px;
	font-weight: bolder;
}

.noticelistrow {
	background-color: white;
}

.noticelistrow:hover {
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
					<span style="color: black; font-size: 25px; margin-bottom: 10px;">공지&nbsp;&nbsp;<i
						class="arrow right"></i></span> <span
						style="color: black; font-size: 25px; margin-bottom: 10px;">&nbsp;&nbsp;<strong>공지
							리스트</strong></span>
				</div>

				<table class="table">

					<tr class="noticelistheader">
						<td class="cell">&nbsp;</td>
						<td class="cell">글 번호 &nbsp;</td>
						<td class="cell">작성자 &nbsp;</td>
						<td class="cell">공지 제목&nbsp;</td>
						<td class="cell">등록일 &nbsp;</td>
					</tr>

					<c:forEach var="dto" items="${pList}">

						<c:url var="path" value="notice_view.do">
							<c:param name="currentPage" value="${pd.currentPage }" />
							<c:param name="noticecode" value="${dto.noticecode}" />
						</c:url>
						<tbody>
							<tr class="noticelistrow"
								onclick="javascript:location.href='${path}'">
								<th>&nbsp;</th>
								<th>${dto.noticecode}</th>
								<th>관리자</th>
								<th>${dto.n_title}</th>
								<th>${dto.n_day}</th>
							</tr>
						</tbody>
					</c:forEach>
				</table>




				<form name="frm" id="frm" method="get">
					<div class="artical-commentbox">
						<div class="table-form" style="float: right;">
							<input type="hidden" name="noticecode" value="${dto.noticecode}"
								id="coco" /> <input type="hidden" name="currentPage"
								id="currentPage" value="${currentPage}" />
							<c:choose>
								<c:when test="${ sessionScope.loginOk.userlvl eq 3}">
									<div align="right">
										<a href="notice_write.do"><input type="button" value="글쓰기"
											class="btn "
											style="cursor: pointer; background-color: #6495ED" /></a>
									</div>

								</c:when>
							</c:choose>

							<input type="hidden" name="usercode" id="usercode"
								value="${dto.usercode }">
						</div>
					</div>

				</form>



				<!-- 이전 출력 시작 -->
				<div class="pageList" align="center">
					<c:if test="${pd.startPage >1 }">
						<a href="notice.do?currentPage=${pd.startPage-pd.blockPage }">이전</a>
					</c:if>
					<!-- 이전 출력끝 -->



					<!-- 페이지 출력시작 -->
					<c:forEach var="i" begin="${pd.startPage }" end="${pd.endPage }">
						<span> <c:url var="currPage" value="notice.do">
								<c:param name="currentPage" value="${i }" />
							</c:url> <c:choose>
								<c:when test="${i==pd.currentPage }">
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

					<c:if test="${pd.totalPage>pd.endPage }">
						<a href="notice.do?currentPage=${pd.startPage +pd.blockPage }">다음</a>
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