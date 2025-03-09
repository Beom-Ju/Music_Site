<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/member.js"></script>

</head>
<body>
	<form name="pwdCheck_form" action="mypage" method="post">

	
	<div class="pwd_form">
		<div class="overlay">
			<div class="pwd_form2">
				<div class="pwd_form3">
	
				<h1>본인 확인</h1>
				
				<br>

				<table>
					<tr>
						<td colspan="2">* 본인 확인을 위해 비밀번호를 다시 한 번 입력해주세요.</td>
					</tr>
					<tr>
						<th>비밀번호 : </th>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td>${message}</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center"><input type="button" value="확인" onclick="go_mypage()"></td>
					</tr>
				
				</table>
				
				</div>
			</div>
		</div>
	</div>	
	</form>
	
</body>
</html>

	<%@ include file="../footer.jsp" %>