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
	
		<input type="hidden" name="check" value="check2">
	
		<ul class="pagination">
			
			<c:if test="${pageMaker2.prev}">
				<li class="paginate_button privious">
					<a href="admin_singer_info${pageMaker2.makeQuery(pageMaker2.startPage - 1)}&pseq=${singerDetail.pseq}&check=check2">[이전]</a>
				</li>
			</c:if>
							
			<c:forEach begin="${pageMaker2.startPage}" end="${pageMaker2.endPage}" var="index">
				<a href="admin_singer_info${pageMaker2.makeQuery(index)}&pseq=${singerDetail.pseq}&check=check2">[${index}]</a>
			</c:forEach>
				
			<c:if test="${pageMaker2.next}">
				<li class="paginate_button next">
					<a href="admin_singer_info${pageMaker2.makeQuery(pageMaker2.endPage + 1)}&pseq=${singerDetail.pseq}&check=check2">[다음]</a>
				</li>
			</c:if>

		</ul>
	</div>
</body>
</html>