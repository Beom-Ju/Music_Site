<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<img src="images/qna/think.jpg">
	</div>
	
	 <div class="index"> 

        <!-- Category News End-->

        <!-- Category News Start-->
        <div class="cat-news">
            <div class="container">
                 <h2>문의하기</h2>
				<form name="qna_form">
				
				
				<table class="list" border="1" width="1000" style="margin:auto">
					<tr>
						<th width="60">순서</th>
						<th width="170">분류</th>
						<th width="470">제목</th>
						<th width="150">상태</th>
						<th width="150">등록일자</th>
					</tr>
					<c:forEach items="${qnaList}" var="qnaVO">
					<tr> 
						<td align="center">${qnaVO.num}</td>
						<td align="center">${qnaVO.kind}</td>
						<td> &nbsp; <a href="qnaDetail?qseq=${qnaVO.qseq}">${qnaVO.subject}</a></td>
						<td align="center">
							<c:choose>
					            <c:when test="${qnaVO.rep==1}"> 미처리 </c:when>
					            <c:when test="${qnaVO.rep==2}"> 처리완료 </c:when>
					        </c:choose>
						</td>
						<td align="center"><fmt:formatDate value="${qnaVO.regdate}" pattern="yyyy-MM-dd"/></td>
					</tr>
					</c:forEach>
				</table>
				
				<br>
				
				<div style="float:right">
					<input type="button" value="1:1 문의하기" onclick="location.href='qna_write'">
				</div>
				<br><br><br><br>

				
				
				</form>
            </div>
        </div>
        <!-- Category News End-->

        
        

	</div>
	
	<%@ include file="qna_page.jsp" %>
</body>
</html>

<%@ include file="../footer.jsp" %>