<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

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
<h1>아이디 찾기</h1>

	<br>

		<fieldset>
			<legend>이메일로 찾기</legend>
					<form name="findId_email" >
						<table>
							<tr>
								<th>이름 : </th>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<th>이메일 : </th>
								<td><input type="text" name="email"></td>
							</tr>
						</table>
					
						<br> <br>
						
						<input type="button" value="찾기" onclick="go_findId_email()">
					 
					</form>	
		</fieldset>
	
	<br> <br>

 					
			<fieldset>
				<legend>전화번호로 찾기</legend>        		
					<form name="findId_phone">	
						<table>
							<tr>
								<th>이름 : </th>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<th>전화번호 : </th>
								<td><input type="text" name="phone"></td>
							</tr>
						</table>
						
						<br> 
						
						<input type="submit" value="찾기" onclick="go_findId_phone()">
					</form>

		</fieldset>

 </div>
</body>
	
</html>