<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('#side_mileage').on('click', function() {
		if('${loginOk.userlvl}' != 2){
			alert('해당 기능을 사용하기에는 권한이 부족합니다.');
			return false;
		}
	});
});
</script>
</head>
<body>
	 <ul class="sidebar navbar-nav">
	 <li class="nav-item">
        <a class="nav-link"  href="mypage.do" >
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>마이페이지</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>회원 정보</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="intro.do" id="myInfo"> 내 정보 보기</a>
          <a class="dropdown-item" href="withdrawal.do" id="jobSearch"> 회원 탈퇴</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>구인/구직</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="jobView.do" id="job">구인</a>
          <a class="dropdown-item" href="jobSearchView.do" id="jobSearch">구직</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>장터</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="product.do" id="product">판매목록</a>
          <a class="dropdown-item" href="myBuy.do" id="myBuy">구매목록</a>
          <a class="dropdown-item" href="myAuction.do" id="auction">경매목록</a>
          <a class="dropdown-item" href="myBid.do" id="myBid">입찰목록</a>
          <a class="dropdown-item" href="myDonation.do" id="myDonation">나눔목록</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="myBoard.do">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>게시판</span></a>
      </li>
			<li class="nav-item dropdown" id="side_mileage">
			 <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-table"></i><span>마일리지</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="mileage.do" id="mileage">내 마일리지</a>
					<a class="dropdown-item" href="mileage_charge.do" id="mileage_charge">마일리지 충전</a>
					<a class="dropdown-item" href="mileage_payment.do" id="mileage_payment">마일리지 출금</a>
				</div>
			</li>
		</ul>
</body>
</html>