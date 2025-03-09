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
	<form name="delete_form" method="post" action="delete">
	<div id="wrap">
		<img src="images/member/bye.jpg">
	</div>	
		<!-- 
			<h1 class="delete_reason">탈퇴 사유</h1>
		 -->
			<div class="del_form">
	    		<div class="del_form2">
	     			<div class="del_form3">
	     				
						<fieldset>
							<legend>탈퇴 사유</legend>
								탈퇴 사유를 남겨주세요. 남겨주신 의견을 바탕으로 앞으로의 서비스에 힘쓰겠습니다. <br>
								<br> <br>
							
							<input type="radio" name="reason" value="컨텐츠 부족"> 컨텐츠 부족 <br>
							<input type="radio" name="reason" value="개인정보 노출 우려"> 개인정보 노출 우려 <br>
							<input type="radio" name="reason" value="시스템 장애"> 시스템 장애 <br>
							<input type="radio" name="reason" value="다른 아이디 변경"> 다른 아이디 변경 <br>
							<input type="radio" name="reason" value="불친절"> 불친절 <br>
							<input type="radio" name="reason" value="사이트 불편"> 사이트 불편 <br>
							<input type="radio" name="reason" value="사이트를 거의 사용하지 않음"> 사이트를 거의 사용하지 않음 <br>
							<input type="radio" name="reason" value="etc">기타 <input type="text" name="etc_reason">
							
							<input type="hidden" name="etcyn" value="n">
							<br><br><br>
							
							<span>* 탈퇴를 진행하실 경우 탈퇴 계정으로는 로그인을 하실 수 없으며 <br>
						&nbsp;&nbsp;아이디를 다시 생성하실 수 없습니다.</span> <br> <br><br>
							
							* 본인확인을 위해 비밀번호를 다시 한 번 입력해 주신 후 탈퇴하기 버튼을 눌러주세요 <br> <br><br>
							<label>비밀번호 : </label><input type="password" name="pwd"> <br> 
							
									
						</fieldset>
						
						<br> <br>
						
						<div id="buttons" style="text-align:center">
        					<input type="button"    value="탈퇴하기"   class="submit" onclick="go_delete()">  
       						<input type="reset"      value="취소"     class="cancel" onclick="location.href='login_form'">
      					</div>
					
					</div>
				</div>
			</div>
	</form>
</body>
</html>

<%@ include file="../footer.jsp" %>