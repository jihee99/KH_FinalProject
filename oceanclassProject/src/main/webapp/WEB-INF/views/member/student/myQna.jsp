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
    <link rel="stylesheet" href="./resources/css/stuMypage.css">
<style>
	.searchBar>p{margin-right: 30px; margin-left: 70px;}
	#search{width:450px; margin-left: 450px;}
	.table{
		width:100%;
		margin-top: 30px;
		text-align: center;
	}
	#myQna>tbody #answer{
		display: none;
	}
	#answer{background: rgb(107, 171, 213, 0.2);}
	#answer p{font-size: 10px; margin-top: 20px;}
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
				    <h2>1:1 문의 내역</h2>
				    
				    <div class="searchBar">
				        <p>기간검색</p>
				        <button class="btn btn-info">1주일</button>
				        <button class="btn btn-info">15일</button>
				        <button class="btn btn-info">1개월</button>
				        <div id="search">
				            <select name="type" id="type">
				                <option value="title">제목</option>
				                <option value="value">분류</option>
				            </select>
				            <input type="text">
				            <button>검색</button>
				        </div>
				    </div>
				    
				    <table class="table" id="myQna">
				        <thead>
				            <tr>
				                <th>날짜</th>
				                <th>분류</th>
				                <th>제목</th>
				                <th>답변유무</th>
				            </tr>
				        </thead>
				        <tbody>
				        	<c:forEach var="q" items="${list}">
					            <tr id="question">
					                <td>${q.createDate}</td>
					                <td>${q.category}</td>
					                <td>${q.qnaTitle}</td>
					                <c:choose>
				                        <c:when test="${not empty q.ansContent}">
				                        	<td>등록완료<td>
				                        </c:when>
				                        <c:otherwise>
				                        	<td>대기중<td>
				                        </c:otherwise>
			                        </c:choose>
					            </tr>
					            <tr id="answer">
					            	<td colspan="4">${q.ansContent} <p>${q.ansDate}</p></td>
					            </tr>
				            </c:forEach>
				        </tbody>
				    </table>
			    
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
					
					<script>
						$(function(){
							$("#myQna>tbody>#question").click(function(){
								//console.log($(this));
								$(this).toggleClass("selected");
								$("#myQna>tbody>#question").not(this).removeClass("selected");
								var target = $(this).next();
								console.log(target.text());
								target.slideToggle(300);
							});
						});
					</script>
				</div>	
			</td>
		</tr>
	</table>

</body>
</html>