/**
 * 
 */
$('#mail_rejected').click(function() {
	mail_rejected();
});
$('#id').keyup(function() {
	idCheck($('#id').val());
});
$('#reg_pass').blur(function() {
	passCheck();
});
$('#reg_pass_re').keyup(function() {
	passCheck();
});
function idCheck(ObjectValue) {
	var rst = 0 ;
	if ($('#id').val().length < 3) {
		$('#id_noti').html("아이디는 3글자 이상이여야 합니다");
		rst = -1;
	} else if (h_check(ObjectValue) >= 0) { // 한글이나 특문을 사용하지 않았을경우
		$.ajax({
			method : 'GET',
			url : '/AppleMango/user/register_inner.in',
			dataType : 'text',
			data : {
				id : $('#id').val()
			}
		}).success(function(msg) {
			$('#id_noti').html(msg);
			rst = 1;
		});
	} else {
		rst = -1;
	}
	return rst;
}

function registerCheck() {
	if (idCheck($('#id').val())) {
		alert("아아디가 부적합 합니다.");
		$('#reg_id').focus();
	} else if (passCheck() == -1) {
		alert("비밀번호를 작성하지 않았거나, 비밀번호가 일치하지 않습니다.");
		$('#reg_pass').focus();
	} else if ($('#email').val() == "") {
		alert("email을 작성하지 않았습니다.");
	} else {
		$("#register").submit();
	}
}

function mail_rejected() {
	if ($('#mail_rejected').prop('checked')) {
		alert("이벤트 정보를 수신하지 않습니다.");
	}
}

function h_check(ObjectValue) {
	var intErr = 0;
	var strValue = ObjectValue;
	var retCode = 0;
	var re = /[~!@\#$%<>^&*\[\]\;\:\"\,\/\?{}()\-=+'|\\]/gi; // 특수문자 정규식 변수
	// 선언
	for (i = 0; i < strValue.length; i++) {
		var retCode = strValue.charCodeAt(i)
		var retChar = strValue.substr(i, 1).toUpperCase()
		retCode = parseInt(retCode)

		// 입력받은 값중에 한글이 있으면 에러
		if ((retChar < "0" || retChar > "9")
				&& (retChar < "A" || retChar > "Z")
				&& ((retCode > 255) || (retCode < 0))) {
			intErr = -1;
			$('#id_noti').html("한글은 입력 불가능합니다.");
			break;
			// 입력받은 값중에 특수문자가 있으면 에러
		} else if (re.test(strValue)) {
			intErr = -1;
			$('#id_noti').html("특수문자는 _와 .만 사용가능합니다.");
			break;
		}
	}
	return intErr;
}
function passCheck() {
	if ($('#reg_pass').val().length < 7) {
		$('#reg_pass_noti').html("비밀번호는 7글자 이상이여야 합니다");
	} else if ($('#reg_pass_re').val() != $('#reg_pass').val()) {
		if ($('#reg_pass_re').val().length == 0) {
			$('#reg_pass_noti').html("");
			$('#reg_pass_re').focus();
		} else {
			$('#reg_pass_noti').html("비밀번호가 일치하지 않습니다");
		}
	} else {
		$('#reg_pass_noti').html("비밀번호가 일치합니다");
		return 1;
	}
	return -1;
}
