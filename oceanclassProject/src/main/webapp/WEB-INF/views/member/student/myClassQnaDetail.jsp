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
					<table class="table table-hover" id="list">
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
					            <tr>
					            	<input type="hidden" id="csQno" name="csQno" value="${q.csQno}">
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
			        
			        <script>
						$("#list>tbody>tr").click(function(){
							let csQno = $($(this)[0]).children().first().val();
							let empty = "";
							$.ajax({
								url:"ajaxClassQna.me",
								data:{csQno: csQno},
								success:function(result){
									let list = '<table class="table">';
									list += '<tr>'
										  + 	  '<th> 클래스  </th>'
										  + 	  '<td>' + result.clName + '</td>'
										  + '</tr>'
										  + '<tr>'
										  +    '<th> 문의 제목  </th>'
										  +    '<td>' + result.title + '</td>'
										  + '</tr>'
										  + '<tr>'
										  +    '<th> 문의 날짜   </th>'
										  +    '<td>' + result.createDate + '</td>'
										  + '</tr>'
										  + '<tr>'
										  +    '<th> 문의 내용   </th>'
										  +    '<td>' + result.content + '</td>'
										  + '</tr>'
									if(!(result.answerContent == "" || result.answerContent == null || result.answerContent == "undefined" || result.answerContent == undefined)){
								 		list += '<tr>'
											  +    '<th> 답변 내용   </th>'
											  +    '<td width=600>' + result.answerContent + '</td>'
											  + '</tr>'
											  + '<tr>'
											  +    '<th> 답변 날짜   </th>'
											  +    '<td>' + result.answerDate + '</td>'
											  + '</tr>' 
									}else{
										list += '<tr>'
											  +    '<th colspan="2"> 답변 등록 전입니다.  </th>'
											  + '</tr>'
									}
									$(".modal-body").html(list);
								},error:function(){
									console.log("주문 상세보기 실패")
								}
							})
							$(".modal").modal();
						})
					</script>
					
					<div class="modal" tabindex="-1">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
						       		<div class="modal-title">문의 상세 보기</div>
						        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				         				<span aria-hidden="true">&times;</span>
				        			</button>
					      		</div>
								<div class="modal-body">
									
								</div>
							</div>
						</div>
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