<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="mypage/css/nav.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top" id="nav">

    <a class="navbar-brand mr-1" href="main.do">GO! FARM</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

	<ul class="main-menu" id="main-menu" style="margin-left: 27%;">
			<li><a href="main.do" class="nav">HOME</a></li>
			<li><a href="info.do" class="nav">INFO</a></li>
			<li><a href="recruit2.do" class="nav">구인 | 구직</a></li>
			<li><a href="productList.do" class="nav">장터</a></li>
			<li><a href="board.do" class="nav">게시판</a></li>
			<li><a href="chatlist.do" class="nav">오픈채팅</a></li>
		</ul>
    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
		
	</form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
           
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="intro.do">myInfo</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="logout.do" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>
</body>
</html>