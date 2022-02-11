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
	<link rel="stylesheet" href="./resources/css/helpMain.css?6">
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
    <div class="innerOuter my-3">
        <div class="head py-3">
            <p>공지사항</p>
        </div>
        <div class="button my-3">
            <button type="button" class="btn" onclick="location.href='helpList.he';">공지사항</button>
            <button type="button" class="btn" onclick="location.href='faqMain.he';">FAQ</button>
            <button type="button" class="btn" onclick="location.href='qnaMain.he';">1:1문의</button>
        </div>
        <div class="content my-5">
            <table id="noticeList" class="table table-hover">
                <thead>
                    <tr>
                    	<th>글번호</th>
                    	<th>구분</th>
                        <th style="width:50%;">제목</th>
                        <th>작성날짜</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="n" items="${list}"> 
	                    <tr>	
	                        <td id="nno">${n.noNo}</td>
	                        <td>${n.category}</td>
	                        <td>${n.noTitle}</td>
	                        <td>${n.createDate}</td>
	                        <td>${n.count}</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script>
        	$(function(){
        		$("#noticeList>tbody>tr").click(function(){
        			location.href = 'detail.he?nno=' + $(this).children("#nno").text();
        		});
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
						<li class="page-item"><a class="page-link" href="helpList.he?cpage=${ pi.currentPage-1 }">Previous</a></li>
					</c:otherwise>
				</c:choose>
				
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link" href="helpList.he?cpage=${ p }">${ p }</a></li>
				</c:forEach>
				
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled">
							<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="helpList.he?cpage=${ pi.currentPage+1 }">Next</a></li>
					</c:otherwise>
				</c:choose>
            </ul>
        </div>
	</div>
	
    <jsp:include page="../common/footerBar.jsp" />
    
</body>
</html>