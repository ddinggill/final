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
</head>
<body>

<jsp:include page="/WEB-INF/view/common/main_nav.jsp" />
<br><br><br><br><br><br><br>



<div id="login-box">
 <form action="createroom.do" method="post">
  <div class="left">
    <h2>채팅방개설</h2>
   <br/>
   <br/>
   
    <input type="text" name=ct_title placeholder="방제목" required="required"/>
    <p>참가인원
	 	<select name="ct_limit">
	 		<option value="1">1</option>
	 		<option value="2">2</option>
	 		<option value="3">3</option>
	 		<option value="4">4</option>
	 		<option value="5">5</option>
	 		<option value="6">6</option>
	 		<option value="7">7</option>
	 		<option value="8">8</option>
	 	</select>
	 </p>
    
    <input type="submit" value="개설하기" />
  </div>
  </form>

</div>
<br><br><br><br><br><br><br>
<jsp:include page="/WEB-INF/view/common/footer.jsp" />
<script src="main/plugin-frameworks/bootstrap.min.js"></script>
<script src="main/plugin-frameworks/swiper.js"></script>
<script src="main/common/scripts.js"></script>
</body>
</html>