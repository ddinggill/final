<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_content.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
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
* {
	margin: 0;
	padding: 0;
}

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

#main-menu {
	width: 1200px;
	margin-left: 25%;
	margin-top: 0px;
}
</style>
<body>

	<jsp:include page="/WEB-INF/view/main/main_nav.jsp"></jsp:include>


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
													<h4 class="mtb-10">
														<a href="#"><b>STEP1</b></a>
													</h4>

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
														<a href="#"><b class="ngc">상품 목록 보기</b><br></a>
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
													<a href="#"><b>커뮤니티 바로보기 </b><br></a>
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

						<!-- START OF THIRD PARA -->
						<div class="col-sm-6 col-md-6 col-lg-6 col-xl-4  mb-30">
							<div class="card h-100 bg-white">
								<div class="plr-25 ptb-15 h-100">
									<div class="">
										<div class="dplay-tbl-cell">

											<h5 class="color-ash">
												<b>구직</b>
											</h5>
											<h4 class="mtb-10">
												<a href="#"><b>구직 정보 보기</b></a>
											</h4>


										</div>
										<!-- dplay-tbl-cell -->
									</div>
									<!-- dplay-tbl -->
								</div>
								<!-- plr-25 ptb-15 -->
							</div>
							<!-- card -->
						</div>
						<!-- col-lg-4 col-md-6 -->

						<div class="col-sm-6 col-md-6 col-lg-6 col-xl-4 mb-30">

							<!-- SETTING IMAGE WITH bg-4 -->
							<div class="card h-100 bg-white">
								<div class="plr-25 ptb-15">
									<h5 class="color-grey">
										<b class="h">구인</b>
									</h5>
									<h4 class="mtb-10">
										<a href="#"><b>구인 등록 하기</b></a>
									</h4>

								</div>
								<!-- hot-news -->
							</div>
							<!-- card -->
						</div>
						<!-- col-lg-4 col-md-6 -->

						<div class="col-sm-6 col-md-6 col-lg-6 col-xl-4 mb-30">

							<!-- SETTING IMAGE WITH bg-5 -->
							<div class="card pos-relative h-100 bg-5 bg-layer-4 color-white">
								<div class="plr-25 ptb-15">
									<h5 class="color-grey">
										<b>게시판</b>
									</h5>
									<h4 class="mtb-10">
										<a href="#"><b>오픈채팅방 바로가기</b></a>
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

								<div class="all-scroll pos-relative mt-50">
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
													<a class="abs-center circle-50 bg-tp-5 text-center"
														href="#"> <i class="lh-50 font-12 ion-play"></i></a> <img
														src="" alt="">
												</div>
												<!-- pos-relative -->
											</div>
											<!-- swiper-slide -->

											<div class="swiper-slide">
												<div class="pos-relative">
													<a class="abs-center circle-50 bg-tp-5 text-center"
														href="#"> <i class="lh-50 font-12 ion-play"></i></a> <img
														src="" alt="">
												</div>
												<!-- pos-relative -->
											</div>
											<!-- swiper-slide -->

											<div class="swiper-slide">
												<div class="pos-relative">
													<a class="abs-center circle-50 bg-tp-5 text-center"
														href="#"> <i class="lh-50 font-12 ion-play"></i></a> <img
														src="" alt="">
												</div>
												<!-- pos-relative -->
											</div>
											<!-- swiper-slide -->

											<div class="swiper-slide">
												<div class="pos-relative">
													<a class="abs-center circle-50 bg-tp-5 text-center"
														href="#"> <i class="lh-50 font-12 ion-play"></i></a> <img
														src="" alt="">
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


					<h6 class="text-center mt-20">
						<a class="btn-brdr-grey color-ash plr-30" href="#"><b>LEARN
								MORE</b></a>
					</h6>
				</div>
				<!-- col-sm-9 -->

				<div class="col-md-12 col-lg-3 bg-2-white ptb-50 pl-30 pl-md-15">
					<div class="row">
						<div class="col-md-12 col-lg-8">
							<div class="mx-w-md-400x mlr-md-auto">

								<div class="mb-50">
									<h4 class="mb-30 mt-30 clearfix">
										<b class="blink">실시간 채팅방</b>
									</h4>

									<div class="sided-80x mb-20">
										<div class="s-left color-ash text-center">
											<div class="dplay-tbl">
												<div class="dplay-tbl-cell">
													<h2>
														<b>16</b>
													</h2>
													<h4>
														<b>JAN</b>
													</h4>
												</div>
												<!-- dplay-tbl-cell -->
											</div>
											<!-- dplay-tbl -->
										</div>
										<!-- s-left -->
										<div class="s-right">
											<h5 class="pt-5">
												<a href="#"><b>I Got off Addrall and Xanax Using
														Psilocybon</b></a>
											</h5>
										</div>
										<!-- s-left -->
									</div>
									<!-- sided-80x -->

									<div class="sided-80x mb-20">
										<div class="s-left color-ash text-center">
											<div class="dplay-tbl">
												<div class="dplay-tbl-cell">
													<h2>
														<b>16</b>
													</h2>
													<h4>
														<b>JAN</b>
													</h4>
												</div>
												<!-- dplay-tbl-cell -->
											</div>
											<!-- dplay-tbl -->
										</div>

										<!-- s-left -->
										<div class="s-right">
											<h5 class="pt-5">
												<a href="#"><b>I Got off Addrall and Xanax Using
														Psilocybon</b></a>
											</h5>
										</div>
										<!-- s-left -->
									</div>
									<!-- sided-80x -->

									<div class="sided-80x mb-20">
										<div class="s-left color-ash text-center">
											<div class="dplay-tbl">
												<div class="dplay-tbl-cell">
													<h2>
														<b>16</b>
													</h2>
													<h4>
														<b>JAN</b>
													</h4>
												</div>
												<!-- dplay-tbl-cell -->
											</div>
											<!-- dplay-tbl -->
										</div>
										<!-- s-left -->
										<div class="s-right">
											<h5 class="pt-5">
												<a href="#"><b>I Got off Addrall and Xanax Using
														Psilocybon</b></a>
											</h5>
										</div>
										<!-- s-left -->
									</div>
									<!-- sided-80x -->

									<div class="sided-80x mb-20">
										<div class="s-left color-ash text-center">
											<div class="dplay-tbl">
												<div class="dplay-tbl-cell">
													<h2>
														<b>16</b>
													</h2>
													<h4>
														<b>JAN</b>
													</h4>
												</div>
												<!-- dplay-tbl-cell -->
											</div>
											<!-- dplay-tbl -->
										</div>
										<!-- s-left -->
										<div class="s-right">
											<h5 class="pt-5">
												<a href="#"><b>I Got off Addrall and Xanax Using
														Psilocybon</b></a>
											</h5>
										</div>
										<!-- s-left -->
									</div>
									<!-- sided-80x -->
								</div>

								<a class="mb-50 pos-relative dplay-block" href="#"> <img
									src="main/images/sidebar_1_400X300.jpg" alt="">
									<div class="abs-tblr z-10 bg-layer-4">

										<div class="dplay-tbl text-center color-white">
											<div class="dplay-tbl-cell">
												<h3>
													<b>CHARITY</b>
												</h3>
												<h4>
													<b>tournament</b>
												</h4>
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

									<div class="sided-80x mb-20">
										<div class="s-left">
											<img src="main/images/top_2_120x120.jpg" alt="">
										</div>
										<!-- s-left -->
										<div class="s-right">
											<h5>
												<a href="#"><b>I Got off Addrall and Xanax Using
														Psilocybon</b></a>
											</h5>
										</div>
										<!-- s-left -->
									</div>


									<!-- s-left -->
									<!-- sided-80x -->

									<div class="sided-80x mb-20">
										<div class="s-left">
											<img src="main/images/top_4_120x120.jpg" alt="">
										</div>
										<!-- s-left -->
										<div class="s-right">
											<h5>
												<a href="#"><b>I Got off Addrall and Xanax Using
														Psilocybon</b></a>
											</h5>
										</div>
										<!-- s-left -->
									</div>
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