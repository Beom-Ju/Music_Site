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
	<div class="page2">
	
		<input type="hidden" name="check" value="check1">
	
		<ul class="pagination">
			
			<c:if test="${pageMaker1.prev}">
				<li class="paginate_button privious">
					<a href="singer_info${pageMaker1.makeQuery(pageMaker1.startPage - 1)}&pseq=${singerDetail.pseq}&check=check1">[이전]</a>
				</li>
			</c:if>
							
			<c:forEach begin="${pageMaker1.startPage}" end="${pageMaker1.endPage}" var="index">
				<a href="singer_info${pageMaker1.makeQuery(index)}&pseq=${singerDetail.pseq}&check=check1">[${index}]</a>
			</c:forEach>
				
			<c:if test="${pageMaker1.next}">
				<li class="paginate_button next">
					<a href="singer_info${pageMaker1.makeQuery(pageMaker1.endPage + 1)}&pseq=${singerDetail.pseq}&check=check1">[다음]</a>
				</li>
			</c:if>

		</ul>
	</div>
</body>
</html>