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
	.table{
		width: 90%;
		margin: 0 auto;
		margin-top: 30px;
	}
	.pagination{
		width: 90%;
		margin: 0 auto;
		margin-top: 50px;
	}
	.table{text-align: center;}
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
				        <h2>클래스 문의</h2>
				    </div>
					<table class="table">
			            <thead>
			                <tr>
			                    <th>클래스</th> 
				                <th>문의제목</th>
				                <th>문의날짜</th>
				                <th>답변상태</th>
			                </tr>
			            </thead>
			            <tbody>
			            	<c:forEach var="q" items="${list}">
			            		<input type="hidden" id="csQno" name="csQno" value="${c.csQno}">
					            <tr>
					                <td>
						                <c:choose>
						            		<c:when test="${fn:length(q.clName) gt 11}">
						            			<c:out value="${fn:substring(q.clName, 0, 10)}"></c:out>
						            			..
						            		</c:when>
						            		<c:otherwise>
						            			<c:out value="${q.clName}"></c:out>
						            		</c:otherwise>
							            </c:choose>
						            </td>
					                <td>
						                <c:choose>
						            		<c:when test="${fn:length(q.title) gt 20}">
						            			<c:out value="${fn:substring(q.title, 0, 19)}"></c:out>
						            			..
						            		</c:when>
						            		<c:otherwise>
						            			<c:out value="${q.title}"></c:out>
						            		</c:otherwise>
							            </c:choose>
						            </td>
					                <td>${q.createDate}</td>
					                <c:choose>
				                        <c:when test="${not empty q.answerContent}">
				                        	<td>등록완료</td>
				                        </c:when>
				                        <c:otherwise>
				                        	<td>대기중</td>
				                        </c:otherwise>
			                        </c:choose>
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
									<li class="page-item"><a class="page-link" href="myClassQnaDetail.me?cpage=${ pi.currentPage-1 }">Previous</a></li>
								</c:otherwise>
							</c:choose>
							
							
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<li class="page-item"><a class="page-link" href="myClassQnaDetail.me?cpage=${ p }">${ p }</a></li>
							</c:forEach>
							
							
							<c:choose>
								<c:when test="${ pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled">
										<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="myClassQnaDetail.me?cpage=${ pi.currentPage+1 }">Next</a></li>
								</c:otherwise>
							</c:choose>
			            </ul>
			        </div>
				</div>
				
			</td>
		</tr>
	</table>
	
</body>
</html>