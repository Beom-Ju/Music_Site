<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function exit() {
		self.close();
	}
</script>
<script type="text/javascript" src="js/member.js"></script>
<style>
 .find {
 	text-align:center;
 }
 
 table {
 	margin-left: auto;
 	margin-right: auto;
 }
</style>
</head>
<body>
<div class="find">
	
	
	<c:if test="${message==1}">
	<h1>아이디 찾기 결과</h1>
	<br>
	
		<table>

			<tr>
				<th align="left">아이디 : </th>
				<td>${member.id}</td>
			</tr>
			<tr>		
				<td colspan="2" align="left">(생성날짜 : <fmt:formatDate value="${member.regdate}" pattern="yyyy-MM-dd"/> )</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="button" value="확인" onclick="exit()">
				</td>
			</tr>
		</table>
		
	</c:if>
	
	<c:if test="${message==-1}">
		<h1>아이디 찾기 결과</h1>
		<br>
			<table>
				<tr>
					<td>잘못된 사용자 정보입니다.</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="다시 찾기" onclick="history.go(-1)">
						<input type="button" value="확인" onclick="exit()">
					</td>
				</tr>
			</table>
	</c:if>
	
		
	<c:if test="${message==2}">
		<h1>비밀번호 변경</h1>
		<form name="find_form"  action="update_pwd" method="post">
		<br>
			<input type="hidden" name="id" value="${id}">
		<table>
			<tr>
				<td colspan="2">*비밀번호는 4~9자리까지 입력가능 합니다.</td>
			</tr>
			<tr>
				<th align="left">비밀번호 : </th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th align="left">비밀번호 확인 : </th>
				<td><input type="password" name="pwdCheck"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" onclick="go_pwd_update()">
				</td>
			</tr>
		</table>
		</form>
	</c:if>
	
	<c:if test="${message==-2}">
		<h1>비밀번호 찾기 결과</h1>
		<br>
			<table>
			<tr>
				<td>잘못된 사용자 정보입니다.</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="다시 찾기" onclick="history.go(-1)">
					<input type="button" value="확인" onclick="exit()">
				</td>
			</tr>
		
		</table>
	</c:if>

	
</div>
</body>
</html>