<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  
<%@ include file="sub_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery CDN에서 복사해서 붙여넣음 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : 'GET',
			headers : {
				Accept: "application/json; charset=utf-8",
				"Content-type": "application/json; charset=utf-8"
			},
			url : 'delete_record_chart',
			success : function(result) {
				google.charts.load('current', {'packages' : ['corechart']});
				google.charts.setOnLoadCallback(function() {
					drawChart(result);
				})
		},
		error: function() {
			alert("Chart drawing error!");
		}
	});
				
				
	function drawChart(result) {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'reason');
		data.addColumn('number', 'reason_cnt');
		var dataArray = [];
		$.each(result, function(i, obj) {
			dataArray.push([obj.reason, obj.reason_cnt]);
			
			console.log(obj.reason, obj.reason_cnt);
		});
	
		
		data.addRows(dataArray);
		
		var piechart_options = {
			title : '탈퇴 사유 현황',
			width : 400,
			height : 300
		};
	
		var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
		
		piechart.draw(data, piechart_options);
		
		// 바차트 그리기
		var barchart_options = {
			title: 'BarChart: 탈퇴 사유 현황',
			width: 400,
			height: 300,
			legend: 'none'
		};
		
		var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
	
		barchart.draw(data, barchart_options);

	
	}
	
	
});
	
	
</script>
<style>
table {
font-size: 20px;

}
</style>

</head>
<body>
<article>
	<div>
		<h1 align="center">탈퇴 사유 현황</h1>
		
			<br> <br>
			<table style="margin:auto">
				<tr>
					<td><div id="piechart_div" style="border:1px solid #ccc"></div></td>
					<td><div id="barchart_div" style="border:1px solid #ccc"></div></td>
				</tr>
			</table>
		</div>
		
		<br> <br>

		<div>
			<h4>기타 탈퇴 사유</h4>
		
			<table class="etc_class" width="600" border="1">
				<tr>
					<th width="500">탈퇴 사유</th>
					<th width="100">횟수</th>

				</tr>
				<c:forEach items="${etcList}" var="etc">
				<tr>
					<td>${etc.reason}</td>
					<td>${etc.reason_cnt}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		

</article>
</body>
</html>

<%@ include file="footer.jsp" %>
