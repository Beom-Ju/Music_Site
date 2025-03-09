<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <title>아이 신난다</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Bootstrap News Template - Free HTML Templates" name="keywords">
        <meta content="Bootstrap News Template - Free HTML Templates" name="description">

		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

		<!-- 헤더  -->
		
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600&display=swap" rel="stylesheet"> 

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        
        <!-- js -->
        <script type="text/javascript" src="js/member.js"></script>
        <script type="text/javascript" src="js/album.js"></script>  
        <script type="text/javascript" src="js/qna.js"></script>  

		<script>
			$(document).ready(function(){
				//인기검색어 표출
				$.ajax({
					type: 'GET',
					url: 'popularKey',
					data: {},	
					dataType : "json",
					success : function(data) {
						
						//초기값 넣어줌
						$("#popularKey").text(data[0].ro +". " + data[0].keyword);
						$("#popularKey").attr("href", "searchList?keyword=" + data[0].keyword);
						
						
						var i = -1;
						
						//5초마다 1위부터 10위까지의 인기검색어 보여줌
						setInterval(function(){
							i++;
							$("#popularKey").text(data[i].ro +". " + data[i].keyword);
							$("#popularKey").attr("href", "searchList?keyword=" + data[i].keyword);
							
							if (i == 9) { //10위까지 보여주면 다시 처음부터
								i=-1;
							} 
							
						}, 5000);
						
						
					},
					error: function(jqXHR, textStatus, errorThrown) {
						alert("인기검색어를 불러오는데 오류가 발생했습니다.");
					}
				});
			});
		</script>

        <!-- Top Bar Start -->
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="tb-contact">
                            <p><i class="fas fa-envelope"></i>kbj0882@hanmail.net</p>
                            <p><i class="fas fa-phone-alt"></i>010 1234 5678</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 맨위 상단 화면-->
        <form name="search_form">
        <div class="brand">
            <div class="container">
                <div class="row align-items-center">
                	<!-- 로고 -->
                    <div class="col-lg-7 col-md-4 mr-auto">
                        <div class="b-logo">
                            <a href="index.html">
                                <img src="images/logo.jpg" alt="Logo">
                            </a>
                        </div>
                    </div>
                    
                    <!-- 인기검색어 -->
                    <div class="col-lg-2 col-md-4 ml-auto">
                        <div class="b-search">
                            <!-- <input type="text" id="popularKey" value=""> -->
                            <a href="" id="popularKey" class="dropdown-item"	style="font-weight: bold;background: #efefef;"></a>
                        </div>
                    </div>
                    
                    <!-- 검색창 -->
                    
                    <div class="col-lg-3 col-md-4 ml-auto">
                        <div class="b-search">
                            <input type="text" name="keyword" placeholder="Search" maxlength="12">
                            <button onclick="search()"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
		</form>

        <!-- 메뉴 -->
        <div class="nav-bar">
            <div class="container">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                	
                
                	<br> <br> <br>
                
                    <a href="#" class="navbar-brand">MENU</a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="chartList" class="nav-item nav-link">음원 차트</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">최신 음악</a>
                                <div class="dropdown-menu">
                                    <a href="newSong" class="dropdown-item">최신 곡</a>
                                    <a href="newAlbum" class="dropdown-item">최신 앨범</a>
                                </div>
                            </div>
                            
                            
                            <a href="genre" class="nav-item nav-link">장르</a>
                            
                        </div>
                     
                        <div class="navbar-nav ml-auto">
                        	<c:choose>
	                        	<c:when test="${empty sessionScope.loginUser}">
	                        		<a href="login_form" class="nav-item nav-link">Login | </a>
	                        	</c:when>
                            	<c:otherwise>
                            		<div class="nav-item nav-link">
                            		${sessionScope.loginUser.name}(${sessionScope.loginUser.id}) |
                            		</div>
                            		<a href="logout"  class="nav-item nav-link">Logout | </a>
                            	</c:otherwise>
                            </c:choose>
                            <a href="login_pwdCheck" class="nav-item nav-link">My Page | </a>
                            <a href="myMusic" class="nav-item nav-link">My Music | </a>
                            <a href="qna" class="nav-item nav-link">Q&A </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
</head>
<body>

</body>
</html>