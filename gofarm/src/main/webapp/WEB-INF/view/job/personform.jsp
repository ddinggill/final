<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/index_style.css">
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

<!-- Stylesheets -->

<link href="personform/plugin-frameworks/bootstrap.min.css"
   rel="stylesheet">
<link href="personform/plugin-frameworks/swiper.css" rel="stylesheet">
<link href="personform/fonts/ionicons.css" rel="stylesheet">
<link href="personform/common/styles.css" rel="stylesheet">
<style type="text/css">
div.container {
   margin-top: 50px;
}

h2 {
   text-align: center;
   font-family: 'Nanum Gothic Coding', monospace;
}

table {
   width: 100%;
}

td {
   font-family: 'Nanum Gothic Coding', monospace;
}

h2{
   margin-bottom: 50px;
   font-family: 'Nanum Gothic Coding', monospace;
}
.subject, .content {
   width: 100%;
   border: solid 1px #BDBDBD;
}
</style>

<script type="text/javascript">
   $(document).ready(
         function() {
            $('form').on(
                  'submit',
                  function() {
                     //입력한 내용의 엔터가 있으면 br로 줄바꿈
                     $('[name=contents]').val(
                           $('[name=contents]').val().replace(/\n/gi,
                                 '<br/>'));
                  });
         });
</script>
</head>
<body>
   <jsp:include page="/WEB-INF/view/common/nav.jsp"></jsp:include>
   <section class="ftco-section">
      <div class="container" id="write">
         <h2>채용 정보 등록하기</h2>
         <form name="frm" method="post" enctype="multipart/form-data"
            action="#">
            <table>
         
               <tr>
                  <td align="center">모집업종</td>
                  <td><input type="text" name="j_type" class="j_type"
                     required="required" /></td>
               </tr>
               <tr>
                  <td align="center">회사명</td>
                  <td><input type="text" name="j_company" class="j_company"
                     required="required" /></td>
               </tr>
               
               <tr>
                  <td align="center">마감일</td>
                  <td><input type="text" name="j_deadline" class="j_deadline"
                     required="required" /></td>
               </tr>
               
               <tr>
                  <td align="center">근무지역</td>
                  <td><select name="j_area">
                     <option value="서울특별시">서울특별시</option>
                     <option value="경기도">경기도</option>
                     <option value="인천광역시">인천광역시</option>
                     <option value="부산광역시">부산광역시</option>
                     <option value="대구광역시">대구광역시</option>
                     <option value="광주광역시">광주광역시</option>
                     <option value="대전광역시">대전광역시</option>
                     <option value="울산광역시">울산광역시</option>
                     <option value="세종특별자치시">세종특별자치시</option>
                     <option value="강원도">강원도</option>
                     <option value="경상남도">경상남도</option>
                     <option value="전라남도">전라남도</option>
                     <option value="충청남도">충청남도</option>
                     <option value="충청북도">충청북도</option>
                     <option value="제주특별자치도">제주특별자치도</option>
                  </select>
                  </td>
               </tr>
               <tr>
                  <td align="center">작업지주소</td>
                  <td><input type="text" name="j_address" class="j_address"
                     required="required" /></td>
               </tr>
               <tr>
                  <td align="center">모집인원</td>
                  <td><input type="text" name="j_recruitment" class="j_recruitment"
                     required="required" /></td>
               </tr>
               
               <tr>
                  <td align="center">성별</td>
                  <td><input type="radio" name="j_gender" value="m">남자
                  <input type="radio" name="j_gender" value="f">여자</td>
               </tr>
               
               <tr>
                  <td align="center">구인연령</td>
                  <td><input type="text" name="j_age" class="j_age"
                     required="required" /></td>
               </tr>
               <tr>
                  <td align="center">경력</td>
                  <td><input type="text" name="j_career" class="j_career"
                     required="required" /></td>
               </tr>
               <tr>
                  <td align="center">우대사항</td>
                  <td><input type="text" name="j_preferential" class="j_preferential"
                     required="required" /></td>
               </tr>
               <tr>
                  <td align="center">지원정보</td>
                  <td><input type="text" name="j_info" class="j_info"
                     required="required" /></td>
               </tr>
               <tr>
                  <td align="center">문의전화</td>
                  <td><input type="text" name="j_contact" class="j_contact"
                     required="required" /></td>
               </tr>
               <tr>
                  <td align="center">작업기간</td>
                  <td><input type="text" name="j_term" class="j_term"
                     required="required" /></td>
               </tr>
               <tr>
                  <td align="center">내용</td>
                  <td><textarea name="content" class="content" ></textarea></td>
               </tr>
               <tr>
                  <td colspan="2" align="center"><input type="submit"
                     class="btn btn-black py-3 px-5" value="글쓰기" /> <input
                     type="reset" value="취소" class="btn btn-black py-3 px-5" /></td>
               </tr>
            </table>
         </form>
      </div>
   </section>
   <jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</body>
</html>