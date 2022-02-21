<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/css/store/instructorStoreOrderDetail.css">
</head>
<body>

    <!-- 강사 사이드 네비바 연결하기 -->
    <jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>

    <div class="innerOuter">
        <div class="headMenu">
        	<br><br>
            <b>주문 내역서</b>
        </div>
        <div class="head_2">
            <b>주문 상세 정보</b>
            <hr>
        </div>
        <div class="content">
            <form action="soupdate.in" method="post">
            <input type="hidden" name="orderNo" value="${so.orderNo }">
                <div class="content_1">
                    <b>주문 정보</b>
                    <table class="table table-light table-sm">
                        <tr>
                            <th width="200">주문번호</th>
                            <td width="250">${so.orderNo }</td>
                            <th width="200" rowspan="2">주소</th>
                            <td width="250" rowspan="2">${so.address }</td>
                        </tr>
                        <tr>
                            <th>주문일자</th>
                            <td>${so.payDate }</td>
                        </tr>
                        <tr>
                            <th>주문자</th>
                            <td>${so.userName }</td>
                            <th>전화번호</th>
                            <td>${so.phone }</td>
                        </tr>
                        <tr>
                            <th>결제방법</th>
                            <td>${so.payMethod }</td>
                            <th>주문상태</th>
                            <td>
                            	<input type="hidden" id="os" value="${so.orderStatus }">
                                <select name="orderStatus" id="orderStatus">
                                    <option class="op1" value="1">결제완료</option>
                                    <option class="op2" value="2">상품준비</option>
                                    <option class="op3" value="3">배송시작</option>
                                    <option class="op4" value="4">배송중</option>
                                    <option class="op5" value="5" style="color: green;">배송완료</option>
                                    <option class="op6" value="6">주문취소</option>
                                    <option class="op7" value="7" style="color: red;">취소완료</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="content_2">
                    <b>결제 정보</b>
                    <table class="table table-light table-sm">
                        <tr>
                            <th width="200">포인트/쿠폰 사용금액</th>
                            <td width="250">${so.usePoint }</td>
                            <th width="200">총 결제금액</th>
                            <td width="250">${so.payAmount }</td>
                        </tr>
                    </table>
                </div>

                <div class="content_3">
                    <b>상품 정보</b>
                    <table class="table table-light table-sm">
                        <thead>
                            <tr>
                                <th width="130">상품번호</th>
                                <th width="80">옵션번호</th>
                                <th width="230">상품명</th>
                                <th width="100">상품가격</th>
                                <th width="80">수량</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var ="buylist" items="${buylist }">
                        	<tr>
                            <td>${buylist.productNo }</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${buylist.optionNo eq 0}">--</c:when>
                            		<c:otherwise>${buylist.optionNo }</c:otherwise>
                            	</c:choose>
                            </td>
                            <td>${buylist.title }</td>
                            <td>${buylist.price }</td>
                            <td>${buylist.quantity }</td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div> 
                <div align="center">
                    <button id="submitBtn" class="btn btn-lg" type="submit">저장하기</button>
                    <input type="button" id="listBtn" class="btn btn-lg" onclick="history.back();" value="목록보기">
                </div>   
            </form>
        </div>
		<script>
			$(function(){
				var orderStatus = $("#os").val();
				console.log(orderStatus);
				
				$("select[name=status]").val(orderStatus).prop("selected", true);

				if(orderStatus == 1){
					$(".op1").prop("selected", true);
				}else if(orderStatus == 2){
					$(".op2").prop("selected", true);
				}else if(orderStatus == 3){
					$(".op3").prop("selected", true);
				}else if(orderStatus == 4){
					$(".op4").prop("selected", true);
				}else if(orderStatus == 5){
					$(".op5").prop("selected", true);
				}else if(orderStatus == 6){
					$(".op6").prop("selected", true);
				}else if(orderStatus == 7){
					$(".op7").prop("selected", true);
				}

			})
		</script>
    </div>

</body>
</html>