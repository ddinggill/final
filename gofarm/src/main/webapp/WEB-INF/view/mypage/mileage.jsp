<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>마이페이지 - 마일리지</title>

<!-- Custom fonts for this template-->
  <link href="mypage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="mypage/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="mypage/css/sb-admin.css" rel="stylesheet">

</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.5.min.js" type="application/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	//결제창 테스트 추가코드
	//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
	$('#bootpay').on('click', function() {
		BootPay.request({
			price: '1000', //실제 결제되는 가격
			application_id: "5d5e7f090627a800293d1a42",
			name: '경기 이천쌀', //결제창에서 보여질 이름
			pg: '',
			method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			items: [
				{
					item_name: 'rice', //상품명
					qty: 1, //수량
					unique: 'rice1', //해당 상품을 구분짓는 primary key
					price: 1000, //상품 단가
					cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2: '농산물', // 대표 상품의 카테고리 중, 50글자 이내
					cat3: '쌀', // 대표상품의 카테고리 하, 50글자 이내
				}
			],
			user_info: {
				username: '박종현',
				email: 'qqq11@naver.com',
				addr: '경기도 양주시',
				phone: '010-1234-4567'
			},
			order_id: '123456789', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {callback1: 'gofarm', callback2: 'mileage_charge', customvar1234: 'callback'},
			account_expire_at: '2019-09-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
			    start_at: '2019-09-09', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at: '2022-09-10', // 정기결제 만료일 -  기간 없음 - 무제한
		        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
		        quota: '' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			alert("결제 진행중 문제가 발생하였습니다.");
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			alert("결제가 취소되었습니다.");
			console.log(data);
		}).ready(function (data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				this.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				this.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행됩니다
			
			
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			var BootpayRest = require('bootpay-rest-client');
			BootpayRest.setConfig("5d5e7f090627a800293d1a45", "yPFihV059mEi24gXu0RWHhR/PT+UG88JtGjLq1AxpiU=");
			BootpayRest.getAccessToken().then(function (response) {
				// Access Token을 발급 받았을 때
				if (response.status === 200 && response.data.token !== undefined) {
					BootpayRest.verify('[[ receipt_id ]]').then(function (_response) {
						// 검증 결과를 제대로 가져왔을 때
						if (_response.status === 200) {
							// 원래 주문했던 금액이 일치하는가?
							// 그리고 결제 상태가 완료 상태인가?
							if (_response.data.price === price && _response.data.status === 1) {
								// TODO: 이곳이 상품 지급 혹은 결제 완료 처리를 하는 로직으로 사용하면 됩니다.
								alert('결제 검증 결과 완료');
							}
						}
					});
				}
			});
			
			console.log(api.getAccessToken());
			alert("결제가 완료되었습니다.");
			console.log(data);
		});
	});
});
</script>

<body id="page-top">
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>마일리지
          </div>
          <div class="card-body">
          <p><span>현재 마일리지&emsp;</span><span>20000</span></p>
          <p><input type="button" id="bootpay" value="결제" /></p>
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  	<th>번호</th>
                    <th>이전 마일리지(현재마일리지-마일리지 증감량)</th>
                    <th>마일리지 증감량</th>
                    <th>마일리지 증감내용</th>
                    <th>현재 마일리지</th>
                    <th>일자</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                 	 <th>번호</th>
                    <th>이전 마일리지(현재마일리지-마일리지 증감량)</th>
                    <th>마일리지 증감량</th>
                    <th>마일리지 증감내용</th>
                    <th>현재 마일리지</th>
                    <th>일자</th>
                  </tr>
                </tfoot>
                <tbody>
                  <tr>
                  	<th>1</th>
                    <td>0</td>
                    <td>+10,000</td>
                    <td>마일리지 충전</td>
                    <td>10,000</td>
                    <td>2011/04/25</td>
                  </tr>
                  <tr>
                  	<th>2</th>
                    <td>10,000</td>
                    <td>+60,000</td>
                    <td>블링블링 마스카라 5개 판매</td>
                    <td>70,000</td>
                    <td>2011/05/16</td>
                  </tr>
                  </tr>
                  <tr>
                  	<th>3</th>
                    <td>70,000</td>
                    <td>-50,000</td>
                    <td>마일리지 출금</td>
                    <td>20,000</td>
                    <td>2011/05/20</td>
                  </tr>
                  <tr>
                 	<th>4</th>
                    <td>Ashton Cox</td>
                    <td>Junior Technical Author</td>
                    <td>San Francisco</td>
                    <td>66</td>
                    <td>2009/01/12</td>
                  </tr>
                  <tr>
                  	<th>5</th>
                    <td>Airi Satou</td>
                    <td>Accountant</td>
                    <td>Tokyo</td>
                    <td>33</td>
                    <td>2008/11/28</td>
                  </tr>
                  <tr>
                  	<th>6</th>
                    <td>Integration Specialist</td>
                    <td>New York</td>
                    <td>61</td>
                    <td>$372,000</td>
                    <td>2012/12/02</td>
                  </tr>
                  <tr>
                  	<th>7</th>
                    <td>Sales Assistant</td>
                    <td>San Francisco</td>
                    <td>59</td>
                    <td>$137,500</td>
                    <td>2012/08/06</td>
                  </tr>
                  <tr>
                  	<th>8</th>
                    <td>Integration Specialist</td>
                    <td>Tokyo</td>
                    <td>55</td>
                    <td>$327,900</td>
                    <td>2010/10/14</td>
                  </tr>
                  <tr>
                  	<th>9</th>
                    <td>Colleen Hurst</td>
                    <td>Javascript Developer</td>
                    <td>San Francisco</td>
                    <td>39</td>
                    <td>2009/09/15</td>
                  </tr>
                  <tr>
                  	<th>10</th>
                    <td>Software Engineer</td>
                    <td>Edinburgh</td>
                    <td>23</td>
                    <td>$103,600</td>
                    <td>2008/12/13</td>
                  </tr>
                  <tr>
                  	<th>11</th>
                    <td>Office Manager</td>
                    <td>London</td>
                    <td>30</td>
                    <td>$90,560</td>
                    <td>2008/12/19</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

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

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="mypage/vendor/jquery/jquery.min.js"></script>
  <script src="mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="mypage/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="mypage/vendor/datatables/jquery.dataTables.js"></script>
  <script src="mypage/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="mypage/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="mypage/js/demo/datatables-demo.js"></script>

</body>

</html>
