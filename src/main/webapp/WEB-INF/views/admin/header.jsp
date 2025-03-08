<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
        <link href="css/admin.css" rel="stylesheet">
        
        <!-- js -->
        <script type="text/javascript" src="js/admin.js"></script>

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
                    <div class="col-lg-6 col-md-4 mr-auto">
                        <div class="b-logo">
                            <a href="main_form">
                                <img src="images/logo.jpg" alt="Logo">
                            </a>
                             (관리자용)
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
                        	
                        	<a href="main_form" class="nav-item nav-link">메인</a>
                        	
                        	<a href="singerList" class="nav-item nav-link">음원 리스트</a>
                   
                            <a href="memberList" class="nav-item nav-link">회원 리스트</a>
                            
                             <a href="admin_qna" class="nav-item nav-link">Q&A 리스트</a>
                             
                             
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
                            		<a href="logout"  class="nav-item nav-link">Logout</a>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
</head>
<body>

</body>
</html>