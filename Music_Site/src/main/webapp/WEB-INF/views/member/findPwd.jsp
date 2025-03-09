<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

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
	<h1>비밀번호 찾기</h1>
	
	<br>


		<fieldset>
			<legend>이메일로 찾기</legend>
				<form name="findPwd_email">    
					<table >
						<tr>
							<th>아이디 : </th>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<th>이름 : </th>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<th>이메일 : </th>
							<td><input type="email" name="email"></td>
						</tr>
					</table>
				   
					<br> <br>
					
					<input type="button" value="찾기" onclick="go_findPwd_email()">
					
				</form> 
				
		</fieldset>	
	<br><br>
			<fieldset>
				<legend>전화번호로 찾기</legend> 	
				<form name="findPwd_phone">  	
					<table>
						<tr>
							<th>아이디 : </th>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<th>이름 : </th>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<th>전화번호 : </th>
							<td><input type="text" name="phone"></td>
						</tr>
					</table>
					
					<br> <br>
					
					<input type="button" value="찾기" onclick="go_findPwd_phone()">
				
				</form>
			</fieldset>
</div>
</body>
</html>