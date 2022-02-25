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
	.searchBar{height: 200px;}
	.list{
	    width: 90%;
	    height: 150px;
	    margin: 0 auto;
	    margin-top: 50px;
	    border: 1px solid lightgray;
	}
	.list img{
		width: 30%; 
		height: 145px;
		float: left;
		padding: 5px;
	}
	#explain{
		width: 40%; 
		height: 100%; 
		float: left; 
		margin-top: 20px;
		margin-left: 15px;
	}
	#explain>h3{color:rgb(107, 171, 213); font-weight: 600;}
	#explain>p{margin-top: -10px; font-weight: bolder; }
	#state{float:left;}
	.list>button{
		width: 15%; 
		height: 30%; 
		margin-top: 45px;
		margin-left: 50px;
		font-weight: 600;
	}
	
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
				    <h2>주문 조회</h2>
				    <div class="searchBar">
				        <p>기간검색</p>
				        <input type="hidden" id="memNo" value="${loginUser.memNo}">
				        <button type="button" class="btn btn-info" id="week" value="7">1주일</button>
				        <button type="button" class="btn btn-info" id="week" value="14">15일</button>
				        <button type="button" class="btn btn-info" id="week" value="31">1개월</button>
				        <div id="search">
				            <input type="date"> ~ <input type="date">
				            <button>검색</button>
				        </div>
				    </div>
				    <c:forEach var="s" items="${list}">
					    <div class="list">
					    	<a href=""><img src="${s.img}"></a>
					    	<input type="hidden" id="orderNo" name="orderNo" value="${s.orderNo}">
				            <div id="explain">
				                <h4>
				                	<c:choose>
					            		<c:when test="${fn:length(s.title) gt 21}">
					            			<c:out value="${fn:substring(s.title, 0, 20)}"></c:out>
					            			..
					            		</c:when>
					            		<c:otherwise>
					            			<c:out value="${s.title}"></c:out>
					            		</c:otherwise>
						            </c:choose>
						        </h4>
				                <p>주문날짜 : ${s.payDate}</p>
				                <h3 id="state">${s.orderStatus}</h3>
				            </div>
				            <button type="button" class="btn btn-info" onclick="detailShopping();">상세보기</button>
					    </div>
				    </c:forEach>
				</div>
				
				<script>
					$(function(){
						$(document).on("click", ".btn", function(){
							let value = $(this).val();
							let memNo = $("#memNo").val();
							console.log(value);
							console.log(memNo);
							$.ajax({
								url:"ajaxMyShopping.me",
								data:{memberNo: memNo,
									  payDate: value},
							    success:function(result){
							    	let result = '';
							    	for(let i in result){
							    	}
							    },error:function(){
							    	consoel.log("주문 기간조회 실패");
							    }
							})
						})
					})
				</script>
				
				<div class="modal" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
					       		<div class="modal-title">주문 상세 보기</div>
					        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			         				<span aria-hidden="true">&times;</span>
			        			</button>
				      		</div>
							<div class="modal-body">
								
							</div>
						</div>
					</div>
				</div>
				
				<script>
					function detailShopping(){
						
						let orderNo = $("#orderNo").val();
						console.log(orderNo);
						let pay = "";
						$.ajax({
							url:"detailShopping.me",
							data:{orderNo: orderNo},
							success:function(result){
								pay += '<tr>'
									 + '<th> 주문번호 : </th>'
									 + '<td>' + result.orderNo + '</td>'
									 + '</tr>'
									 + '<tr>'
									 + '<th> 주문날짜 : </th>'
									 + '<td>' + result.payDate + '</td>'
									 + '</tr>'
									 + '<th> 주문금액 : </th>'
									 + '<td>' + result.payAmount + '원</td>'
									 + '</tr>'
									 + '<th> 주문방식 : </th>'
									 + '<td>' + result.payMethod + '</td>'
									 + '</tr>'
									 + '<tr>'
									 + '<th> 주문자 정보 </th>'
									 + '</tr>'
									 + '<tr>'
									 + '<td colspan="2"> 이름  : ' + result.userName + '</td>'
									 + '</tr>'
									 + '<tr>'
									 + '<td> 전화번호 : ' + result.phone + '</td>'
									 + '</tr>'
									 + '<tr>'
									 + '<td> 주소 : ' + result.address + '</td>'
									 + '</tr>'
								console.log(pay);
								$(".modal-body").html(pay);	 
							},error:function(){
								console.log("주문 상세보기 실패")
							}
						})
						
						$(".modal").modal();
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
								<li class="page-item"><a class="page-link" href="myShopping.me?cpage=${ pi.currentPage-1 }">Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="myShopping.me?cpage=${ p }">${ p }</a></li>
						</c:forEach>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled">
									<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="myShopping.me?cpage=${ pi.currentPage+1 }">Next</a></li>
							</c:otherwise>
						</c:choose>
		            </ul>
		        </div>
		        
			</td>
		</tr>
	</table>
	
</body>
</html>