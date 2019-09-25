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
		if($('#userLv').val()!=3){
			alert('해당 기능을 사용하기에는 권한이 부족합니다.');
			return false;
		}
	});
});
</script>
</head>
<body>
	<input type="hidden" name="userLv" id="userLv" value="${sessionScope.loginOk.userlvl }" />	
	 <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link"  href="adminUserList.do" >
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>유저목록</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>구인/구직</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="adminJobList.do" id="job">구인 목록</a>
          <a class="dropdown-item" href="adminJobsearchList.do" id="jobSearch">구직 목록</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>장터</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="adminProductList.do" id="product">판매목록</a>
          <a class="dropdown-item" href="adminAuctionList.do" id="myBuy">경매목록</a>
          <a class="dropdown-item" href="adminDonationList.do" id="auction">나눔목록</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="adminBoardList.do">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>게시판</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="adminChatRoomList.do">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>진행중인 채팅방</span></a>
      </li>
			<li class="nav-item dropdown" id="side_mileage">
			 <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-table"></i><span>마일리지</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				
					<a class="dropdown-item" href="adminMileageChargeList.do" id="mileage_charge">마일리지 충전 목록</a>
					<a class="dropdown-item" href="adminMileagePaymentList.do" id="mileage_payment">마일리지 출금신청 목록</a>
				</div>
			</li>
		</ul>
</body>
</html>