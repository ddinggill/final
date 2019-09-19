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



<body style="background-color: #FDF5E6;">

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>



	<div class="container"
	style="margin-top: 200px; margin-bottom: 200px;">
		<div class="main" id="main">
			<span style="color: black; font-size: 25px; margin-bottom: 10px;">인력정보&nbsp;&nbsp;<i
				class="arrow right"></i></span> <span
				style="color: black; font-size: 25px; margin-bottom: 10px;">&nbsp;&nbsp;<strong>
					인력 정보</strong></span>
		</div>

		<table class="table">

			<tr>
				<td class="t1">이름</td>
				<td class="t2">${dto.js_name}</td>
				<td class="t1">등록일</td>
				<td class="t2">${dto.js_registration}</td>

			</tr>

			<tr>
				<td class="t1">사는 지역</td>
				<td class="t2">${dto.js_address}</td>
				<td class="t1">희망 연봉</td>
				<td class="t2">${dto.js_salary}</td>

			</tr>

			<tr>
				<td class="t1">가능 작물</td>
				<td class="t2">${dto.js_crop }</td>
				<td class="t2"></td>
				<td class="t2"></td>
			</tr>
			<tr>
				<td class="t1" colspan="5">경력사항</td>
			</tr>
			<tr>
				<td class="t2" colspan="5"><c:forEach var="car" items="${car}">
							<div class="career" style="border-bottom: 1px solid #E6E6E6;">
							<p>회사명 : ${car.career}</p>
							<p>입사일 : ${car.startdate}</p>
							<p>퇴사일 : ${car.enddate}</p>
							</div>							
						</c:forEach>
						</td>
			</tr>

			<tr>
				<td class="t1" colspan="5">상세소개</td>
			</tr>
			
			<tr>
				<td class="t2" colspan="5">${dto.js_intro}</td>
			</tr>
		</table>



		<%-- 
   <div class="memo">
      <p class="memo_title">우대 사항</p>
      ${dto.j_Preferential}
   </div> --%>
	<div class="btn" align="right">
		<a href="personsearch.do"><input type="button" value="목록가기" class="btn btn-success" /></a>
	</div>
	<form name="frm" id="frm" method="get">
		<input type="hidden" name="jobsearchcode" value="${dto.jobsearchcode}" />
		<input type="hidden" name="currentPage" id="currentPage"
			value="${currentPage}" /> 
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