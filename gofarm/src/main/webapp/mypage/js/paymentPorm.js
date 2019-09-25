$(document).ready( function() {

		$("#m_list").on( "propertychange change keyup paste input", function() {
			var mileage = Number('${userDTO.mileage}');
			if (mileage < $("#m_list").prop('min')) {
				alert("보유하신 마일리지가 " + $("#m_list").prop('min') + " 보다 적어서 출금할 수 없습니다.")
				return false;
			}
		});

		$('#payment_btn').on( 'click', function() {
			var withdraw = Number($("#m_list").val());

			if (withdraw > $("#m_list").prop('max')) {
				alert($("#m_list").prop('max') + "원 보다 큰 금액은 출금할 수 없습니다.");
				$("#m_list").val($("#m_list").prop('max'));
				$("#m_list").focus();
				return false;
			} else if (withdraw < $("#m_list").prop('min')) {
				alert($("#m_list").prop('min') + "원 보다 작은 금액은 출금할 수 없습니다.")
				$("#m_list").val($("#m_list").prop('min'));
				$("#m_list").focus();
				return false;
			}

			$('#frmPayment').submit();
		});

	});