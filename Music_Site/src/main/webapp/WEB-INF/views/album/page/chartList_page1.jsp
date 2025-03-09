<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="page">
		<input type="hidden" name="check" value="check1">
		<ul class="pagination">
		
			<li>				
				<a href="chartList${pageMaker1.makeQuery(pageMaker1.startPage)}&check=check1">1~50위 보기</a>
			</li>

			

			<li>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="chartList${pageMaker1.makeQuery(pageMaker1.endPage)}&check=check1">51~100위 보기</a>
			</li>	

		</ul>
	</div>
</body>
</html>