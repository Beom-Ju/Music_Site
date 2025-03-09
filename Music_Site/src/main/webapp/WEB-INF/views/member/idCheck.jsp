<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<script type="text/javascript" src="js/member.js"></script>

<script type="text/javascript">
function idOk(){
  opener.join_form.id.value="${id}"; 
  opener.join_form.idOk.value="${id}";
  opener.join_form.pwd.focus();
  self.close();
}
</script>
<style>
	.check {
		text-align:center;
	}
</style>
</head>
<body>
<div class="check">
	<h1>아이디 중복확인</h1>
	
	<form name="id_check_form">
	
		<c:if test="${message == 1}">
			${id}는 이미 사용중인 아이디입니다. <br> <br>
			<input type="button" value="닫기" onclick="idExit()">
		</c:if>
		<c:if test="${message == -1 }">
			${id}는 사용 가능한 ID입니다. <br> <br>
			<input type="button" value="사용" onclick="idOk()">
		</c:if>
	
	</form>
</div>	
	
</body>
</html>