<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!--===============================================================================================-->

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

.t1 {
	background-color: #2e2e2e;
	color: white;
	font-weight: bolder;
	text-align: center;
}
.t2{
	background-color: white;
	text-align: center;
}

table {
	border: 1px solid #8c8c8c;
}


</style>
</head>



<body style="background-color: #e6eff2;">

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>


	<div class="container" style="margin-top: 200px; margin-bottom: 200px;">
		<div class="main" id="main">
			<span style="color: black; font-size: 25px; margin-bottom: 10px;">채용정보&nbsp;&nbsp;<i
				class="arrow right"></i></span> <span
				style="color: black; font-size: 25px; margin-bottom: 10px;">&nbsp;&nbsp;<strong>
					채용 정보</strong></span>
		</div>

		<table class="table">


			<tr>
				<td class="t1">회사명</td>
				<td class="t2">${dto.j_company}</td>
				<td class="t1">등록일</td>
				<td class="t2">${dto.j_registration}</td>

			</tr>

			<tr>
				<td class="t1">근무지역</td>
				<td class="t2">${dto.j_area}</td>
				<td class="t1">마감일</td>
				<td class="t2">${dto.j_deadline}</td>

			</tr>

			<tr>
				<td class="t1">모집인원</td>
				<td class="t2">${dto.j_recruitment }</td>
				<td class="t1">경력</td>
				<td class="t2">${dto.j_career}</td>

			</tr>

			<tr>
				<td class="t1">성별</td>
				<td class="t2">${dto.j_gender}</td>
				<td class="t1">구인연령</td>
				<td class="t2">${dto.j_age}</td>

			</tr>
			
			<tr>
				<td class="t1">모집 업종</td>
				<td class="t2">${dto.j_type}</td>
				<td class="t1">우대사항</td>
				<td class="t2">${dto.j_preferential}</td>

			</tr>

			<tr>
				<td class="t1">작업 기간</td>
				<td class="t2">${dto.j_term}</td>
				<td class="t1">지원 정보</td>
				<td class="t2">${dto.j_info}</td>


			</tr>

			<tr>

				<td class="t1">작업지 주소</td>
				<td class="t2">${dto.j_address}</td>
				<td class="t2"></td>
				<td class="t2"></td>
			</tr>
			
			
			<tr>
				<td class="t1" colspan="4">상세내용</td>
			</tr>
			<tr>
				<td class="t2" colspan="4">${dto.content }</td>
			</tr>

		</table>
	<!-- <div class="btn">

		<input type="submit" class="btn btn-success" id="jobrequest"
			value="신청하기 " /> <a href="jobsearch.do"><input type="button"
			value="목록가기" class="btn btn-success" /></a>
	</div> -->
	
	<form name="frm" id="frm" method="post" action="jobrequest.do">
		<input type="hidden" name="job" value="${dto.job}" /> <input
			type="hidden" name="currentPage" id="currentPage"
			value="${currentPage}" /> <input type="hidden" name="usercode"
			value="${dto.usercode }">
		<input type="submit" class="btn btn-success" id="jobrequest"
			value="신청하기 " /> <a href="jobsearch.do"><input type="button"
			value="목록가기" class="btn btn-success" /></a>
	</form>
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