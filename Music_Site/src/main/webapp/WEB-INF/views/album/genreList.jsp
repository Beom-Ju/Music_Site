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
                
        <h2>장르</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
        <div class="tab-news">
        	<div class="container">

                  <ul class="nav nav-pills nav-justified">
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#ballad">Ballad</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#rock">Rock</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#dance">Dance</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#ost">OST</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#pop">Pop</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#rap">Rap/Hip-Hop</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#rnb">R&B/Soul</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#trot">Trot</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#indie">Indie</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link active" data-toggle="pill" href="#folk">Folk/Blues</a>
                      </li>
                  </ul>

                 <div class="tab-content">
                 	<div id="ballad" class="container tab-pane active">
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
									<c:forEach items="${genreBalladList}" var="balladVO">
										<tr>
											<td align="center">${balladVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${balladVO.aseq}">
													 <c:choose>
							                             <c:when test="${balladVO.album_image == 'nocover.jpg'}">
															<img src="images/album/nocover.jpg">
														 </c:when>
														 <c:otherwise>
															<img src="images/album_images/${balladVO.album_image}">
														 </c:otherwise>
													 </c:choose>
												</a> &nbsp;
												${balladVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${balladVO.pseq}">${balladVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${balladVO.aseq}">${balladVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${balladVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${balladVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${balladVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${balladVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${balladVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
								</table>							
							</div>
                       </div>           
                    </div>
                    <div id="rock" class="container tab-pane fade">
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
									
									<c:forEach items="${genreRockList}" var="rockVO">
										<tr>
											<td align="center">${rockVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${rockVO.aseq}">
													 <c:choose>
							                             <c:when test="${rockVO.album_image == 'nocover.jpg'}">
															<img src="images/album/nocover.jpg">
														 </c:when>
														 <c:otherwise>
															<img src="images/album_images/${rockVO.album_image}">
														 </c:otherwise>
													 </c:choose>
												</a> &nbsp;
												${rockVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${rockVO.pseq}">${rockVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${rockVO.aseq}">${rockVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${rockVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${rockVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${rockVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${rockVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${rockVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
									
								</table>											
							</div>
                        </div>
                        
                    </div>
                    <div id="dance" class="container tab-pane fade">
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
									
									<c:forEach items="${genreDanceList}" var="danceVO">
										<tr>
											<td align="center">${danceVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${danceVO.aseq}">
													 <c:choose>
							                             <c:when test="${danceVO.album_image == 'nocover.jpg'}">
															<img src="images/album/nocover.jpg">
														 </c:when>
														 <c:otherwise>
															<img src="images/album_images/${danceVO.album_image}">
														 </c:otherwise>
													 </c:choose>
												</a> &nbsp;
												${danceVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${danceVO.pseq}">${danceVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${danceVO.aseq}">${danceVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${danceVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${danceVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${danceVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${danceVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${danceVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
									
								</table>							
							</div>
                        </div>
                        
                    </div>
                    <div id="ost" class="container tab-pane fade">
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
									
									<c:forEach items="${genreOstList}" var="ostVO">
										<tr>
											<td align="center">${ostVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${ostVO.aseq}">
													 <c:choose>
							                             <c:when test="${ostVO.album_image == 'nocover.jpg'}">
															<img src="images/album/nocover.jpg">
														 </c:when>
														 <c:otherwise>
															<img src="images/album_images/${ostVO.album_image}">
														 </c:otherwise>
													 </c:choose>
												</a> &nbsp;
												${ostVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${ostVO.pseq}">${ostVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${ostVO.aseq}">${ostVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${ostVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${ostVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${ostVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${ostVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${ostVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
									
								</table>							
							</div>
                        </div>
                        
                    </div>
                    <div id="pop" class="container tab-pane fade">
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
									
									<c:forEach items="${genrePopList}" var="popVO">
										<tr>
											<td align="center">${popVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${popVO.aseq}">
													 <c:choose>
							                             <c:when test="${popVO.album_image == 'nocover.jpg'}">
															<img src="images/album/nocover.jpg">
														 </c:when>
														 <c:otherwise>
															<img src="images/album_images/${popVO.album_image}">
														 </c:otherwise>
													 </c:choose>
												</a> &nbsp;
												${popVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${popVO.pseq}">${popVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${popVO.aseq}">${popVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${popVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${popVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${popVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${popVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${popVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
									
								</table>							
							</div>
                        </div>
                        
                    </div>
                    <div id="rap" class="container tab-pane fade">
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
									
									<c:forEach items="${genreRapList}" var="rapVO">
										<tr>
											<td align="center">${rapVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${rapVO.aseq}">
													 <c:choose>
							                             <c:when test="${rapVO.album_image == 'nocover.jpg'}">
															<img src="images/album/nocover.jpg">
														 </c:when>
														 <c:otherwise>
															<img src="images/album_images/${rapVO.album_image}">
														 </c:otherwise>
													 </c:choose>
												</a> &nbsp;
												${rapVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${rapVO.pseq}">${rapVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${rapVO.aseq}">${rapVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${rapVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${rapVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${rapVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${rapVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${rapVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
									
								</table>							
							</div>
                        </div>
                        
                    </div>
                    <div id="rnb" class="container tab-pane fade">
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
									
									<c:forEach items="${genreRnbList}" var="rnbVO">
										<tr>
											<td align="center">${rnbVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${rnbVO.aseq}">
													 <c:choose>
							                             <c:when test="${rnbVO.album_image == 'nocover.jpg'}">
															<img src="images/album/nocover.jpg">
														 </c:when>
														 <c:otherwise>
															<img src="images/album_images/${rnbVO.album_image}">
														 </c:otherwise>
													 </c:choose>
												</a> &nbsp;
												${rnbVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${rnbVO.pseq}">${rnbVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${rnbVO.aseq}">${rnbVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${rnbVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${rnbVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${rnbVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${rnbVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${rnbVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
									
								</table>							
							</div>
                        </div>
                        
                    </div>
                    <div id="trot" class="container tab-pane fade">
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
									
									<c:forEach items="${genreTrotList}" var="trotVO">
										<tr>
											<td align="center">${trotVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${trotVO.aseq}">
													 <c:choose>
							                             <c:when test="${trotVO.album_image == 'nocover.jpg'}">
															<img src="images/album/nocover.jpg">
														 </c:when>
														 <c:otherwise>
															<img src="images/album_images/${trotVO.album_image}">
														 </c:otherwise>
													 </c:choose>
												</a> &nbsp;
												${trotVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${trotVO.pseq}">${trotVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${trotVO.aseq}">${trotVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${trotVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${trotVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${trotVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${trotVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${trotVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
									
								</table>							
							</div>
                        </div>
                        
                    </div>
                    <div id="indie" class="container tab-pane fade">
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
									
									<c:forEach items="${genreIndieList}" var="indieVO">
										<tr>
											<td align="center">${indieVO.num}</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${indieVO.aseq}">
													 <c:choose>
							                             <c:when test="${indieVO.album_image == 'nocover.jpg'}">
															<img src="images/album/nocover.jpg">
														 </c:when>
														 <c:otherwise>
															<img src="images/album_images/${indieVO.album_image}">
														 </c:otherwise>
													 </c:choose>
												</a> &nbsp;
												${indieVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${indieVO.pseq}">${indieVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${indieVO.aseq}">${indieVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${indieVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${indieVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${indieVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${indieVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${indieVO.sseq}"><img src="images/album/play.png"></a></td>
											<td align="center"><img src="images/album/download.png"></td>									
										</tr>
									</c:forEach>
									
								</table>							
							</div>
                        </div>
                        
                    </div>
                    <div id="folk" class="container tab-pane fade">
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
									
									<c:forEach items="${genreFolkList}" var="folkVO">
										<tr>
											<td align="center">1</td>
												<td class="ab_img">&nbsp; 
												<a href="album_info?aseq=${folkVO.aseq}">
													 <c:choose>
							                             <c:when test="${folkVO.album_image == 'nocover.jpg'}">
															<img src="images/album/nocover.jpg">
														 </c:when>
														 <c:otherwise>
															<img src="images/album_images/${folkVO.album_image}">
														 </c:otherwise>
													 </c:choose>}">
												</a> &nbsp;
												${folkVO.subject}
											</td>
											<td>&nbsp; <a href="singer_info?pseq=${folkVO.pseq}">${folkVO.singer_name}</a></td>
											<td>&nbsp; <a href="album_info?aseq=${folkVO.aseq}">${folkVO.album_name}</a></td>
											<td align="center">
											<c:choose>
												<c:when test="${folkVO.goodClick == 'y'}">
													<a href="listen_good_cancel?sseq=${folkVO.sseq}">
													<img src="images/album/like.png"></a>
												</c:when>
												<c:otherwise>
													<a href="listen_good?sseq=${folkVO.sseq}">
													<img src="images/album/cancel_like.png"></a>
												</c:otherwise>
											</c:choose> 
											&nbsp; ${folkVO.good_cnt}</td>
											<td align="center"><a href="listen_music?sseq=${folkVO.sseq}"><img src="images/album/play.png"></a></td>
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