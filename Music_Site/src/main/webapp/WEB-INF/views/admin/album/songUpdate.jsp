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
                
        <h2>노래 수정</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
        <div class="tab-news">
        	<div class="container">

                 <div class="tab-content">
                   		<div class="tn-news">
								<form name="song_up_form" action="songUpdate" method="post">
									'<b style="color:red;">*</b>' 표시는 무조건 입력해야 하는 문항입니다. <br> <br>
									<table>
										<tr>
											<th width="140">앨범 등록 번호</th>
											<td>${albumNum}
											
												<input type="hidden" name="aseq" value="${albumNum}">
											
											</td>
										</tr>
										<tr>
											<th>노래 등록 번호</th>
											<td>${songNum}
											
												<input type="hidden" name="sseq" value="${songNum}">
											
											</td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>노래 고유 번호</th>
											<td>										
												<input type="text" name="song_num" value="${songVO.song_num}">
											</td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>노래 제목</th>
											<td><input type="text" name="subject" value="${songVO.subject}"></td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>가수 이름</th>
											<td>
												<input type="text" name="singer_name" value="${songVO.singer_name}">
											</td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>앨범 이름</th>
											<td>
												<input type="hidden" name="album_name" value="${songVO.album_name}">
											</td>
											
										</tr>
										<tr>
											<th><b style="color:red;">*</b>타이틀곡 여부</th>
											<td>
												<c:choose>
													<c:when test="${songVO.title == 'y'}">
														<input type="radio" name="title" value="y" checked="checked"> &nbsp; O &nbsp;
														<input type="radio" name="title" value="n" > &nbsp;X
													</c:when>
													<c:otherwise>
														<input type="radio" name="title" value="y" > &nbsp; O &nbsp;
														<input type="radio" name="title" value="n" checked="checked"> &nbsp;X
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>국내/해외 여부</th>
											<td>
												<c:choose>
													<c:when test="${songVO.kpop == 'y'}">
														<input type="radio" name="kpop" value="y" checked="checked">국내 &nbsp;
														<input type="radio" name="kpop" value="n">해외
													</c:when>
													<c:otherwise>
														<input type="radio" name="kpop" value="y">국내 &nbsp;
														<input type="radio" name="kpop" value="n" checked="checked">해외
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									
									
									</table>
	
										<br> <br>
										
										<div id="buttons" style="text-align:center">
				        					<input type="button"    value="수정"   class="submit" onclick="song_update()"> 
				       						<input type="button"      value="취소"     class="cancel" onclick="history.go(-1)">
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