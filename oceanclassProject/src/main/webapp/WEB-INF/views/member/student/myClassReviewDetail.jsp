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
	.conhead{margin-bottom: 20px;}
	.conhead>h2{margin-bottom: 20px;}
	.conreview{width:90%; height: 18%; margin: 0 auto; margin-bottom: 10px; border:1px solid;}
	.img{width:30%; height: 100%; float:left; border:1px solid;}
	.review{width:70%; height: 100%; margin-left: 230px; padding: 20px; text-align: left;}
	.img img{width: 100%;}
	.title{font-size: 24px; font-weight:600;}
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
				        <h2>클래스 후기</h2>
				    </div>
				    <c:forEach var="c" items="${list}">
					    <div class="conreview">
				            <div class="img">
				            	<a><img src="${c.img}"></a>
				            </div>
				            <div class="review">
				            	<p class="title">
					            	<c:choose>
					            		<c:when test="${fn:length(c.clName) gt 24}">
					            			<c:out value="${fn:substring(c.clName, 0, 23)}"></c:out>..
					            		</c:when>
					            		<c:otherwise>
					            			<c:out value="${c.clName}"></c:out>
					            		</c:otherwise>
						            </c:choose>
					            </p>
				            	<p>${c.content}</p>
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