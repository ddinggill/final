<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="board/index/css/style.css" rel='stylesheet' type='text/css' />

<!-- 메인 네비바에 이거4개만 들어가면 됨 -->
<link href="main/plugin-frameworks/bootstrap.min.css" rel="stylesheet">
<link href="main/fonts/ionicons.css" rel="stylesheet">
<link href="main/common/styles.css" rel="stylesheet">
<link href="main/common/main_nav.css" rel="stylesheet">
<!-- 메인 네비바 링크 끝 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!----webfonts---->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<!----//webfonts---->
<!-- Global CSS for the page and tiles -->
<link rel="stylesheet" href="board/index/css/main.css">
<!-- //Global CSS for the page and tiles -->
<!---start-click-drop-down-menu----->

<style type="text/css">
i {
	margin-top:30px;
}
</style>
</head>
<body style="background-color: #A2BBCA;">
<jsp:include page="/WEB-INF/view/common/main_nav.jsp"></jsp:include>
	<!---start-content---->
	<div class="content" style="margin-top: 185px; margin-bottom: 150px">
		<div class="wrap">
			<div id="main" role="main" >
				<ul id="tiles" >
					<!-- These are our grid blocks -->
					<li onclick="location.href='#';"><img
						src="board/index/images/img1.jpg" width="282" height="118">
						<div class="post-info">
							<div class="post-basic-info">
								<h3>
									<a href="board_job.do">A. 구인 구직</a>
								</h3>
								<span><a href="board_job.do"><label> </label> Job </a></span>
								<p>구인과 구직에 관련된 정보로 소통하세요</p>
								<p>Communicate with information on job openings and job openings.</p>
							</div>
							<div class="post-info-rate-share">
								<div class="rateit">
									<span> </span>
								</div>
								<div class="post-share">
									<span> </span>
								</div>
								<div class="clear"></div>
							</div>
						</div></li>
					<li onclick="location.href='single-page.html';"><img
						src="board/index/images/img2.jpg" width="282" height="344">
						<div class="post-info">
							<div class="post-basic-info">
								<h3>
									<a href="board_trade.do">B. 판매 경매</a>
								</h3>
								<span><a href="board_trade.do"><label></label>Shop</a></span>
								<p>판매에 관련된 정보를 얻어가세요</p>
								<p>Get sales information.</p>
							</div>
							<div class="post-info-rate-share">
								<div class="rateit">
									<span> </span>
								</div>
								<div class="post-share">
									<span> </span>
								</div>
								<div class="clear"></div>
							</div>
						</div></li>
					<li onclick="location.href='single-page.html';"><img
						src="board/index/images/img3.jpg" width="282" height="210">
						<div class="post-info">
							<div class="post-basic-info">
								<h3>
									<a href="board_shard.do">C. 나눔</a>
								</h3>
								<span><a href="board_shard.do"><label> </label>Share</a></span>
								<p>다양한 상품을 나눔하세요</p>
								<p>Share a variety of products</p>
							</div>
							<div class="post-info-rate-share">
								<div class="rateit">
									<span> </span>
								</div>
								<div class="post-share">
									<span> </span>
								</div>
								<div class="clear"></div>
							</div>
						</div></li>
					<li onclick="location.href='single-page.html';"><img
						src="board/index/images/img4.jpg" width="282" height="385">
						<div class="post-info">
							<div class="post-basic-info">
								<h3>
									<a href="board_talk.do">D. 수다</a>
								</h3>
								<span><a href="board_talk.do"><label> </label>Talk</a></span>
								<p>사람들과 즐겁게 소통하세요</p>
								<p>Commumicate joyfull with people.</p>
							</div>
							<div class="post-info-rate-share">
								<div class="rateit">
									<span> </span>
								</div>
								<div class="post-share">
									<span> </span>
								</div>
								<div class="clear"></div>
							</div>
						</div></li>
						
					<!----//--->

					<!-- End of grid blocks -->
				</ul>
			</div>
		</div>
	</div>
	
	<!---//End-content---->
	<!----wookmark-scripts---->
	<script src="board/index/js/jquery.imagesloaded.js"></script>
	<script src="board/index/js/jquery.wookmark.js"></script>
	<script type="text/javascript">
		(function($) {
			var $tiles = $('#tiles'), $handler = $('li', $tiles), $main = $('#main'), $window = $(window), $document = $(document), options = {
				autoResize : true, // This will auto-update the layout when the browser window is resized.
				container : $main, // Optional, used for some extra CSS styling
				offset : 20, // Optional, the distance between grid items
				itemWidth : 280
			// Optional, the width of a grid item
			};
			/**
			 * Reinitializes the wookmark handler after all images have loaded
			 */
			function applyLayout() {
				$tiles.imagesLoaded(function() {
					// Destroy the old handler
					if ($handler.wookmarkInstance) {
						$handler.wookmarkInstance.clear();
					}

					// Create a new layout handler.
					$handler = $('li', $tiles);
					$handler.wookmark(options);
				});
			}

			// Call the layout function for the first time
			applyLayout();

		
		})(jQuery);
	</script>
	<!----//wookmark-scripts---->
	<!----start-footer--->
   <!-- Footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- SCIPTS -->

	<script src="main/plugin-frameworks/jquery-3.2.1.min.js"></script>

	<script src="main/plugin-frameworks/bootstrap.min.js"></script>

	<script src="main/plugin-frameworks/swiper.js"></script>


	<script src="main/common/scripts.js"></script>
	<!----//End-footer--->
	<!---//End-wrap---->
</body>
</html>
