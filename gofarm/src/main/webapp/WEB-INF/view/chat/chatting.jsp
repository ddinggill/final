<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<!-- Chat CSS -->
<link href="chat/css/chat.css" rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
<script type="text/javascript">

	var wsocket;
	
	function connect(num) {
		var chatcode = num;
		console.log("chatcode: "+chatcode);
		wsocket = new WebSocket("ws://localhost:8090/gofarm/chat.do?chatcode="+chatcode);
		//연결되면 호출되는 함수
		wsocket.onopen = onOpen;
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		wsocket.onmessage = onMessage;
		//연결종료되면 호출되는 함수
		wsocket.onclose = onClose;
		
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
		if(data.substring(0,4) == 'msg:'){
			appendMessage(data.substring(4));
		}
	}
	
	function onClose(evt){
		console.log("접속종료");
	}
	
	function bootsend(){
		var nickname = "${loginOk.nickname}";
		var msg = $('.write_msg').val();
		wsocket.send("msg:" + nickname + ':' + msg +"${chatcode}");
		$('.write_msg').val('');
		$('.msg_history').append('<div class="outgoing_msg"><div class="sent_msg"><p>'+msg+'</p><span class="time_date"> 11:01 AM    |    June 9</span> </div></div>');
		$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
	}
		
	function appendMessage(msg) {
		$('#chatMessageArea').append(msg + '<br>');
		var chatAreaHeight = $('#chatArea').height();
		var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
		$('#chatArea').scrollTop(maxScroll);
		$('.msg_history').append('<div class="incoming_msg"><img src="https://ptetutorials.com/images/user-profile.png" alt="sunil" width="6%" class="chatimg"> </div>'
								+'<div class="received_msg"><div class="received_withd_msg"><p>'+msg+'</p>'
								+'<span class="time_date"> 11:01 AM    |    June 9</span></div></div></div>');
		$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight); 
	}
	
	$(document).ready(function() {
		
		connect("${chatcode}");
		$(".msg_send_btn").click(function(){
			bootsend();
		});
	});
	
</script>
<style type="text/css">

body{
	background-color : #FFFFFF;
}

.chatimg{
	width: 6%;
}
</style>


</head>
<body>
<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
<br><br><br><br><br><br><br>
<div class="container">
<h3 class=" text-center">Messaging</h3>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Userlist</h4>
            </div>
            <div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar"  placeholder="Search" >
                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span> </div>
            </div>
          </div>
          <div class="inbox_chat">
            <div class="chat_list active_chat">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>${loginOk.nickname } <span class="chat_date">Dec 25</span></h5>
                  <p>Test, which is a new approach to have all solutions 
                    astrology under one roof.</p>
                </div>
              </div>
            </div>
            <c:forEach items="${userlist }" var="userdto">
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>${userdto.nickname } <span class="chat_date">Dec 25</span></h5>
                  <p>Test, which is a new approach to have all solutions 
                    astrology under one roof.</p>
                </div>
              </div>
            </div>
            </c:forEach>
            
          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history">
           
           
           
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="Type a message" />
              <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
      
      
      <p class="text-center top_spac"> Design by <a target="_blank" href="#">Sunil Rajput</a></p>
      
    </div></div>
  
  <br><br><br><br><br><br><br>
<!-- footer 시작-->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- footer 끝 -->
</body>
</html>