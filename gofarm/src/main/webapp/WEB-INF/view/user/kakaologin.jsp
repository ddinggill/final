<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>


	<c:if test="${userId eq null}">

		<a id="kakao-login-btn"
			href="https://kauth.kakao.com/oauth/authorize?
		client_id=a472371a544d55e94dc88a22579f02ff&
		redirect_uri=http://localhost:8090/gofarm/kakao.do&
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




</body>
</html>