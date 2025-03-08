<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="page">
		<ul class="pagination">
			
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous">
					<a href="cmtList${pageMaker.makeQuery(pageMaker.startPage - 1)}&keyword=${keyword}">[이전]</a>
				</li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
				<a href="cmtList${pageMaker.makeQuery(index)}&keyword=${keyword}">[${index}]</a>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next">
					<a href="cmtList${pageMaker.makeQuery(pageMaker.endPage + 1)}&keyword=${keyword}">[다음]</a>
				</li>
			</c:if>
			
		</ul>
	</div>
</body>
</html>