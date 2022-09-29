checkNull = function(obj, value) {
    if (value == "" || value == null) {
        $(obj).focus();
        return false;
    } else {
        return true;
    }
}

success = function(obj, feedback, msg) {
	$(obj).addClass('is-valid');

	$(feedback).addClass('valid-feedback');
	$(feedback).removeClass('invalid-feedback');
	$(feedback).text(msg);
};

fail = function(obj, feedback, msg) {
	$(obj).addClass('is-invalid');
	
	$(feedback).addClass('invalid-feedback');
	$(feedback).removeClass('valid-feedback');
	$(feedback).text(msg);
};



id_check = function(obj, value, feedback, msg) {
	if (!checkNull(obj, value)) {
        fail(obj, feedback, msg);
        return false;
    } else if(!(($.trim($(obj).val()).length > 2) && ($.trim($(obj).val()).length < 21))) {
        fail(obj, feedback, "2~20 자리까지 입력하시오");
        return false;
    } else { 
		success(obj, feedback, "사용가능한 비밀번호입니다.");
        return true;
    }
}	