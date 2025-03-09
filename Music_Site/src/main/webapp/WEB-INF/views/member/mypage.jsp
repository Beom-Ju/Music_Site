<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

  <meta http-equiv="Content-Language" content="ko">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <script type="text/javascript" src="js/calendar.js"></script>
</head>
<body> 
	<form name="mypage_form" action="update" method="post" enctype="multipart/form-data">
	<div id="wrap">
		<img src="images/member/login.jpg">
	</div>	
		<h1 class="mypage">My Page</h1>
			<div class="mypage_form">
	    		<div class="mypage_form2">
	     			<div class="mypage_form3">
	     				'<b style="color:red;">*</b>' 표시는 무조건 입력해야 하는 문항입니다. <br> <br>
					
						<fieldset>
		     				<legend>로그인 정보</legend>
		     				
		     				<input type="hidden" name="progress" value="2">
							<label id="id"><b style="color:red;">*</b>아이디</label>
							<input type="text" name="id" class="id" value="${loginUser.id}" readOnly="readOnly"> <br>
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
								<c:choose>
									<c:when test="${loginUser.member_picture == 'default.jpg'}">
										<img src="images/member/default.jpg">
									</c:when>
									<c:otherwise>
										<img src="images/member_images/${loginUser.member_picture}">
									</c:otherwise>
								</c:choose>
								<input type="file" name="uploadPicture" value="사진 선택"> <br> <br>
								<label id="name"><b style="color:red;">*</b>이름</label>
								<input type="text" name="name" value="${loginUser.name}"> <br>
								
								<label id="birth"><b style="color:red;">*</b>생년월일</label>
							
								<fmt:parseDate var="birthDate" value="${loginUser.birth}" pattern="yyyy-MM-dd"/>
								<input type="date" name="birth" value="<fmt:formatDate value="${birthDate}" pattern="yyyy-MM-dd"/>">
								 <br>

								
								<label id="gender"><b style="color:red;">*</b>성별</label>

								<c:choose>
									<c:when test="${loginUser.gender == '남자'}">	
										<input type="radio" name="gender" value="남자" checked="checked">남자 &nbsp; &nbsp;
										<input type="radio" name="gender" value="여자">여자 <br> <br>
									</c:when>
									<c:otherwise>
										<input type="radio" name="gender" value="남자" >남자 &nbsp; &nbsp;
										<input type="radio" name="gender" value="여자" checked="checked">여자 <br> <br>
									</c:otherwise>
								</c:choose>
								
								<label id="phone"><b style="color:red;">*</b>전화 번호</label>
								<input type="text" name="phone" value="${loginUser.phone}"> <br>
								
								<label id="email"><b style="color:red;">*</b>이메일</label>
								<input type="email" name="email" value="${loginUser.email}"> <br>
								
								<label id="address">주소</label>
								<input type="text" name="zip_num" value="${loginUser.zip_num}" readOnly="readOnly" class="zip_num">
								<input type="button" value="주소 찾기" onclick="my_addr_search()"> <br>
								
								<input type="text" name="address1" class="address1" value="${loginUser.address1}" size="50" style="margin-left: 140px" readOnly="readOnly"> <br>
								<input type="text" name="address2" value="${loginUser.address2}" size="50" style="margin-left: 140px"> 
						
								
						</fieldset>
						
						<br> <br>
						
						<div id="buttons" style="text-align:center">
        					<input type="button"    value="수정하기"   class="submit" onclick="go_update()">
        					<input type="button"    value="회원 탈퇴"   class="submit" onclick="location.href='delete_reason'">  
       						<input type="button"      value="취소"     class="cancel" onclick="location.href='index'">
      					</div>
					
					</div>
				</div>
			</div>
	</form>

</body>
</html>

	<%@ include file="../footer.jsp" %>