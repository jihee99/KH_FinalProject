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
	#option{float:left;}
	.middle{
		width: 100%;
		margin: auto;
		margin-top: 50px;
		margin-bottom: -20px;
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
    #searchArea{width: 90%;}
    .label{float:left; padding-left: 30px; vertical-align: middle; margin-right: 10px; padding-top: 5px;}
    #searchArea>label{margin:0 auto;}
    input[type='radio']{width: 15px; margin-right: 50px; margin-top: -1px; vertical-align: middle; }
    #qnaList{width: 110%;}
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
            <button type="button" class="btn" onclick="location.href='qnaList.he';">1:1문의</button>
        </div>
        <div class="middle">
        	<div id="search">
		        <form action="searchQnaList.he" method="get">	
        			<select id="option" name="option" class="dropdown-toggle form-control-sm" style="margin-top: -1px;">
			            <option id="writer" value="writer">작성자</option>
			            <option id="category" value="category">카테고리</option>
		        	</select>
		        	<div id="searchArea"><input id="nickName" name="nickName" type="text" class="form-control form-control-sm"></div>
           			<button type="submit" class="btn btn-sm" style="width:60px; margin-top: -1px;">검색</button>
        		</form>
	        </div>
	        <c:if test="${not empty loginUser }">
				<button type="button" class="btn qs" style="margin-top: -35px;" onclick="location.href='qnaForm.he';">문의하기</button>
        	</c:if>
        </div>
        
        <script>
        	$("#option").change(function(){
        		let option = $(this).val();
        		//console.log(option);
        		let value = ''
        		if(option == "category"){
        			value += '<div class="label"><label><input type="radio" class="form-check-input" id="category" name="category" value="C">클래스</label></div>'
        				 + '<div class="label"><label><input type="radio" class="form-check-input" id="category" name="category" value="S">스토어</label></div>'
        				 + '<div class="label"><label><input type="radio" class="form-check-input" id="category" name="category" value="E">기타</label></div>'
        			$("#searchArea").html(value);	 
        		}else{
        			value += '<input id="nickName" name="nickName" type="text" class="form-control form-control-sm">'
        			$("#searchArea").html(value);
        		}
        	})
        </script>
        
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
        			let pwd = $($(this)[0]).children().first().val();
        			let nick = $($(this)[0]).children().eq(4).text();
        			let login = '<c:out value="${loginUser.nickName}"/>';
        			//console.log(pwd);
        			//console.log(nick);
        			console.log(login);
        			if(pwd == ""){
        				location.href='qnaDetail.he?qno=' + $(this).children("#qno").text();
        			}else if(pwd != "" && ((login == nick) || (login === '나관리'))){
        				location.href='qnaDetail.he?qno=' + $(this).children("#qno").text();
        			}else{
        				$(".modal").modal();
        				//console.log("비밀글");
        			}
        			
        		});
        	});
        	
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
						<li class="page-item"><a class="page-link" href="searchQnaList.he?cpage=${ pi.currentPage-1 }">Previous</a></li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach  var="p" begin="${pi.startPage}" end="${pi.endPage}">
					<c:choose>
						<c:when test="${ empty option }">
							<li class="page-item"><a class="page-link" href="searchQnaList.he?cpage=${ p }">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${ option == 'category'}">
									<li class="page-item"><a class="page-link" href="searchQnaList.he?cpage=${p}&option=${ option }&category=${ category }">${p}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="searchQnaList.he?cpage=${p}&option=${ option }&nickName=${ nickName }">${p}</a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled">
							<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="searchQnaList.he?cpage=${pi.currentPage+1}">Next</a></li>
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