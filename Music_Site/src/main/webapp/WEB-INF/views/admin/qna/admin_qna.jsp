<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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

	<div class="cat-news">
    
    	<div class="container">
                
        <h2>Q&A 목록</h2>

        <!-- Category News End-->
        
        <!-- Tab News Start-->
			<form name="qna_form">
	
	
						<div class="btn">
		                        
			              		<input type="button" value="전체 보기" onclick="admin_qna_all()">
		                        
		            	</div>
		            		
		 		          <br><br>  
                        
                        
                         <div class="admin_search">
                         	
                            아이디 : <input type="text" name="keyword" placeholder="Search" size="100">
                            <button onclick="qna_search()"><i class="fa fa-search"></i></button>
                        

                        	
                        </div>
                            	<br> <br> <br>
                            
				 				
								<table class="list" border="1" width="1050" style="margin:auto">
									<tr>
										<th width="60">순서</th>
										<th width="120">아이디</th>
										<th width="170">분류</th>
										<th width="400">제목</th>
										<th width="150">상태</th>
										<th width="150">등록일자</th>
									</tr>
									
									<c:choose>
										<c:when test="${qnaCnt <=0}">
											<td  colspan="6" align="center">조회 결과가 없습니다.</td>
										</c:when>
										<c:otherwise>
											<c:forEach items="${qnaList}" var="qnaVO">
											<tr> 
												<td align="center">${qnaVO.num}</td>
												<td align="center">${qnaVO.id}</td>
												<td align="center">${qnaVO.kind}</td>
												<td> &nbsp; <a href="admin_qnaDetail?qseq=${qnaVO.qseq}">${qnaVO.subject}</a></td>
												<td align="center">
													<c:choose>
											            <c:when test="${qnaVO.rep==1}"> 미처리 </c:when>
											            <c:when test="${qnaVO.rep==2}"> 처리완료 </c:when>
											        </c:choose>
												</td>
												<td align="center"><fmt:formatDate value="${qnaVO.regdate}" pattern="yyyy-MM-dd"/></td>
											</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>	
														
				<br>
				<br><br>
				</form>
        <!-- Tab News Start-->
                   </div>                  
     </div>
</div>
	<%@ include file="admin_qna_page.jsp" %>
</article>
</body>
</html>
<%@ include file="../footer.jsp" %>