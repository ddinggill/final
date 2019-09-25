<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
   ///// 스크롤 100픽셀 내리면 상단메뉴에 노란배경색이 생김 /////
   $(window).on("scroll", function() {
      if ($(window).scrollTop() > 100) {
         $("#topNav").addClass("bg");
      } else {
         $("#topNav").removeClass("bg");
      }
   });

   ///// 상단의 각메뉴를 클릭하면 해당 하위메뉴가 나타남 /////
   $(document).ready(function() {
      $("#topNav>ul>li").click(function() {
         $("#topNav").find("div").fadeOut();
         $(this).find("div").fadeIn();
      });
   });
</script>

<style>

/**** 상단 *****/
header {
   position: fixed;
   z-index: 1;
   top: 0;
}

header>#topNav {
   position: fixed;
   padding-top: 20px;
   width: 100%;
   height: 70px;
   transition: .5s ease-in-out /*느렸다빨리짐*/;
}

header #topNav.bg {
   box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.6);
   padding-top: 5px;
   background: black;
   color: white;
}

header a {
   text-decoration: none;
   color: white;
}

header>#topNav>ul {
   display: flex;
   list-style: none;
}

header>#topNav>ul>li {
   text-align: center;
   margin-left: 70px;
   position: relative;
}

/**** 상단: 하위메뉴 *****/
header>#topNav>ul>li>div {
   position: absolute;
   margin: 10px 0 0 50px;
   z-index: 1;
   width: 100px;
   background: #eee;
   box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.3);
   text-align: left;
   display: none;
}

header>#topNav>ul>li>div>ul {
   list-style: none;
   padding: 10px;
}

header>#topNav>ul>li>div>ul>li {
   padding: 2px 10px;
   text-align: left;
}

header>#topNav>ul.main-munu>li>a {
   display: block;
   height: auto;
   line-height: 1;
   padding: 15px;
}

.nav{
   text-shadow: 0 0 2px #000000;
}
</style>
</head>
<body>

   <header class="fixed-top">

      <nav id="topNav" >
        <p class="logo nav" href="#"><img src="main/images/logo.png"><a style="margin-top:20px">GO FARM</a></p>
         <ul class="main-menu" id="main-menu"
          style="margin-left: 27%;">
          
         
          
            <li><a href="main.do" class="nav">HOME</a></li>
            <li><a href="info.do" class="nav">INFO</a></li>
            <li><a href="recruit2.do" class="nav">구인 | 구직</a></li>
            <li><a href="productList.do" class="nav">장터</a></li>
            <li><a href="board.do" class="nav">게시판</a></li>
            <li><a href="chatlist.do" class="nav">오픈채팅</a></li>
            <c:choose>
               <c:when test="${empty sessionScope.loginOk}">
                  <li><a href="login.do" class="nav">로그인</a></li>
               </c:when>
               <c:otherwise>
                  <!--    <script type="text/javascript">
                       timecount();
                    </script> -->
                  <li class="drop-down"><a href="#!" class="nav">${loginOk.userid }<i
                        class="ion-arrow-down-b"></i></a>
                     <ul class="drop-down-menu drop-down-inner">
                        <li><a href="logout.do" class="nav">logout</a></li>
                        <c:choose>
                        <c:when test="${loginOk.userlvl == 3 }">
                        <li><a href="adminUserList.do" class="nav">관리자 페이지</a></li>
                        </c:when>
                        <c:otherwise>
                         <li><a href="mypage.do" class="nav">mypage</a></li>
                        </c:otherwise>
                        
                        
                        </c:choose>
                     </ul></li>
               </c:otherwise>
            </c:choose>
         </ul>
      </nav>

   </header>
   
</body>

</html>