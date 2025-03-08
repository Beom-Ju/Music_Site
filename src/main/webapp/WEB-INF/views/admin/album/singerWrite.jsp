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
                
        <h2>가수 등록</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
        <div class="tab-news">
        	<div class="container">

                 <div class="tab-content">
                   		<div class="tn-news">
								<form name="singer_form" action="singerWrite" method="post" enctype="multipart/form-data">
									'<b style="color:red;">*</b>' 표시는 무조건 입력해야 하는 문항입니다. <br> <br>
									<table>
										<tr>
											<th width="120">사진</th>
											<td><input type="file" name="uploadPicture"></td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>가수명</th>
											<td><input type="text" name="singer_name"> </td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>데뷔 년도</th>
											<td><input type="text" name="regdate_year"> </td>
										</tr>
										<tr>
											<th><b style="color:red;">*</b>데뷔 곡</th>
											<td><input type="text" name="first_song"></td>
										</tr>
									
									
									</table>
								
								
				
										
										<br> <br>
										
										<div id="buttons" style="text-align:center">
				        					<input type="button"    value="등록"   class="submit" onclick="singer_write()"> 
				       						<input type="button"      value="취소"     class="cancel" onclick="history.go(-1)'">
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