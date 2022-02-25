<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<title>Insert title here</title>
<style>
.innerOuter{width:1000px; margin: auto;}
.headMenu{text-align: left;} 
.headMenu>b{font-size: 28px; font-weight: 800; margin-left: 10px; color: rgb(107, 171, 213);}

.content{width: 100%; margin-top: 50px; padding: 5px 8px;}
.chart{width: 45%; margin: 0 auto; margin-left: 40px; margin-top:30px; float:left; padding: 20px;}
#list{width: 40%; height: 30px;}
</style>
</head>
<body>

	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
	
	<div class="innerOuter" align="center">
		<div class="headMenu">
			<br>
            <b>상품별 통계 페이지</b>
        </div>
        <div class="content" align="left">
        	<select id="list">
        		<option>상품명1</option>
        		<option>상품명2</option>
        		<option>상품명3</option>
        	</select>
        	<br>
    		
    		<div class="chart" align="center">
				<!--차트가 그려질 부분-->
				<canvas id="myChart1" width="400" height="400"></canvas>
			</div>
			<div class="chart" align="center">
				<!--차트가 그려질 부분-->
				<canvas id="myChart2" width="400" height="400"></canvas>
			</div>
			<br><br>	
        </div>
	</div>
	
	
	<script>
    	$(function(){
    		
    		$.ajax({
    			url : "starChartAjax.in",
    			data : {
    				pno :"상품번호 입력란"
    			}
    		});
    		
    		//상품 만족도
    		let ctx1 = document.getElementById('myChart1').getContext('2d');
    		let myChart1 = new Chart(ctx1, {
    			  type: 'pie', // 차트의 형태
                  data: { // 차트에 들어갈 데이터
                      labels: [
                          //x 축
                          '1','2','3','4','5'
                      ],
                      datasets: [
                          { //데이터
                              label: 'test1	', //차트 제목
                              fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                              data: [
                                  21,19,25,20,23 //x축 label에 대응되는 데이터 값
                              ],
                              backgroundColor: [
                                  //색상
                                  'rgba(255, 99, 132, 0.2)',
                                  'rgba(54, 162, 235, 0.2)',
                                  'rgba(255, 206, 86, 0.2)',
                                  'rgba(75, 192, 192, 0.2)',
                                  'rgba(153, 102, 255, 0.2)',
                                  'rgba(255, 159, 64, 0.2)'
                              ],
                              borderColor: [
                                  //경계선 색상
                                  'rgba(255, 99, 132, 1)',
                                  'rgba(54, 162, 235, 1)',
                                  'rgba(255, 206, 86, 1)',
                                  'rgba(75, 192, 192, 1)',
                                  'rgba(153, 102, 255, 1)',
                                  'rgba(255, 159, 64, 1)'
                              ],
                              borderWidth: 1 //경계선 굵기
                          }/* ,
                          {
                              label: 'test2',
                              fill: false,
                              data: [
                                  8, 34, 12, 24
                              ],
                              backgroundColor: 'rgb(157, 109, 12)',
                              borderColor: 'rgb(157, 109, 12)'
                          } */
                      ]
                  },
                  options: {
                      scales: {
                      	title: {
				    		display: true,
				    		text: '스토어만족도'
				  		},
                        yAxes: [
                              {
                                  ticks: {
                                      beginAtZero: true
                                  }
                              }
                        ]
                      }
                  }
              });
    		
    		//문의 응답율 추이
    		let ctx2 = document.getElementById('myChart2').getContext('2d');
    		let myChart2 = new Chart(ctx2, {
    			  type: 'line', // 차트의 형태
                  data: { // 차트에 들어갈 데이터
                      labels: [
                          //x 축
                          '1','2','3','4','5','6','7'
                      ],
                      datasets: [
                          { //데이터
                              label: '문의', //차트 제목
                              fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                              data: [
                            	  21,19,50,40,23,26,25 //x축 label에 대응되는 데이터 값
                              ],
                              backgroundColor: [
                                  //색상
                                  'rgba(255, 99, 132, 0.2)'
                              ],
                              borderColor: [
                                  //경계선 색상
                            	  'rgba(255, 99, 132, 0.2)'
                              ]
                          },
                          { //데이터
                              label: '응답', //차트 제목
                              fill: false,  // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                              data: [
                                  21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                              ],
                              backgroundColor: [
                                  //색상
                                  'rgba(54, 162, 235, 0.2)'
                              ],
                              borderColor: [
                                  //경계선 색상
                            	  'rgba(54, 162, 235, 0.2)'
                              ]
                          }
							
                      ]
                  },
                  options: {
                	title: {
				    		display: true,
				    		text: '문의 응답율 추이'
				  	},
                    scales: {
                    	y: {
                            stacked: true
                          }
              		}
				 }
              });
    		
    		
    	
    	})

    	
    	
    	
    </script>
	
</body>
</html>