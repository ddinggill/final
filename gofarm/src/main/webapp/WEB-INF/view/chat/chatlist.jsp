<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓</title>

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
	background-color : #D8D8D8;
}
</style>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".join").click(function(){
			console.log($(this).parents("tr").children("#chatcode").val());
			//connect($(this).parents("tr").children("#chatcode").val());
			window.location.href="chatjoin.do?chatcode="+$(this).parents("tr").children("#chatcode").val();
		});
	});
	
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
	<script src="main/plugin-frameworks/bootstrap.min.js"></script>
	<script src="main/plugin-frameworks/swiper.js"></script>
	<script src="main/common/scripts.js"></script>
</body>
</html>