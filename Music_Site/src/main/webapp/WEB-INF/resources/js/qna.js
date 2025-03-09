/**
 * 
 */
function qnaWrite() {
	
	var form = document.write_form;
	
	if (form.kind.value == "선택") {
		alert("분류를 선택해 주세요");
		form.kind.focus();
	} else if(form.subject.value == "") {
		alert("제목을 입력해 주세요");
		form.subject.focus();
	} else if(form.content.value == "") {
		alert("내용을 입력해 주세요");
		form.content.focus();
	} else {
		form.action = "qna_write";
		form.submit();
	}
}