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

  <title></title>

</head>

<body>
       <!-- ▼ 마일리지 출금 정보 //-->
				<form id="frmPayment" name="frmPayment" method="post" action="mileage_payment_end.do">
					<input type="hidden" name="total_mileage" id="total_mileage" value="0"> 
					<input type="hidden" name="enable_mileage" id="enable_mileage" value="0"> 
					<input type="hidden" name="charge" id="charge" value="1000"> 
					<input type="hidden" name="creditrating" id="creditrating" value="0">
					<input type="hidden" name="dailycount" id="dailycount" value="0">
					<div class="g_subtitle first">나의 계좌정보</div>
					<table class="g_blue_table">
						<colgroup>
							<col width="160">
							<col width="250">
							<col width="160">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th>은행명</th><td colspan="3"><span>${userDTO.bank}은행</span>
									<div class="g_right">
										*본인 명의 계좌가 아니면 출금이 불가능합니다. 
										<img src="https://img3.itemmania.com/images/btn/btn_bank_edit.gif"
											width="84" height="18" alt="출금계좌수정" class="g_button"
											id="bankmodify_btn">
									</div>
								</td>
							</tr>
							<tr>
								<th>계좌번호</th>
								<td>${userDTO.account}</td>
								<th>예금주</th>
								<td>${userDTO.name}</td>
							</tr>
						</tbody>
					</table>
					<div class="g_subtitle">출금신청</div>
					<table class="g_blue_table">
						<colgroup>
							<col width="160">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th>출금가능 마일리지</th>
								<td><span id="mileage_total">${userDTO.mileage} 원</span></td>
							</tr>
							<tr>
								<th>출금할 마일리지</th>
								<td><input type="text" name="m_list" id="m_list"
									class="g_text" maxlength="13" value="0"> 원</td>
							</tr>
							<!-- <tr>
								<th colspan="2">실제 출금 마일리지 : <span id="spnPayment_mileage"
									class="spnPayment_mileage">0</span> 원
								</th>
							</tr> -->
						</tbody>
					</table>
					<!-- ▲ 마일리지 출금 정보 //-->
					<ul class="box6 g_list">
						<li>출금가능시간 : 04:00 ~ 22:50 (단, 우체국은 05:00 부터 가능)</li>
						<li>매주 첫 영업 개시일에는 출금이 오전 6시 40분부터 출금가능합니다. 
							<div class="g_msgbox blue guide_info" id="guide_info">
								<div class="title">
									영업개시일이란? <a href="javascript:;" class="close"></a>
								</div>
								<div class="cont">매주 공휴일이 아닌 첫 영업일 즉, 월,화요일이 공휴일인 경우 수요일이 영업개시일이 됩니다.</div>
							</div>
						</li>
					</ul>
					<div class="g_btn">
						<input type="image"
							src="https://img2.itemmania.com/images/btn/btn_mileage_pay.gif"
							width="115" height="37" alt="마일리지 출금" class="g_image" id="payment_btn">
					</div>
				</form>
				<div class="g_finish"></div>

				<!-- ▼ 알아두기 //-->
				<div class="g_notice">알아두기</div>
				<ul class="g_notice_box1 g_list">
					<li>마일리지 출금은 은행과 연계 시스템으로 신청 즉시 출금이 됩니다.</li>
					<li>마일리지 출금 시 출금 수수료 1,000원이 부과됩니다.</li>
					<li>마일리지 출금 요청 즉시 고객님이 요청하신 출금 계좌로 입금이 되지만, 성공 여부를 알려드리기 까지는 약 1~2분이 소요될 수 있습니다.</li>
					<li>마일리지 출금 서비스는 오전 04:00부터 오후	10:50분 까지만 가능합니다.</li>
					<li>오후 10:50 이후부터 오전 04:00까지는 은행의 전산망 점검 시간으로 출금이 되지 않습니다.</li>
				</ul>
				<!-- ▲ 알아두기 //-->
</body>
</html>
