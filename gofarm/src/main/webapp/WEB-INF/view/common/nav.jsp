<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>common_nav</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,700"
	rel="stylesheet">

<!-- Stylesheets -->

<link href="plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="plugin-frameworks/swiper.css" rel="stylesheet">
<link href="fonts/ionicons.css" rel="stylesheet">
<link href="common/styles.css" rel="stylesheet">
<style type="text/css">
header {
background-color: black;

}
</style>
</head>
<body>
<header class="fixed-top" >

      <a class="logo" href="#"><img src="images/logo.png" >GO FARM</a>

      <ul class="main-menu" id="main-menu">
         <li><a href="index.html">HOME</a></li>
         <li><a href="#">INFO</a></li>
         <li><a href="#">구인</a></li>
         <li><a href="#">구직</a></li>
         <li><a href="#">장터</a></li>
         <li><a href="#">게시판</a></li>
         <li class="drop-down"><a href="#!">김주희 님<i
               class="ion-arrow-down-b"></i></a>
            <ul class="drop-down-menu drop-down-inner">
               <li><a href="#">logout</a></li>
               <li><a href="#">mypage</a></li>
            </ul></li>
      </ul>

   </header>


<script src="common/scripts.js"></script>
</body>
</html>