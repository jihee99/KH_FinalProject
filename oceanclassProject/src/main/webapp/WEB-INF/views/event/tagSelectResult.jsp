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
    <link rel="stylesheet" href="./resources/css/header.css?1">
    <link rel="stylesheet" href="./resources/css/eventMain.css?4">
    
<style>
	.innerOuter{height: 1300px;}
	.img{margin:0 auto; margin-top: 50px;}
	#img{
		width: 100%; 
		height: 200px;
		object-fit:cover;
	}
	.pagination{
		width: 100%;
		justify-content: center;
		padding-top: 50px;
	}
	#move{width: 90%; height: 40%; overflow: hidden; border:none; margin: 0 auto; margin-left: 20px;}
	.img>p{text-align: center;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
    <div class="innerOuter my-3">
        <div class="content" id="result">
        
			<div class="head py-3">
	            <p>${selectTag}</p>
	        </div>

        	<c:forEach var="c" items="${list}">
        		
	            <div class="img">
	            	<form id="classDetail" method="post" action="classDetail.me">
	            		<input type="hidden" id="referNo" name="referNo" value="${c.clNo}">
		                <button id="move" type="submit"><img src="${c.clImg}" id="img"></button>
		            </form>   
		            <p>
			            <c:choose>
		            		<c:when test="${fn:length(c.clName) gt 22}">
		            			<c:out value="${fn:substring(c.clName, 0, 21)}"></c:out>
		            			..
		            		</c:when>
		            		<c:otherwise>
		            			<c:out value="${c.clName}"></c:out>
		            		</c:otherwise>
			            </c:choose>
		            </p> 
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
						<li class="page-item"><a class="page-link" href="tagSelect.ev?cpage=${ pi.currentPage-1 }">Previous</a></li>
					</c:otherwise>
				</c:choose>
				
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link" href="tagSelect.ev?cpage=${ p }">${ p }</a></li>
				</c:forEach>
				
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled">
							<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="tagSelect.ev?cpage=${ pi.currentPage+1 }">Next</a></li>
					</c:otherwise>
				</c:choose>
	           </ul>
	       </div>
    </div>
    
    <jsp:include page="../common/footerBar.jsp" />
    
</body>
</html>