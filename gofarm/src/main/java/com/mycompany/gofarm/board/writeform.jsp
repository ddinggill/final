<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



<!-- 스마트 에디터 적용 -->
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

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
					form_data.append('file', file);
					$.ajax({
						data : form_data,
						type : 'POST',
						url : 'http://localhost:8090/gofarm4/write.do',
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
			<h2>자유 게시판 글</h2>
			<form method="post" enctype="multipart/form-data"
				action="personformOK.do">
				<table>

					<tr>
						<td align="center">글 제목</td>
						<td><input type="text" name="b_type" class="b_type"
							required="required" /></td>
					</tr>


					<tr>
						<td align="center">카테고리</td>
						<td><select name="b_thema">
								<option value="구인구직">구인구직</option>
								<option value="판매경매">판매경매</option>
								<option value="사담">사담</option>
								<option value="나눔">나눔</option>
						</select></td>
					</tr>
					<tr>
						<td align="center">내용</td>
						<td><textarea id="summernote" name="content"></textarea></td>
					</tr>

					<tr>
						<th>첨부파일<input type="file" name="b_img" id="b_img" /></th>

					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							class="btn btn-black py-3 px-5" value="글쓰기" /> <input
							type="reset" value="취소" class="btn btn-black py-3 px-5" /></td>
					</tr>
				</table>

			</form>

			<input id="check" type="button" name="check" value="제발 확인 성공해줘">
		</div>
	</section>


	<!-- SCIPTS -->

	<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>

	<script src="main/plugin-frameworks/bootstrap.min.js"></script>

	<script src="main/plugin-frameworks/swiper.js"></script>


	<script src="main/common/scripts.js"></script>
</body>


</html>