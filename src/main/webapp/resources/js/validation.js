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
	$(obj).focus();
	
	$(feedback).addClass('invalid-feedback');
	$(feedback).removeClass('valid-feedback');
	$(feedback).text(msg);
};



id_check = function(obj, value, feedback, msg) {
	if (!checkNull(obj, value)) {
        fail(obj, feedback, msg);
        return false;
    } else if(!(($.trim($(obj).val()).length > 2) && ($.trim($(obj).val()).length < 10))) {
        fail(obj, feedback, "3~10 자리까지 입력하시오");
        return false;
    } else { 
		/*success(obj, feedback, "사용가능한 아이디입니다.");*/
        return true;
    }
}	

pw_check = function(obj, value, feedback, msg) {
	/* const re = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/g; */ 
	if (!checkNull(obj, value)) {
        fail(obj, feedback, msg);
        return false;
    } else if(!(($.trim($(obj).val()).length > 5) && ($.trim($(obj).val()).length < 12))) {
        fail(obj, feedback, "6~12 자리까지 입력하시오");
        return false;
    } else { 
		success(obj, feedback, "사용가능한 비밀번호입니다.");
        return true;
    }
}

pwRecheck = function(obj, value, feedback, msg) {
	if (!checkNull(obj, value)) {
        fail(obj, feedback, msg);
        return false;
    } else if(!(($.trim($(obj).val()) === $.trim($('#pw').val())))){	 
        fail(obj, feedback, "비밀번호가 일치하지 않습니다.");
        return false;
    } else { 
		success(obj, feedback, "비밀번호가 일치합니다.");
        return true;
    }
}
