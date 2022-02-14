<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
	.innerOuter{width:1000px; margin: auto;}
	.headMenu{text-align: left;} 
	.headMenu>b{font-size: 28px; font-weight: 800; margin-left: 10px; color: rgb(107, 171, 213);}
	
	.head_2{height: 70px; margin-top: 30px; margin-left: 10px; text-align: left;}
	
	.content_1{margin-left: 10px; text-align: left; font-size: 14px;}
	.content_1 table{margin-top: 5px; width: 100%; font-size: 13px; text-align: center;}
	.content_1 table th{background: lightgray;}
	
	.content_2{margin-left: 10px; margin-top: 5px; text-align: left; font-size: 14px;}
	.content_2 table{margin-top: 5px; width: 100%; font-size: 13px; text-align: center;}
	.content_2 table th{background: lightgray;}
	
	.content_3{margin-left: 10px; margin-top: 5px; text-align: left; font-size: 14px;}
	.content_3 table{margin-top: 5px; width: 100%; font-size: 13px; text-align: center;}
	.content_3 table>thead{background: lightgray;}
	
	#reBtn{margin-top:30px; background: rgb(177, 5, 5); font-size: 16px; font-weight: 550; color: white;}
	#listBtn{margin-top:30px; background: gray; font-size: 16px; font-weight: 550; color: white;}
</style>
</head>
<body>

	<!-- 관리자 사이드바 연결하기 -->
    <jsp:include page="../../common/admin/adminSidebar.jsp" />
   
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>주문 내역서</b>
        </div>
        <div class="head_2">
            <b>주문 상세 정보</b>
            <hr>
        </div>
        <div class="content">
            <form action="">
                <div class="content_1">
                    <b>주문 정보</b>
                    <table class="table table-light table-sm">
                        <tr>
                            <th width="200">주문번호</th>
                            <td width="250">${sOrder.orderNo }</td>
                            <th width="200" rowspan="2">주소</th>
                            <td width="250" rowspan="2">${sOrder.address }</td>
                        </tr>
                        <tr>
                            <th>주문일자</th>
                            <td>${sOrder.payDate }</td>
                        </tr>
                        <tr>
                            <th>주문자</th>
                            <td>${sOrder.userName }</td>
                            <th>전화번호</th>
                            <td>전화번호 안가져왔다 셀렉문에 추가하기!!!</td>
                        </tr>
                        <tr>
                            <th>결제방법</th>
                            <td>${sOrder.payMethod }</td>
                            <th>주문상태</th>
                            <td>
                            <c:choose>
								<c:when test="${sOrder.orderStatus eq 1 }">주문접수</c:when>
								<c:when test="${sOrder.orderStatus eq 2 }">상품준비중</c:when>
								<c:when test="${sOrder.orderStatus eq 3 }">배송시작</c:when>
								<c:when test="${sOrder.orderStatus eq 4 }">배송중</c:when>
								<c:when test="${sOrder.orderStatus eq 5 }">배송완료</c:when>
								<c:when test="${sOrder.orderStatus eq 6 }">주문취소</c:when>
								<c:when test="${sOrder.orderStatus eq 7 }">취소완료</c:when>
							</c:choose>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="content_2">
                    <b>결제 정보</b>
                    <table class="table table-light table-sm">
                        <tr>
                            <th width="200">포인트 사용 금액</th>
                            <td width="250">
                            	<c:choose>
                            		<c:when test="${sOrder.usePoint ne null }">${sOrder.usePoint }</c:when>
                            		<c:otherwise>--</c:otherwise>
                            	</c:choose>	
                            </td>
                            <th width="200">쿠폰 할인 금액</th>
                            <td width="250">
                            	<c:choose>
                            		<c:when test="${sOrder.useCoupon  ne null }">${sOrder.useCoupon }</c:when>
                            		<c:otherwise>--</c:otherwise>
                            	</c:choose>	
                            </td>
                        </tr>
                        <tr>
                            <th width="200">총 결제금액</th>
                            <td width="250" colspan="3" style="font-size: 15px;">${sOrder.payAmount }</td>
                        </tr>
                        
                        <c:if test="${sOrder.refundNo ne ''}">				
	                        <tr>
	                            <th width="200">환불신청일</th>
	                            <td width="250">${sOrder.refundDate }</td>
	                           	<th width="200">환불처리상태</th>
	                            <td width="250">${sOrder.refundStatus }</td>
	                        </tr>	
						</c:if>
                    </table>
                </div>

                <div class="content_3">
                    <b>상품 정보</b>
                    <table class="table table-light table-sm">
                        <thead>
                            <tr>
                                <th width="130">상품번호</th>
                                <th width="80">카테고리</th>
                                <th width="230">상품명</th>
                                <th width="100">상품가격</th>
                                <th width="80">수량</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>S1239</td>
                                <td>DIY Kit</td>
                                <td>펀치 니들 자수 패키지 DIY 취미세트</td>
                                <td>32000</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>S1611</td>
                                <td>OC 에디션</td>
                                <td>OC 2022 하루일기 다이어리</td>
                                <td>18000</td>
                                <td>1</td>
                            </tr>
                        </tbody>
                    </table>
                </div> 
                <div align="center">
                    <button id="reBtn" class="btn btn-lg" type="submit">주문취소</button>
                    <button id="listBtn" class="btn btn-lg" type="">목록보기</button>
                </div>   
            </form>
        </div>
    </div>

</body>
</html>