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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Sunflower:300&display=swap');

*:focus {
	outline: none;
}

body {
	margin: 0;
	padding: 0;
	/* background: #DDD; */
	font-size: 16px;
	color: #222;
	font-family: 'Sunflower';
	font-weight: 300;
	background-image: url("images/test1.jpg");
}

#login-box {
	position: relative;
	margin: 5% auto;
	width: 600px;
	height: 800px;
	background: #FFF;
	border-radius: 2px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
	opacity: 0.8;
}

.left {
	position: absolute;
	top: 0;
	left: 0;
	box-sizing: border-box;
	padding: 40px;
	width: 300px;
	height: 400px;
}

h2 {
	margin: 0 0 20px 0;
	font-weight: bold;
}

input[type="text"], input[type="password"], input[type="email"], input[type="date"]
	{
	display: block;
	box-sizing: border-box;
	margin-bottom: 20px;
	padding: 4px;
	width: 220px;
	height: 32px;
	border: none;
	border-bottom: 1px solid #AAA;
	font-family: 'Jua';
	font-weight: 400;
	font-size: 15px;
	transition: 0.2s ease;
}

input[type="text"]:focus, input[type="password"]:focus, input[type="password"]:focus,
	input[type="date"]:focus {
	border-bottom: 2px solid #16a085;
	color: #16a085;
	transition: 0.2s ease;
}

input[type="submit"] {
	margin-top: 28px;
	width: 120px;
	height: 32px;
	background: #16a085;
	border: none;
	border-radius: 2px;
	color: #FFF;
	font-family: 'Jua';
	font-weight: 500;
	font-size: 18px;
	text-transform: uppercase;
	transition: 0.1s ease;
	cursor: pointer;
}

input[type="submit"]:hover, input[type="submit"]:focus {
	opacity: 0.8;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
	transition: 0.1s ease;
}

input[type="submit"]:active {
	opacity: 1;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
	transition: 0.1s ease;
}

.or {
	position: absolute;
	top: 330px;
	left: 280px;
	width: 40px;
	height: 40px;
	background: #DDD;
	border-radius: 50%;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
	line-height: 40px;
	text-align: center;
	font-family: 'Sunflower';
	font-weight: 400;
}

.right {
	position: absolute;
	top: 0;
	right: 0;
	box-sizing: border-box;
	padding: 40px;
	padding-top: 200px;
	width: 300px;
	height: 800px;
	background: url('https://goo.gl/YbktSj');
	background-size: cover;
	background-position: center;
	border-radius: 0 2px 2px 0;
}

.right .loginwith {
	display: block;
	margin-bottom: 40px;
	font-size: 28px;
	color: black;
	text-align: center;
}

button.social-signin {
	margin-bottom: 20px;
	width: 220px;
	height: 36px;
	border: none;
	border-radius: 2px;
	color: black;
	font-family: 'Sunflower';
	font-weight: 500;
	transition: 0.2s ease;
	cursor: pointer;
}

button.social-signin:hover, button.social-signin:focus {
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
	transition: 0.2s ease;
}

button.social-signin:active {
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
	transition: 0.2s ease;
}

button.social-signin.naver {
	background: #2DB400;
	color: black;
	font-size: 18px;
	font-weight: 600;
	font-family: 'Do Hyeon';
	opacity: 0.9;
}

button.social-signin.kakao {
	background: #F7E600;
	color: black;
	font-size: 18px;
	font-weight: 600;
	font-family: 'Do Hyeon';
	opacity: 0.9;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp" />

	<div id="login-box">
		<form action="signuppro.do" method="post">
			<div class="left">
				<h2>회원정보</h2>
				<br> <input type="text" name="userid" placeholder="아이디" /> <input
					type="password" name="userpw" placeholder="비밀번호" /> <input
					type="password" name="passchk" placeholder="비밀번호 확인" /> <input
					type="text" name="name" placeholder="이름" /> <input type="email"
					name="email" placeholder="이메일" /> <input type="date" name="birth"
					placeholder="생년월일" /> <input type="text" name="user_home"
					placeholder="주소" /> <input type="text" name="phone"
					placeholder="전화번호 - 없이 입력하세요." /> <input type="text"
					name="nickname" placeholder="닉네임" /> <input type="text"
					name="bank" placeholder="계좌은행" /> <input type="text"
					name="account" placeholder="계좌번호 - 없이 입력하세요." /> <input
					type="submit" name="signup_submit" value="회원 가입" />
			</div>
		</form>
		<div class="right">
			<span class="loginwith">Sign in with<br />social network
			</span>

			<button class="social-signin naver">네이버 회원가입</button>
			<button class="social-signin kakao">카카오 회원가입</button>

		</div>
		<div class="or">OR</div>
	</div>

	<jsp:include page="/WEB-INF/view/common/footer.jsp" />
</body>
</html>