<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_music_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 정보</title>
<script>


</script>
</head>
<body>
	<form name="album_form">
  <div class="index"> 
        <!-- 앨범 정보-->
        <div class="cat-news">
            <div class="container">
                        <h2>앨범 정보</h2>
                        <div class="row cn-slider">
                            <div class="col-md-4">
                                <div class="cn-img">
									<c:choose>
			                             <c:when test="${albumInfo.album_image == 'nocover.jpg'}">
											<img src="images/album/nocover.jpg">
										 </c:when>
										 <c:otherwise>
											<img src="images/album_images/${albumInfo.album_image}">
										 </c:otherwise>
									</c:choose>                                    
                                </div>
                            </div>
                            <div class="col-md-4">                           
                            	[${albumInfo.album_kind}] <br>
                            	<h4>${albumInfo.album_name}</h4> <br>
                            
                            	
                            
                            	<table class="info1">
                            		<tr>
                            			<th>가수 등록 번호</th>
                            			<td>${albumInfo.pseq}
                            				<input type="hidden" name="pseq" value="${albumInfo.pseq}">
                            			</td>
                            			
                            		</tr>
                            	    <tr>
                            			<th>앨범 등록 번호</th>
                            			<td>${albumInfo.aseq}
                            				<input type="hidden" name="aseq" value="${albumInfo.aseq}">
                            			</td>
                            		</tr>
                            		<tr>
                            			<th>아티스트</th>
                            			<td><a href="admin_singer_info?pseq=${albumInfo.pseq}">${albumInfo.singer_name}</a></td>
                            		</tr>
                            		<tr>
                            			<th>장르</th>
                            			<td>${albumInfo.genre}</td>
                            		</tr>
                            		<tr>
                            			<th>발매일</th>
                            			<td><fmt:parseDate var="regdate" value="${albumInfo.regdate}" pattern="yyyy-MM-dd"/>
                            				<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/>
                            			</td>
                            		</tr>		
                            	</table>
                            	
                            	<br> <br> <br>
                     	
   			                  	<input type="button" value="수정하기" onclick="location.href='albumUpdate?aseq=${albumInfo.aseq}';"> &nbsp; &nbsp; 
           			          	<input type="button" value="삭제하기" onclick="location.href='albumDelete?aseq=${albumInfo.aseq}&pseq=${albumInfo.pseq}';">
                            </div>
                            <div class="col-md-4">
                            
                            	<br><br><br><br>
                            	
								평점 : ${albumInfo.score}
                            </div>
                        </div>
            </div>
		</div>

		<br> <br>

        <!-- Category News End-->

        <!-- Category News Start-->
        <div class="cat-news">
            <div class="container">
                 <h2>수록곡</h2>

				<table class="list" border="1" width="1000" style="margin:auto">
					<tr>
						<th width="50">번호</th>
						<th width="430">노래제목</th>
						<th width="130">가수</th>
						<th width="80">좋아요</th>
						<th width="80">듣기</th>
						<th width="80">다운로드</th>
						<th width="150">수정 및 삭제</th>
					</tr>
					<c:forEach items="${songList}" var="songVO">
					<tr> 
						<td align="center">${songVO.song_num}</td>
						<td> &nbsp;
							<c:choose>
								<c:when test="${songVO.title == 'y'}">
									<span><b>[title]</b></span>
								</c:when>
								<c:otherwise>
								
								</c:otherwise>
							</c:choose>
								${songVO.subject}</td>
						<td> &nbsp; <a href="admin_singer_info?pseq=${songVO.pseq}">${songVO.singer_name}</a></td>
						<td align="center"> &nbsp; ${songVO.good_cnt}</td>
						<td align="center">	&nbsp; ${songVO.listen_cnt}</td>
						<td align="center"> &nbsp; ${songVO.down_cnt}</td>
						<td align="center">
							<input type="button" value="수정" onclick="location.href='songUpdate?sseq=${songVO.sseq}&aseq=${songVO.aseq}';"> 
           			        <input type="button" value="삭제" onclick="location.href='songDelete?sseq=${songVO.sseq}&aseq=${songVO.aseq}';">
						</td>
					</tr>
					
					</c:forEach>
				</table>	
				<br>
				<div align="center">
					<input type="button" value="노래 등록하기" onclick="location.href='songWrite?pseq=${albumInfo.pseq}&aseq=${albumInfo.aseq}&	singer_name=${albumInfo.singer_name}&album_name=${albumInfo.album_name}';"> <br>
     			</div>
            </div>
        </div>
        <!-- Category News End-->
        
        <br><br> 
        
        <!-- Category News Start-->
        <div class="cat-news">
            <div class="container">
                 <h2>앨범 설명</h2>
					<div class=info2>
					${albumInfo.content}
					</div>
            </div>
        </div>
        <!-- Category News End-->
        
        <br> <br>

	</div>
	</form>
		<br> <br>
<script>		
		/*
	*	댓글 삭제
	*/
	function delete_comment(cseq, id) {
		
		$.ajax({
			type: 'POST',
			url: 'comments/delete',
			data: {cseq: cseq,	
				   id: id},	// 함수의 파라미터로 받은 값을 전송
			success : function(data) {
				if (data=="success") {
					alert("삭제를 완료했습니다.");
					getCommentList();
				} else if (data=="fail") {
					alert("해당 회원만 삭제할 수 있는 댓글입니다.");
				} else if (data=="not_login") {
					alert("댓글삭제를 위해 로그인을 해주세요!")
					location.href='login_form';
				}
			}
		});
	}
</script>		
</body>
</html>
<%@ include file="admin_comment.jsp" %>
<%@ include file="../footer.jsp" %>