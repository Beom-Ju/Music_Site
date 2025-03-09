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
				<form name="write_form" action="qna_write" method="post" enctype="multipart/form-data">
				<table class="list" border="1" width="1000" style="margin:auto">
					<tr>
						<th>분류</th>
						<td>
							<select name="kind">
								<option value="선택">===선택===</option>
								<option value="음원 사용">음원 사용</option>
								<option value="결제 관련">결제 관련</option>
								<option value="회원 정보">회원 정보</option>
								<option value="이벤트">이벤트</option>
								<option value="기타">기타</option>	
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="content" cols="130" rows="10" style="resize:none;"></textarea>
						</td>
					</tr>
					<tr>
						<th>첨부 <br> 이미지</th>
						<td><input type="file" name="uploadPicture" value="사진 선택"></td>
					</tr>
				</table>
				
				<br> <br>
				
					<div class="qWrite_btn">	
						<input type="button" value="확인" onclick="qnaWrite()">
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						<input type="button" value="취소" onclick="history.go(-1)">
					</div>
				</form>
            </div>
        </div>
        <!-- Category News End-->

        
        

	</div>	
</body>
</html>

<%@ include file="../footer.jsp" %>