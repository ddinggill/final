<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Quite Light</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,700"
	rel="stylesheet">
<!-- Stylesheets -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/plugin-frameworks/swiper.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/main_content.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
		$(".chatjoin").click(function(){
			if("${sessionScope.loginOk}" == ""){
				alert("로그인이 필요합니다.");
				return false;
			}else{
				console.log("로그인햇네");
			}
			
		});
	})

</script>
<style>
* {
	margin: 0;
	padding: 0;
}

#main-menu {
	width: 1200px;
	margin-left: 25%;
	margin-top: 0px;
}

.main_icon{
width: 50px;
height: 50px;
	
}
#chatimg{
	width: 50px;
	height: 50px;
}


</style>
<body>

	<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>


	<div class="slider-main h-800x h-sm-auto pos-relative pt-95 pb-25">
		<div class="img-bg bg-1 bg-layer-4"></div>
		<div class="container-fluid h-100 mt-xs-50">

			<div class="row h-100">
				<div class="col-md-1"></div>
				<div class="col-sm-12 col-md-5 h-100 h-sm-50">
				
					<div class="dplay-tbl">
						<div class="dplay-tbl-cell color-white mtb-30">
							<div class="mx-w-400x">
								<h5>
									<b>ART</b>
								</h5>
								<h1 class="mt-20 mb-30">

									<b style="font-size: 60px; color: #5F9EA0"> GO! FARM </b> </br> <b
										style="font-size: 48px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;농사꾼
										되기</b>
								</h1>
								<h6>
									<a class="plr-20 btn-brdr-grey color-white" href="#"><b>Continue
											Reading</b></a>
								</h6>
							</div>
							<!-- mx-w-200x -->
						</div>
						<!-- dplay-tbl-cell -->
					</div>
					<!-- dplay-tbl -->
				</div>
				<!-- col-sm-6 -->

				<div
					class="col-sm-12 col-md-6 h-sm-50 oflow-hidden swiper-area pos-relative">

					<div class="abs-blr pos-sm-static">
						<div class="row pos-relative mt-50 all-scroll">

							<div class="swiper-scrollbar resp"></div>
							<div class="col-md-10" style="height: 250px;">

								<h5 class="mb-50 color-white">
									<b>FARM STEP</b>
								</h5>

								<div class="swiper-container oflow-visible"
									data-slide-effect="slide" data-autoheight="false"
									data-swiper-speed="500" data-swiper-margin="25"
									data-swiper-slides-per-view="2" data-swiper-breakpoints="true"
									data-scrollbar="true" data-swiper-loop="true"
									data-swpr-responsive="[1, 2, 1, 2]">



									<div class="swiper-wrapper">
										<!-- data-swiper-autoplay="1000"  -->
										<div class="swiper-slide">
											<div class="bg-white">
												<img src="main/images/step111.png" width=200px height=175px
													alt="">
												<div class="plr-25 ptb-15">
													<h5 class="color-ash">
														<b class="plan"><strong>정보수집</strong> </b>
													</h5>
												</div>

												<!-- hot-news -->
											</div>
											<!-- hot-news -->
										</div>
										<!-- swiper-slide -->

										<div class="swiper-slide">
											<div class="bg-white">
												<img src="main/images/step222.png" width=200px; height=175px;
													alt="">

												<div class="plr-25 ptb-15">
													<h5 class="color-ash">
														<b class="plan recenter">작물선택</b>
													</h5>


												</div>
												<!-- hot-news -->
											</div>
											<!-- hot-news -->
										</div>
										<!-- swiper-slide -->

										<div class="swiper-slide">
											<div class="bg-white">
												<img src="main/images/step333.png" width=200px; height=175px;
													alt="">

												<div class="plr-25 ptb-15">
													<h5 class="color-ash">
														<b class="plan">기술습득</b>
													</h5>


												</div>
												<!-- hot-news -->
											</div>
											<!-- hot-news -->
										</div>
										<!-- swiper-slide -->


										<div class="swiper-slide">
											<div class="bg-white">
												<img src="main/images/step444.png" width=200px; height=175px;
													alt="">

												<div class="plr-25 ptb-15">
													<h5 class="color-ash">
														<b class="plan">농지구매</b>
													</h5>



												</div>
												<!-- hot-news -->
											</div>
											<!-- hot-news -->
										</div>
										<!-- swiper-slide -->

										<div class="swiper-slide">
											<div class="bg-white">
												<img src="main/images/step555.png" width=200px; height=175px;
													alt="">

												<div class="plr-25 ptb-15">
													<h5 class="color-ash">
														<b class="plan">계획수립</b>
													</h5>

												</div>
												<!-- hot-news -->
											</div>
											<!-- hot-news -->
										</div>
										<!-- swiper-slide -->

									</div>
									<!-- swiper-wrapper -->
								</div>
								<!-- swiper-container -->

							</div>
							<!-- col-sm-6 -->
						</div>
						<!-- all-scroll -->
					</div>
					<!-- row -->
				</div>
				<!-- col-sm-6 -->

			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</div>
	<!-- slider-main -->



	<section class="bg-1-white ptb-0">
      <div class="container-fluid">
         <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-md-12 col-lg-8 ptb-50 pr-30 pr-md-15">


               <h4 class="mb-30 mt-30 clearfix">
                  <b>한눈에 바로보기</b>
               </h4>

               <div class="row">

                  <!-- START OF SECOND PARA -->
                  <div class="col-sm-12 col-md-12 col-lg-12 col-xl-8 mb-30">
                     <div class="card h-100 h-xs-500x">
                        <div class="sided-half sided-xs-half h-100 bg-white">

                           <!-- SETTING IMAGE WITH bg-2 -->
                           <div class="s-left w-50 w-xs-100 h-100 h-xs-50 pos-relative">
                              <div class="bg-2 abs-tblr"></div>
                           </div>

                           <div class="s-right w-50 w-xs-100 h-xs-50">
                              <div class="plr-25 ptb-25 h-100">
                                 <div class="dplay-tbl">
                                    <div class="dplay-tbl-cell">

                                       <h5 class="color-ash">
                                          <b>장터</b>
                                       </h5>
                                       <h2 class="mtb-10">
                                          <a href="productList.do"><b class="ngc">상품 목록 보기</b><br></a>
                                       </h2>

                                       <h5 class="color-ash">
                                          <b>#필요상품 #직접 판매</b> <br>
                                       </h5>


                                    </div>
                                    <!-- dplay-tbl-cell -->
                                 </div>
                                 <!-- dplay-tbl -->
                              </div>
                              <!-- plr-25 ptb-25 -->
                           </div>
                           <!-- s-right -->
                        </div>
                        <!-- sided-half -->
                     </div>
                     <!-- card -->
                  </div>
                  <!-- col-lg-8 col-md-12 -->

                  <div class="col-sm-6 col-md-6 col-lg-6 col-xl-4 mb-30">
                     <div class="card h-100 h-xs-350x">
                        <div class="bg-white h-100">

                           <!-- SETTING IMAGE WITH bg-3 -->
                           <div class="h-50 bg-3 dplay-lg-none dplay-xs-block"></div>

                           <div class="plr-25 ptb-15 h-50">
                              <div class="dplay-tbl">
                                 <div class="dplay-tbl-cell">

                                    <h5 class="color-ash">
                                       <b>게시판</b>
                                    </h5>
                                    <h4 class="mtb-10">
                                       <a href="board.do"><b>커뮤니티 바로보기 </b><br></a>
                                    </h4>



                                 </div>
                                 <!-- dplay-tbl-cell -->
                              </div>
                              <!-- dplay-tbl -->
                           </div>
                           <!-- plr-25 ptb-15 -->
                        </div>
                        <!-- hot-news -->
                     </div>
                     <!-- card -->
                  </div>
                  <!-- col-lg-4 col-md-6 -->
                  <!-- END OF SECOND PARA -->
                  <div class="col-sm-6 col-md-6 col-lg-6 col-xl-4 mb-30">
                     <!-- START OF THIRD PARA -->
                     <div class="card pos-relative h-100 color-black">
                        <div class="plr-25 ptb-15 h-100">
                           <h5 class="color-ash">
                              <b>구인/구직</b>
                           </h5>
                           <h4 class="mtb-10">
                              <a href="recruit2.do"><b>구인/구직 정보 보기</b></a>
                              <img src="main/images/eyes.png" style="width:20%; height:100%"/>
                           </h4>
                           
                           <!-- dplay-tbl-cell -->
                           <!-- dplay-tbl -->
                        </div>
                        <!-- plr-25 ptb-15 -->
                        <!-- card -->
                     </div>
                  </div>
                  <!-- col-lg-4 col-md-6 -->
                  <div class="col-sm-6 col-md-6 col-lg-6 col-xl-4 mb-30">
                     <!-- SETTING IMAGE WITH bg-4 -->
                     <div class="card pos-relative h-100 color-black ">
                        <div class="plr-25 ptb-15">
                           <h5 class="color-grey">
                              <b class="h">구인</b>
                           </h5>
                           <h4 class="mtb-10">
                              <a href="auctionList.do"><b>경매 바로 가기</b></a>
                              <img src="main/images/money.png" style="width:20%; height:100%"/>
                           </h4>
                        </div>
                        <!-- hot-news -->
                     </div>
                     <!-- card -->
                  </div>
                  <!-- col-lg-4 col-md-6 -->
                  <div class="col-sm-6 col-md-6 col-lg-6 col-xl-4 mb-30">
                     <!-- SETTING IMAGE WITH bg-5 -->
                     <div class="card pos-relative h-100">
                        <div class="plr-25 ptb-15">
                           <h5 class="color-grey">
                              <b>게시판</b>
                           </h5>
                           <h4 class="mtb-10">
                              <a href="chatlist.do"><b>오픈채팅방 바로가기</b></a>
                              <img src="main/images/airplane.png" style="width:20%; height:100%"/>
                           </h4>
                        </div>
                        <!-- hot-news -->
                     </div>
                     <!-- card -->
                  </div>
                  <!-- col-lg-4 col-md-6 -->
                  <!-- END OF THIRD PARA -->
               </div>
               <!-- row -->

					<h4 class="mb-30 mt-20 clearfix">
						<b>귀농 정보 동영상</b>
					</h4>

					<div class="row">
						<div class="col-sm-12 mb-30 swiper-area ">

							<!-- SETTING IMAGE WITH bg-6 -->
							<div
								class="bg-6 p-40 bg-layer-4 pos-relative z-1 oflow-hidden pr-0 color-white">
								<div class="mx-w-600x">

									<h2>
										<a href="#"> <b>귀농에 대한 <br>자세한 내용은 <br>상단바 <i
												style="color: #00CED1">INFO</i> 를 이용해주세요
										</b></a>
									</h2>
								</div>
								<!-- mx-w-200x -->

								<div class="all-scroll pos-relative " style="height: 500px; margin-top: 150px" >
									<h5 class="mb-50">
										<b>MORE VIDEO</b>
									</h5>

									<div class="swiper-scrollbar"></div>

									<div class="swiper-container oflow-visible"
										data-slide-effect="slide" data-autoheight="false"
										data-swiper-speed="500" data-swiper-margin="25"
										data-swiper-slides-per-view="3" data-swiper-breakpoints="true"
										data-scrollbar="true" data-swiper-loop="true"
										data-swpr-responsive="[1, 2, 2, 2]">
										<!-- 동영상 슬라이드  시작 -->

										<div class="swiper-wrapper">
											<div class="swiper-slide">
												<div class="pos-relative">
													<div class="mt-4 embed-responsive embed-responsive-16by9"> 
														<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/Ltad3MBSNao"></iframe> 
													</div> 
												</div>
												<!-- pos-relative -->
											</div>
											<!-- swiper-slide -->

											<div class="swiper-slide">
												<div class="pos-relative">
													<div class="mt-4 embed-responsive embed-responsive-16by9"> 
														<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/GAyQMj9IGlk"></iframe> 
													</div> 
												</div>
												<!-- pos-relative -->
											</div>
											<!-- swiper-slide -->

											<div class="swiper-slide">
												<div class="pos-relative">
													<div class="mt-4 embed-responsive embed-responsive-16by9"> 
														<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/XgPtIgyrn_k"></iframe> 
													</div> 
												</div>
												<!-- pos-relative -->
											</div>
											<!-- swiper-slide -->

											<div class="swiper-slide">
												<div class="pos-relative">
													<div class="mt-4 embed-responsive embed-responsive-16by9"> 
														<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/ON3ih_iBhu8"></iframe> 
													</div>
												</div>
												<!-- pos-relative -->
											</div>
											<!-- swiper-slide -->

										</div>
										<!-- swiper-wrapper -->
									</div>
									<!-- swiper-container -->

								</div>
								<!-- swiper-area -->

							</div>
							<!-- bg-4 -->
						</div>
						<!-- col-lg-4 col-md-6 -->
					</div>
					<!-- row -->


					
				</div>
				<!-- col-sm-9 -->

				<div class="col-md-12 col-lg-3 bg-2-white ptb-50 pl-30 pl-md-15">
					<div class="row">
						<div class="col-md-12 col-lg-8">
							<div class="mx-w-md-400x mlr-md-auto">

								<div class="mb-50">
									<h4 class="mb-30 mt-30 clearfix">
										<b class="blink">실시간 채팅방</b>
										<img src="main/images/up.png" style="width:15%; height:100%"/>
									</h4>

							<c:forEach items="${cList}" var="cdto" begin="1" end="4" step="1">
							<c:url value="chatjoin.do" var="chatList">
							<c:param name="chatcode" value="${cdto.chatcode}" />
							</c:url>
							
									<div class="sided-80x mb-20">
										<div class="s-left color-ash text-center">
											<div class="dplay-tbl">
												<div class="dplay-tbl-cell">
													<img alt="/gofarm/profileUpload/chatimg.png" src="/gofarm/profileUpload/chatimg.png" id="chatimg">
												</div>
												<!-- dplay-tbl-cell -->
											</div>
											<!-- dplay-tbl -->
										</div>
										<!-- s-left -->
										<div class="s-right">
											<h5 class="pt-5">
												<a href=${chatList } class="chatjoin"><b>${cdto.ct_title}	</b></a>
											</h5>
										</div>
										<!-- s-left -->
									</div>
									<!-- sided-80x -->
							</c:forEach>
							
									<!-- sided-80x -->
								</div>

								<a class="mb-50 pos-relative dplay-block" href="http://www.returnfarm.com/"> <img
									src="main/images/link_img.jpg" alt="" />
									<div class="abs-tblr z-10 ">

										<div class="dplay-tbl text-center color-white">
											<div class="dplay-tbl-cell">
											
											</div>
										</div>
										<!-- dplay-tbl -->
									</div> <!-- abs-tblr -->
								</a>
								<!-- mb-50 -->

								<div class="mb-0">
									<h4 class="mb-30 mt-30 clearfix">
										<b class="blink">실시간 인기상품</b>
									</h4>
							<c:forEach items="${pList}" begin="1"  end="3" step="1" var="cdto">
								<c:url value="productView.do" var="product">
									<c:param name="currentPage" value="1" />
									<c:param name="prod_code" value="${cdto.prod_code}" />
								</c:url>
							
									<div class="sided-80x mb-20">
										<div class="s-left">
											<img src="/gofarm/profileUpload/${cdto.pd_file}" alt="">
										</div>
										<!-- s-left -->
										<div class="s-right">
											<h5>
												<a href="${product}"><b>${cdto.pd_name}</b></a>
											</h5>
										</div>
										<!-- s-left -->
									</div>
							</c:forEach>

									<!-- s-left -->
									<!-- sided-80x -->

									
									<!-- sided-80x -->
								</div>
								<!-- mb-50 -->

							</div>
							<!-- mx-w-400 -->
						</div>
						<!-- col-sm-9 -->
					</div>
					<!-- row -->
				</div>
				<!-- col-sm-3 -->
			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</section>

	<!-- footer 시작-->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- footer 끝 -->
	<!-- SCIPTS -->

	<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>

	<script src="main/plugin-frameworks/bootstrap.min.js"></script>

	<script src="main/plugin-frameworks/swiper.js"></script>


	<script src="main/common/scripts.js"></script>

</body>
</html>