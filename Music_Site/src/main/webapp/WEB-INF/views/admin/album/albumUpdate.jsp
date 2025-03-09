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
                
        <h2>앨범 수정</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
        <div class="tab-news">
        	<div class="container">

                 <div class="tab-content">
                   		<div class="tn-news">
								<form name="album_up_form" action="albumUpdate" method="post" enctype="multipart/form-data">
									<br>
									<div class="row cn-slider">
					                     <div class="col-lg-4">
					                         <div class="cn-img">
					                           <c:choose>
						                             <c:when test="${albumVO.album_image == 'nocover.jpg'}">
														<img src="images/album/nocover.jpg">
													 </c:when>
													 <c:otherwise>
														<img src="images/album_images/${albumVO.album_image}">
													 </c:otherwise>
												</c:choose>    
					                         </div>
					                     <br> <br>
					                     </div>
										 <div class="col-lg-8">   
											'<b style="color:red;">*</b>' 표시는 무조건 입력해야 하는 문항입니다. <br> <br>
											<table>
												<tr>
													<th width="140">앨범 등록 번호</th>
													<td>${albumVO.aseq}
													
														<input type="hidden" name="aseq" value="${albumVO.aseq}">
													
													</td>
												</tr>
												<tr>
													<th>가수 등록 번호</th>
													<td>${albumVO.pseq}
													
														<input type="hidden" name="pseq" value="${albumVO.pseq}">
													
													</td>
												</tr>
												<tr>
													<th>앨범 이미지</th>
													<td><input type="file" name="uploadPicture"></td>
												</tr>
												<tr>
													<th><b style="color:red;">*</b>앨범 종류</th>
													<td>
														<c:choose>
															<c:when test="${albumVO.album_kind == '싱글'}">
																<select name="album_kind" id="album_kind">
																	<option value="선택">===선택===</option>
																	<option value="싱글" selected="selected">싱글</option>
																	<option value="EP">EP</option>
																	<option value="정규">정규</option>
																	<option value="비정규">비정규</option>
																	<option value="OST">OST</option>
																	<option value="옴니버스">옴니버스</option>		
																</select>											
															</c:when>
															<c:when test="${albumVO.album_kind == 'EP'}">
																<select name="album_kind" id="album_kind">
																	<option value="선택">===선택===</option>
																	<option value="싱글">싱글</option>
																	<option value="EP" selected="selected">EP</option>
																	<option value="정규">정규</option>
																	<option value="비정규">비정규</option>
																	<option value="OST">OST</option>
																	<option value="옴니버스">옴니버스</option>		
																</select>											
															</c:when>
															<c:when test="${albumVO.album_kind == '정규'}">
																<select name="album_kind" id="album_kind">
																	<option value="선택">===선택===</option>
																	<option value="싱글">싱글</option>
																	<option value="EP">EP</option>
																	<option value="정규" selected="selected">정규</option>
																	<option value="비정규">비정규</option>
																	<option value="OST">OST</option>
																	<option value="옴니버스">옴니버스</option>		
																</select>											
															</c:when>
															<c:when test="${albumVO.album_kind == '비정규'}">
																<select name="album_kind" id="album_kind">
																	<option value="선택">===선택===</option>
																	<option value="싱글">싱글</option>
																	<option value="EP">EP</option>
																	<option value="정규">정규</option>
																	<option value="비정규" selected="selected">비정규</option>
																	<option value="OST">OST</option>
																	<option value="옴니버스">옴니버스</option>		
																</select>											
															</c:when>
															<c:when test="${albumVO.album_kind == 'OST'}">
																<select name="album_kind" id="album_kind">
																	<option value="선택">===선택===</option>
																	<option value="싱글">싱글</option>
																	<option value="EP">EP</option>
																	<option value="정규">정규</option>
																	<option value="비정규">비정규</option>
																	<option value="OST" selected="selected">OST</option>
																	<option value="옴니버스">옴니버스</option>		
																</select>											
															</c:when>
															<c:otherwise>
																<select name="album_kind" id="album_kind">
																	<option value="선택">===선택===</option>
																	<option value="싱글">싱글</option>
																	<option value="EP">EP</option>
																	<option value="정규">정규</option>
																	<option value="비정규">비정규</option>
																	<option value="OST">OST</option>
																	<option value="옴니버스" selected="selected">옴니버스</option>		
																</select>											
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
												<tr>
													<th>가수명</th>
													<td>
														<input type="text" name="singer_name" value="${albumVO.singer_name}">
													</td>
												</tr>
												<tr>
													<th><b style="color:red;">*</b>앨범명</th>
													<td><input type="text" name="album_name" value="${albumVO.album_name}"> </td>
												</tr>
												<tr>
													<th><b style="color:red;">*</b>앨범 발매일</th>
													<td>
														<fmt:parseDate var="regDate" value="${albumVO.regdate}" pattern="yyyy-MM-dd"/>
														<input type="date" name="regdate" value="<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd"/>">
													</td>
												</tr>
												<tr>
													<th><b style="color:red;">*</b>장르</th>
													<td>
														<c:choose>
															<c:when test="${albumVO.genre == 'Ballad'}">
																<select name="genre">
																	<option value="선택">===선택===</option>
																	<option value="Ballad" selected="selected">Ballad</option>
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
															</c:when>
															<c:when test="${albumVO.genre == 'Rock'}">
																<select name="genre">
																	<option value="선택">===선택===</option>
																	<option value="Ballad">Ballad</option>
																	<option value="Rock" selected="selected">Rock</option>
																	<option value="Dance">Dance</option>
																	<option value="OST">OST</option>
																	<option value="Pop">Pop</option>
																	<option value="Rap/Hip-Hop">Rap/Hip-Hop</option>
																	<option value="R&B/Soul">R&B/Soul</option>
																	<option value="Trot">Trot</option>
																	<option value="Indie">Indie</option>
																	<option value="Folk/Blues">Folk/Blues</option>	
																</select>
															</c:when>
															<c:when test="${albumVO.genre == 'Dance'}">
																<select name="genre">
																	<option value="선택">===선택===</option>
																	<option value="Ballad">Ballad</option>
																	<option value="Rock">Rock</option>
																	<option value="Dance" selected="selected">Dance</option>
																	<option value="OST">OST</option>
																	<option value="Pop">Pop</option>
																	<option value="Rap/Hip-Hop">Rap/Hip-Hop</option>
																	<option value="R&B/Soul">R&B/Soul</option>
																	<option value="Trot">Trot</option>
																	<option value="Indie">Indie</option>
																	<option value="Folk/Blues">Folk/Blues</option>	
																</select>
															</c:when>
															<c:when test="${albumVO.genre == 'OST'}">
																<select name="genre">
																	<option value="선택">===선택===</option>
																	<option value="Ballad">Ballad</option>
																	<option value="Rock">Rock</option>
																	<option value="Dance">Dance</option>
																	<option value="OST" selected="selected">OST</option>
																	<option value="Pop">Pop</option>
																	<option value="Rap/Hip-Hop">Rap/Hip-Hop</option>
																	<option value="R&B/Soul">R&B/Soul</option>
																	<option value="Trot">Trot</option>
																	<option value="Indie">Indie</option>
																	<option value="Folk/Blues">Folk/Blues</option>	
																</select>
															</c:when>
															<c:when test="${albumVO.genre == 'Pop'}">
																<select name="genre">
																	<option value="선택">===선택===</option>
																	<option value="Ballad">Ballad</option>
																	<option value="Rock">Rock</option>
																	<option value="Dance">Dance</option>
																	<option value="OST">OST</option>
																	<option value="Pop" selected="selected">Pop</option>
																	<option value="Rap/Hip-Hop">Rap/Hip-Hop</option>
																	<option value="R&B/Soul">R&B/Soul</option>
																	<option value="Trot">Trot</option>
																	<option value="Indie">Indie</option>
																	<option value="Folk/Blues">Folk/Blues</option>	
																</select>
															</c:when>
															<c:when test="${albumVO.genre == 'Rap/Hip-Hop'}">
																<select name="genre">
																	<option value="선택">===선택===</option>
																	<option value="Ballad">Ballad</option>
																	<option value="Rock">Rock</option>
																	<option value="Dance">Dance</option>
																	<option value="OST">OST</option>
																	<option value="Pop">Pop</option>
																	<option value="Rap/Hip-Hop" selected="selected">Rap/Hip-Hop</option>
																	<option value="R&B/Soul">R&B/Soul</option>
																	<option value="Trot">Trot</option>
																	<option value="Indie">Indie</option>
																	<option value="Folk/Blues">Folk/Blues</option>	
																</select>
															</c:when>
															<c:when test="${albumVO.genre == 'R&B/Soul'}">
																<select name="genre">
																	<option value="선택">===선택===</option>
																	<option value="Ballad">Ballad</option>
																	<option value="Rock">Rock</option>
																	<option value="Dance">Dance</option>
																	<option value="OST">OST</option>
																	<option value="Pop">Pop</option>
																	<option value="Rap/Hip-Hop">Rap/Hip-Hop</option>
																	<option value="R&B/Soul" selected="selected">R&B/Soul</option>
																	<option value="Trot">Trot</option>
																	<option value="Indie">Indie</option>
																	<option value="Folk/Blues">Folk/Blues</option>	
																</select>
															</c:when>
															<c:when test="${albumVO.genre == 'Trot'}">
																<select name="genre">
																	<option value="선택">===선택===</option>
																	<option value="Ballad">Ballad</option>
																	<option value="Rock">Rock</option>
																	<option value="Dance">Dance</option>
																	<option value="OST">OST</option>
																	<option value="Pop">Pop</option>
																	<option value="Rap/Hip-Hop">Rap/Hip-Hop</option>
																	<option value="R&B/Soul">R&B/Soul</option>
																	<option value="Trot" selected="selected">Trot</option>
																	<option value="Indie">Indie</option>
																	<option value="Folk/Blues">Folk/Blues</option>	
																</select>
															</c:when>
															<c:when test="${albumVO.genre == 'Indie'}">
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
																	<option value="Indie" selected="selected">Indie</option>
																	<option value="Folk/Blues">Folk/Blues</option>	
																</select>
															</c:when>
															<c:otherwise>
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
																	<option value="Folk/Blues" selected="selected">Folk/Blues</option>	
																</select>
															</c:otherwise>
														</c:choose>
													 </td>
												</tr>
												<tr>
													<th>앨범 설명</th>
													<td><textarea name="content" cols="85" rows="5" style="resize:none;">${albumVO.content}</textarea> </td>
												</tr>
												<tr>
													<th><b style="color:red;">*</b>국내/해외 여부</th>
													<td>
														<c:choose>
															<c:when test="${albumVO.kpop == 'y'}">
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
						        					<input type="button"    value="등록"   class="submit" onclick="album_update()"> 
						       						<input type="button"      value="취소"     class="cancel" onclick="history.go(-1)">
						      					</div>
						      					 <br>
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
<script>
/*
	$('#album_kind').val('정규').prop("selected",true);

*/
</script>
</html>
 
<%@ include file="../footer.jsp" %>