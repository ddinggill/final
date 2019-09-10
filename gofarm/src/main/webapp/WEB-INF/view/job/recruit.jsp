<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,700"
	rel="stylesheet">
<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="recruit/recruit.css" rel="stylesheet">
<body style="background-color: #A297BD">
	<!--common 네비바 -->
	<!-- ----------------------------------------------------------------------------------- -->
		<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
	 <div style="height: 1000px; margin-top: 300px; ">


		<div class="w3-row-padding"
			style="margin: 0 350px 0 350px; height: 200px">

			<div class="w3-half">
				<div class="w3-card " style="background-color: #FFFAF0">

					<div class="w3-container">
						<h3 class="w3-text-indigo getinfo">
							&nbsp;채용 정보 <a class="w3-button w3-circle w3-large"
								href="jobsearch.do"><p class="fa fa-plus"></p></a>
						</h3>
						<hr>
						<h6 class="font_color">근무자를 찾고 있습니다</h6>
					</div>
					<ul class="w3-ul w3-border-top">

						<c:forEach var="dto" items="${aList}" varStatus="status" begin="0"
							end="3">
							<li>
								<p>${dto.j_company}</p>
								<p>The response to the animations was ridiculous</p>
							</li>
						</c:forEach>
					</ul>
					<div class="w3-container fastbutton">
							<a href="personform.do"><span class="re_title">채용정보등록 바로가기</span></a>
					</div>
				</div>
			</div>

			<div class="w3-half">
				<div class="w3-card " style="background-color: #FDF5E6;">
					<div class="w3-container">
						<h3 class="w3-text-indigo getinfo">
							&nbsp;인력 정보 <a class="w3-button w3-circle w3-large "
								href="personsearch.do"><p class="fa fa-plus"></p></a>
						</h3>
						<hr>
						<h6 class="font_color">일자리를 찾고 있습니다</h6>
					</div>
					<ul class="w3-ul w3-border-top">

						<c:forEach var="dto" items="${aList2}" varStatus="status"
							begin="0" end="4">
							<li>
								<p>${dto.js_name}</p>
								<p>The response to the animations was ridiculous</p>
							</li>
						</c:forEach>
					</ul>
					<div class="w3-container fastbutton">
						<a href="recruitform.do"><span class="re_title">인력정보등록 바로가기</span></a>
					</div>
				</div>
			</div>
		</div>

		<hr>


	</div>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>

</body>
</html>