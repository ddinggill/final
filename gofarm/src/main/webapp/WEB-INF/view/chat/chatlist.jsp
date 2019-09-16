<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓</title>
</head>
<body>

<%-- <a href="${pageContext.request.contextPath}/chat.do?num=1">1번방 채팅하러가자</a>
<a href="${pageContext.request.contextPath}/chat.do?num=2">2번방 채팅하러가자</a>
<a href="${pageContext.request.contextPath}/chat.do?num=3">3번방 채팅하러가자</a> --%>
<button id="croom">채팅방 생성하기</button>
<table>
<c:forEach items="${roomlist}" var="dto">
		<tr><a href="chatjoin.do?num="+${dto.chatcode }>${dto.ct_title}</a></tr>
</c:forEach>
</table>
</body>
</html>