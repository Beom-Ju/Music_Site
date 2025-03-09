<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_music_menu.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.admin_search {
		text-align: center;
	}

	.btn {
		margin-left : 230px;
	}
</style>
</head>
<body>
<article>
<div class="index">  
 <!-- Category News Start-->
        <div class="cat-news">
            <div class="container">
                 <h2>노래 목록</h2>
				 <form name="song_form">

					<div class="btn">
                        
	              		<input type="button" value="전체 보기" onclick="admin_song_all()">
                        
            		</div>

 		           <br><br>  

					<div class="admin_search">
                            	
                            	곡명 : <input type="text" name="keyword" placeholder="Search" size="100" value="${keyword}">
                            	<button onclick="admin_song_search()"><i class="fa fa-search"></i></button>
                            	
                            	
                    </div>
                            	<br> <br> <br>

						<table class="list" border="1" width="1000" style="margin:auto">
							<tr>
								<th width="50">순서</th>
								<th width="300">노래제목</th>
								<th width="130">가수</th>
								<th width="130">앨범명</th>
								<th width="80">좋아요</th>
								<th width="80">듣기</th>
								<th width="80">다운로드</th>
							</tr>
							
							<c:choose>
								<c:when test="${songCnt <= 0}">
									<tr>
										<td  colspan="7" align="center">조회 결과가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${songList}" var="songVO">
									<tr> 
										<td align="center">${songVO.num}</td>
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
										<td> &nbsp; <a href="admin_album_info?aseq=${songVO.aseq}">${songVO.album_name}</a></td>
										<td align="center"> &nbsp; ${songVO.good_cnt}</td>
										<td align="center">	&nbsp; ${songVO.listen_cnt}</td>
										<td align="center"> &nbsp; ${songVO.down_cnt}</td>
									</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>	
						
						<br> <br>
				</form>
			</div>
		</div>	
		
</div>	

		<%@ include file="page/songList_page.jsp" %>

</article>
</body>
</html>

<%@ include file="../footer.jsp" %>