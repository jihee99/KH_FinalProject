<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	.conhead{
        width: 100%;
	    height: 15%;
	}
	.content1{
	    width: 100%;
	    height: 50%;
	}
	.conhead>h2{width: 30%; font-weight: 900;}
    .item{width:40%; height: 80%; float:left; margin: 35px; overflow: hidden;}
    .item>#stitle{text-align: center; font-size: 20px; font-weight: 600; }
    #proImg{width: 350px; height: 230px;}
    #proImg:hover{cursor: pointer;}
    .content1>p{
    	text-align: center;
    	font-size : 24px;
    	font-weight: 800;
    	padding: 30px;
    	margin-top: 50px;
    	margin-bottom: 50px;
    }
    .content1>button{
    	display: block; 
    	margin: 0 auto;
    	background-color: rgb(107, 171, 213, 0.2);
    	font-sixe: 20px;
    	font-weight: 800;
    	width: 300px;
    }
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
				    <div class="content1">
				        <div class="conhead">
				            <h2>찜한 상품</h2>
				        </div>
				        <c:choose>
			        		<c:when test="${empty list}">
			        			<p>찜한 상품이 없습니다</p>
			        			<button type="button" class="btn btn-lg" onclick="moveStore();">지금 찜하러 가기!</button>
			        		</c:when>
				        	<c:otherwise>
				        		<c:forEach var="s" items="${list}">
									<div class="item">
										<div class="img">
						            		<input type="hidden" value="${s.productNo}">
						            		<img src="${s.productImg0}" id="proImg">
							            </div>
						            	<p id="stitle">
							            	<c:choose>
							            		<c:when test="${fn:length(s.title) gt 18}">
							            			<c:out value="${fn:substring(s.title, 0, 18)}"></c:out>
							            			.. ${s.price}원
							            		</c:when>
							            		<c:otherwise>
							            			<c:out value="${s.title} ${s.price}원"></c:out>
							            		</c:otherwise>
							            	</c:choose>
						            	</p>
						            </div>
						   		</c:forEach>	
						   		
						   		<script>
						        	$(".item #proImg").click(function(){
						        		let pno = $(this).prev().val();
						        		location.href = "productMain.pr?pno=" + pno;
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
												<li class="page-item"><a class="page-link" href="likeProduct.me?cpage=${ pi.currentPage-1 }">Previous</a></li>
											</c:otherwise>
										</c:choose>
										
										<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
											<li class="page-item"><a class="page-link" href="likeProduct.me?cpage=${ p }">${ p }</a></li>
										</c:forEach>
										
										<c:choose>
											<c:when test="${ pi.currentPage eq pi.maxPage }">
												<li class="page-item disabled">
													<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="likeProduct.me?cpage=${ pi.currentPage+1 }">Next</a></li>
											</c:otherwise>
										</c:choose>
						            </ul>
								</div>
							</c:otherwise>			        
				        </c:choose>
				    </div> 
				</div>
				
				<script>
		   			function moveStore(){
		   				location.href="storeList.st";
		   			}
		   		
				
					$("a").click(function(){
						$.ajax({
							url:"productMain.pr",
							data:{pno:$(this).next().val()},
							success:function(result){
								console.log("성공");
							},error:function(){
								console.log("상품메인접속실패");
							}
						})
					})
				</script>
				
			</td>
		</tr>
	</table>
	
</body>
</html>