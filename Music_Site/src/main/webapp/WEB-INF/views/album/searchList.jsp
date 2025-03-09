<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.keyword span {
 font-size : 20px;
}

.noSearch span {
	font-size : 30px;
	color : #FF6F61;
}
</style>

</head>
<body>
<div class="index"> 

		        
	<div class="cat-news">
    	<div class="container">
			<div class="keyword">
	        	<span>"${keyword}"에 대한 검색 결과입니다.</span> <br> <br>
	        </div>         
        <c:choose>         
        	<c:when test="${total > 0}">         
	                 <!-- 가수 검색결과-->
	                 <c:choose>
	                 	<c:when test="${singerCnt == 0}">
	                 	</c:when>
	                 	<c:otherwise>
			                 <h4>가수 검색 결과 (${singerCnt})</h4>
			                 <c:forEach items="${searchSinger}" var="singerVO">
			                 <div class="row cn-slider">
			                     <div class="col-md-4">
			                         <div class="cn-img">
			                             <img src="images/singer_images/${singerVO.singer_image}" />
			                         </div>
			                     </div>
			                     <div class="col-md-8">                           
			                      <br>
			                     	<h4><a href="singer_info?pseq=${singerVO.pseq}">${singerVO.singer_name}</a></h4> <br>
			                     
			                     	<table class="info1">
			                     		<tr>
			                     			<th>데뷔</th>
			                     			<td>${singerVO.regdate_year}년 &nbsp; / &nbsp;
			                     				${singerVO.first_song}
			                     			</td>
			                     		</tr>	
			                     	</table>
			                     </div>
			                 </div>
			                 </c:forEach>
			                 
			                 <br> <br>
	                 	</c:otherwise>
	                 </c:choose>
	                <!-- 가수 검색결과 끝 -->
	                 
	                <!-- 곡명, 가수, 앨범명에 따른 노래 리스트 검색결과 -->
	               	 <c:choose>
	                	<c:when test="${totalsongCnt == 0}">
	                 	</c:when>
	                	<c:otherwise>  
			                 <h4>노래 검색 결과 (${totalsongCnt})</h4>
			                 
			                 <!-- 곡명 검색 결과 -->
			                 <c:choose>
			                	<c:when test="${songCnt1 == 0}">
			                 	</c:when>
			                	<c:otherwise>  
					                 <h6> &nbsp;&nbsp;&nbsp;&nbsp;곡명으로 검색 결과(${songCnt1})</h6>
									
									<div class = "chart">
										<div class="add_see">
										
										</div>
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
											<c:forEach items="${searchSong1}" var="song1VO">
											<tr>
												<td align="center">${song1VO.num}</td>
												<td>&nbsp;
													<c:choose>
														<c:when test="${song1VO.title == 'y'}">
															<span><b>[title]</b></span>
														</c:when>
														<c:otherwise>
													
														</c:otherwise>
													</c:choose>
												 	${song1VO.subject}</td>
												<td>&nbsp; <a href="singer_info?pseq=${song1VO.pseq}">${song1VO.singer_name}</a></td>
												<td>&nbsp; <a href="album_info?aseq=${song1VO.aseq}">${song1VO.album_name}</a></td>
												<td align="center">
													<c:choose>
														<c:when test="${song1VO.goodClick == 'y'}">
															<a href="listen_good_cancel?sseq=${song1VO.sseq}">
															<img src="images/album/like.png"></a>
														</c:when>
														<c:otherwise>
															<a href="listen_good?sseq=${song1VO.sseq}">
															<img src="images/album/cancel_like.png"></a>
														</c:otherwise>
													</c:choose> 
												&nbsp; ${song1VO.good_cnt}</td>
												<td align="center">
													<a href="listen_music?sseq=${song1VO.sseq}">
													<img src="images/album/play.png"></a>
												</td>
												<td align="center"><img src="images/album/download.png"></td>		
											</tr>
											</c:forEach>
										</table>	
									</div>
									<!-- 노래명 검색 결과 끝-->
									<br>
								</c:otherwise>
							</c:choose>
							
							<!-- 가수명 검색 결과 -->
			                 <c:choose>
			                	<c:when test="${songCnt2 == 0}">
			                 	</c:when>
			                	<c:otherwise>  
									<h6> &nbsp;&nbsp;&nbsp;&nbsp;가수명으로 검색 결과(${songCnt2})</h6>
									<div class = "chart">
										<div class="add_see">
										
										</div>
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
											<c:forEach items="${searchSong2}" var="song2VO">
											<tr>
												<td align="center">${song2VO.num}</td>
												<td>&nbsp; 
													<c:choose>
														<c:when test="${song2VO.title == 'y'}">
															<span><b>[title]</b></span>
														</c:when>
														<c:otherwise>
													
														</c:otherwise>
													</c:choose>
													${song2VO.subject}</td>
												<td>&nbsp; <a href="singer_info?pseq=${song2VO.pseq}">${song2VO.singer_name}</a></td>
												<td>&nbsp; <a href="album_info?aseq=${song2VO.aseq}">${song2VO.album_name}</a></td>
												<td align="center">
													<c:choose>
														<c:when test="${song2VO.goodClick == 'y'}">
															<a href="listen_good_cancel?sseq=${song2VO.sseq}">
															<img src="images/album/like.png"></a>
														</c:when>
														<c:otherwise>
															<a href="listen_good?sseq=${song2VO.sseq}">
															<img src="images/album/cancel_like.png"></a>
														</c:otherwise>
													</c:choose> 
													&nbsp; ${song2VO.good_cnt}</td>
												<td align="center">
													<a href="listen_music?sseq=${song2VO.sseq}">
													<img src="images/album/play.png"></a>
												</td>
												<td align="center"><img src="images/album/download.png"></td>		
											</tr>
											</c:forEach>
										</table>	
									</div>
									<!-- 가수명 검색 결과 끝-->
			
								<br>
								</c:otherwise>
							</c:choose>
							<!-- 앨범명 검색 결과 -->
			                <c:choose>
			                	<c:when test="${songCnt3 == 0}">
			                 	</c:when>
			                	<c:otherwise>  
									<h6> &nbsp;&nbsp;&nbsp;&nbsp;앨범명으로 검색 결과(${songCnt3})</h6>
									<!-- 앨범명 검색 결과 -->
									<div class = "chart">
										<div class="add_see">
										
										</div>
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
											<c:forEach items="${searchSong3}" var="song3VO">
											<tr>
												<td align="center">${song3VO.num}</td>
												<td>&nbsp;
													<c:choose>
														<c:when test="${song3VO.title == 'y'}">
															<span><b>[title]</b></span>
														</c:when>
														<c:otherwise>
													
														</c:otherwise>
													</c:choose>							 
													${song3VO.subject}</td>
												<td>&nbsp; <a href="singer_info?pseq=${song3VO.pseq}">${song3VO.singer_name}</a></td>
												<td>&nbsp; <a href="album_info?aseq=${song3VO.aseq}">${song3VO.album_name}</a></td>
												<td align="center">
													<c:choose>
														<c:when test="${song3VO.goodClick == 'y'}">
															<a href="listen_good_cancel?sseq=${song3VO.sseq}">
															<img src="images/album/like.png"></a>
														</c:when>
														<c:otherwise>
															<a href="listen_good?sseq=${song3VO.sseq}">
															<img src="images/album/cancel_like.png"></a>
														</c:otherwise>
													</c:choose> 
													&nbsp; ${song3VO.good_cnt}</td>
												<td align="center">
													<a href="listen_music?sseq=${song3VO.sseq}">
													<img src="images/album/play.png"></a>
												</td>
												<td align="center"><img src="images/album/download.png"></td>		
											</tr>
											</c:forEach>
										</table>	
									</div>
					
					             	<br><br>
					             </c:otherwise>
					          </c:choose>
					          <!-- 앨범명 검색 결과 끝-->
	        				</c:otherwise>
						</c:choose>
						<!-- 제목, 가수, 앨범명에 따른 노래 리스트 검색결과 끝 -->
	
						<c:choose>
		                 	<c:when test="${albumCnt == 0}">
		                 	</c:when>
		                 	<c:otherwise>
				                 <h4>앨범 검색 결과 (${albumCnt})</h4>
				                 
				                 <div class="tn-news">
				                       <div class = "chart">
					 				     <c:forEach items="${searchAlbum}" var="albumVO">
					                         <div class="cn-img">
					                             <img src="images/album_images/${albumVO.album_image}"  />
					                             <div class="cn-title">
					                                 <a href="album_info?aseq=${albumVO.aseq}" class="album_name">${albumVO.album_name}</a>
					                                 <br><br><br><br><br>
					                                 <a href="singer_info?pseq=${albumVO.pseq}" class="singer">${albumVO.singer_name}</a>
					                             </div>
					                             <br>
					                              <div class="cn-title2">
					                                 
					                             </div>
					                         </div>
					                     </c:forEach>							
									 </div>
				                 </div>
				            </c:otherwise>
				        </c:choose>
			    	</c:when>
			    <c:otherwise>
			    
			    	<br><br><br><br><br><br><br><br><br>
			    
			    	<div class="noSearch">
			    		<b><span>검색 결과가 없습니다! </span></b>
			    	</div>
			    	
			    	<br><br><br><br><br><br>
			    </c:otherwise>
			  </c:choose>        
          
          <br><br><br><br>
          </div>   
   	</div>          
</div>        
        
        
        	

</body>
</html>
<%@ include file="../footer.jsp" %>