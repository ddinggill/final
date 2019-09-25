<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
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
		//댓글 등록 버튼
		$('#c_addbtn').on('click', reply_list);
		//게시물 수정 버튼
		$('#update').on('click', updateRun);
		//게시물 삭제 버튼
		$('#delete').on('click', deleteRun);

		$('#c_upbtn').on('click', reply_list_result);

		function updateRun() {
			$('#bfrm').attr('action', "board_up.do").submit();
		}

		function deleteRun() {
			$('#bfrm').attr('action', "board_del.do").submit();

		}

		//댓글 삭제버튼
		$('.btn1').on('click', function() {
			var commentcode = $(this).prev().attr('id');
			console.log(commentcode);

			var form_data = new FormData();
			form_data.append('commentcode', commentcode);

			$.ajax({
				type : 'POST',
				url : 'cDelate.do',
				data : form_data,
				contentType : false,
				processData : false,
				success : reply_list_result,

			});

		});

		//댓글 수정 버튼
		$('.btn2').on('click', function() {
			var text = $(this).prev().prev().text();
			var commentcode = $(this).prev().prev().attr('id');
			$('#newReplyText').text(text);
			$('#c_addbtn').on('click', function() {
				alert("수정 버튼을 누르세요");
				return false;
			})

			$('#c_upbtn').on('click', function() {
				var form_data = new FormData();
				form_data.append('commentcode', commentcode);
				form_data.append('content', $('#newReplyText').val());

				$.ajax({
					type : 'POST',
					dataType : 'json',
					url : 'cUpdate.do',
					data : form_data,
					contentType : false,
					processData : false,
					success : reply_list_result
				});

			});
		});

	
		
	})

	function updateRun() {
		$('#frm').attr('action', "board_up.do").submit();
	}

	//댓글 저장 기능
	function reply_list() {
		if ($('#newReplyText').val() == '') {
			console.log($('#newReplyText').val());
			alert("댓글 내용을 입력하세요.");
			return false;
		}
		var form_data = new FormData();
		form_data.append('boardcode', $('#coco').val());
		form_data.append('content', $('#newReplyText').val());

		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'cinsertList.do',
			data : form_data,
			contentType : false,
			processData : false,
			success : reply_list_result

		})

	}

	function reply_list_result(res) {

		location.href = '/gofarm/board_view.do?currentPage='
				+ $('#currentPage').val() + '&boardcode=' + $('#coco').val();

	}
</script>

<style type="text/css">
#update { .
	position: relative;
	margin-top: 20px;
	border: 1px solid black;
}

.test{
	width: 100%;
	height: 500px;
}
</style>

<!----//End-dropdown--->
</head>
<body style="background-color: #FFFAF0;">
	<!---start-wrap---->

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
	<!---start-content---->
	<div class="container">
		<div class="content">
			<div style="background-color: #FFFAF0;" class="wrap">


				<div class="single-page"
					style="background-color: #FFFAF0; border: 1px solid black ; ">
					<h2 id="replycntSmall">Content</h2>
					<hr>
					<div class="single-page-artical">



						<div class="a1">
							<span
								style="font: 600 20px/28px 'Open Sans', sans-serif; color: #363636; text-align: left; padding: 1em 0 0.5em;">글제목:</span>
							<span
								style="font: 600 20px/28px 'Open Sans', sans-serif; color: #363636; text-align: left; padding: 1em 0 0.5em;">${dto.b_title}</span>
						</div>
						<div class="a2">
							<span
								style="font: 600 15px/20px 'Open Sans', sans-serif; color: #363636; text-align: left; padding: 1em 0 0.5em;">작성자:</span>
							<span
								style="font: 600 15px/20px 'Open Sans', sans-serif; color: #363636; text-align: left; padding: 1em 0 0.5em;">${dto.nickname }</span>
						</div>
						<div class="content" style="border: 1px solid gray; margin-top: 70px;">
							<div class="test">${dto.content }</div>
						</div>

						<div class="file">${dto.b_file}</div>
					</div>
				</div>



				<form name="bfrm" id="bfrm" method="get">
					<div class="artical-commentbox">
						<div class="table-form" style="float: right;">
							<input type="hidden" name="boardcode" value="${dto.boardcode}"
								id="coco" /> <input type="hidden" name="currentPage"
								id="currentPage" value="${currentPage}" />
							<c:choose>
								<c:when test="${ sessionScope.loginOk.usercode eq dto.usercode}">
									<a><input type="submit" id="update" value="글수정" /></a>
									<a><input type="submit" id="delete" value="글삭제" /></a>
								</c:when>
							</c:choose>

							<input type="hidden" name="usercode" id="usercode"
								value="${dto.usercode }"> <input type="hidden"
								name="up_file" value="${dto.b_file}" />
						</div>
					</div>

				</form>

				<!---start-comments-section--->
				<!-- 댓글 리스트 출력 시작 -->

				<div class="comment-section">
					<div class="grids_of_2">
						<h2 id="replycntSmall">Comments [ ${fn:length(cdto)} ]</h2>
						<hr>
						<div class="grid1_of_2">
							<!-- 댓글 출력시작 -->
							<ul class="timeline">
								<c:forEach items="${cdto}" var="rdto">
									<div class="grid_text">
										<h5 class="style1 list">
											<a href="#">작성자: ${rdto.nickname }</a>
										</h5>
										<h3 name="commentInsertForm" class="style">${rdto.com_day}</h3>
										<p class="para top" id="${rdto.commentcode }">${rdto.content}</p>
										<c:choose>
											<c:when
												test="${sessionScope.loginOk.nickname eq rdto.nickname}">
												<a class="btn1">댓글 삭제 &nbsp;</a>
												<a class="btn2"
													style="width: 100px; height: 35px; font-size: 12.25px">
													<img src="board/index/images/blog-icon3.png"
													title="Comments"
													style="width: 21px; height: 15px; padding: 0px 6px 0px 0px;">
													댓글 수정
												</a>
											</c:when>
										</c:choose>

									</div>
									<div class="clear">
										<hr>
									</div>
								</c:forEach>
							</ul>

						</div>
						<!-- 댓글 입력 시작 -->
						<div class="artical-commentbox">
							<h2>댓글 등록</h2>

							<div class="table-form">
								<form action="#" method="post" name="post_comment">
									<div>

										<label for="newReplyText">Your Comment<span>*</span></label>
										<textarea id="newReplyText" placeholder="댓글 내용"></textarea>

									</div>
								</form>
								<a><input id="c_addbtn" type="submit" value="댓글 등록"></a>
								<a><input id="c_upbtn" type="submit" value="수정 완료"></a>
							</div>
							<div class="clear"></div>
						</div>


					</div>
				</div>

			</div>


		</div>
	</div>
	<!----start-footer--->
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