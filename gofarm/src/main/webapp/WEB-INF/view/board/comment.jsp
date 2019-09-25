<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="board/index/css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="text/javascript">
$(document).ready(function(){
	//댓글 등록 버튼
	$('#c_addbtn').on('click',reply_list);
})

//댓글 저장 기능
function reply_list(){
	
	if($('newReplyText').val()==''){
		alert("댓글 내용을 입력하세요.");
		return false;
	}
	
	var form_data= new FormData();
	form_data.append('boardcode',1);
	form_data.append('content',$('newReplyText').val());
	
	
	
	$.ajax({
		type 		: 'POST', 
		dataType 	: 'json', 
		url 		: 'cinsertList.do', 
		data 		: form_data, 
		contentType : false, 
		enctype 	: 'multipart/form-data', 
		processData : false, 
		success 	: reply_list_result 
		
	})
	
}

function reply_list_result (res){
	
	/* $('.timeline').remove();
	$.each(res, function(index, value) {
		var source 	= 	'<li class="time_sub" id="{{rno}}">'
			+		'<p>{{replyer}}</p>'
			+		'<p id="{{rno}}text">{{replytext}}</p>'
			+		'<p>{{newDate regdate}}</p>';

	});		 */
	alert("오류입니다");
	
}


</script>
</head>
<body>
<div class="comment-section">
				<div class="grids_of_2">
					<h2>Comments</h2>
					<div class="grid1_of_2">
						<div class="grid_img">
							<a href=""><img src="images/pic10.jpg" alt=""></a>
						</div>
						<div class="grid_text">
							<h4 class="style1 list"><a href="#">Uku Mason</a></h4>
							<h3 class="style">march 2, 2013 - 12.50 AM</h3>
							<p class="para top"> All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>
							<a href="" class="btn1">Click to Reply</a>
						</div>
						<div class="clear"></div>
					</div>
					<!-- 댓글 출력시작 -->
					<ul class = "timeline">
					<c:forEach items="${BoardDTO.replyList}" var="rdto">
					<div class="grid_text">
							<h4 class="style1 list"><a href="#">${rdto.usercode}</a></h4>
							<h3 class="style">${rdto.com_day }</h3>
							<p class="para top">${rdto.content }</p>
							<a href="" class="btn1"> 댓글등록</a>
						</div>
					

					</c:forEach>
					</ul>
					
					<div class="grid1_of_2">
						<div class="grid_img">
							<a href=""><img src="images/pic12.jpg" alt=""></a>
						</div>
						<div class="grid_text">
							<h4 class="style1 list"><a href="#">Ro Kanth</a></h4>
							<h3 class="style">march 2, 2013 - 12.50 AM</h3>
							<p class="para top"> All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>
							<a href="" class="btn1">Click to Reply</a>
						</div>
						<div class="clear"></div>
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
							<div class="clear"> </div>
				  		</div>			
					</div>
			</div>
</body>
</html>