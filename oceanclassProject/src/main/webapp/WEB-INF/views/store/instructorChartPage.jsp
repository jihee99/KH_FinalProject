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
.chart2{width: 45%; margin: 0 auto; margin-left: 40px; margin-top:30px; float:left; padding: 20px;}
.chart1{width: 45%; margin: 0 auto; margin-left: 40px; margin-top:30px; float:left; padding: 20px;}
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
        	<select class="list">
        		<option value="0"> </option>
        		<c:forEach var="p" items="${list }">
        			<option value="${p.productNo }">
        				<c:choose>
        					<c:when test="${p.category eq 1 }">[클래스상품]</c:when>
        					<c:when test="${p.category eq 2 }">[OC에디션]</c:when>
        					<c:when test="${p.category eq 3 }">[DIY키트]</c:when>
        				</c:choose>
        				${p.title }
        			</option>
        		</c:forEach>
        	</select>
        	<br>
    		
    		<div class="chart1" align="center">
				<!--차트가 그려질 부분-->
				<!--<canvas id="myChart1" width="400" height="400"></canvas>-->
			</div>
			<div class="chart2" align="center">
				<!--차트가 그려질 부분-->
				<canvas id="myChart2" width="400" height="400"></canvas>
			</div>
			<br><br>	
        </div>
	</div>
	
	
	<script>	
	
		window.onload = function(){
			
			$(".chart1").html('<canvas id="myChart1" width="400" height="400"></canvas>');
			$(".chart2").html('<canvas id="myChart2" width="400" height="400"></canvas>');
			
			$.ajax({
				url:"chartMain.in",
				success:function(result){
    				// x-axis
    				let starNo = [];	
    				// response data
    				let starCount = [];	    				
    				for(let i  in result.starlist){
    					starNo.push(result.starlist[i].star);
    					starCount.push(result.starlist[i].starCount);
    				}  				
					
    				// myChart1
    				let ctx1 = document.getElementById('myChart1').getContext('2d');
    	    		let myChart1 = new Chart(ctx1, {
    	    			  type: 'pie', 
    	                  data: { 
    	                      labels: starNo,
    	                      datasets: [
    	                          { 
    	                              fill: false, 
    	                              data: starCount, 
    	                              backgroundColor: [
    	                                  'rgba(255, 99, 132, 0.2)',
    	                                  'rgba(54, 162, 235, 0.2)',
    	                                  'rgba(255, 206, 86, 0.2)',
    	                                  'rgba(75, 192, 192, 0.2)',
    	                                  'rgba(153, 102, 255, 0.2)'
    	                              ],
    	                              borderColor: [
    	                                  'rgba(255, 99, 132, 1)',
    	                                  'rgba(54, 162, 235, 1)',
    	                                  'rgba(255, 206, 86, 1)',
    	                                  'rgba(75, 192, 192, 1)',
    	                                  'rgba(153, 102, 255, 1)'
    	                              ],
    	                              borderWidth: 1 
    	                          }
    	                      ]
    	                  },
    	                  options: {
	    	                	  title: {
	  					    		display: true,
	  					    		text: '스토어 만족도'
	  					  	  },
    	                	  pieceLabel: { mode:"label", position:"outside", fontSize: 11, fontStyle: 'bold' },
    	                      scales: {
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
    	    		
    	    		// 해당 강사가 판매중인 모든 상품의 문의 수
    	    		let qnaCount = [];
    	    		// 해당 강사가 판매중인 모든 상품의 응답 수
    	    		let answerCount = [];
    	    		// x축 기준 data
    	    		let xlabel= [];
    	    		for(let i  in result.qnalist){
    					qnaCount.push(result.qnalist[i].qnaCount);
    					answerCount.push(result.qnalist[i].answerCount);
   						xlabel.push(result.qnalist[i].productNo);
    	    		}
    	    		
    	    		//myChart2
    	    		let ctx2 = document.getElementById('myChart2').getContext('2d');
    	    		let myChart2 = new Chart(ctx2, {
    	    			  type: 'line',
    	                  data: { 
    	                      labels: xlabel,
    	                      datasets: [
    	                          { 
    	                              label: '문의',
    	                              data: qnaCount,
    	                              backgroundColor: [
    	                                  'rgb(255, 99, 132, 0.2)'
    	                              ],
    	                              borderColor: [
    	                            	  'rgb(255, 99, 132, 0.2)'
    	                              ]
    	                          },
    	                          {
    	                              label: '응답', 
    	                              data: answerCount,
    	                              backgroundColor: [
    	                                  'rgb(54, 162, 235, 0.2)'
    	                              ],
    	                              borderColor: [
    	                            	  'rgb(54, 162, 235, 0.2)'
    	                              ]
    	                          }	
    	                      ]
    	                  },
    	                  options: {
    	                	title: {
    					    		display: true,
    					    		text: '문의 응답률 추이'
    					  	},
    					  	yAxes: [
    	                        {
    	                            ticks: {
    	                                beginAtZero: true
    	                            }
    	                        }
    	                  ]
    					 }
    	              });
				},error:function(){
					console.log("ajax error");
				}
			});
			
			
			// select product
    		$(".list").change(function(){
    			
    			$(".chart1").html('<canvas id="myChart1" width="400" height="400"></canvas>');
    			$(".chart2").html('<canvas id="myChart2" width="400" height="400"></canvas>');
    			
    			pno = $(".list option:selected").val();
    			
	    		$.ajax({
	    			url : "chartAjax.in",
	    			data : {
	    				pno : pno
	    			},success:function(result){
	    				// x-axis
	    				let starNo = [];	
	    				// response data
	    				let starCount = [];	 	    				
	    				for(let i  in result.starlist){
	    					starNo.push(result.starlist[i].star);
	    					starCount.push(result.starlist[i].starCount);
	    				}
	    				
	    				// myChart1
	    	    		let ctx1 = document.getElementById('myChart1').getContext('2d');
	    	    		let myChart1 = new Chart(ctx1, {
	    	    			  type: 'pie', 
	    	                  data: { 
	    	                      labels: starNo,
	    	                      datasets: [
	    	                          { 
	    	                              label: '상품별 만족도', 
	    	                              fill: false, 
	    	                              data: starCount, 
	    	                              backgroundColor: [
	    	                                  'rgba(255, 99, 132, 0.2)',
	    	                                  'rgba(54, 162, 235, 0.2)',
	    	                                  'rgba(255, 206, 86, 0.2)',
	    	                                  'rgba(75, 192, 192, 0.2)',
	    	                                  'rgba(153, 102, 255, 0.2)'
	    	                              ],
	    	                              borderColor: [
	    	                                  'rgba(255, 99, 132, 1)',
	    	                                  'rgba(54, 162, 235, 1)',
	    	                                  'rgba(255, 206, 86, 1)',
	    	                                  'rgba(75, 192, 192, 1)',
	    	                                  'rgba(153, 102, 255, 1)'
	    	                              ],
	    	                              borderWidth: 1 
	    	                          }
	    	                      ]
	    	                  },
	    	                  options: {
	    	                	  title: {
	    					    		display: true,
	    					    		text: '스토어 만족도'
	    					  	  },
	    	                	  pieceLabel: { mode:"label", position:"outside", fontSize: 11, fontStyle: 'bold' },
	    	                      scales: {
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
	    				
	    	    		let qnaCount = [];
	    	    		let answerCount = [];
	    	    		let xlabel= [];

	    	    		for(let i  in result.qnalist){
	    					qnaCount.push(result.qnalist[i].qnaCount);
	    					answerCount.push(result.qnalist[i].answerCount);
	    					if(pno == 0){
	    						xlabel.push(result.qnalist[i].productNo);
	    					}else{
	    						xlabel.push(result.qnalist[i].createDate);
	    					}
	    	    		}
	    	    		
	    	    		// myChart2
	    	    		let ctx2 = document.getElementById('myChart2').getContext('2d');
	    	    		let myChart2 = new Chart(ctx2, {
	    	    			  type: 'line', 
	    	                  data: { 
	    	                      labels: xlabel,
	    	                      datasets: [
	    	                          { 
	    	                              label: '문의', 
	    	                              data: qnaCount,
	    	                              backgroundColor: [
	    	                                  'rgb(255, 99, 132, 0.2)'
	    	                              ],
	    	                              borderColor: [
	    	                            	  'rgb(255, 99, 132, 0.2)'
	    	                              ]
	    	                          },
	    	                          { 
	    	                              label: '응답',
	    	                              data: answerCount,
	    	                              backgroundColor: [
	    	                                  'rgb(54, 162, 235, 0.2)'
	    	                              ],
	    	                              borderColor: [
	    	                            	  'rgb(54, 162, 235, 0.2)'
	    	                              ]
	    	                          }
	    								
	    	                      ]
	    	                  },
	    	                  options: {
	    	                	title: {
	    					    		display: true,
	    					    		text: '문의 응답률 추이'
	    					  	},
	    					  	yAxes: [
	    	                        {
	    	                            ticks: {
	    	                                beginAtZero: true
	    	                            }
	    	                        }
	    	                  ]
	    					 }
	    	              });

	    			},error:function(){
	    				console.log("error");
	    			}
	    		});
    		});
    		
    	
    	}

    	
    	
    	
    </script>
	
</body>
</html>