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

	<jsp:include page="../common/header.jsp" />
	
    <div class="innerOuter my-3">
        <div class="head py-3">
            <p>EVENT</p>
        </div>
        <div class="button">
       		<button type="button" class="btn" id="A" value="A">전체</button>
            <button type="button" class="btn btn1" id="C" value="C">클래스</button>
            <button type="button" class="btn btn1" id="S" value="S">스토어</button>
            <button type="button" class="btn btn1" id="P" value="P">포인트</button>
            <button type="button" class="btn btn1" id="R" value="R">댓글</button>
            <button type="button" class="btn btn1" id="E" value="E">기타</button>
        </div>
        
        <div class="content" id="result">
        	
        	<c:forEach var="e" items="${list}">
	            <div class="img">
	            	<input type="hidden" id="eno" value="${e.eventNo}">
	                <img src="${e.img}" id="img">
	                <p>${e.eventTitle}</p>   
	            </div>
	        </c:forEach>    
	        
	        <div id="paging">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
							<li class="page-item disabled">
								<a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="eventMain.ev?cpage=${ pi.currentPage-1 }">Previous</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<li class="page-item"><a class="page-link" href="eventMain.ev?cpage=${ p }">${ p }</a></li>
					</c:forEach>
					
					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled">
								<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="eventMain.ev?cpage=${ pi.currentPage+1 }">Next</a></li>
						</c:otherwise>
					</c:choose>
	            </ul>
	        </div> 
	        
	    </div>

    </div>
    
    <script>
    	$(".img>#img").click(function(){
	    	let eventNo = $(this).prev().val();
	    	//console.log(eventNo);
	    	location.href = 'detailEvent.ev?eno=' + eventNo;
    	})
    
    	$("#A").click(function(){
    		location.href="eventMain.ev";
    	})
    	
    	$(function(){
    		$(".btn1").click(function(){
        		let value = $(this).val();
        		//console.log(value);
        		$.ajax({
        			url:"ajaxSearchEvent.ev",
        			data:{category:value},
        			success:function(result){
        				let value = "";
        				for(let i in result){
        					//console.log(result[i].eventNo);
        					value += '<div class="img">'
        						   + '<input type="hidden" value="' + result[i].eventNo + '">'
        						   + '<img src="' + result[i].img + '" id="img">'
        						   + '<p>'
        						   + result[i].eventTitle
        						   + '</p>'
        						   + '</div>'
        				}
        				
        				$("#result").html(value);
        				console.log(value);
        			},error:function(){
        				//console.log("에러");
        				alert("에러발생");
        			}
        		})
        	})
    	})
    </script>
    
    <jsp:include page="../common/footerBar.jsp" />
    
</body>
</html>