function acyncMovePage(url) {
	// ajax option
	var ajaxOption = {
		url : url,
		type : "POST",
		dataType : "html",
		cache : false
	};

	$.ajax(ajaxOption).done(function(data) {
		// Contents 영역 삭제
		$('#content-wrapper').children().remove();
		// Contents 영역 교체
		$('#content-wrapper').html(data);
	});
}
