<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./resources/css/store/instructorStoreQnaList.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#detailBtn{width: 50px; height: 30px; border-radius: 5px; border: none; background: gray; color: white;}
</style>
</head>
<body>
<div style="width: 1600px; height: auto; margin: auto;">
	<!-- 강사용 메뉴바 연결하기 	-->
	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
	 	
	<div class="innerOuter">
        <div class="headMenu">
        	<br><br>
            <b>상품 문의 관리</b>
        </div>
        <div class="content">
            <div class="">
                <select id="productList">
                    <option value="0">선택안함</option>
                	<c:forEach var="store" items="${plist }">
                    	<option value="${store.productNo }">${store.title }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="content_table">
                <table class="table table-sm table-light" align="center">
                    <thead>
                        <tr>
                            <th width="150">문의번호</th>
                            <th width="150">문의유형</th>
                            <th width="300">제목</th>
                            <th width="150">작성자</th>
                            <th width="180">작성일</th>
                            <th width="100">답변상태</th>
                            <th width="100"></th>
                        </tr>
                    </thead>
                    <tbody class="qnaBody">
                    	<c:forEach var="q" items="${list }">
	                    	<tr>
	                            <td>${q.csQno }</td>
	                            <td>${q.referNo }</td>
	                            <td>${q.title }</td>
	                            <td>${q.userId }</td>
	                            <td>${q.createDate }</td>
	                            <td>
	                             <c:choose>
	                             	<c:when test="${q.answerDate ne null }">
	                                	<p>답변완료</p>	                             	
	                             	</c:when>
	                             	<c:when test="${q.answerDate eq null }">
	                             		<p style="color: red;">미답변</p>
	                             	</c:when>
	                             </c:choose>
	                            </td>
	                            <td>
	                            	<button id="detailBtn" onclick="location.href='sqdetail.in?qno=${q.csQno}'">상세</button>
	                            </td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="btn_group" align="center">
				<c:choose>
	           		<c:when test="${pi.currentPage eq 1 }">
	           			<button class="btn btn-light" disabled>&lt;</button>
	           		</c:when>
	           		<c:otherwise>
	           			<button class="btn btn-light" onclick="location.href='sqlist.in?cpage=${pi.currentPage - 1}'">&lt;</button>
	           		</c:otherwise>
	           	</c:choose>
	                   
	   			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	   				<button class="btn btn-light" onclick="location.href='sqlist.in?cpage=${p}'">${p }</button>
	   			</c:forEach>
	   
	   			<c:choose>
	               	<c:when test="${pi.currentPage eq pi.maxPage }">
	           			<button class="btn btn-light" disabled>&gt;</button>
	               	</c:when>
	               	<c:otherwise>
	               		<button class="btn btn-light" onclick="location.href='sqlist.in?cpage=${pi.currentPage + 1}'">&gt;</button>
	               	</c:otherwise>
	            </c:choose>
			</div>
        </div>
        
        <script>
        	$("#productList").click(function(){
        		console.log($(this).val());
        		// 페이징바 처리하는 ajax
        		/*
        		$.ajax({
        			url:"pQnaCountAjax.in",
        			data:{pno:$(this).val()},
        			success:function(pi){
        				console.log(pi);
        				let value="";
        				
        				if(pi.currentPage == 1){
        					value += "<button class='btn btn-light' disabled>&lt;</button>";
        				}else if(pi.currentPage != 1){
        					num = pi.currentPage - 1;
        					value += "<button class='btn btn-light' onclick='movePage(" + num + ")'>&lt;</button>"
        				}
        				console.log("lt value------------------");
        				
        				for(var i=pi.startPage; i<=pi.endPage; i++ ){
        					value += "<button class= 'btn btn-light' onclick='movePage("+i+")'>"+ i + "</button>";
        				}
        				console.log("for value------------------");
        				
        				if(pi.currentPage == pi.maxPage){
        					value += "<button class='btn btn-light' disabled>&gt;</button>";
        				}else{
        					value += "<button class='btn btn-light' onclick='movePage(" + pi.currentPage + ")'>&gt;</button>"
        				}
        				
        				console.log(value);
        				
        				$(".btn_group").empty();
						$(".btn_group").html(value);
						
        			},error:function(){
						console.log("ajax 상품 조회 실패!!")
        			}
        		});
        		*/
        		//상품별 조회하는 ajax
        		$.ajax({
        			url:"pQnaListAjax.in",
        			data:{pno:$(this).val()},
        			success:function(list){
        				console.log(list);
        				
        				let value = "";
        				
        				for(let i in list){
        					value += "<tr>"
        								+ "<td><input type='hidden' class='csQno' value="+ list[i].csQno + ">"+ list[i].csQno + "</td>"
        								+ "<td>"+ list[i].referNo + "</td>"		
        								+ "<td>"+ list[i].title + "</td>"
        								+ "<td>"+ list[i].userId +"</td>"
        								+ "<td>"+ list[i].createDate + "</td>"
        								+ "<td>";
	        					if(list[i].answerDate != null){
	        						value += "<p>답변완료</p>";
	        					}else{
	        						value += "<p style='color: red;'>미답변</p>";
	        					}
	        					value += "</td>"
	        							+"<td><button id='detailBtn' onclick='qnaDetail("+ list[i].csQno+")'>상세</button></td>"	
	        							+"</tr>";
        				}
    					console.log(value);        			        			
        				$(".qnaBody").empty();
        				$(".qnaBody").html(value);
        			}, error:function(){
        				alert("상품 문의 조회에 실패했습니다.");
        			}
        		})
        		
        		
        	})
        	//-------------페이징바 이동 함수-------------------
        	function movePage(num){
        		location.href="sqlist.in?cpage="+ num;
        	}
        	
        	function qnaDetail(num){
        		location.href='sqdetail.in?qno='+num;
        	}
        	</script>
       
    </div>
    </div>
</body>
</html>