<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
                            
                            	<input type="hidden" name="aseq" value="${albumInfo.aseq}">
                            
                            	<table class="info1">
                            		<tr>
                            			<th>아티스트</th>
                            			<td><a href="singer_info?pseq=${albumInfo.pseq}">${albumInfo.singer_name}</a></td>
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
                            </div>
                            <div class="col-md-4">
                            
                            	<br><br><br><br>
                            	
								평점 : 
								<c:choose>
									<c:when test="${star == 5}">
										<img src="images/album/5.png">
									</c:when>
									<c:when test="${star == 4.5}">
										<img src="images/album/4.5.png">
									</c:when>
									<c:when test="${star == 4}">
										<img src="images/album/4.png">
									</c:when>
									<c:when test="${star == 3.5}">
										<img src="images/album/3.5.png">
									</c:when>
									<c:when test="${star == 3}">
										<img src="images/album/3.png">
									</c:when>
									<c:when test="${star == 2.5}">
										<img src="images/album/2.5.png">
									</c:when>
									<c:when test="${star == 2}">
										<img src="images/album/2.png">
									</c:when>
									<c:when test="${star == 1.5}">
										<img src="images/album/1.5.png">
									</c:when>
									<c:when test="${star == 1}">
										<img src="images/album/1.png">
									</c:when>
									<c:when test="${star == 0.5}">
										<img src="images/album/0.5.png">
									</c:when>
									<c:otherwise>
										<img src="images/album/0.png">
									</c:otherwise>
								</c:choose>
								
								
								${albumInfo.score}
								(${albumInfo.score_cnt}명)
								<br>
								<c:choose>
									<c:when test="${loginUser.id == null}">
										<input type="button" value="평점 주기" onclick="location.href='no_login'">
									</c:when>
									<c:otherwise>
										<input type="button" value="평점 주기" onclick="window.open('grade_check?aseq=${albumInfo.aseq}', '_blank', 'top=100, left=300, width=500, height=250'); return false">
									</c:otherwise>
								</c:choose>
								
								
								<input type="hidden" name="scoreCheck">
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
						<th width="60">번호</th>
						<th width="530">노래제목</th>
						<th width="170">가수</th>
						<th width="80">좋아요</th>
						<th width="80">듣기</th>
						<th width="80">다운로드</th>
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
						<td> &nbsp; <a href="singer_info?pseq=${songVO.pseq}">${songVO.singer_name}</a></td>
						<td align="center">
								<c:choose>
									<c:when test="${songVO.goodClick == 'y'}">
										<a href="listen_good_cancel?sseq=${songVO.sseq}&aseq=${songVO.aseq}&pseq=${songVO.pseq}">
										<img src="images/album/like.png"></a>
									</c:when>
									<c:otherwise>
										<a href="listen_good2?sseq=${songVO.sseq}&aseq=${songVO.aseq}&pseq=${songVO.pseq}">
										<img src="images/album/cancel_like.png"></a>
									</c:otherwise>
								</c:choose>
								 &nbsp; ${songVO.good_cnt}
						</td>
						<td align="center"><a href="listen_music?sseq=${songVO.sseq}"><img src="images/album/play.png"></a></td>
						<td align="center"><img src="images/album/download.png"></td>
					</tr>
					</c:forEach>
				</table>	

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
<%@ include file="comment.jsp" %>
<%@ include file="../footer.jsp" %>