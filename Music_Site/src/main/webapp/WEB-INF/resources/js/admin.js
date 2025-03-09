/**
 * 
 */

function singer_write() {
	
	var form = document.singer_form;
	
	if (form.singer_name.value == "") {
		
		alert("가수명을 입력해주세요.");
		form.singer_name.focus();
	} else if (form.regdate_year.value=="") {
		
		alert("데뷔 년도를 입력해주세요.");
		form.regdate_year.focus();
	} else if (form.first_song.value=="") {
		alert("데뷔 곡을 입력해주세요.");
		form.first_song.focus();
	} else {
		form.action="singerWrite";
		form.submit();
	}
}



function singer_update() {
	
	var form = document.singer_up_form;
	
	if (form.singer_name.value == "") {
		
		alert("가수명을 입력해주세요.");
		form.singer_name.focus();
	} else if (form.regdate_year.value=="") {
		
		alert("데뷔 년도를 입력해주세요.");
		form.regdate_year.focus();
	} else if (form.first_song.value=="") {
		alert("데뷔 곡을 입력해주세요.");
		form.first_song.focus();
	} else {
		form.action="singerUpdate";
		form.submit();
	}
}

function album_write() {
	
	var form = document.album_form;
	
	if (form.album_kind.value == "선택") {
		alert("앨범 종류를 선택하세요");
	} else if (form.album_name.value == "") {
		alert("앨범명을 입력해 주세요");
	} else if (form.regdate.value == "") {
		alert("앨범 발매일을 입력해 주세요")
	} else if (form.genre.value == "선택") {
		alert("장르를 선택하세요")
	} else if (form.kpop.value == "") {
		alert("국내 앨범인지, 해외 앨범인지 선택해주세요");
	} else {
		form.action ="albumWrite";
		form.submit();
	}
}

function album_update() {
	
	var form = document.album_up_form;
	
	if (form.album_kind.value == "선택") {
		alert("앨범 종류를 선택하세요");
	} else if (form.singer_name.value == "") {
		alert("가수 이름을 입력해 주세요");
	} else if (form.album_name.value == "") {
		alert("앨범명을 입력해 주세요");
	} else if (form.regdate.value == "") {
		alert("앨범 발매일을 입력해 주세요")
	} else if (form.genre.value == "선택") {
		alert("장르를 선택하세요")
	} else if (form.kpop.value == "") {
		alert("국내 앨범인지, 해외 앨범인지 선택해주세요");
	} else {
		form.action ="albumUpdate";
		form.submit();
	}
}

function song_write() {
	 
	var form = document.song_form;

	if (form.song_num.value == "") {
		alert("노래 고유 번호를 입력해 주세요");
	} else if (form.subject.value=="") {
		alert("노래 제목을 입력해 주세요");
	} else if (form.title.value=="") {
		alert("타이틀 곡인지 여부를 체크해 주세요");
	} else if (form.kpop.value=="") {
		alert("국내 곡인지, 해외 곡인지 선택해 주세요");
	} else {
		form.action = "songWrite";
		form.submit();
	}
}


function song_update() {
	 
	var form = document.song_up_form;

	if (form.song_num.value == "") {
		alert("노래 고유 번호를 입력해 주세요");
	} else if (form.subject.value=="") {
		alert("노래 제목을 입력해 주세요");
	} else if (form.singer_name.value == "") {
		alert("가수 이름을 입력해 주세요");	
	} else if (form.album_name.value == "") {
		alert("앨범 이름을 입력해 주세요");	
	} else if (form.title.value=="") {
		alert("타이틀 곡인지 여부를 체크해 주세요");
	} else if (form.kpop.value=="") {
		alert("국내 곡인지, 해외 곡인지 선택해 주세요");
	} else {
		form.action = "songUpdate";
		form.submit();
	}
}

function admin_singer_all() {
	document.singer_form.keyword.value = "";	
	document.singer_form.action = "singerList";
	document.singer_form.submit();	
}

//가수 검색
function admin_singer_search() {
	if (document.singer_form.keyword.value == "") {
		alert("검색어를 작성해 주세요");
		document.singer_form.keyword.focus();
	} else {
		document.singer_form.action = "singerList";
		document.singer_form.focus();
	}
}

function admin_album_all() {
	document.album_form.keyword.value = "";	
	document.album_form.action = "albumList";
	document.album_form.submit();	
}

//앨범 검색
function admin_album_search() {
	if (document.album_form.keyword.value == "") {
		alert("검색어를 작성해 주세요");
		document.album_form.keyword.focus();
	} else {
		document.album_form.action = "albumList";
		document.album_form.focus();
	}
}

function admin_song_all() {
	document.song_form.keyword.value = "";	
	document.song_form.action = "songList";
	document.song_form.submit();	
}

//노래 검색
function admin_song_search() {
	if (document.song_form.keyword.value == "") {
		alert("검색어를 작성해 주세요");
		document.song_form.keyword.focus();
	} else {
		document.song_form.action = "songList";
		document.song_form.focus();
	}
}

function admin_cmt_all() {
	document.cmt_form.keyword.value = "";	
	document.cmt_form.action = "cmtList";
	document.cmt_form.submit();	
}

//댓글 검색
function admin_cmt_search() {
	if (document.cmt_form.keyword.value == "") {
		alert("검색어를 작성해 주세요");
		document.cmt_form.keyword.focus();
	} else {
		document.cmt_form.action = "cmtList";
		document.cmt_form.focus();
	}
}

//회원 검색
function member_search() {
	if (document.member_form.keyword.value == "") {
		alert("검색어를 작성해 주세요");
		document.member_form.keyword.focus();
	} else {
		document.member_form.action = "memberList";
		document.member_form.focus();
	}
}

function admin_member_all() {
	document.member_form.keyword.value = "";	
	document.member_form.action = "memberList";
	document.member_form.submit();	
}


//qna 검색
function qna_search() {
	if (document.qna_form.keyword.value == "") {
		alert("검색어를 작성해 주세요");
		document.qna_form.keyword.focus();
	} else {
		document.qna_form.action = "admin_qna";
		document.qna_form.focus();
	}
}

function admin_qna_all() {
	document.qna_form.keyword.value = "";	
	document.qna_form.action = "admin_qna";
	document.qna_form.submit();	
}

function answerQna() {
	if (document.reply_form.reply.value == "") {
		alert("답변을 입력해 주세요.");
		document.reply_form.reply.focus();
	} else {
		document.reply_form.action = "answerQna";
		document.reply_form.submit();
	}
}
