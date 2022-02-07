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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./resources/css/helpMain.css">
<style>
	.middle{
		width: 100%;
		margin: auto;
		margin-top: 50px;
		margin-bottom: -20px;
	}
    .middle>input{
    	width: 200px; 
    	float: left; 
    	margin-top: -1px;
    }
    .middle>.qs{float: right;}
    .middle>button{
    	width: 100px;
    	margin-left:0;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
    <div class="innerOuter my-3">
        <div class="head py-3">
            <p>1:1문의</p>
        </div>
        <div class="button my-3">
            <button type="button" class="btn btn-outline-primary" onclick="location.href='helpList.he';">공지사항</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='faqMain.he';">FAQ</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='qnaMain.he';">1:1문의</button>
        </div>
        <div class="middle">
            <input type="text" class="form-control form-control-sm">
            <button class="btn btn-sm btn-outline-primary" style="width:60px;">검색</button>
			<button type="button" class="btn btn-primary qs" onclick="location.href='qnaForm.he';">문의하기</button>
        </div>
        <div class="content my-5">
        	<input type="hidden" id="pwd" value="${q.qwd}">
            <table id="qnaList" class="table table-hover">
                <thead>
                    <tr>
                    	<th>글번호</th>
                        <th>카테고리</th>
                        <th style="width:50%;">제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                        <th>답변유무</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="q" items="${list}"> 
	                    <tr>	
	                        <td id="qno">${q.qnaNo}</td>
	                        <td>${q.category}</td>
	                        <td>
	                        	${q.qnaTitle}
	                        	<c:if test="${q.pwd ne '0'}">
		                    		<i class="bi bi-lock-fill"></i>
		                    	</c:if>
	                        </td>
	                        <td>${q.nickName}</td>
	                        <td>${q.createDate}</td>
	                        <c:choose>
		                        <c:when test="${not empty q.ansDate}">
		                        	<td>답변등록</td>
		                        </c:when>
		                        <c:otherwise>
		                        	<td><td>
		                        </c:otherwise>
	                        </c:choose>
	                        
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <script>
        	$(function(){
        		$("#qnaList>tbody>tr").click(function(){
        			if(("#pwd").text() != 0){
        				password();
        			}else{
        				location.href='qnaDetail.he?qno=' + $(this).children("#qno").text();
        			}
        		});
        	})
        	
        	function password(){
        		
        		
        	}
        
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
						<li class="page-item"><a class="page-link" href="qnaList.he?cpage=${ pi.currentPage-1 }">Previous</a></li>
					</c:otherwise>
				</c:choose>
				
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link" href="qnaList.he?cpage=${ p }">${ p }</a></li>
				</c:forEach>
				
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled">
							<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="qnaList.he?cpage=${ pi.currentPage+1 }">Next</a></li>
					</c:otherwise>
				</c:choose>
            </ul>
        </div>
	</div>
    
     <jsp:include page="../common/footerBar.jsp" />
     
</body>
</html>