<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 작성</title>

<script src="joblist/vendor/jquery/jquery-3.2.1.min.js"></script>
<link ref="stylesheet" href="personform/css/style.css">

<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_nav.css" rel="stylesheet">

<style type="text/css">
div.container {
	margin-top: 50px;
}

h2 {
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
	margin-bottom: 50px;
}

.row {
	overflow: hidden;
}

.input_title {
	width: 30%;
	float: left;
	text-align: center;
	padding: 0px 0px 0px 20px;
}

/* .sub_button {
  align:left;
}  */
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var i = 0;

						//경력 추가 버튼을 눌렀을 때 폼 나오기
						$('#add_form')
								.on(
										'click',
										function() {

											var str = '<div class="add_element"><div class="row">'
													+ '<div class="input_title">경력</div><div class="resume_input">'
													+ '<input type="text" placeholder="회사명" name="list['+ i +'].career" class="career" required="required" />'
													+ '</div></div><div class="row"><div class="input_title">시작일</div>'
													+ '<div class="resume_input"><input type="date" name="list['+ i +'].startdate" class="startdate" required="required" />'
													+ '</div></div><div class="row"><div class="input_title">종료일</div>'
													+ '<div class="resume_input"><input type="date" name="list['+ i +'].enddate" class="enddate" required="required" />'
													+ '</div></div></div><hr>';

											$('.add_resume').append(str);
											i++;
											console.log(i);

										});
					});
</script>
</head>
<body style="background-color: #A2BBCA;">
	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
	<section class="ftco-section">
		<div class="container"
			style="background-color: #FFFAF0; padding: 20px">
			<h2>이력서 작성하기</h2>
			<form name="frm" method="post" action="resumeOK.do">
				<div class="container">
					<div class="row">
						<div class="input_title">희망작물</div>
						<div class="resume_input">
							<input type="text" name="js_crop" class="js_crop"
								placeholder="작물이름" required="required" />
						</div>
					</div>

					<div class="row">
						<div class="input_title">이름</div>
						<div class="resume_input">
							<input type="text" name="js_name" class="js_name"
								required="required" />
						</div>
					</div>

					<div class="row">
						<div class="input_title">희망근무기간</div>
						<div class="resume_input">
							<input type="text" name="js_time" class="js_time"
								required="required" placeholder="ex)단기,장기" />
						</div>
					</div>

					<div class="row">
						<div class="input_title">희망급여</div>
						<div class="resume_input">
							<input type="text" name="js_salary" class="js_salary"
								required="required" placeholder="ex)50000" />
						</div>
					</div>

					<div class="row">
						<div class="input_title">희망근무지역</div>
						<div class="resume_input">
							<select name="js_area">
								<option value="지역무관">지역무관</option>
								<option value="서울특별시">서울특별시</option>
								<option value="경기도">경기도</option>
								<option value="인천광역시">인천광역시</option>
								<option value="부산광역시">부산광역시</option>
								<option value="대구광역시">대구광역시</option>
								<option value="광주광역시">광주광역시</option>
								<option value="대전광역시">대전광역시</option>
								<option value="울산광역시">울산광역시</option>
								<option value="세종특별자치시">세종특별자치시</option>
								<option value="강원도">강원도</option>
								<option value="경상남도">경상남도</option>
								<option value="전라남도">전라남도</option>
								<option value="충청남도">충청남도</option>
								<option value="충청북도">충청북도</option>
								<option value="제주특별자치도">제주특별자치도</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="input_title">거주지</div>
						<div class="resume_input">
							<input type="text" name="js_address" class="js_address"
								required="required" />
						</div>
					</div>
					<div class="row">
						<div class="input_title">나이</div>
						<div class="resume_input">
							<input type="text" name="js_age" class="js_age"
								required="required" placeholder="ex)21" />
						</div>
					</div>

					<div class="row">
						<div class="input_title">성별</div>
						<div class="resume_input">
							<select name="js_gender">
								<option value="남자">남자</option>
								<option value="여자">여자</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="input_title">전화번호</div>
						<div class="resume_input">
							<input type="text" name="js_phone" class="js_phone"
								required="required" placeholder="ex)02-1234-5678" />
						</div>
					</div>
					<div class="row">
						<div class="input_title">상세정보</div>
						<div class="resume_input">
							<textarea name="js_intro" class="js_intro"></textarea>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="input_title">경력</div>
						<div class="resume_input">
							<button type="button" id="add_form" class="btn btn-black">경력
								추가</button>
						</div>
					</div>
					<br>
					<hr>
					<!-- 추가되는거 -->
					<div class="add_resume"></div>
					<!--  -->

					<hr>

					<div class="sub_button" align="right">
						<input type="submit" class="btn btn-black py-3 px-5" value="글쓰기" />
						<input type="reset" value="취소" class="btn btn-black py-3 px-5" />
					</div>
				</div>
			</form>
		</div>
	</section>
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