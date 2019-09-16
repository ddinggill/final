<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="personform/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="personform/css/animate.css">

<link rel="stylesheet" href="personform/css/owl.carousel.min.css">
<link rel="stylesheet" href="personform/css/owl.theme.default.min.css">
<link rel="stylesheet" href="personform/css/magnific-popup.css">

<link rel="stylesheet" href="personform/css/aos.css">

<link rel="stylesheet" href="personform/css/ionicons.min.css">

<link rel="stylesheet" href="personform/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="personform/css/jquery.timepicker.css">


<link rel="stylesheet" href="personform/css/flaticon.css">
<link rel="stylesheet" href="personform/css/icomoon.css">
<link rel="stylesheet" href="personform/css/style.css">


<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="recruit/recruit.css" rel="stylesheet">
<link rel="stylesheet" href="recruit/resum.css">


</head>



<body>

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>



	<div class="ffrom">
		<div class="main" id="main">

			<span style="color: black; font-size: 25px; margin-bottom: 10px;">인력정보&nbsp;&nbsp;<i
				class="arrow right"></i><strong>&nbsp;&nbsp;인력 정보</strong></span>

		</div>

		<table class="tab" id="tab" style="border-radius: 5px;">
			<!--       <tr style="border: 0;">
            <td colspan="5">
               <div class="main" id="main">

                  <span style="color: black; font-size: 25px; margin-bottom: 10px;">채용정보&nbsp;&nbsp;<i
                     class="arrow right"></i><strong>&nbsp;&nbsp;채용 정보</strong></span>

               </div>
            </td>

         </tr> -->

			<tr>
				<td class="t1">이름</td>
				<td class="t2">${dto.js_name}</td>
				<td class="t1">등록일</td>
				<td class="t2">${dto.js_registration}</td>

			</tr>

			<tr>
				<td class="t1">사는 지역</td>
				<td class="t2">${dto.js_address}</td>
				<td class="t1">희망 연봉</td>
				<td class="t2">${dto.js_salary}</td>

			</tr>

			<tr>
				<td class="t1">가능 작물</td>
				<td class="t2">${dto.js_crop }</td>
				<%--    <td class="t1">경력</td>
            <td class="t2">${dto.js_career}</td> --%>

				<%-- </tr>

         <tr>
            <td class="t1">성별</td>
            <td class="t2">${dto.j_gender}</td>
            <td class="t1">구인연령</td>
            <td class="t2">${dto.j_age}</td>

         </tr>

         <tr>
            <td class="t1">모집 업종</td>
            <td class="t2" colspan="4">${dto.j_type}</td>

         </tr>

         <tr>
            <td class="t1">작업 기간</td>
            <td class="t2" colspan="4">${dto.j_term}</td>


         </tr>

         <tr>
            <td class="t1">지원 정보</td>
            <td class="t2" colspan="4">${dto.j_info}</td>


         </tr>

         <tr>

            <td class="t1">작업지 주소</td>
            <td class="t2" colspan="4">${dto.j_address}</td>


         </tr> --%>
			<tr>
				<td colspan="5">
					<div class="detail">
						<p class="datail_title">상세 내용</p>
						<p>반응형</p>
						<p>테스트</p>
						<p>입니다</p>
						<p>입니다</p>
						<p>입니다</p>
						<p>입니다</p>
						<p>입니다</p>
						<p>입니다</p>
					</div>
			</tr>

			<tr>
				<td colspan="5">
					<div class="memo">

						<p class="memo_title">우대 사항</p>
						<%-- ${dto.j_preferential} --%>
					</div>

				</td>
		</table>



		<%-- 
   <div class="memo">
      <p class="memo_title">우대 사항</p>
      ${dto.j_Preferential}
   </div> --%>


	</div>
	<div class="btn" style="margin-left: 750px;">

		<input type="submit" class="btn btn-black py-3 px-5" value="신청하기 " />
		<a href="personsearch.do"><input type="button" value="목록가기" class="btn btn-black py-3 px-5" /></a>
	</div>
	<form name="frm" id="frm" method="get">
		<input type="hidden" name="jobsearchcode" value="${dto.jobsearchcode}" />
		<input type="hidden" name="currentPage" id="currentPage"
			value="${currentPage}" /> <input type="button" id="list" value="리스트" />
	</form>
</body>
</html>