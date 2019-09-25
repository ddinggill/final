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
		wsocket = new WebSocket("ws://192.168.30.69:8090/gofarm/chat.do?chatcode="+chatcode+"&nickname=${loginOk.nickname}");
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
		if(data.substring(0,5) == 'users'){
			appenduserlist(data.substring(6));
		}else{
			appendMessage(data);
		}
	}
	
	function onClose(evt){
		console.log("접속종료");
	}
	
	function bootsend(){
		var nickname = "${loginOk.nickname}";
		var msg = $('.write_msg').val();
		if(msg==""){
			return false;
		}
		var d = new Date();
		var date = d.getFullYear()+'-'+(d.getMonth() + 1)+'-'+d.getDate()+' '+d.getHours()+':'+d.getMinutes()+":"+d.getSeconds();
		console.log(date);
		//wsocket.send("msg:" + nickname + ':' + msg +"${chatcode}");
		var senddate = {
				type:"chat",
				ct_nickname:nickname,
				ct_content:msg,
				ct_time:date,
				chatcode:"${chatcode}"
		}
		wsocket.send(JSON.stringify(senddate));
		//wsocket.send(nickname + ':' + msg);
		$('.write_msg').val('');
		$('.msg_history').append('<div class="outgoing_msg"><div class="sent_msg"><p>'+msg+'</p><span class="time_date">'+date+'</span> </div></div>');
		$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
	}
		
	function clearuserlist(){
		$('.users').remove();
	}
	
	function appenduserlist(userlist){
		console.log(userlist);
		var users = userlist.split(',');
		console.log(users.length);
		clearuserlist();
		for(var i=0; i<users.length; i++){
			if(users[i] =="${loginOk.nickname}"){
				console.log("내정보다"+users[i]);
			}
			else{
				console.log("users[i]: "+users[i]);
				$('.inbox_chat').append('<div class="chat_list users"><div class="chat_people"><div class="chat_img"><img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>'
						+'<div class="chat_ib">'
						+'<h5>'+users[i]+'<span class="chat_date">Other</span></h5>'
						+'<p>Test, which is a new approach to have all solutions astrology under one roof.</p>'
						+'</div></div></div>');	
			}
		}
		
	}
	
	function appendMessage(msg) {
		var msg = JSON.parse(msg);
		console.log("msg길이:"+msg.length);
		if(msg.length >=1){
			console.log("첫입장 기존내용 뿌려주기")
			for(var i=0; i<msg.length; i++){
				var ct_time = msg[i].ct_time;
				var ct_nickname = msg[i].ct_nickname;
				var ct_content = msg[i].ct_content;
				var type = msg[i].type;
				if(ct_nickname == "${loginOk.nickname}"){
					$('.msg_history').append('<div class="outgoing_msg"><div class="sent_msg"><p>'+ct_content+'</p><span class="time_date">'+ct_time+'</span> </div></div>');
					$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
				}else{
					$('.msg_history').append('<div class="incoming_msg"><img src="https://ptetutorials.com/images/user-profile.png" alt="sunil" width="6%" class="chatimg"> </div>'
							+'<div class="received_msg"><div class="received_withd_msg"><p>'+ct_nickname+":"+ct_content+'</p>'
							+'<span class="time_date">'+ct_time+'</span></div></div></div>');
					$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight); 
				}
			}
			$('.msg_history').append('<div>------------------------------------기존 채팅 내역입니다.---------------------------------</div>');
		}else{
			var ct_time = msg.ct_time;
			var ct_nickname = msg.ct_nickname;
			var ct_content = msg.ct_content;
			var type = msg.type;
			
			$('.msg_history').append('<div class="incoming_msg"><img src="https://ptetutorials.com/images/user-profile.png" alt="sunil" width="6%" class="chatimg"> </div>'
					+'<div class="received_msg"><div class="received_withd_msg"><p>'+ct_nickname+":"+ct_content+'</p>'
					+'<span class="time_date">'+ct_time+'</span></div></div></div>');
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight); 
		}
	
	}
	
	$(document).ready(function() {
		
		connect("${chatcode}");
		
		$('.write_msg').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13') {
				bootsend();
			}
			event.stopPropagation();
		});
		
		
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
<h3 class=" text-center">${roominfo.ct_title }</h3>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Userlist</h4>
            </div>
      <!--       <div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar"  placeholder="Search" >
                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span> </div>
            </div> -->
          </div>
          <div class="inbox_chat">
            <div class="chat_list active_chat">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>${loginOk.nickname } <span class="chat_date">Me</span></h5>
                  <p>Test, which is a new approach to have all solutions 
                    astrology under one roof.</p>
                </div>
              </div>
            </div>
            
            <%-- <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>${userdto.nickname } <span class="chat_date">Dec 25</span></h5>
                  <p>Test, which is a new approach to have all solutions 
                    astrology under one roof.</p>
                </div>
              </div>
            </div> --%>
            
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
      
      
      <!-- <p class="text-center top_spac"> Design by <a target="_blank" href="#">Sunil Rajput</a></p> -->
      
    </div></div>
  
  <br><br><br><br>
<!-- footer 시작-->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- footer 끝 -->
	<script src="main/plugin-frameworks/bootstrap.min.js"></script>
	<script src="main/plugin-frameworks/swiper.js"></script>
	<script src="main/common/scripts.js"></script>
</body>
</html>