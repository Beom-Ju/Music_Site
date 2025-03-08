<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
                
        <h2>최신 앨범</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
        <div class="tab-news">
        	<div class="container">

                  <ul class="nav nav-pills nav-justified">
                      <li class="nav-item">
                          <a class="nav-link active" data-toggle="pill" href="#featured">전체</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#popular">국내</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#latest">해외</a>
                      </li>
                  </ul>

                 <div class="tab-content">
                 	<div id="featured" class="container tab-pane active">
                   		<div class="tn-news">
                            <div class = "chart">
			 				     <c:forEach items="${newAlbumListAll}" var="albumVO">
			                         <div class="cn-img">
			                             <img src="images/album_images/${albumVO.album_image}"  />
			                             <div class="cn-title">
			                                 <a href="album_info?aseq=${albumVO.aseq}" class="album_name">${albumVO.album_name}</a>
			                                 <br><br><br><br><br>
			                                 <a href="singer_info?pseq=${albumVO.pseq}" class="singer">${albumVO.singer_name}</a>
			                             </div>
			                             <br>
			                              <div class="cn-title2">
			                                 
			                             </div>
			                         </div>
			                     </c:forEach>							
							</div>
                       </div>           
                    </div>
                    <div id="popular" class="container tab-pane fade">
                        <div class="tn-news">
                            <div class = "chart">
				 				 <c:forEach items="${newAlbumListKor}" var="albumKorVO">
			                         <div class="cn-img">
			                             <img src="images/album_images/${albumKorVO.album_image}"  />
			                             <div class="cn-title">
			                                 <a href="album_info?aseq=${albumKorVO.aseq}" class="album_name">${albumKorVO.album_name}</a>
			                                 <br><br><br><br><br>
			                                 <a href="singer_info?pseq=${albumKorVO.pseq}" class="singer">${albumKorVO.singer_name}</a>
			                             </div>
			                             <br>
			                              <div class="cn-title2">
			                                 
			                             </div>
			                         </div>
			                     </c:forEach>											
							</div>
                        </div>
                        
                    </div>
                    <div id="latest" class="container tab-pane fade">
                        <div class="tn-news">
                            <div class = "chart">
				 				<c:forEach items="${newAlbumListOver}" var="albumOverVO">
			                         <div class="cn-img">
			                             <img src="images/album_images/${albumOverVO.album_image}"  />
			                             <div class="cn-title">
			                                 <a href="album_info?aseq=${albumOverVO.aseq}" class="album_name">${albumOverVO.album_name}</a>
			                                 <br><br><br><br><br>
			                                 <a href="singer_info?pseq=${albumOverVO.pseq}" class="singer">${albumOverVO.singer_name}</a>
			                             </div>
			                             <br>
			                              <div class="cn-title2">
			                                 
			                             </div>
			                         </div>
			                     </c:forEach>								
							</div>
                        </div>
                        
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