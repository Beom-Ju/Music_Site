

/**
 * 회원가입으로 화면 이동
 */
function goJoin() {
	document.login_form.action="join_form";
	document.login_form.submit();
}

/*
* 아이디 중복체크 화면 표시 및 확인
*/
function idCheck() {
	if (document.join_form.id.value == "") {
		alert("아이디를 입력해주세요!");
		document.join_form.id.focus();
		return;
	} else if (document.join_form.id.value.length < 3 || document.join_form.id.value.length > 7) {
		alert("아이디를 3~7자리로 입력해주세요.");
		document.join_form.id.focus();
		return;
	} else {
	var url = "id_check_form?id=" + document.join_form.id.value;
	window.open(url, "_blank_1", "left=800, top=400, toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=350, height=230");
	}
}

/*
* 아이디가 중복일 경우
*/
function idExit() {
	opener.join_form.id.value = "";
	opener.join_form.id.focus();
	
	self.close();
}


/**
  아이디 중복확인 후 적용
 */
/*
function idOk() {
	opener.join_form.id.value = "${id}";
	opener.join_form.idOk.value = "${id}";
	
	self.close();
}
*/
/**
	우편번호 화면 표시(회원가입)
 */
function join_addr_search() {
	var url = "join_addr_search";
	window.open(url, "_blank_1", "left=800, top=400, toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=500");
}

function join_addr_search2() {
	if (document.addr_form.dong.value == "") {
		alert("동이름을 입력해 주세요!");
		document.addr_form.dong.focus();
		return;
	} 
}



/*
* 회원가입
*/

function go_save() {
	
	var form = document.join_form; 
	
	if (form.id.value == "") {
		alert("아이디를 입력해주세요.");
		form.id.focus();
	} else if (form.id.value.length < 3 || form.id.value.length > 7) {
		alert("아이디를 3~7자리로 입력해주세요.");
		form.id.focus();
	} else if (form.idOk.value == "" || form.id.value != form.idOk.value) {
		alert("중복확인을 해주세요.");
		form.id.focus();
	} else if (form.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		form.pwd.focus();
	} else if (form.pwd.value.length < 4 || form.pwd.value.length > 9) {
		alert("비밀번호를 4~9자리로 입력해주세요.");
		form.pwd.focus();
	} else if (form.pwdCheck.value == "") {
		alert("비밀번호를 한번 더 입력해주세요.");
		form.pwdCheck.focus();
	} else if (form.pwd.value != form.pwdCheck.value) {
		alert("비밀번호가 일치하지 않습니다.")
		form.pwd.focus();
	} else if (form.name.value == "") {
		alert("이름을 입력해주세요.");
		form.name.focus();
	} else if (form.birth.value == "") {
		alert("생년월일을 입력해주세요.");
		form.birth.focus();
	} else if (form.phone.value == "") {
		alert("전화번호를 입력해주세요.");
		form.phone.focus();
	} else if (form.email.value == "") {
		alert("이메일을 입력해주세요.");
		form.email.focus();
	} else {
	
		if (confirm("회원가입을 하시겠습니까?") == true) {
			alert("가입이 완료되었습니다!");
			document.join_form.action="join";
			document.join_form.submit();
		} else {
			return;
		}
	}


}

/**
	아이디 찾기(이메일로)
 */
function go_findId_email() {
	
	var form = document.findId_email;
	
	if (form.name.value == "") {
		alert("이름을 입력해 주세요.");
		form.name.focus();
	} else if (form.email.value=="") {
		alert("이메일을 입력해 주세요.");
		form.email.focus();
	} else {
		form.action="findId_email";
		form.submit();
	}
}

/**
	아이디 찾기(전화번호로)
 */
function go_findId_phone() {
	
	var form = document.findId_phone;
	
	if (form.name.value == "") {
		alert("이름을 입력해 주세요.");
		form.name.focus();
	} else if (form.phone.value=="") {
		alert("전화번호를 입력해 주세요.");
		form.phone.focus();
	} else {
		form.action="findId_phone";
		form.submit();
	}
}

/**
	비밀번호 찾기(이메일로)
 */
function go_findPwd_email() {
	
	var form = document.findPwd_email;
	
	if (form.id.value == "") {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
	} else if (form.name.value == "") {
		alert("이름을 입력해 주세요.");
		form.name.focus();
	} else if (form.email.value=="") {
		alert("이메일을 입력해 주세요.");
		form.email.focus();
	} else {
		form.action="findPwd_email";
		form.submit();
	}
}

