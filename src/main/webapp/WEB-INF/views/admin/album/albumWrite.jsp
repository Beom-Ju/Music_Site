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
                
        <h2>앨범 등록</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
        <div class="tab-news">
        	<div class="container">

                 <div class="tab-content">
                   		<div class="tn-news">
								<form name="album_form" action="albumWrite" method="post" enctype="multipart/form-data">
									'<b style="color:red;">*</b>' 표시는 무조건 입력해야 하는 문항입니다. <br> <br>
									<table>
										<tr>
											<th width="140">가수 등록 번호</th>
											<td>${singerNum}
											
												<input type="hidden" name="pseq" value="${singerNum}">
											
											</td>
										</tr>
										<tr>
											<th>앨범 이미지</th>
											<td><input type="file" name="uploadPicture"></td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>앨범 종류</th>
											<td>
												<select name="album_kind">
													<option value="선택">===선택===</option>
													<option value="싱글">싱글</option>
													<option value="EP">EP</option>
													<option value="정규">정규</option>
													<option value="비정규">비정규</option>
													<option value="OST">OST</option>
													<option value="옴니버스">옴니버스</option>		
												</select>											
											</td>
										</tr>
										<tr>
											<th>가수명</th>
											<td>${singerName}
												<input type="hidden" name="singer_name" value="${singerName}">
											</td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>앨범명</th>
											<td><input type="text" name="album_name"> </td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>앨범 발매일</th>
											<td><input type="date" name="regdate"></td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>장르</th>
											<td>
												<select name="genre">
													<option value="선택">===선택===</option>
													<option value="Ballad">Ballad</option>
													<option value="Rock">Rock</option>
													<option value="Dance">Dance</option>
													<option value="OST">OST</option>
													<option value="Pop">Pop</option>
													<option value="Rap/Hip-Hop">Rap/Hip-Hop</option>
													<option value="R&B/Soul">R&B/Soul</option>
													<option value="Trot">Trot</option>
													<option value="Indie">Indie</option>
													<option value="Folk/Blues">Folk/Blues</option>	
												</select>
											 </td>
										</tr>
										<tr>
											<th>앨범 설명</th>
											<td><textarea name="content" cols="85" rows="5" style="resize:none;"></textarea> </td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>국내/해외 여부</th>
											<td>
												<input type="radio" name="kpop" value="y" checked="checked">국내 &nbsp;
												<input type="radio" name="kpop" value="n">해외
											</td>
										</tr>
									
									
									</table>
								
								
				
										
										<br> <br>
										
										<div id="buttons" style="text-align:center">
				        					<input type="button"    value="등록"   class="submit" onclick="album_write()"> 
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