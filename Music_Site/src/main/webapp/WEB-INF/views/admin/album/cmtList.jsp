<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_music_menu.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.admin_search {
		text-align: center;
	}
	
	.btn {
		margin-left : 230px;
	}
</style>

</head>
<body>
<article>
<div class="index">  
 <!-- Category News Start-->
        <div class="cat-news">
            <div class="container">
                 <h2>댓글 목록</h2>
                 <form name="cmt_form">


					<div class="btn">
                        
	              		<input type="button" value="전체 보기" onclick="admin_cmt_all()">
                        
            		</div>
            		
 		          <br><br>  

					<div class="admin_search">
                            	
                            	아이디 : <input type="text" name="keyword" placeholder="Search" size="100" value="${keyword}">
                            	<button onclick="admin_cmt_search()"><i class="fa fa-search"></i></button>
                            	
                            	
                    </div>
                            	<br> <br> <br>

				<table class="list" border="1" width="1000" style="margin:auto">
					<tr>
						<th width="50">번호</th>
						<th width="70">댓글번호</th>
						<th width="70">앨범번호</th>						
						<th width="110">아이디</th>
						<th width="300">내용</th>
						<th width="200">앨범이름</th>
						<th width="100">등록날짜</th>
						<th width="100">삭제</th>
					</tr>
					
					<c:choose>
						<c:when test="${cmtCnt <= 0}">
							<tr>
								<td  colspan="8" align="center">조회 결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${cmtList}" var="cmtVO">
							<tr> 
								<td align="center">${cmtVO.num}</td>
								<td align="center">${cmtVO.cseq}</td>
								<td align="center">${cmtVO.aseq}</td>
								<td align="center">${cmtVO.id}</td>
								<td> &nbsp;${cmtVO.contents}</td>
								<td> &nbsp;<a href="admin_album_info?aseq=${cmtVO.aseq}"> ${cmtVO.album_name}</a></td>
								<td align="center"><fmt:formatDate value="${cmtVO.regdate}" pattern="yyyy-MM-dd" /></td>
								<td align="center"><input type="button" value="삭제" onclick="location.href='admin_cmtDelete?cseq=${cmtVO.cseq}';"></td>
							</tr>
							
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>	
				<br><br>
				</form>
			</div>
		</div>	
</div>
	<%@ include file="page/cmtList_page.jsp" %>
</article>	
</body>
</html>

<%@ include file="../footer.jsp" %>