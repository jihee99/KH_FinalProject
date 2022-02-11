<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

<style>
#content{
    width: 50%;
    height: 50%;
    border: 1px solid;
}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="../../common/admin/adminSidebar.jsp" />
	    <div class="contentArea">
	        <div id="content">
				<canvas id="myChart"></canvas>
				<script>
					let ctx = document.getElementById('myChart').getContext('2d');
					let myChart = new Chart(ctx, {
						type: 'bar',
	        
						// The data for our dataset
						data: {
							labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
							datasets: [{
								label: '바 그래프',
								type : 'bar', // 'bar' type, 전체 타입과 같다면 생략가능
								backgroundColor: 'rgb(255, 204, 102)',
								borderColor: 'rgb(255, 204, 102)',
								data: [10, 20, 30, 40, 50, 60]
							}, {
								label: '라인 그래프1',
								type : 'line',         // 'line' type
								fill : false,         // 채우기 없음
								lineTension : 0.5,  // 0이면 꺾은선 그래프, 숫자가 높을수록 둥글해짐
								pointRadius : 0,    // 각 지점에 포인트 주지 않음
								backgroundColor: 'rgb(255, 153, 0)',
								borderColor: 'rgb(255, 153, 0)',
								data: [40, 50, 60, 70, 80, 90]
							}, {
								label: '라인 그래프2',
								type : 'line',
								fill : false,
								lineTension : 0,
								pointRadius : 0,
								backgroundColor: 'rgb(255, 204, 0)',
								borderColor: 'rgb(255, 204, 0)',
								data: [100, 120, 150, 100, 180, 200]
							}]
						},
						// Configuration options
						options: {
							legend: {
								labels: {
									fontColor: 'white' // label color
									}
								},
							scales: {
								// y축
								yAxes: [{
									stacked: true,
									ticks: {
										fontColor:'white' // y축 폰트 color
									}
								}],
								// x축
								xAxes: [{
									stacked: true,
									ticks: {
										fontColor:'white' // x축 폰트 color
									}
								}]
	                		}
	            		}
	        		});
				</script>
			</div>	
	        	
		</div>
	</div>
</body>
</html>