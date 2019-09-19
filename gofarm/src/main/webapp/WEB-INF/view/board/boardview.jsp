<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Pinball Website Template | single-page :: w3layouts</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="board/index/css/style.css" rel='stylesheet' type='text/css' />
<!-- main -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_nav.css" rel="stylesheet">
<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>

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
$(document).ready(function(){
   //댓글 등록 버튼
   $('#c_addbtn').on('click',reply_list);
   
})

//댓글 저장 기능
function reply_list(){
   
   if($('#newReplyText').val()==''){
      alert("댓글 내용을 입력하세요.");
      return false;
   }
   var form_data= new FormData();
   form_data.append('boardcode',$('#coco').val());
   form_data.append('content',$('#newReplyText').val());
   
   
   $.ajax({
      type       : 'POST', 
      dataType    : 'json', 
      url       : 'cinsertList.do', 
      data       : form_data, 
      contentType : false, 
      processData : false, 
      success    : reply_list_result
      
   })
   
}

function reply_list_result (res){
   
   location.href='/gofarm/board_view.do?currentPage='+$('#currentPage').val()+'&boardcode='+$('#coco').val();
   
}


</script>

<!----//End-dropdown--->
</head>
<body>
	<!---start-wrap---->

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
	<!---start-content---->
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<div class="single-page-artical">
					<h2 id="cont"
						style="font: 400 30px/28px 'Open Sans', sans-serif; color: #363636; text-align: left; padding: 1em 0 0.5em;">Content</h2>

					<div class="artical-content">
						<span>글제목:</span> <span>${dto.b_title}</span>
					</div>

					<div class="content"
						style="border: 1px solid gray; margin-top: 20px;">
						${dto.content }</div>
				</div>
				<!---start-comments-section--->
				<!-- 댓글 리스트 출력 시작 -->

				<div class="comment-section">
					<div class="grids_of_2">
						<h2>Comments</h2>
						<div class="grid1_of_2">
							<!-- 댓글 출력시작 -->
							<ul class="timeline">
								<c:forEach items="${cdto}" var="rdto">

									<div class="grid_text">
										<h5 class="style1 list">
											<a href="#">작성자: ${rdto.nickname }</a>
										</h5>
										<h3 name="commentInsertForm" class="style">${rdto.com_day}</h3>
										<p class="para top">${rdto.content}</p>
										<a href="" class="btn1"> 댓글삭제</a>
									</div>
									<div class="clear">
										<hr>
									</div>
								</c:forEach>
							</ul>

						</div>
						<!-- 댓글 입력 시작 -->
						<div class="artical-commentbox">
							<h2>Leave a Comment</h2>
							<div class="table-form">
								<form action="#" method="post" name="post_comment">
									<div>

										<label for="newReplyText">Your Comment<span>*</span></label>
										<textarea id="newReplyText" placeholder="댓글 내용"> </textarea>

									</div>
								</form>
								<input id="c_addbtn" type="submit" value="댓글 등록">
							</div>
							<div class="clear"></div>
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
		<form name="frm" id="frm" method="post" action="board.do">
			<input type="hidden" name="boardcode" value="${dto.boardcode}"
				id="coco" /> <input type="hidden" name="currentPage"
				id="currentPage" value="${currentPage}" /> <input type="hidden"
				name="usercode" id="usercode" value="${dto.usercode }">
		</form>

		<!-- SCIPTS -->


		<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
		<!----//End-footer--->
		<script src="main/plugin-frameworks/bootstrap.min.js"></script>
		<script src="main/plugin-frameworks/swiper.js"></script>
		<script src="main/common/scripts.js"></script></body>
</html>
