$(document).ready(function() {
	
	acyncMovePage('paymentPorm.do');
	
}); 

function acyncMovePage(url) {
	var ajaxOption = {
		url : url,
		async : true,
		// type : "POST",
		dataType : "html",
		cache : false
	};

	$.ajax(ajaxOption).done(function(data) {
		$('#payment_content').children().remove();
		$('#payment_content').html(data);
	});
}
