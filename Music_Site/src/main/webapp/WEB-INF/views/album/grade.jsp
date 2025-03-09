<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평점 등록</title>
<script type="text/javascript" src="js/album.js"></script>
<style>
body {
	text-align : center;
}
</style>

</head>
<body>
	<h3>평점을 선택해주세요</h3>
	
	<form name="check_form" action="grade_check" method="post">
	
		<input type="hidden" name="aseq" value="${aseq}">
	
		<input type="radio" name="rate" value="0"> ☆☆☆☆☆ <br>
		<input type="radio" name="rate" value="1"> ★☆☆☆☆ <br>
		<input type="radio" name="rate" value="2"> ★★☆☆☆ <br>
		<input type="radio" name="rate" value="3"> ★★★☆☆ <br>
		<input type="radio" name="rate" value="4"> ★★★★☆ <br>
		<input type="radio" name="rate" value="5"> ★★★★★ <br>
		
		<br>
		
		<input type="button" value="확인" onclick="gradeCheck()">
		
		<input type="button" value="취소">
	</form>
</body>
</html>