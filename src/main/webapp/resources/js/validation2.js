checkNull = function(obj, value) {
    if (value == "" || value == null) {
        obj.focus();
        return false;
    } else {
        return true;
    }
}

checkNullWithoutFocus = function(value) {
    if (value == "" || value == null) {
        alert(message);
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).hide()
        return true;
    }
}

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

errorValidation = function(input, msg, message) {
	        $(msg).text(message);
	        $(msg).show();
	        $(input).val('');
	        $(input).focus();
		}

id_regex = function(obj, value, message, hide) {
    const re = /^[A-Za-z가-힣]{1}[A-Za-z가-힣]{2,19}$/g;
    if ($("#id").val() == null || $("#id").val() == "" ) {
				document.getElementById("id").classList.add('is-invalid');
				document.getElementById("idFeedback").innerText = "아이디를 다시 확인해주세요.";
				$("#id").focus();
			} else {
				document.getElementById("id").classList.add('is-valid');
			}
}
