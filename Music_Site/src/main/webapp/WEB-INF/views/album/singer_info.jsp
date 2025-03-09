<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가수 정보</title>
</head>
<body>
	<div class="index"> 
        <!-- 가수 정보-->
        <div class="cat-news">
            <div class="container">
                 <h2>가수 정보</h2>
                 <div class="row cn-slider">
                     <div class="col-md-4">
                         <div class="cn-img">
                        	 <c:choose>
								<c:when test="${singerDetail.singer_image == 'noprofile.jpg'}">
									<img src="images/album/noprofile.jpg">
								</c:when>
								<c:otherwise>
									<img src="images/singer_images/${singerDetail.singer_image}">
								</c:otherwise>
							 </c:choose>
                         </div>
                     </div>
                     <div class="col-md-8">                           
                      <br>
                     	<h4>${singerDetail.singer_name}</h4> <br>
                     
                     	<table class="info1">
                     		<tr>
                     			<th>데뷔</th>
                     			<td>${singerDetail.regdate_year}년 &nbsp; / &nbsp;
                     				${singerDetail.first_song}
                     			</td>
                     		</tr>	
                     	</table>
                     	
                     </div>

                 </div>
           </div>      
                 <br> <br>
         </div> 
         
        <!-- Category News Start-->
        <div class="cat-news">
            <div class="container">
                
                 <h2>앨범 목록</h2>


                     <c:forEach items="${albumListBySinger}" var="albumList">
                         <input type="hidden" name="num" value="${albumList.num}">
                         <div class="cn-img">
                         	<a href="album_info?aseq=${albumList.aseq}">
                             	<c:choose>
		                             <c:when test="${albumList.album_image == 'nocover.jpg'}">
										<img src="images/album/nocover.jpg">
									 </c:when>
									 <c:otherwise>
										<img src="images/album_images/${albumList.album_image}">
									 </c:otherwise>
								</c:choose> 
                             </a>
                             <div>
	                        	[${albumList.album_kind}]
	                         	<a href="album_info?aseq=${albumList.aseq}">${albumList.album_name}</a> <br>
	                         	<a href="singer_info?pseq=${albumList.pseq}">${albumList.singer_name}</a> <br>
	                         	
	                         	<fmt:parseDate var="regdate" value="${albumList.regdate}" pattern="yyyy-MM-dd"/>
	                            <fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/>
                         
                         	</div>
                         </div>     	
                     </c:forEach>
                     
                     <br><br>
					
			<%@ include file="page/singerInfo_page1.jsp" %>
             </div>                  
        </div>
        
        	
        
        	<br> <br>
        
         <!-- Category News Start-->
        <div class="cat-news">
            <div class="container">
                 <h2>노래 목록</h2>

				<table class="list" border="1" width="1000" style="margin:auto">
					<tr>
						<th width="50">번호</th>
						<th width="380">노래제목</th>
						<th width="140">가수</th>
						<th width="220">앨범명</th>
						<th width="70">좋아요</th>
						<th width="70">듣기</th>
						<th width="70">다운로드</th>
					</tr>
					<c:forEach items="${songListBySinger}" var="songList">
						<tr>
							<td align="center">${songList.num}</td>
							<td>&nbsp;
							<c:choose>
								<c:when test="${songList.title == 'y'}">
									<span><b>[title]</b></span>
								</c:when>
								<c:otherwise>
								
								</c:otherwise>
							</c:choose>
							
							 ${songList.subject}</td>
							<td>&nbsp; <a href="singer_info?pseq=${songList.pseq}">${songList.singer_name}</a></td>
							<td>&nbsp; <a href="album_info?aseq=${songList.aseq}">${songList.album_name}</a></td>
							<td align="center">
								<c:choose>
									<c:when test="${songList.goodClick == 'y'}">
										<a href="listen_good_cancel?sseq=${songList.sseq}">
										<img src="images/album/like.png"></a>
									</c:when>
									<c:otherwise>
										<a href="listen_good?sseq=${songList.sseq}">
										<img src="images/album/cancel_like.png"></a>
									</c:otherwise>
								</c:choose>
							 &nbsp; ${songList.good_cnt}</td>
							<td align="center"><a href="listen_music?sseq=${songList.sseq}"><img src="images/album/play.png"></a></td>
							<td align="center"><img src="images/album/download.png"></td>	
						</tr>
					</c:forEach>
				</table>	
					
					<br><br>
					
					<%@ include file="page/singerInfo_page2.jsp" %>
					
					<br><br>
            </div>
        </div>
        <!-- Category News End-->
  
</div>

</body>
</html>
<%@ include file="../footer.jsp"%>