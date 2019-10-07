<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/plugin-frameworks/swiper.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_content.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style type="text/css">
body{
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/common/main_nav.jsp" />
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<c:if test="${userId eq null}">

		<a id="kakao-login-btn"
			href="https://kauth.kakao.com/oauth/authorize?
		client_id=a472371a544d55e94dc88a22579f02ff&
		redirect_uri=http://54.180.168.41:8080/gofarm/kakao.do&
		response_type=code">
			<img
			src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
			width="500" />
		</a>
	</c:if>
	<c:if test="${userId ne null}">
		<h1>${userId}로그인성공입니다</h1>
		<input type="button" value="로그아웃" onclick="location.href='/logout'">
	</c:if>

	<script type="text/javascript">
		
	</script>


<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="/WEB-INF/view/common/footer.jsp" />

<script src="main/plugin-frameworks/bootstrap.min.js"></script>
<script src="main/plugin-frameworks/swiper.js"></script>
<script src="main/common/scripts.js"></script>

</body>
</html>