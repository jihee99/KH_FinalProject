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
    <link rel="stylesheet" href="./resources/css/helpMain.css?6">
<style>
	.middle{
		width: 100%;
		margin: auto;
		margin-top: 50px;
		margin-bottom: -20px;
	}
	#category{
		width: 10%;
		float:left
	}
    .middle input{
    	width: 200px; 
    	float: left; 
    	margin-top: -1px;
    }
    .middle .qs{float: right;}
    .middle>button{
    	width: 100px;
    	margin-left:0;
    }
    .middle button{background: rgb(107, 171, 213); color: whitesmoke;}
    button:hover{background: rgb(107, 171, 213, 0.2)}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
    <div class="innerOuter my-3">
        <div class="head py-3">
            <p>1:1문의</p>
        </div>
        <div class="button my-3">
            <button type="button" class="btn" onclick="location.href='helpList.he';">공지사항</button>
            <button type="button" class="btn" onclick="location.href='faqMain.he';">FAQ</button>
            <button type="button" class="btn" onclick="location.href='qnaMain.he';">1:1문의</button>
        </div>
        <div class="middle">
        	<div id="search">
        		<form method="get">
        			<select id="category" name="category" class="dropdown-toggle form-control-sm" style="margin-top: -1px;">
			            <option value="wwirter">작성자</option>
			            <option value="category">카테고리</option>
		        	</select>
		            <input id="keyword" type="text" class="form-control form-control-sm" name="keyword" >
           			<button type="submit" class="btn btn-sm" style="width:60px; margin-top: -1px;">검색</button>
        		</form>
	        </div>
	        <c:if test="${not empty loginUser }">
				<button type="button" class="btn qs" style="margin-top: -35px;" onclick="location.href='qnaForm.he';">문의하기</button>
        	</c:if>
        </div>
        
        <div class="content my-5">
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
	                    	<input type="hidden" id="pwd" name="pwd" value="${q.pwd}">
	                        <td id="qno">${q.qnaNo}</td>
	                        <td>${q.category}</td>
	                        <td>
	                        	${q.qnaTitle}
	                        	<c:if test="${not empty q.pwd}">
		                    		<i class="bi bi-lock-fill"></i>
		                    	</c:if>
	                        </td>
	                        <td id="nick">${q.nickName}</td>
	                        <td>${q.createDate}</td>
	                        <c:choose>
		                        <c:when test="${not empty q.ansContent}">
		                        	<td>등록완료<td>
		                        </c:when>
		                        <c:otherwise>
		                        	<td>대기중<td>
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
        			var pwd = $($(this)[0]).children().first().val();
        			var nick = $($(this)[0]).children().eq(4).text();
        			var login = '<c:out value="${loginUser.nickName}"/>';
        			//console.log(pwd);
        			//console.log(nick);
        			//console.log(login);
        			if(pwd == ""){
        				location.href='qnaDetail.he?qno=' + $(this).children("#qno").text();
        			}else if(pwd != "" && ((login == nick) || (login == "관리자1")){
        				location.href='qnaDetail.he?qno=' + $(this).children("#qno").text();
        			}else{
        				$(".modal").modal();
        				//console.log("비밀글");
        			}
        			
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
	
	
	<!-- Modal Area -->
	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<p style="text-align:center;">비밀글입니다.</p>
			
				</div>
			<div class="modal-footer">
		        <button id="modalClose" type="button" class="btn" data-dismiss="modal">닫기</button>
		    </div>
			</div>
		</div>
	</div>
    
    <jsp:include page="../common/footerBar.jsp" />
     
</body>
</html>