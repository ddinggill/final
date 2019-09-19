<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,700"
	rel="stylesheet">
<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/plugin-frameworks/swiper.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_content.css" rel="stylesheet">
<link href="user/css/login.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function(){
	//console.log(1);
	if("${loginCheck}" == "fail"){
		 alert("로그인 실패했습니다 다시 입력하세요");
	}
	
	$(".kakao").click(function(){
		console.log("카카오로그인 클릭");
		window.location.href="kakaologin.do";
	});
	
	$(".naver").click(function(){
		console.log("네이버로그인 클릭");
		window.location.href="naverlogin.do";
	});
	
	$("#join").click(function(){
		console.log("join")
		window.location.href = "signup.do";
		return false;
	});
});

</script>
</head>
<body>

<jsp:include page="/WEB-INF/view/common/main_nav.jsp" />
<br><br><br><br><br><br><br>



<div id="login-box">
 <form action="loginpro.do" method="post">
  <div class="left">
    <h2>로그인</h2>
   <br/>
   <br/>
   
    <input type="text" name="userid" placeholder="ID" />
    <input type="password" name="userpw" placeholder="PASSWORD" />
 
    
    <input type="submit" name="signup_submit" value="로그인" />
    <input type="submit" name="signup_submit" id="join" value="회원가입" />
  </div>
  </form>
  <div class="right">
    <span class="loginwith">소셜 로그인</span> 
    
    <button class="social-signin naver">네이버 로그인</button>
    <button class="social-signin kakao">카카오 로그인</button>
   
  </div>
  <div class="or">OR</div>
</div>
<br><br><br><br><br><br><br>
<jsp:include page="/WEB-INF/view/common/footer.jsp" />

<script src="main/plugin-frameworks/bootstrap.min.js"></script>
<script src="main/plugin-frameworks/swiper.js"></script>
<script src="main/common/scripts.js"></script>
</body>
</html>