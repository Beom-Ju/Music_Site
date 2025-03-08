<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_music_menu.jsp" %>
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
                
        <h2>가수 수정</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
        <div class="tab-news">
        	<div class="container">

                 <div class="tab-content">
                   		<div class="tn-news">
								<form name="singer_up_form" action="singerUpdate" method="post" enctype="multipart/form-data">
									<br>
									<div class="row cn-slider">
					                     <div class="col-lg-6">
					                         <div class="cn-img">
					                             <c:choose>
													<c:when test="${singerVO.singer_image == 'noprofile.jpg'}">
														<img src="images/album/noprofile.jpg">
													</c:when>
													<c:otherwise>
														<img src="images/singer_images/${singerVO.singer_image}">
													</c:otherwise>
												 </c:choose>
					                         </div>
					                     <br> <br>
					                     </div>
					                     
					                     
					                     <div class="col-lg-6">                           
					                     
											'<b style="color:red;">*</b>' 표시는 무조건 입력해야 하는 문항입니다. <br> <br>
											<table>
												<tr>
													<th width="120">등록 번호</th>
													<td>${singerVO.pseq}
													<input type="hidden" name="pseq" value="${singerVO.pseq}">
													</td>
												</tr>
												<tr>
													<th width="120">사진</th>
													<td><input type="file" name="uploadPicture"></td>
												</tr>
												<tr>
													<th><b style="color:red;">*</b>가수명</th>
													<td><input type="text" name="singer_name" value="${singerVO.singer_name}"> </td>
												</tr>
												<tr>
													<th><b style="color:red;">*</b>데뷔 년도</th>
													<td><input type="text" name="regdate_year" value="${singerVO.regdate_year}"> </td>
												</tr>
												<tr>
													<th><b style="color:red;">*</b>데뷔 곡</th>
													<td><input type="text" name="first_song" value="${singerVO.first_song}"></td>
												</tr>
											
											
											</table>
						                     	
						                     <br> <br>
										
											<div id="buttons" style="text-align:center">
					        					<input type="button"    value="수정"   class="submit" onclick="singer_update()"> 
					       						<input type="button"      value="취소"     class="cancel" onclick="history.go(-1)">
					      					</div>
										</div>		

								      </div>                
                      			</form>
                      			
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