<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

  <meta http-equiv="Content-Language" content="ko">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <script type="text/javascript" src="js/calendar.js"></script>
</head>
<body>
	<form name="join_form" method="post" action="join" enctype="multipart/form-data">
	<div id="wrap">
		<img src="images/member/login.jpg">
	</div>	
		<h1 class="sign">Sign Up</h1>
			<div class="join_form">
	    		<div class="join_form2">
	     			<div class="join_form3">
	     				'<b style="color:red;">*</b>' 표시는 무조건 입력해야 하는 문항입니다. <br> <br>
	     				<fieldset>
		     				<legend>로그인 정보</legend>
							<label id="id"><b style="color:red;">*</b>아이디</label>
							<input type="text" name="id">
							<input type="hidden" name="idOk">
							<input type="button" value="중복 체크" onclick="idCheck()"> <br>
							<span>*아이디는 3~7자리까지 입력가능 합니다.</span><br>
							
							<label id="pwd"><b style="color:red;">*</b>비밀번호</label>
							<input type="password" name="pwd"> <br> 
							<span>*비밀번호는 4~9자리까지 입력가능 합니다.</span> <br>
							
							<label id="pwdCheck"><b style="color:red;">*</b>비밀번호 확인</label>
							<input type="password" name="pwdCheck"> <br>
							<span>*비밀번호 확인을 위해 비밀번호를 한번 더 입력해 주세요.</span> <br>
						</fieldset>
						
						<br><br>
						
						<fieldset>
							<legend>개인 정보</legend>
								<label id="picture">사진</label> 
								<input type="file" name="uploadPicture" > <br> <br>
								<label id="name"><b style="color:red;">*</b>이름</label>
								<input type="text" name="name"> <br>
								
								<label id="birth"><b style="color:red;">*</b>생년월일</label>
								<input type="date" name="birth"> <br>
								
								<label id="gender"><b style="color:red;">*</b>성별</label>
								<input type="radio" name="gender" value="남자" checked="checked">남자 &nbsp; &nbsp;
								<input type="radio" name="gender" value="여자">여자 <br> <br>
								
								<label id="phone"><b style="color:red;">*</b>전화 번호</label>
								<input type="text" name="phone"> <br>
								
								<label id="email"><b style="color:red;">*</b>이메일</label>
								<input type="email" name="email"> <br>
								
								<label id="address">주소</label>
								<input type="text" name="zip_num" readOnly="readOnly" class="zip_num">
								<input type="button" value="주소 찾기" onclick="join_addr_search()"> <br>
								
								<input type="text" name="address1" class="address1" size="50" style="margin-left: 140px" readOnly="readOnly"> <br>
								<input type="text" name="address2" size="50" style="margin-left: 140px"> 
						
								
						</fieldset>
						
						<br> <br>
						
						<div id="buttons" style="text-align:center">
        					<input type="button"    value="회원가입"   class="submit" onclick="go_save()"> 
       						<input type="button"      value="취소"     class="cancel" onclick="location.href='login_form'">
      					</div>
					
					</div>
				</div>
			</div>
	</form>

</body>
</html>

	<%@ include file="../footer.jsp" %>