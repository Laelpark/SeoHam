checkNull = function(obj, value) {
    if (value == "" || value == null) {
        obj.focus();
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

const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success');
};

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
};

// 아이디

id_check = function(obj, value, feedback, msg) {
	if (!checkNull(obj, value)) {
        fail(obj, feedback, msg);
        return false;
    } else if(!(($.trim($(obj).val()).length > 3) && ($.trim($(obj).val()).length < 10))) {
        fail(obj, feedback, "3~10 자리까지 입력하시오");
        return false;
    } else { 
		/*success(obj, feedback, "사용가능한 아이디입니다.");*/
        return true;
    }
}	

// 비밀번호
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

// name
name_V = function(obj, value, message, hide) {
    const re = /^[ㄱ-ㅎ가-힣a-zA-z]{1,10}$/g;
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else if (!(re.test($.trim($(obj).val())))) {
        $(hide).text('양식에 맞게 작성하시오')
        hide.parent().addClass('error')
        $(hide).show()
        return false;
    } else if(!(($.trim($(obj).val()).length > 1) && ($.trim($(obj).val()).length < 10))) {
        $(hide).text('2~10자 사이의 이름을 작성하시오')
        hide.parent().addClass('error')
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).hide()
        return true;
    }
}



