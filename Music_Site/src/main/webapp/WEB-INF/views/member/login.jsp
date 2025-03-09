<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form name="login_form" action="login" method="post">
	
	<div id="wrap">
		<img src="images/member/login.jpg">
	</div>
	
	<h1 class="member">member login</h1>
	 
	 <br> <br>
	 
	<div id="wrap2">    
		<label><input type="radio" name="system" value="1" checked="checked">유저</label>
		&nbsp; &nbsp; &nbsp; &nbsp;
		<label><input type="radio" name="system" value="2">관리자</label>
	</div>
	
	   
	<div class="login_form">
		<div class="login_form2">
			<div class="login_form3">
				<label for="id">아이디</label><input type="text" name="id">
	      		<div class="clear"></div>
	      		<label for="pwd">비밀번호</label><input type="password" name="pwd">
	     	</div>
	     
	     		<input type="submit" value="로그인하기">
	     
	     	<br><br><br><br>

	     	
	     	<br>
	     	
	     	<div class="clear"></div>
	     
	     	<div class="login_form4">

	      		<div class="clear"></div>
	      		<label><input type="button" value="회원가입" onClick="goJoin()"></label> 
	      		<label>
	      			<a href="findId" onclick="window.open(this.href, '_blank', 'top=100, left=300, width=600, height=500'); return false" >아이디 찾기</a> | 
	      			<a href="findPwd" onclick="window.open(this.href, '_blank', 'top=100, left=300, width=600, height=600'); return false">비밀번호 찾기</a>
				</label>
	     	</div>
	    </div>
	</div>

 	</form>


</body>
</html>

	<%@ include file="../footer.jsp" %>