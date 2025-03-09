<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 검색</title>
<style type="text/css">

</style>
<script type="text/javascript">
	function result(zip_num, sido, gugun, dong) {
		opener.document.mypage_form.zip_num.value=zip_num;
		opener.document.mypage_form.address1.value=sido+" "+gugun+" "+dong;
		self.close();
	}
</script>
<style>
	.addr {
		text-align:center;
	}
	
	 table {
 	margin-left: auto;
 	margin-right: auto;
 }
</style>
</head>
<body>
<div class="addr">
	<h1>주소 검색</h1>
	<form name="addr_form" action="my_addr_search" method="post">
		동 이름 : <input type="text" name="dong">
		<input type="submit" value="찾기" name="search">
		
		<table id="addr_result">
			<tr>
				<th width="100">우편 번호</th>
				<th width="300">주소</th>
			</tr>
			<c:forEach items="${addressList}" var="addressVO">
			<tr>
				<td>${addressVO.zip_num}</td>
				<td>
					<a href="#" onclick="return result('${addressVO.zip_num}', '${addressVO.sido}', '${addressVO.gugun}', '${addressVO.dong}')">
					${addressVO.sido} ${addressVO.gugun} ${addressVO.dong}
					</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</form>
</div>
</body>
</html>