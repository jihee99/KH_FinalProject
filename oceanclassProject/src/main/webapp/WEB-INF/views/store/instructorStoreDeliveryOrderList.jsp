<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="./resources/css/store/instructorStoreDeliveryOrderList.css">
</head>
<body>

	<!-- 강사용 사이드바 연결 -->
	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
	
	<div class="innerOuter">
        <div class="headMenu">
        	<br><br>
            <b>주문 배송 관리</b>
        </div>
        <div id="dStatus">
            <table>
                <tr align="center"> 
                    <td onclick="typeValue(1);">
                        <div class="imgbox" id="type1">
                            <img src="resources/images/delivery1.png">
                        </div>
                        <p>결제완료</p>
                    </td>
                    <td onclick="typeValue(2);">
                        <div class="imgbox" id="type2">
                            <img src="resources/images/delivery2.png">
                        </div>
                        <p>상품준비중</p>
                    </td>
                    <td onclick="typeValue(3);">
                        <div class="imgbox" id="type3">
                            <img src="resources/images/delivery3.png">
                        </div>
                        <p>배송시작</p>
                    </td>
                    <td onclick="typeValue(4);">
                        <div class="imgbox" id="type4">
                            <img src="resources/images/delivery4.png">
                        </div>
                        <p>배송중</p>
                    </td>
                    <td onclick="typeValue(5);">
                        <div class="imgbox" id="type5">
                            <img src="resources/images/delivery5.png">
                        </div>
                        <p>배송완료</p>
                    </td>
                    <td onclick="typeValue(6);">
                        <div class="imgbox" id="type6">
                            <img src="resources/images/delivery6.png">
                        </div>
                        <p>결제취소</p>
                    </td>
                </tr>
            </table>
            <script>
                /* 선택된 버튼 색상 변경 rgb(107, 171, 213, 0.7) */
                /* 버튼 클릭시 해당 상태인 주문내역 불러오기 */
            </script>
        </div>
        <div class="content">
            <div class="content_1">
                <div class="content_1_left"><b>전체 주문</b>(${pi.listCount })</div>
                <div class="content_1_center"></div>
                <div class="content_1_right">
                    <form id="searchForm" align="right">
                        <input type="text" id="searchKey" placeholder="주문자명을 입력하세요"> 
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>
            <div class="content_2">
                <table class="orderList">
                    <thead>
                        <tr>
                            <th width="40"><input type="checkbox" id="checkAll"></th>
                            <th width="150">주문번호</th>
                            <th width="150">주문자명</th>
                            <th width="220">주문일</th>
                            <th width="110">주문방법</th>
                            <th width="110">주문금액</th>
                            <th width="130">주문상태</th>
                            <th width="150">기능</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="s" items="${list }">
                        <tr>
                            <!-- <td><input type="checkbox" class="deleteNum" name="deleteNum" value="${b.boardNo }"></td> -->
                            <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                            <td>${s.orderNo }</td>
                            <td>${s.userId }</td>
                            <td>${s.payDate }</td> 
                            <td>${s.payMethod }</td>
                            <td>${s.payAmount }</td>
                            <td>
                            	<input type="hidden" name="orderStatus" value="${s.orderStatus }"> 
                                <select name="status" id="" value="${s.orderStatus }">
                                	<option class="op1" value="1">결제완료</option>
                                    <option class="op2" value="2">상품준비</option>
                                    <option class="op3" value="3">배송시작</option>
                                    <option class="op4" value="4">배송중</option>
                                    <option class="op5" value="5" style="color: green;">배송완료</option>
                                    <option class="op6" value="6">주문취소</option>
                                    <option class="op7" value="7" style="color: red;">취소완료</option>
                                </select>
                            	
                            </td>
                            <td align="center">
                                <button id="updateBtn" type="submit">변경</button>
                                <button id="detailBtn" onclick="location.href='sodetail.in?ono=${s.orderNo}'">상세</button>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div align="left">
            <button id="deleteBtn">선택삭제</button>
        </div>
        <div class="btn_group" align="center">
			<c:choose>
           		<c:when test="${pi.currentPage eq 1 }">
           			<button class="btn btn-light" disabled>&lt;</button>
           		</c:when>
           		<c:otherwise>
           			<button class="btn btn-light" onclick="location.href='sorderF.in?cpage=${pi.currentPage - 1}'">&lt;</button>
           		</c:otherwise>
           	</c:choose>
                   
   			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
   				<button class="btn btn-light" onclick="location.href='sorderF.in?cpage=${p}'">${p }</button>
   			</c:forEach>
   
   			<c:choose>
               	<c:when test="${pi.currentPage eq pi.maxPage }">
           			<button class="btn btn-light" disabled>&gt;</button>
               	</c:when>
               	<c:otherwise>
               		<button class="btn btn-light" onclick="location.href='sorderF.in?cpage=${pi.currentPage + 1}'">&gt;</button>
               	</c:otherwise>
            </c:choose>
		</div>
		
		<script>	
			$(function(){
				var status = $("input[name=orderStatus]").val();
				//console.log(status);
				switch(status){
				case '1': break; 
				case '2': break;
				case '3': break;
				case '4': break;
				case '5': break;
				case '6': break;
				case '7': break;
				}
			})
			function typeValue(num){
				console.log(num)
				var box1 = $("#type1");
				var box2 = $("#type2");
				var box3 = $("#type3");
				var box4 = $("#type4");
				var box5 = $("#type5");
				var box6 = $("#type6");

				if(num ==1){
					box1.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box2.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box3.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box4.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box5.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box6.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}else if(num==2){
					box2.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box1.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box3.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box4.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box5.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box6.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}else if(num==3){
					box3.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box1.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box2.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box4.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box5.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box6.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}else if(num==4){
					box4.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box1.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box2.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box3.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box5.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box6.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}else if(num==5){
					box5.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box1.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box2.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box3.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box4.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box6.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}else if(num==6){
					box6.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box1.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box2.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box3.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box4.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box5.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}
				/*
				$.ajax({
					url:"sosearch.in",
					date:{orderStatus:num},
					success:function(result){
						
					},error:function(result){
						
					}
				})
				*/
			}
		</script>
    </div>

</body>
</html>