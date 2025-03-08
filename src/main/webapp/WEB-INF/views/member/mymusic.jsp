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
<form name="intro_form" action="intro" method="">
<div class="index"> 
        <!-- 가수 정보-->
        <div class="cat-news">
            <div class="container">
                 <h2>마이 뮤직</h2>
                 <div class="row cn-slider">
                     <div class="col-md-4">
                         <div class="cn-img">
                         	 <c:choose>
                         	 	<c:when test="${loginUser.member_picture == 'default.jpg'}">
                         	 		<img src="images/member/default.jpg">
                         	 	</c:when>
                         	 	<c:otherwise>
                             		<img src="images/member_images/${loginUser.member_picture}" />
                         	 	</c:otherwise>
                         	 </c:choose>
                         	 
                         </div>
                         <br>
                         <div id="profile">
                         	*프로필 사진은 마이페이지에서 수정해 주세요!
                         </div>
                     </div>
                     <div class="col-md-8">                           
                      <br>
                     	<h4>${loginUser.id}</h4> <br>
                     
                     	<table class="info">
                     		<tr>
                     			<th>소개글</th>
                     			<td>
                     				<input type="text" name="intro" value="${loginUser.intro}">
                     				<input type="button" value="수정하기" onclick="go_intro()">
                     			</td>
                     		</tr>	
                     	</table>
                     	
                     	
                     </div>

                 </div>
           </div>      
                 <br> <br>
         </div>
         
          <!-- Tab News Start-->
        <div class="tab-news">
        	<div class="container">
				
				<c:choose>
					<c:when test="${check == 'check2'}">
		                  <ul class="nav nav-pills nav-justified">
		                      <li class="nav-item">
		                          <a class="nav-link" data-toggle="pill" href="#good">좋아요 누른 노래</a>
		                      </li>
		                      <li class="nav-item">
		                          <a class="nav-link active" data-toggle="pill" href="#listen">많이 들은 노래 순위</a>
		                      </li>
		                  </ul>
		
		                 <div class="tab-content">
		                 	<div id="good" class="container tab-pane fade">
		                   		<div class="tn-news">
		                            <div class = "chart">
							 				<table class="list" border="1" width="1020" style="margin:auto">
												<tr>
													<th width="50">순서</th>
													<th width="400">노래제목</th>
													<th width="140">가수</th>
													<th width="220">앨범명</th>
													<th width="70">좋아요</th>
													<th width="70">듣기</th>
													<th width="70">다운로드</th>
												</tr>
												<c:choose>
													<c:when test="${goodSongCnt <= 0}">
														<tr>
															<td  colspan="7" align="center">좋아요를 누른 음원이 없습니다.</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${goodSongList}" var="songVO">
														<tr>
															<td align="center">${songVO.num}</td>
															<td>&nbsp; ${songVO.subject}</td>
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
																 &nbsp; ${songVO.good_cnt}
															</td>
															<td align="center">
																<a href="listen_music?sseq=${songVO.sseq}">
																<img src="images/album/play.png"></a>
															</td>
															<td align="center"><img src="images/album/download.png"></td>
															
															
														</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</table>	
											
											<br><br>
											
											<%@ include file="mymusic_page1.jsp" %>						
										</div>
			                       </div>           
			                    </div>
			                    <div id="listen" class="container tab-pane active">
			                        <div class="tn-news">
			                            <div class = "chart">
										<table class="list" border="1" width="1020" style="margin:auto">
											<tr>
												<th width="50">순서</th>
												<th width="400">노래제목</th>
												<th width="140">가수</th>
												<th width="220">앨범명</th>
												<th width="70">좋아요</th>
												<th width="70">듣기</th>
												<th width="70">다운로드</th>
											</tr>
											<c:choose>
												<c:when test="${listenCnt <= 0}">
													<tr>
														<td  colspan="7" align="center">음원 재생 기록이 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${listenSongList}" var="songVO">
													<tr>
														<td align="center">${songVO.num}</td>
														<td>&nbsp; ${songVO.subject}</td>
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
															 &nbsp; ${songVO.good_cnt}
														</td>
														<td align="center">
															<a href="listen_music?sseq=${songVO.sseq}">
															<img src="images/album/play.png"></a>
														</td>
														<td align="center"><img src="images/album/download.png"></td>
														
														
													</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</table>	
										
										<br><br>
											
										<%@ include file="mymusic_page2.jsp" %>										
									</div>
		                        </div>
		                        
		                    </div>
		                </div>
               	 	</c:when>
	               	 <c:otherwise>
	               	 	  <ul class="nav nav-pills nav-justified">
		                      <li class="nav-item">
		                          <a class="nav-link active" data-toggle="pill" href="#good">좋아요 누른 노래</a>
		                      </li>
		                      <li class="nav-item">
		                          <a class="nav-link" data-toggle="pill" href="#listen">많이 들은 노래 순위</a>
		                      </li>
		                  </ul>
		
		                 <div class="tab-content">
		                 	<div id="good" class="container tab-pane active">
		                   		<div class="tn-news">
		                            <div class = "chart">
							 				<table class="list" border="1" width="1020" style="margin:auto">
												<tr>
													<th width="50">순서</th>
													<th width="400">노래제목</th>
													<th width="140">가수</th>
													<th width="220">앨범명</th>
													<th width="70">좋아요</th>
													<th width="70">듣기</th>
													<th width="70">다운로드</th>
												</tr>
												
												<c:choose>
													<c:when test="${goodSongCnt <= 0}">
														<tr>
															<td  colspan="7" align="center">좋아요를 누른 음원이 없습니다.</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${goodSongList}" var="songVO">
														<tr>
															<td align="center">${songVO.num}</td>
															<td>&nbsp; ${songVO.subject}</td>
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
																 &nbsp; ${songVO.good_cnt}
															</td>
															<td align="center">
																<a href="listen_music?sseq=${songVO.sseq}">
																<img src="images/album/play.png"></a>
															</td>
															<td align="center"><img src="images/album/download.png"></td>
															
															
														</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</table>	
											
											<br><br>
											
											<%@ include file="mymusic_page1.jsp" %>						
										</div>
			                       </div>           
			                    </div>
			                    <div id="listen" class="container tab-pane fade">
			                        <div class="tn-news">
			                            <div class = "chart">
										<table class="list" border="1" width="1020" style="margin:auto">
											<tr>
												<th width="50">순서</th>
												<th width="400">노래제목</th>
												<th width="140">가수</th>
												<th width="220">앨범명</th>
												<th width="70">좋아요</th>
												<th width="70">듣기</th>
												<th width="70">다운로드</th>
											</tr>
											<c:choose>
												<c:when test="${listenCnt <= 0}">
													<tr>
														<td  colspan="7" align="center">음원 재생 기록이 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${listenSongList}" var="songVO">
													<tr>
														<td align="center">${songVO.num}</td>
														<td>&nbsp; ${songVO.subject}</td>
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
															 &nbsp; ${songVO.good_cnt}
														</td>
														<td align="center">
															<a href="listen_music?sseq=${songVO.sseq}">
															<img src="images/album/play.png"></a>
														</td>
														<td align="center"><img src="images/album/download.png"></td>
														
														
													</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</table>	
										
										<br><br>
											
										<%@ include file="mymusic_page2.jsp" %>										
									</div>
		                        </div>
		                        
		                    </div>
		                </div>
	               	 </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- Tab News Start-->
         
  

</div>
</form>
</body>
</html>
<%@ include file="../footer.jsp" %>