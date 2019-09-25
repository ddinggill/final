<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pinball Website Template | single-page :: w3layouts</title>
<link href="board/index/css/style.css" rel='stylesheet' type='text/css' />
<!-- main -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_nav.css" rel="stylesheet">


<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>
<script src="main/plugin-frameworks/bootstrap.min.js"></script>
<script src="main/plugin-frameworks/swiper.js"></script>
<script src="main/common/scripts.js"></script>
<!-- end -->


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="board/index/images/fav-icon.png" />
<!----webfonts---->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!----//webfonts---->
<script type="text/javascript">
	$(document).ready(function() {

		//게시물 삭제 버튼
		$('#delete').on('click', deleteRun);

	});

	function deleteRun() {
		$('#frm').attr('action', "notice_del.do").submit();

	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
	<!---start-content---->
	<div class="container">
		<div class="content">
			<div class="wrap">
				<div class="single-page">
					<div class="single-page-artical">
						<h2 id="cont"
							style="font: 700 35px/28px 'Open Sans', sans-serif; color: #363636; text-align: left; padding: 1em 0 0.5em;">Content</h2>


						<div class="a1">
							<span
								style="font: 600 20px/28px 'Open Sans', sans-serif; color: #363636; text-align: left; padding: 1em 0 0.5em;">글제목:</span>
							<span
								style="font: 600 20px/28px 'Open Sans', sans-serif; color: #363636; text-align: left; padding: 1em 0 0.5em;">${dto.n_title}</span>
						</div>
						<div class="a2">
							<span
								style="font: 600 20px/28px 'Open Sans', sans-serif; color: #363636; text-align: left; padding: 1em 0 0.5em;">작성자:</span>
							<span
								style="font: 600 20px/28px 'Open Sans', sans-serif; color: #363636; text-align: left; padding: 1em 0 0.5em;">${dto.nickname }</span>
						</div>

						<div class="content"
							style="border: 1px solid gray; margin-top: 70px;">
							${fn:replace(dto.content, replaceChar, "<br/>")}</div>

						<div class="file">${dto.n_file}</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<form name="frm" id="frm" method="get">

		<div class="artical-commentbox" align="center" style="height: 40px;">
			<div class="table-form">
				<input type="hidden" name="noticecode" value="${dto.noticecode}"
					id="noticecode" /> <input type="hidden" name="currentPage"
					id="currentPage" value="${currentPage}" />
				<c:choose>
					<c:when test="${ sessionScope.loginOk.usercode eq dto.usercode}">

						<a><input type="submit" id="delete" value="글삭제" /></a>
					</c:when>
				</c:choose>

				<input type="hidden" name="usercode" id="usercode"
					value="${dto.usercode }"> <input type="hidden"
					name="up_file" value="${dto.n_file}" />
			</div>
		</div>

	</form>

	<div class="footer">
		<p>
			Design by <a href="http://w3layouts.com/">W3layouts</a>
		</p>
	</div>
	<!----//End-footer--->
	<!---//End-wrap---->


	<!-- SCIPTS -->


	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!----//End-footer--->
</body>
</html>