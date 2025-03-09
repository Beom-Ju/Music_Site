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
<div class="index">  

	<div class="cat-news">
    
    	<div class="container">
                
        <h2>최신 곡</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
        <div class="tab-news">
        	<div class="container">

                  <ul class="nav nav-pills nav-justified">
                      <li class="nav-item">
                          <a class="nav-link active" data-toggle="pill" href="#featured">전체</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#popular">국내</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#latest">해외</a>
                      </li>
                  </ul>

                 <div class="tab-content">
                 	<div id="featured" class="container tab-pane active">
                   		<div class="tn-news">
                            <div class = "chart">
				 				<table class="list" border="1" width="1020" style="margin:auto">
									<tr>
										<th width="50">번호</th>
										<th width="410">노래제목</th>
										<th width="140">가수</th>
										<th width="220">앨범명</th>
										<th width="60">좋아요</th>
										<th width="60">듣기</th>
										<th width="80">다운로드</th>
									</tr>
									<c:forEach items="${newAlbumListAll}" var="songVO">
										<tr>
											<td align="center">${songVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${songVO.aseq}">
													<img src="images/album_images/${songVO.album_image}">
												</a> &nbsp;
												${songVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${songVO.pseq}">${songVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${songVO.aseq}">${songVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${songVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${songVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${songVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${songVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${songVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
								</table>							
							</div>
                       </div>           
                    </div>
                    <div id="popular" class="container tab-pane fade">
                        <div class="tn-news">
                            <div class = "chart">
				 				<table class="list" border="1" width="1020" style="margin:auto">
									<tr>
										<th width="50">번호</th>
										<th width="410">노래제목</th>
										<th width="140">가수</th>
										<th width="220">앨범명</th>
										<th width="60">좋아요</th>
										<th width="60">듣기</th>
										<th width="80">다운로드</th>
									</tr>
									
									<c:forEach items="${newAlbumListKor}" var="songKorVO">
										<tr>
											<td align="center">${songKorVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${songKorVO.aseq}">
													<img src="images/album_images/${songKorVO.album_image}">
												</a> &nbsp;
												${songKorVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${songKorVO.pseq}">${songKorVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${songKorVO.aseq}">${songKorVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${songKorVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${songKorVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${songKorVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${songKorVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${songKorVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
									
								</table>											
							</div>
                        </div>
                        
                    </div>
                    <div id="latest" class="container tab-pane fade">
                        <div class="tn-news">
                            <div class = "chart">
				 				<table class="list" border="1" width="1020" style="margin:auto">
									<tr>
										<th width="50">번호</th>
										<th width="410">노래제목</th>
										<th width="140">가수</th>
										<th width="220">앨범명</th>
										<th width="60">좋아요</th>
										<th width="60">듣기</th>
										<th width="80">다운로드</th>
									</tr>
									
									<c:forEach items="${newAlbumListOver}" var="songOverVO">
										<tr>
											<td align="center">${songOverVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${songOverVO.aseq}">
													<img src="images/album_images/${songOverVO.album_image}">
												</a> &nbsp;
												${songOverVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${songOverVO.pseq}">${songOverVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${songOverVO.aseq}">${songOverVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${songOverVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${songOverVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${songOverVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${songOverVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${songOverVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
									
								</table>							
							</div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Tab News Start-->
                   </div>                  
     </div>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>