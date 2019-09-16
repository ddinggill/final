$(document).ready(function() {
	var charge_price=0;
	$("input#price_custom").on("click", function(){
	    $('#priceD').prop('checked', true);
	 });
	
	$('#bootPay_btn').on('click', function() {
		if($('input[type="radio"]:checked').val()==0){
			 charge_price = $('#price_custom').val();
		}else {
			charge_price = $('input[type="radio"]:checked').val();
		}
		
		BootPay.request({
			price: charge_price, //실제 결제되는 가격
			application_id: "5d5e7f090627a800293d1a42",
			name: '마일리지 충전', //결제창에서 보여질 이름
			pg: '',
			method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			items: [
				{
					item_name: 'Mileage', //상품명
					qty: 1, //수량
					unique: 'Mileage', //해당 상품을 구분짓는 primary key
					price: charge_price, //상품 단가
					cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
					cat2: 'Cash', // 대표 상품의 카테고리 중, 50글자 이내
					cat3: 'Mileage', // 대표상품의 카테고리 하, 50글자 이내
				}
			],
			user_info: {
				username: $('#userName').val(),
				email: $('#userEmail').val(),
				addr: $('#userHome').val(),
				phone: $('#userPhone').val()
			},
			order_id: '123456789', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {callback1: 'gofarm', callback2: 'mileage_charge', customvar1234: 'callback'},
			account_expire_at: $('#sysdate').val(), // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
			    start_at: $('#sysdate').val(), // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at: '', // 정기결제 만료일 -  기간 없음 - 무제한
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
			alert("결제가 완료되었습니다.");
			console.log(data);
			$('#f_mileage_charge').append('<input type="hidden" id="m_list" name="m_list" value="'+charge_price+'"/>');
			$('#f_mileage_charge').submit();
		});
		
	});
});
