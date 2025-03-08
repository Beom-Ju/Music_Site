/**
 * 
 */

function cmtWrite() {
	
	if (document.album_form.contents.value == "") {
		alert("댓글을 작성해 주세요.");
		document.album_form.contents.focus();
	} else {
		document.album_form.action = "cmt";
		document.album_form.submit();
	}
}

function search() {
	if (document.search_form.keyword.value == "") {
		alert("검색어를 입력해 주세요");
		document.search_form.keyword.focus();

	} else {
		document.search_form.action = "searchList";
		document.search_form.submit();
	}
}

/*
* 평점
*/

function gradeCheck() {
	
	if (document.check_form.rate.value == "") {
		alert("평점을 선택해 주세요");
	} else {
		document.check_form.action = "grade_check";
		document.check_form.submit();
	}
}

