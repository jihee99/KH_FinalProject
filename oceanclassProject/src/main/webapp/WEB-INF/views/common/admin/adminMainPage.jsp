<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

<style>
	#content{
	    width: 1200px;
	    height: 1200px;
	    margin: 0 auto;
	    padding: 10px;
	    border: 1px solid;
	}
	#memTable{width: 90%; text-align: center; margin: 0 auto; margin-top: 50px;}
	#memTable>p{font-size: 28px; font-weight: 800; color:rgb(107, 171, 213); }
	.chart{width: 45%; margin: 0 auto; margin-left: 40px; margin-top:30px; float:left; padding: 20px;}
	.chart>p{font-size: 18px; font-weight: 600; text-align: center;}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="../../common/admin/adminSidebar.jsp" />
	    <div class="contentArea">
	        <div id="content">
	        	<div class="table" id="memTable">
	        		<p>회원 / 강사 현황</p>
	        		<table class="table">
	        			<thead>
				            <tr>
				                <th>날짜</th>
				                <th>신규회원</th>
				                <th>휴먼회원</th>
				                <th>탈퇴회원</th>
				                <th>신규강사</th>
				                <th>휴먼강사</th>
				                <th>탈퇴강사</th>
				            </tr>
				        </thead>
				        <tbody>
				        	<c:forEach var="a" items="${list}">
					        	<tr id="qna">
					                <td>${a.staDate}</td>
					                <td>${a.newMem}</td>
					                <td>${a.sleepMem}</td>
					                <td>${a.delMem}</td>
					                <td>${a.newTeacher}</td>
					                <td>${a.sleepTeacher}</td>
					                <td>${a.delTeacher}</td>
					            </tr>
				            </c:forEach>
				        </tbody>
	        		</table>
	        	</div>
	        	<div class="chart">
		        	<p>회원 현황</p>
					<canvas id="myChart1" width="500" height="300"></canvas>
				</div>
				<div class="chart">
					<p>강사 현황</p>
					<canvas id="myChart2" width="500" height="300"></canvas>
				</div>	
				<script>
					
					$(document).ready(function(){
						$.ajax({
							url:"memChart.ad",
							success:function(result){
								//console.log(result);
								let date = [];
								let newMem = [];
								let sleepMem = [];
								let delMem = [];
								let newTeacher = [];
								let sleepTeacher = [];
								let delTeacher = [];
								
								/*
								for(let i=6; i=0; i++){
									date.push(result.memList[i].staDate);
								}
								*/
								
								for(let i in result.memList){
									date.push(result.memList[i].staDate);
									newMem.push(result.memList[i].newMem);
									sleepMem.push(result.memList[i].sleepMem);
									delMem.push(result.memList[i].delMem);
								}
								
								for(let i in result.teacherList){
									newTeacher.push(result.teacherList[i].newTeacher);
									sleepTeacher.push(result.teacherList[i].sleepTeacher);
									delTeacher.push(result.teacherList[i].delTeacher);
								}
								//console.log(date);
								//console.log(newMem);
								//console.log(sleepMem);
								//console.log(delMem);
								
								let ctx1 = document.getElementById('myChart1').getContext('2d');
								let myChart1 = new Chart(ctx1, {
									type: 'bar',
									// The data for our dataset
									data: {
										labels: date,		// x축 기준 설정
										datasets: [{
											label: '신규회원',
											type : 'bar',         // 'line' type
											backgroundColor: 'rgb(100, 100, 252)',
											borderColor: 'rgb(255, 153, 0)',
											data: newMem
										}, {
											label: '휴먼회원',
											type : 'bar',         // 'line' type
											backgroundColor: 'rgb(100, 200, 100)',
											borderColor: 'rgb(255, 153, 0)',
											data: sleepMem
										}, {
											label: '탈퇴회원',
											type : 'bar',
											backgroundColor: 'rgb(255, 100, 100)',
											borderColor: 'rgb(255, 204, 0)',
											data: delMem
										}]
									},
									// Configuration options
									options: {
										responsive: false,
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
								
								let ctx2 = document.getElementById('myChart2').getContext('2d');
								let myChart2 = new Chart(ctx2, {
									type: 'bar',
									// The data for our dataset
									data: {
										labels: date,		// x축 기준 설정
										datasets: [{
											label: '신규강사',
											type : 'bar',         // 'line' type
											backgroundColor: 'rgb(100, 100, 252)',
											borderColor: 'rgb(255, 153, 0)',
											data: newTeacher
										}, {
											label: '휴먼강사',
											type : 'bar',         // 'line' type
											backgroundColor: 'rgb(100, 200, 100)',
											borderColor: 'rgb(255, 153, 0)',
											data: sleepTeacher
										}, {
											label: '탈퇴강사',
											type : 'bar',
											backgroundColor: 'rgb(255, 100, 100)',
											borderColor: 'rgb(255, 204, 0)',
											data: delTeacher
										}]
									},
									// Configuration options
									options: {
										responsive: false,
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
							},error:function(){
								
							}
						})
					});
				
				</script>
				
			</div>	
		</div>
	</div>
</body>
</html>