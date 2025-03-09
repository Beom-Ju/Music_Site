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
                
        <h2>회원 목록</h2>
        
        <form name="member_form">

        <!-- Category News End-->
        
        <!-- Tab News Start-->

	
							<div class="btn">
		                        
			              		<input type="button" value="전체 보기" onclick="admin_member_all()">
		                        
		            		</div>
		            		
		 		          <br><br>                          
                        
                         <div class="admin_search">
                         	
                            회원명 : <input type="text" name="keyword" placeholder="Search" size="100" value="${keyword}">
                            <button onclick="member_search()"><i class="fa fa-search"></i></button>
                        
                        	
                        	
                        </div>
                            	<br> <br> <br>
                            
			 				<table class="list" border="1" width="1050" style="margin:auto">
								<tr>
									<th width="50">번호</th>
									<th width="70">탈퇴여부</th>
									<th width="70">아이디</th>
									<th width="70">이름</th>
									<th width="100">생일</th>
									<th width="50">성별</th>
									<th width="100">전화번호</th>
									<th width="150">이메일</th>
									<th width="70">우편번호</th>
									<th width="220">주소</th>
									<th width="100">생성 날짜</th>
								</tr>
								
								<c:choose>
									<c:when test="${memberCnt <=0}">
										<td  colspan="11" align="center">조회 결과가 없습니다.</td>
									</c:when>
									<c:otherwise>
										<c:forEach items="${memberList}" var="memberVO">
											<tr>
												<td align="center">${memberVO.num}</td>
												<td align="center">
													<c:choose>
														<c:when test="${memberVO.useyn == 'n'}">
															<span style="color: #ff0000"><b>탈퇴</b></span>
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
												</td>
												<td align="center">${memberVO.id}</td>
												<td align="center">${memberVO.name}</td>
												<td align="center">
													<fmt:parseDate var="birth" value="${memberVO.birth}" pattern="yyyy-MM-dd"/>
		                            				<fmt:formatDate value="${birth}" pattern="yyyy-MM-dd"/>
												</td>
												<td>${memberVO.gender}</td>
												<td>${memberVO.phone}</td>
												<td>${memberVO.email}</td>
												<td>${memberVO.zip_num}</td>
												<td>${memberVO.address1}&nbsp;${memberVO.address2}</td>
												<td>
													<fmt:parseDate var="regdate" value="${memberVO.regdate}" pattern="yyyy-MM-dd"/>
		                            				<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>							

					
					<br><br>
			</form>		
        <!-- Tab News Start-->
                   </div>                  
     </div>
</div>
	<%@ include file="memberList_page.jsp" %>
</article>
</body>
</html>
<%@ include file="../footer.jsp" %>