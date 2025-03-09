<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#commentList {
		background-color: rgba(255, 102, 102, 0.3);
		border-radius: 3px;
		font-size: 15px;
	}
</style>
</head>
<body>
<div class="cat-news">
    <div class="container">
         <h2>댓글</h2>
		<form id="commentForm">
		
		<br><br>	
		<input type="hidden" id="aseq" name="aseq" value="${albumInfo.aseq}">


		<table class="list" border="1" width="800" style="margin:auto">
			<tr>

				<th width="110">아이디</th>
				<th width="300">내용</th>
				<th width="100">등록날짜</th>
				<th width="100">삭제</th>
			</tr>
			<c:forEach items="${cmtList}" var="cmtVO">
			<tr> 

				<td align="center">${cmtVO.id}</td>
				<td> &nbsp; ${cmtVO.contents}</td>
				<td align="center"><fmt:formatDate value="${cmtVO.regdate}" pattern="yyyy-MM-dd" /></td>
				<td align="center"><input type="button" value="삭제" onclick="location.href='admin_cmtDeleteToAlbum?cseq=${cmtVO.cseq}&aseq=${cmtVO.aseq}';"></td>
			</tr>
			
			</c:forEach>
		</table>
		<br>
	</form>
  </div>
</div>

</body>
</html>