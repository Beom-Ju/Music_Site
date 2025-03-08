<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  

<%@ include file="header.jsp" %>  

  <div class="index">      
        <!-- 최신 앨범 -->
       <form id="songAlbum"> 
        <div class="cat-news">
            <div class="container">
                
                 <h2>최신 앨범</h2>

					<div class="add_see">

						<a href="chartList">더보기>>></a> <br> <br>
					
					</div>
					
                     <c:forEach items="${newAlbumList}" var="newAlbum">
                         <div class="cn-img">
                             <img src="images/album_images/${newAlbum.album_image}"  />
                             <div class="cn-title">
                                 <a href="album_info?aseq=${newAlbum.aseq}" class="album_name">${newAlbum.album_name}</a>
                                 <br><br><br><br><br>
                                 <a href="singer_info?pseq=${newAlbum.pseq}" class="singer">${newAlbum.singer_name}</a>
                             </div>
                             <br>
                              <div class="cn-title2">
                                 
                             </div>
                         </div>
                     </c:forEach>
                     

             </div>                  
                   

        </div>
		
		<br> <br>
        <!-- Category News Start-->
        
        <!-- 음원 차트 -->
        <div class="cat-news">
            <div class="container">
                
                <h2>음원 차트</h2>

				<div class = "chart">
					<div class="add_see">

						<a href="chartList">더보기>>></a> <br> <br>
					
					</div>
	 				<table class="list" border="1" width="1000" style="margin:auto">
						<tr>
							<th width="50">순위</th>
							<th width="380">노래제목</th>
							<th width="140">가수</th>
							<th width="220">앨범명</th>
							<th width="70">좋아요</th>
							<th width="70">듣기</th>
							<th width="70">다운로드</th>
						</tr>
						<c:forEach items="${songListByCnt}" var="songVO">
						<tr>
							<td align="center">${songVO.num}</td>
							<td>&nbsp; ${songVO.subject}</td>
							<td>&nbsp; <a href="singer_info?pseq=${songVO.pseq}">${songVO.singer_name}</a></td>
							<td>&nbsp; <a href="album_info?aseq=${songVO.aseq}">${songVO.album_name}</a></td>
							<td align="center">
								<input type="hidden" name="sseq" value="${songVO.sseq}">
								<c:choose>
									<c:when test="${songVO.goodClick == 'y'}">
										<a href="listen_good_cancel?sseq=${songVO.sseq}">
										<img src="images/album/like.png"></a>
									</c:when>
									<c:otherwise>
										<a href="#" onclick="listenGood('${songVO.sseq}')">
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
					</table>
					
				</div>
             </div>                  
                   

        </div>
        <!-- Category News End-->
        
        <br> <br>
</form>
</div>

       


<script>
function listenGood(sseq) {
	
	$.ajax({
		type: 'GET',
		url: 'listen_good',
		data: $("#songAlbum").serialize(),
		success : function(data) {
			if (data=="success") {
				alert("좋아요를 눌렀습니다.");
			} else if (data=="fail") {
				alert("좋아요를 누르지 못했습니다.");
			} else if (data=="not_login") {
				alert("로그인을 해주세요!")
				location.href='login_form';
			}
		},
		error: function(request, status, error) {
			alert("error : " + error);
		}
	});
}


function listenGoodCancel(sseq) {
	$.ajax({
		type: 'GET',
		url: 'listen_good_cancel',
		data: {sseq: sseq},
		success : function(data) {
			if (data=="success") {
				alert("좋아요를 취소했습니다.");
			} else if (data=="fail") {
				alert("좋아요를 취소를 못했습니다.");
			} else if (data=="not_login") {
				alert("로그인을 해주세요!")
				location.href='login_form';
			}
		}
	});
}

</script>

<%@ include file="footer.jsp" %>