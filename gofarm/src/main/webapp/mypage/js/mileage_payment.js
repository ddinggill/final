$(document).ready(function() {
	$('#payment_btn').on('click', function() {
		$('#frmPayment').submit();
	});
	
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



/*
$.ajax({
    type : "GET",
    url : "test.jsp",
    dataType : "html",
    error : function() {
        alert('통신실패!!');
    },
    success : function(data) {
    	alert('dd');
    	$('#payment_content').children().remove();
    }

});
*/

/*
function acyncMovePage(url) {
	var ajaxOption = {
		url : url,
		// async : true,
		// type : "POST",
		dataType : "html",
		cache : false
	};

	$.ajax(ajaxOption).done(function(data) {
		alert('aa');
		$('#bodyContents').children().remove();
		$('#bodyContents').html(data);
	});
}
*/