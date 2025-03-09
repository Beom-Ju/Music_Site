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
                
        <h2>가수 목록</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
				<form name="singer_form">
	
                        <div class="btn">
                        
	                        <input type="button" value="가수 등록" id="insertSinger" onclick="location.href='singerWrite'"> &nbsp;  
	                        <input type="button" value="전체 보기" onclick="admin_singer_all()">
                        
                        </div>
                        
                        <br> <br>
                         
                         <div class="admin_search">
                       
                            가수명 : <input type="text" name="keyword" placeholder="Search" size="100" value="${keyword}">
                            <button onclick="admin_singer_search()"><i class="fa fa-search"></i></button>
      	
                        </div>
                            	<br> <br> <br>
                            
				 				<table class="list" border="1" width="1000" style="margin:auto">
									<tr>
										<th width="50">번호</th>
										<th width="70">등록번호</th>
										<th width="410">가수명</th>
										<th width="140">데뷔</th>


									</tr>
									
									<c:choose>
										<c:when test="${singerCnt <= 0}">
											<tr>
												<td  colspan="4" align="center">조회 결과가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${singerList}" var="singerVO">
												<tr>
													<td align="center">${singerVO.num}</td>
													<td align="center">${singerVO.pseq}</td>
													<td class="ab_img">&nbsp; 
														<c:choose>
															<c:when test="${singerVO.singer_image == 'noprofile.jpg'}">
																<img src="images/album/noprofile.jpg">
															</c:when>
															<c:otherwise>
																<img src="images/singer_images/${singerVO.singer_image}">
															</c:otherwise>
														 </c:choose>
														 
														 &nbsp;
														<a href="admin_singer_info?pseq=${singerVO.pseq}">${singerVO.singer_name}</a>
													
													</td>
													<td>&nbsp; ${singerVO.regdate_year}년 &nbsp; / &nbsp;
		                     							${singerVO.first_song}</td>
		
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>	
								
								<br> <br>							
      			</form>
        <!-- Tab News Start-->
                   </div>                  
     </div>
</div>
	<%@include file="page/singerList_page.jsp" %>
</article>
</body>
</html>
<%@ include file="../footer.jsp" %>