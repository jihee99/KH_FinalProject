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
    <link rel="stylesheet" href="./resources/css/header.css?1">
    <link rel="stylesheet" href="./resources/css/eventMain.css?4">
    
<style>
	#img{
		width: 100%; 
		height: 100%;
	}
	.pagination{
		width: 25%;
		margin: 0 auto;
		padding-top: 80px;
		border: 1px solid white;
	}
	#img:hover{border: 3px solid rgb(107, 171, 213); cursor:pointer;}
</style>
</head>
<body>
    <div class="innerOuter my-3">
        <div class="head py-3">
            <p>${hashtag}</p>
        </div>
        
        <div class="content" id="result">
        	
        	
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
	
    </div>
</body>
</html>