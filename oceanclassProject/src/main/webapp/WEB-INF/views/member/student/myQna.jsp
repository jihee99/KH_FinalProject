<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/stuMypage.css">
<style>
	.searchBar p{float: left; margin-right: 30px; font-weight: 800;}
	.button{ width: 45%; float: left; margin-left: 50px;}
	.search{ width:45%; float: left;}
	#myQna{
		width:100%;
		margin: 0 auto;
		margin-top: 30px;
		text-align: center;
		margin-bottom: 50px; 
	}
	#question, #answer{
		display: none;
		background: whitesmoke;
	}
	#qna:hover{cursor:pointer;}
	#answer p{font-size: 10px; margin-top: 20px;}
	.selected{background:skyblue;}
</style>
</head>
<body>

	<table id="mainTable">
		<tr>
			<td colspan="2" style="height:200px;"><jsp:include page="mypageHeader.jsp" flush="false" /></td>
		</tr>
		
		<tr>
			<td id="mainSide"><jsp:include page="mypageSidebar.jsp" flush="false" /></td>
			<td id="mainContent">
				<div class="content">
				    <h2>1:1 문의 내역</h2>
				    
				    <div class="searchBar">
				        <div class="button">
				        	<p>기간검색</p>
					        <input type="hidden" id="memNo" value="${loginUser.memNo}">
					        <button class="btn btn-info" id="week" value="week">1주일</button>
					        <button class="btn btn-info" id="2week" value="2week">15일</button>
					        <button class="btn btn-info" id="month" value="month">1개월</button>
					    </div>    
				        <div class="search">
				            <select name="option" id="option">
				                <option value="t">제목</option>
				                <option value="c">분류</option>
				            </select>
				            <input type="text" id="text">
				            <button>검색</button>
				        </div>
				    </div>
				    
				    <table class="table" id="myQna">
				        <thead>
				            <tr class="table-light">
				                <th>날짜</th>
				                <th>분류</th>
				                <th>제목</th>
				                <th>답변유무</th>
				            </tr>
				        </thead>
				        <tbody id="result">
				        	<c:forEach var="q" items="${list}">
					            <tr id="qna">
					                <td>${q.createDate}</td>
					                <td>${q.category}</td>
					                <td>${q.qnaTitle}</td>
					                <c:choose>
				                        <c:when test="${not empty q.ansContent}">
				                        	<td>등록완료</td>
				                        </c:when>
				                        <c:otherwise>
				                        	<td>대기중</td>
				                        </c:otherwise>
			                        </c:choose>
					            </tr>
					            <tr id="question">
					            	<td></td>
					            	<td>내용</td>
					            	<td colspan="2" style="text-align: left; padding-left: 100px;">${q.qnaContent}</td>
					            </tr>
					            <c:if test="${not empty q.ansContent}"> 
						            <tr id="answer">
						            	<td></td>
						            	<td>답변</td>
						            	<td colspan="2" style="text-align: left; padding-left: 100px;">${q.ansContent} <p>${q.ansDate}</p></td>
						            </tr>
					            </c:if>
				            </c:forEach>
				        </tbody>
				    </table>
				    <!-- 목록 상세보기 -->
				    <script>
						$(function(){
							$("#myQna>tbody>#qna").click(function(){
								//console.log($(this));
								$(this).toggleClass("selected");
								$("#myQna>tbody>#qna").not(this).removeClass("selected");
								var targetQ = $(this).next();
								var targetA = $(this).next().next();
								//console.log(targetQ.text());
								targetQ.fadeToggle(200);
								targetA.fadeToggle(200);
							});
						});
					</script>
					
					<!-- 기간 선택 후 목록 출력 및 상세보기 -->
					<script>
				    	$(function(){
				    		$(".btn").click(function(){
				    			let value = $(this).val();			// 날짜버튼값
					    		$(document).on("click", ".btn", function(){		// 클래스가 btn인 요소들에 click이벤트 발생시

					    			let cpage = 1;
					    			if($(this).is("a")){			// .btn중에 a태그인 것을 찾아서 현재페이지값 저장
					    				cpage = $(this).text();		
					    			}
					    			
					    			let memNo = $("#memNo").val();	
					    			
					    			//console.log(value);
					    			//console.log(cpage);
					    			$.ajax({
					    				url:"ajaxMyQna.me",
					    				data:{createDate: value,		// 날짜
					    					  memNo: memNo,				// 회원번호
					    					  cpage: cpage},			// 현재페이지수
					    				success:function(result){
					    					let qna = '';
					    					for(let i in result.list){
					    						let answer = result.list[i].ansContent;
					    						qna += '<tr id="qna">'
					    							 + '<td>' + result.list[i].createDate + '</td>'
					    						 	 + '<td>' + result.list[i].category + '</td>'
					    						 	 + '<td>' + result.list[i].qnaTitle + '</td>'
					    						if(!(answer == "" || answer == null || answer == "undefined" || answer == undefined)){
					    							qna += '<td>답변완료</td>'
					    						}else{
					    							qna += '<td>답변대기</td>'
					    						}
					    						//console.log("중간" + qna);
					    						qna += '</tr>' 
					    							 + '<tr id="question">'
					    						 	 + '<td></td>'
					    						 	 + '<td>내용</td>'
					    						 	 + '<td colspan="2" style="text-align: left; padding-left: 100px;">' + result.list[i].qnaContent + '</td>'
					    						 	 + '</tr>'
				    						 	//if(answer != "" || answer != null || answer != "undefined" || answer != undefined){
				    						 	//if(!answer){
				    						 	//if(typeof answer != "" || answer != null || answer != "undefined" || answer != undefined){ 
				    						 	if(!(answer == "" || answer == null || answer == "undefined" || answer == undefined)){
					    							 qna += '<tr id="answer"> <td></td> <td>답변</td> <td colspan="2" style="text-align: left; padding-left: 100px;">'
					    								  + result.list[i].ansContent
					    								  + '<p>'
					    								  + result.list[i].ansDate
					    								  + '</p></td></tr>'
					    						}else{
					    							qna += ''
					    						}	 	 
					    						//console.log(result.list[i].ansContent)
					    					}
					    					//console.log(qna);
						    				$("#result").html(qna);
						    				
						    				// ajax 결과 클릭 시 내용답변 뿌려주는 
											$("#myQna>tbody>#qna").click(function(){
												$(this).toggleClass("selected");
												$("#myQna>tbody>#qna").not(this).removeClass("selected");
												var targetQ = $(this).next();
												var targetA = $(this).next().next();
												//console.log(targetQ.text());
												targetQ.fadeToggle(200);
												targetA.fadeToggle(200);
											});
						    				
						    					let page = '<ul class="pagination">';
							    					if(result.pi.currentPage == 1 ){
							    						page += '<li class="page-item disabled"> <a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>'
							    					}else{
							    						page += '<li class="page-item"><a class="page-link btn">Previous</a></li>'
							    					}
							    					
													for(let j=result.pi.startPage; j<=result.pi.endPage; j++){
														page += '<li class="page-item"><a class="page-link btn">'
															  + j 
															  + '</a></li>'
													}
													
													if(result.pi.currentPage == result.pi.maxPage){
														page += '<li class="page-item disabled"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>' 
													}else{
														page += '<li class="page-item"><a class="page-link btn">Next</a></li>'
													}
						    					page += '</ul>'
						    					$("#paging").html(page);
						    					//console.log(page);
						    				
					    				},error:function(){
					    					console.log("에러ㅠㅠ");
					    				}
					    			})
					    		})
					    	})
				    	})
				    </script>
			    
			    	<div id="paging">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ pi.currentPage eq 1 }">
									<li class="page-item disabled">
										<a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="myQna.me?cpage=${ pi.currentPage-1 }">Previous</a></li>
								</c:otherwise>
							</c:choose>
							
							
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<li class="page-item"><a class="page-link" href="myQna.me?cpage=${ p }">${ p }</a></li>
							</c:forEach>
							
							
							<c:choose>
								<c:when test="${ pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled">
										<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="myQna.me?cpage=${ pi.currentPage+1 }">Next</a></li>
								</c:otherwise>
							</c:choose>
			            </ul>
			        </div>
					
					
				</div>	
			</td>
		</tr>
	</table>

</body>
</html>