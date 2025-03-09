<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_music_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가수 정보</title>
</head>
<body>
<form name="singer_inform">
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
                     			<th>등록 번호</th>
                     			<td>${singerDetail.pseq}
                     			</td>
                     		</tr>
                     		<tr>
                     			<th>데뷔</th>
                     			<td>${singerDetail.regdate_year}년 &nbsp; / &nbsp;
                     				${singerDetail.first_song}
                     			</td>
                     		</tr>	
                     	</table>
                     	<input type="hidden" value="${singerDetail.pseq}">
                     	
                     	<br> <br> <br>
                     	
                     	<input type="button" value="수정하기" onclick="location.href='singerUpdate?pseq=${singerDetail.pseq}';"> &nbsp; &nbsp; 
                     	<input type="button" value="삭제하기" onclick="location.href='singerDelete?pseq=${singerDetail.pseq}';">
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
                         <div class="cn-img">
                         		<a href="admin_album_info?aseq=${albumList.aseq}">
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
	                         	<a href="admin_album_info?aseq=${albumList.aseq}">${albumList.album_name}</a> <br>
	                         	<a href="admin_singer_info?pseq=${albumList.pseq}">${albumList.singer_name}</a> <br>
	                         	
	                         	
	                         	<fmt:parseDate var="regdate" value="${albumList.regdate}" pattern="yyyy-MM-dd"/>
	                            <fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/>
                         
                         	</div>
                         </div>     	
                     </c:forEach>
                     
                     <br><br>
					
						<%@ include file="page/admin_singerInfo_page1.jsp" %>
                     
                     <br> <br>
                     <div align="center">
     	                <input type="button" value="앨범 등록하기" onclick="location.href='albumWrite?pseq=${singerDetail.pseq}&singer_name=${singerDetail.singer_name}';"> <br>
             		 </div>
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
							<td>&nbsp; <a href="admin_singer_info?pseq=${songList.pseq}">${songList.singer_name}</a></td>
							<td>&nbsp; <a href="admin_album_info?aseq=${songList.aseq}">${songList.album_name}</a></td>

						</tr>
					</c:forEach>
				</table>	
				<br> <br>
					
				<%@ include file="page/admin_singerInfo_page2.jsp" %>


            </div>
        </div>
        <!-- Category News End-->
            
</div>

<br> <br>
</form>
</body>
<script>

function singer_update(pseq){
	
	$.ajax({
		type: 'GET',
		url: 'singerUpdate',
		data:{pseq : pseq},
		success: function(data){
			console.log("성공");
		}
	});

}
</script>
</html>
<%@ include file="../footer.jsp"%>