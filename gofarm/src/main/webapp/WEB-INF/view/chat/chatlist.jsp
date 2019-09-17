<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓</title>

<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,700"
	rel="stylesheet">
<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/plugin-frameworks/swiper.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_content.css" rel="stylesheet">
<link href="chat/css/login.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
<style type="text/css">
body{
	background-color : #A2BBCA;
}
</style>

<script type="text/javascript">
	var wsocket;
	
	$(document).ready(function(){
		
		$(".join").click(function(){
			console.log($(this).parents("tr").children("#chatcode").val());
			connect($(this).parents("tr").children("#chatcode").val());
			//window.location.href="chatjoin.do?chatcode="+$(this).parents("tr").children("#chatcode").val();
		});
	});
	
	function connect(num) {
		var chatcode = num;
		console.log("chatcode: "+chatcode);
		wsocket = new WebSocket("ws://192.168.30.69:8090/gofarm/chat.do?chatcode="+chatcode);
		//연결되면 호출되는 함수
		wsocket.onopen = onOpen;
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		wsocket.onmessage = onMessage;
		//연결종료되면 호출되는 함수
		wsocket.onclose = onClose;
		
		$('#message').attr('disabled',false);
	}
	
	function onOpen(evt) {
		console.log("접속성공");
		/* var msg = 'msg:[' + $('#nickname').val() + '입장!]'+'${num}';
		wsocket.send(msg); */
	}
	
	function onMessage(evt){
		console.log("메시지수신");
		var data = evt.data;
		console.log(data);
	}
	
	function onClose(evt){
		console.log("접속종료");
	}
</script>
</head>
<body>
<%-- <a href="${pageContext.request.contextPath}/chat.do?num=1">1번방 채팅하러가자</a>
<a href="${pageContext.request.contextPath}/chat.do?num=2">2번방 채팅하러가자</a>
<a href="${pageContext.request.contextPath}/chat.do?num=3">3번방 채팅하러가자</a> --%>
<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
<br><br><br><br><br><br><br>
<div class="mb-3">
	<input type="button" id="croom" onclick="location.href='createroomform.do'" value="채팅방 만들기">
</div>
<table>
	<c:forEach items="${roomlist}" var="dto">
		<tr>
			<input type="hidden" value="${dto.chatcode }" id="chatcode">
			<input type="hidden" value="${dto.usercode }">
			<input type="hidden" value="${dto.ct_title }">
			<input type="hidden" value="${dto.ct_limit }">
			<th>${dto.ct_title}</th>
			<td><input type="button" value="참가하기" class="join"></td>
		</tr>
	</c:forEach>
</table>

<br><br><br><br><br><br><br>
<!-- footer 시작-->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- footer 끝 -->

</body>
</html>