/**
	비밀번호 찾기(전화번호로)
 */
function go_findPwd_phone() {
	
	var form = document.findPwd_phone;
	
	if (form.id.value == "") {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
	} else if (form.name.value == "") {
		alert("이름을 입력해 주세요.");
		form.name.focus();
	} else if (form.phone.value=="") {
		alert("전화번호를 입력해 주세요.");
		form.phone.focus();
	} else {
		form.action="findPwd_phone";
		form.submit();
	}
}

/**
	비밀번호 찾기 후 비밀번호 수정
 */
function go_pwd_update() {
	
	var form = document.find_form; 
	
	if (form.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		form.pwd.focus();
	} else if (form.pwd.value.length < 4 || form.pwd.value.length > 9) {
		alert("비밀번호를 4~9자리로 입력해주세요.");
		form.pwd.focus();
	} else if (form.pwdCheck.value == "") {
		alert("비밀번호를 한번 더 입력해주세요.");
		form.pwdCheck.focus();
	} else if (form.pwd.value != form.pwdCheck.value) {
		alert("비밀번호가 일치하지 않습니다.")
		form.pwd.focus();
	} else {
		form.action = "update_pwd";
		form.submit();
	}
	
}

/**
	마이페이지 이동
 */
function go_mypage() {
	
	if (document.pwdCheck_form.pwd.value=="") {
		alert("비밀번호를 입력해 주세요");
		document.pwdCheck_form.pwd.focus();
	} else {
		document.pwdCheck_form.action = "mypage";
		document.pwdCheck_form.submit();
	}
}


/**
	마이페이지 수정
 */

function go_update() {
	
	var form = document.mypage_form; 
	
	if (form.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		form.pwd.focus();
	} else if (form.pwd.value.length < 4 || form.pwd.value.length > 9) {
		alert("비밀번호를 4~9자리로 입력해주세요.");
		form.pwd.focus();
	} else if (form.pwdCheck.value == "") {
		alert("비밀번호를 한번 더 입력해주세요.");
		form.pwdCheck.focus();
	} else if (form.pwd.value != form.pwdCheck.value) {
		alert("비밀번호가 일치하지 않습니다.")
		form.pwd.focus();
	} else if (form.name.value == "") {
		alert("이름을 입력해주세요.");
		form.name.focus();
	} else if (form.birth.value == "") {
		alert("생년월일을 입력해주세요.");
		form.birth.focus();
	} else if (form.phone.value == "") {
		alert("전화번호를 입력해주세요.");
		form.phone.focus();
	} else if (form.email.value == "") {
		alert("이메일을 입력해주세요.");
		form.email.focus();
	} else {
	
		if (confirm("수정을 완료하시겠습니까?") == true) {
			alert("개인정보가 변경 되었습니다.");
			document.mypage_form.action="update";
			document.mypage_form.submit();
		} else {
			return;
		}
	}

}	

/**
	우편번호 화면 표시(마이페이지)
 */
function my_addr_search() {
	var url = "my_addr_search";
	window.open(url, "_blank_1", "left=800, top=400, toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=500");
}

function my_addr_search2() {
	if (document.addr_form.dong.value == "") {
		alert("동이름을 입력해 주세요!");
		document.addr_form.dong.focus();
		return;
	} 
}

/**
	탈퇴하기
 */

function go_delete() {
	
	var form = document.delete_form;

	
	if (form.reason.value == "") {
		alert("탈퇴 사유를 체크해주세요");
		
	} else if (form.reason.value=="etc" && form.etc_reason.value=="") {
			alert("기타 사유를 입력해 주세요.");
			form.etc_reason.focus();
				
	} else if (form.pwd.value == "") {
		alert("비밀번호를 입력해주세요");
		form.pwd.focus();
		
	} else {
		if (confirm("정말 탈퇴하시겠습니까?")==true) {
			form.action="delete";
			form.submit();
		} else {
			return;
		}
	}

}


function go_intro() {
	
	if(document.intro_form.intro.value == "") {
		alert("소개글을 입력해주세요!");
		document.intro_form.intro.focus();
	} else {
		document.intro_form.action = "intro";
		document.intro_form.submit();
	}
}

