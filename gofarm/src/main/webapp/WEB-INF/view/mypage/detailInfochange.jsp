<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">

<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/plugin-frameworks/swiper.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_content.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>user Detail Info Change</title>
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
	background-color: #D8D8D8;
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

input[type="text"]
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

input[type="text"]:focus {
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

</style>

</head>
<body>

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp" />

	<div id="login-box">
		<form action="detailInfochangepro.do" method="post">
			<div class="left">
				<h2>회원정보</h2>
					<input type="text" name="bank" value="${userDTO.bank }" required="required"/> 
					<input type="text" name="account" value="${userDTO.account }" required="required"/> 
					<input type="text" name="user_home" value="${userDTO.user_home }" required="required"/> 
					<input type="submit" name="signup_submit" value="정보 수정" />
			</div>
		</form>
	</div>

	<jsp:include page="/WEB-INF/view/common/footer.jsp" />
	
	<script src="main/plugin-frameworks/bootstrap.min.js"></script>
	<script src="main/plugin-frameworks/swiper.js"></script>
	<script src="main/common/scripts.js"></script>
</body>
</html>