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

	<div class="cat-news">
    
    	<div class="container">
                
        <h2>앨범 목록</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
        <form name="album_form">
        
        	<div class="btn">
                        
	              
	              <input type="button" value="전체 보기" onclick="admin_album_all()">
                        
            </div>

            <br><br>            
                        
                            
          	<div class="admin_search">
          	앨범명 : <input type="text" name="keyword" placeholder="Search" size="100" value="${keyword}">
          	<button onclick="admin_album_search()"><i class="fa fa-search"></i></button>
          	
          	
          	</div>
          	<br> <br> <br>
          
			<table class="list" border="1" width="1000" style="margin:auto">
			<tr>
				<th width="50">번호</th>
				<th width="70">등록번호</th>
				<th width="410">앨범명</th>
				<th width="140">가수</th>
				<th width="220">발매일</th>
			</tr>
			
			<c:choose>
				<c:when test="${albumCnt <= 0}">
					<tr>
						<td  colspan="5" align="center">조회 결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${albumList}" var="albumVO">
						<tr>
							<td align="center">${albumVO.num}</td>
							<td align="center">${albumVO.aseq}</td>
							<td class="ab_img">&nbsp; 
								<a href="admin_album_info?aseq=${albumVO.aseq}">
									<c:choose>
			                             <c:when test="${albumVO.album_image == 'nocover.jpg'}">
											<img src="images/album/nocover.jpg">
										 </c:when>
										 <c:otherwise>
											<img src="images/album_images/${albumVO.album_image}">
										 </c:otherwise>
									</c:choose>													
								</a> &nbsp;
								<a href="admin_album_info?aseq=${albumVO.aseq}">
									${albumVO.album_name}
								</a>
							</td>
							<td>&nbsp; <a href="admin_singer_info?pseq=${albumVO.pseq}">${albumVO.singer_name}</a></td>
							<td>&nbsp; 
							<fmt:parseDate var="regdate" value="${albumVO.regdate}" pattern="yyyy-MM-dd"/>
		                      				<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/>
							</td>
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
	<%@ include file="page/albumList_page.jsp" %>
</article>
</body>
</html>
<%@ include file="../footer.jsp" %>