<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>



<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>
<script src="main/plugin-frameworks/bootstrap.min.js"></script>
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_nav.css" rel="stylesheet">





<!-- 스마트 에디터 적용 -->
<!--  include libraries(jQuery, bootstrap)-->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>


<style type="text/css">
div.container {
	margin-top: 50px;
}

h2 {
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
}

table {
	width: 100%;
}

td {
	font-family: 'Nanum Gothic Coding', monospace;
}

h2 {
	margin-bottom: 50px;
	font-family: 'Nanum Gothic Coding', monospace;
}

.subject, .content {
	width: 100%;
	border: solid 1px #BDBDBD;
}

.ttt {
	width: 200px;
}
</style>

<script>
	$(document).ready(
			function() {

				$('#summernote').summernote({
					placeholder : 'content',
					minHeight : 600,
					maxHeight : null,
					focus : true,
					lang : 'Ko-KR',
					callbacks : {
						onImageUpload : function(files, editor, welEditable) {
							for (var i = files.length - 1; i >= 0; i--) {
								sendFile(files[i], this);

							}

						}

					}

				});
				function sendFile(file, el) {
					var form_data = new FormData();
					var address = '<%=request.getServerName()+":"+request.getServerPort()%>';
					form_data.append('file', file);
					$.ajax({
						data : form_data,
						type : 'POST',
						url : 'http://'+address+'/gofarm/writeform.do',
						cache : false,
						contentType : false,
						processData : false,
						dataType : 'json',
						enctype : 'multipart/form-data',
						success : function(result) {

							var filePath = '/gofarm/profileUpload/'
									+ result.image_name;
							console.log(filePath);
							$(el).summernote('editor.insertImage', filePath);
						}
					});

				}

				$('#check').on('click', function() {
					var ss = $('#summernote').val();
					alert(ss);
				});
			});
</script>
</head>
<body style="background-color: #A2BBCA;">

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>

	<section class="ftco-section">
		<div class="container" id="write"
			style="background-color: #FFFAF0; padding: 20px">
			<h2 style="">채용 정보 등록하기</h2>
			<form name="frm" method="post" enctype="multipart/form-data"
				action="personformOK.do">
				<table>

					<tr>
						<td class="ttt" align="center">모집업종</td>
						<td><input type="text" name="j_type" class="j_type"
							required="required" placeholder="작물이름" /></td>
					</tr>
					<tr>
						<td class="ttt" align="center">회사명</td>
						<td><input type="text" name="j_company" class="j_company"
							required="required" /></td>
					</tr>

					<tr>
						<td class="ttt" align="center">마감일</td>
						<td><input type="date" name="j_deadline" class="j_deadline"
							required="required" /></td>
					</tr>

					<tr>
						<td class="ttt" align="center">근무지역</td>
						<td><select name="j_area">
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
						</select></td>
					</tr>
					<tr>
						<td class="ttt" align="center">작업지주소</td>
						<td><input type="text" name="j_address" class="j_address"
							required="required" /></td>
					</tr>
					<tr>
						<td class="ttt" align="center">모집인원</td>
						<td><input type="text" name="j_recruitment"
							class="j_recruitment" required="required" placeholder="ex)3" /></td>
					</tr>

					<tr>
						<td class="ttt" align="center">성별</td>
						<td><input type="radio" name="j_gender" value="남">남자
							<input type="radio" name="j_gender" value="여">여자
							<input type="radio" name="j_gender" value="무관" checked="checked">성별무관
						</td>
					</tr>

					<tr>
						<td class="ttt" align="center">구인연령</td>
						<td><input type="text" name="j_age" class="j_age"
							required="required" placeholder="ex)20대" /></td>
					</tr>
					<tr>
						<td class="ttt" align="center">경력</td>
						<td><select name="j_career">
								<option value="무관">무관</option>
								<option value="경력">경력</option>
								<option value="신입">신입</option>
						</select></td>
					</tr>
					<tr>
						<td class="ttt" align="center">우대사항</td>
						<td><input type="text" name="j_preferential"
							class="j_preferential" required="required" placeholder="ex)경력직" /></td>
					</tr>
					<tr>
						<td class="ttt" align="center">지원정보</td>
						<td><input type="text" name="j_info" class="j_info"
							required="required" placeholder="ex)중식제공" /></td>
					</tr>
					<tr>
						<td class="ttt" align="center">문의전화</td>
						<td><input type="text" name="j_contact" class="j_contact"
							required="required" placeholder="ex)02-1234-5678" /></td>
					</tr>
					<tr>
						<td class="ttt" align="center">작업기간</td>
						<td><input type="text" name="j_term" class="j_term"
							required="required" placeholder="ex)3주,5일" /></td>
					</tr>
					<tr>
						<td class="ttt" align="center">내용</td>
						<td><textarea id="summernote" name="content"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							class="btn btn-black py-3 px-5" value="글쓰기" /> <input
							type="reset" value="취소" class="btn btn-black py-3 px-5" /></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<script src="main/plugin-frameworks/swiper.js"></script>
	<script src="main/common/scripts.js"></script>


</body>
</html>