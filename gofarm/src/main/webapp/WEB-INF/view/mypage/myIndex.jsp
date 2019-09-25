<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="mm" value="${labelData}" />
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Mypage - MyIndex</title>

  <!-- Custom fonts for this template-->
  <link href="mypage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="mypage/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="mypage/css/sb-admin.css" rel="stylesheet">
<style type="text/css">
	.border-left-primary {
    border-left: .25rem solid #4e73df!important;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('mileageViewDiv').on('click', function() {
		location.href='mileage.do';
	});
	
	
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#292b2c';

	var ctx = document.getElementById("myAreaChart");
	var dto = JSON.parse('${alldata}');
	var mileageArr = new Array();
	var dayArr = new Array();
	for (var i = 0; i < dto.length; i++) {
		mileageArr[i] = dto[i].m_total;
		dayArr[i] = dto[i].m_day;
	}
	var myLineChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: dayArr,
	    datasets: [{
	      label: "Sessions",
	      lineTension: 0.3,
	      backgroundColor: "rgba(2,117,216,0.2)",
	      borderColor: "rgba(2,117,216,1)",
	      pointRadius: 5,
	      pointBackgroundColor: "rgba(2,117,216,1)",
	      pointBorderColor: "rgba(255,255,255,0.8)",
	      pointHoverRadius: 5,
	      pointHoverBackgroundColor: "rgba(2,117,216,1)",
	      pointHitRadius: 50,
	      pointBorderWidth: 2,
	      data: mileageArr,
	    }],
	  },
	  options: {
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'date'
	        },
	        gridLines: {
	          display: false
	        },
	        ticks: {
	          maxTicksLimit: 7
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: 1000000,
	          maxTicksLimit: 5
	        },
	        gridLines: {
	          color: "rgba(0, 0, 0, .125)",
	        }
	      }],
	    },
	    legend: {
	      display: false
	    }
	  }
	});
});

</script>	
	
</head>

<body id="page-top">

	<!-- Navbar -->
	<jsp:include page="/WEB-INF/view/mypage/common/mypage_nav.jsp"></jsp:include>
	<div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/view/mypage/common/mypage_sidebar.jsp"></jsp:include>
    <div id="content-wrapper">
      <div class="container-fluid">
        <div class="card-header">
				<i class="fas fa-table"></i> OverView
		</div>

        <!-- Icon Cards-->
        <div class="row">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-life-ring"></i>
                </div>
                <div class="mr-5"> 내 마일리지   : ${myCnt_dto.mileage} 원!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="mileage.do">
                <span class="float-left">View Details	</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-list"></i>
                </div>
                <div class="mr-5">내 이력서 열람인원 ${myCnt_dto.jk_cnt} 명!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="jobSearchView.do">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <div class="mr-5">판매된 물건 ${myCnt_dto.prod_cnt} 건!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="product.do">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <div class="mr-5">진행중인 경매 ${myCnt_dto.auction_cnt} 건!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="myAuction.do">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
        </div>

        <!-- Area Chart Example-->
        <div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-chart-area"></i> 최근 한달간 마일리지 변동 현황
			</div>
			<div class="card-body">
            <canvas id="myAreaChart" width="100%" height="30"></canvas>
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- logOut -->
  <jsp:include page="/WEB-INF/view/mypage/common/mypage_logOut.jsp"></jsp:include>
  
  <!-- Bootstrap core JavaScript-->
  <script src="mypage/vendor/jquery/jquery.min.js"></script>
  <script src="mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="mypage/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="mypage/vendor/chart.js/Chart.min.js"></script>
  <script src="mypage/vendor/datatables/jquery.dataTables.js"></script>
  <script src="mypage/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="mypage/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  
</body>

</html>
