<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 #commentCnt {
    	border-radius: 3px;
    	border: 1px solid #000;
    	padding: 5px;
    }

	#commentList {
		background-color: rgba(255, 102, 102, 0.3);
		border-radius: 3px;
		font-size: 15px;
	}
	
	#pagination {
		font-size: 20px;
	}
</style>
</head>
<body>
<div class="cat-news">
    <div class="container">
         <h2>댓글</h2>
		<form id="commentForm">
		<div class="cmt">
			
			<c:choose>
				<c:when test="${empty loginUser}">	
					<textarea name="contents" cols="145" rows="5" placeholder="로그인 후 작성 해주세요!" onclick="location.href='no_login'" style="resize:none;" readonly="readonly"></textarea>

					<input type="button" value="댓글 등록"  onclick="location.href='no_login'">
				</c:when>
				<c:otherwise>
					<textarea name="contents" id="contents" cols="145" rows="5" style="resize:none;" ></textarea>

					<input type="button" value="댓글 등록"  onclick="save_comment('${albumInfo.aseq}')">
				</c:otherwise>
			</c:choose>
		</div>
		
		<br><br>
		<span id="commentCnt"></span> <br><br>	
		
		<input type="hidden" id="aseq" name="aseq" value="${albumInfo.aseq}">

		<div id="commentList">
		
		</div>
		<div>
			<ul id="pagination">
			</ul>
		</div>
		<br>
	</form>
  </div>
</div>
<script>
	$(document).ready(function(){
		getCommentList();
	});

	//상품 목록
	function getCommentList() {
		
		$.ajax({
			type:'GET',
			url: 'comments/list',
			dataType:"json",
			data:$("#commentForm").serialize(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				var totalCount = data.total;
				var pageMaker = data.pageinfo;
				var commentList = data.comments;
				var updateView = data.updateView;
				
				console.log(totalCount);
				console.log(commentList);
				console.log(pageMaker);
				console.log("댓글 정보 길이=" + commentList.length);
				
				showHtml(pageMaker, commentList, totalCount, updateView);
			},
			error: function(request, status, error) {
				alert("댓글 목록을 불러오지 못했습니다.");
			}
		});
	}

	function showHtml(pageMaker, commentList, totalCount, updateView) {
		var html="";
		var p_html="";
		
		if (commentList.length > 0) {
			$.each(commentList, function(index, item){
				var cseq=item.cseq;
				var id=item.id;

				html += "<div>";
		        html += "<div id=\"comment_item\"> <strong> " + item.id+"</strong>"
		        html += "<span id=\"write_date\">" + displayTime(item.regdate) + "</span>"
		        html +=	"<a href=\"#\" onclick=\"delete_comment("+cseq+",'"+id+"')\">삭제</a> <br>"
		        html += item.contents+"<br></div>"
		        html += "</div><br>";
			});
			
			if (pageMaker.prev == true) {
				p_html += "<li class=\"paginate_button previous\">";
				p_html += "<a href=\"comment_paging?pageNum="+pageMaker.startPage-1+
							"&numPerPage="+pageMaker.cri.numPerPage;
							"&aseq=${albumInfo.aseq}\">[이전]</a>";
			}
			
			for(var i=pageMaker.startPage; i<pageMaker.endPage; i++) {
				p_html += "<a href='comment_paging?pageNum="+i+
						"&numPerPage="+pageMaker.cri.numPerPage+
						"&aseq=${albumInfo.aseq}'>[" + i + "]</a>";
			}
			
			if (pageMaker.next == true) {
				p_html += "<li class=\"paginate_button nextx\">";
				p_html += "<a href=\"comment_paging?pageNum="+(pageMaker.endPage+1)+
							"&numPerPage="+pageMaker.cri.numPerPage;
							"&aseq=${albumInfo.aseq}\">[다음]</a>";
			}

		}
		
		$("#commentCnt").html("댓글 (총 " + totalCount + "개)");
		$("#commentList").html(html);
		//$("#pagination").html(p_html);
	}
	
	/**
	* 댓글 날짜 부분
	*/
	
	function displayTime(timeValue) {
		var today = new Date();
		
		//24시간 이내인지 계산하기 위함
		var gap = today.getTime() - timeValue;
					//getTime() - 주어진 시간을 밀리초로 리턴
					
		var dateObj = new Date(timeValue);
		var str = "";
		
		//24시간 이내일 경우 시, 분, 초만 표시
		if (gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh>9 ? '' : '0') + hh, ':', (mi>9 ? '': '0') + mi, ':',
						(ss>9 ? '': '0') + ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [ yy, '-', (mm>9 ? '':'0') + mm, '-',
				(dd>9 ? '':'0') + dd].join('');
		}
	}
	

	/*
	* 댓글 등록
	*/
	function save_comment(aseq){
		
		$.ajax({
			type: 'POST',
			url: 'comments/save',
			data:$("#commentForm").serialize(), //html FORM의 입력 데이터를 전송함
			success : function(data) {
				if (data=="success") {
					getCommentList();
					$("#contents").val("");
				} else if (data == "fail") {
					alert("댓글 등록이 실패하였습니다.");
				} else if (data == "not_login") {
					alert("댓글등록은 로그인이 필필요합니다!");
					location.href='login_form';
				}
			},
			error: function(request, status, error) {
				alert("error : " + error);
			}
			
		});

	}
	
	/*
	*	댓글 삭제
	*/
	function delete_comment(cseq, id) {
		
		$.ajax({
			type: 'POST',
			url: 'comments/delete',
			data: {cseq: cseq,	
				   id: id},	// 함수의 파라미터로 받은 값을 전송
			success : function(data) {
				if (data=="success") {
						getCommentList();
				} else if (data=="fail") {
					alert("해당 회원만 삭제할 수 있는 댓글입니다.");
				} else if (data=="not_login") {
					alert("댓글삭제를 위해 로그인을 해주세요!")
					location.href='login_form';
				}
			}
		});
	}
	/*
	* 댓글 수정
	*/
	
</script>	
 
</body>
</html>