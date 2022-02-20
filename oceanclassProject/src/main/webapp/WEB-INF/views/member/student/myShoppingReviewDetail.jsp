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
    <link rel="stylesheet" href="./resources/css/stuMypage.css?second">
<style>
	.list{
	    width: 90%;
	    height: 22%;
	    margin: 0 auto;
	    margin-top: 50px;
	    background: rgba(107, 171, 213, 0.28);
	    padding: 10px;
	}
	#img{
		width: 30%; 
		height: 100%;
		float: left;
	}
	#img img{
		width: 100%;
		height: 80%;
	}
	.explain{
		width: 70%; 
		height: 100%; 
		float: left; 
		margin-top: 10px;
		padding: 10px;
	}
	.explain>h3{color:rgb(107, 171, 213); font-weight: 600;}
	.explain>p{margin-top: -10px; font-weight: bolder; }
	h4{font-weight: 600; margin-bottom: 20px;}
	#stitle{font-size: 18px; font-weight: 800p; margin-bottom: 20px;}
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
				    <div class="conhead">
				        <h2>상품 문의</h2>
				    </div>
				    <c:forEach var="s" items="${list}">
						<div class="list">
				        	<div id="img">
				        		<a href=""><img src="" alt=""></a>
				            	<p>별점~~~~~</p>
				        	</div>
				        	<div class="explain">
				                <h4>갤럭시Z FLIP 라벤더 색상 자급제 당일출고</h4>
				                <p id="stitle">역시 다른건 다 필요없고 이쁜게 진리인걸 증명하는!!</p>
				                <p>배터리 모자라도 괜찮아ㅠ 내 6s보단 배터리 많아ㅠ 카메라 후져도..</p>	
				            </div>
					    </div>
				    </c:forEach>
				</div>
			 
			 	<div id="paging">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled">
									<a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="myClassReviewDetail.me?cpage=${ pi.currentPage-1 }">Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="myClassReviewDetail.me?cpage=${ p }">${ p }</a></li>
						</c:forEach>
						
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled">
									<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="myClassReviewDetail.me?cpage=${ pi.currentPage+1 }">Next</a></li>
							</c:otherwise>
						</c:choose>
		            </ul>
		        </div>
			 	
			</td>
		</tr>
	</table>
	
</body>
</html>