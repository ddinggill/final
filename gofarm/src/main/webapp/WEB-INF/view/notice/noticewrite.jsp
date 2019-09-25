<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="joblist/vendor/jquery/jquery-3.2.1.min.js"></script>
<link ref="stylesheet" href="personform/css/style.css">

<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_nav.css" rel="stylesheet">


<script type="text/javascript">
	$(document).ready(
			function() {
				$('frm').on(
						'submit',
						function() {
							//입력한 내용의 엔터가 있으면 br로 줄바꿈
							$('[name=content]').val(
									$('[name=content]').val().replace(/\n/gi,
											'<br/>'));

						});

				console.log(result);
			});
</script>
<style type="text/css">
table {
	border-collapse: separate;
	border-spacing: 0 20px;
}

.tt {
	width: 200px;
}

tr {
	margin-bottom: 20px;
}

.aa {
	width: 65%;
}
</style>
</head>
<body style="background-color: #A2BBCA;">
	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>

	<section class="ftco-section" style="margin-top: 100px">
		<div class="container" id="write"
			style="background-color: #FFFAF0; padding: 20px">


			<h2>공지 게시판</h2>
			<form name="frm" method="post" action="writeOK.do"
				enctype="multipart/form-data">
				<table>


					<tr>
						<td class="tt" align="center">공지 제목</td>
						<td class="aa"><input type="text" name="n_title"
							class="n_title" required="required" style="width: 100%;" /></td>
					</tr>
					<tr>
						<td class="tt" align="center">공지 내용</td>
						<td class="aa"><textarea id="content" name="content"
								required="required" style="width: 100%; height: 415px;"></textarea></td>
					</tr>

					<tr>
						<th>첨부파일<input type="file" name="up_file" id="n_file" /></th>

					</tr>

				</table>
				<div id="btn" style="margin-left: 450px;">
					<input type="submit" class="btn btn-black py-3 px-5" value="글쓰기" />
					<input type="reset" value="취소" class="btn btn-black py-3 px-5" />
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