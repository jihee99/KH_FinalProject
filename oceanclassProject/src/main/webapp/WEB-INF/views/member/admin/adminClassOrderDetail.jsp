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
	#saveBtn{margin-top:30px; background: rgb(107, 171, 213); font-size: 16px; font-weight: 550; color: white;}
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

            <div class="content_1">
                <b>주문 정보</b>
                <table class="table table-light table-sm">
                    <tr>
                        <th width="200">주문번호</th>
                        <td width="250">${co.coNo}</td>
                        <th width="200">주문자</th>
                        <td width="250">${co.userName}</td>
                    </tr>
                    <tr>
                        <th>주문일자</th>
                        <td>${co.paymentDate }</td>
                        <th>전화번호</th>
                        <td>${co.phone }</td>
                    </tr>
                    <tr>
                        <th>결제방법</th>
                        <td>!!나중에 숫자에 맞춰서 결제 옵션 바꾸기!!
                        <c:choose>
                        	<c:when test="${co.paymentOption eq 1 }"> <!-- 여기다가 입력 --> </c:when>
                        	<c:when test="${co.paymentOption eq 2 }">카드</c:when>
                        	<c:when test="${co.paymentOption eq 3 }">네이버페이</c:when>
                        </c:choose>
                        </td>
                        <th>열람상태</th>
                        <td>
                        	<c:choose>
                        		<c:when test="${co.readingCheck eq 'N' }">
									미열람                        		
                        		</c:when>
								<c:otherwise>열람</c:otherwise>
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
                        	${co.pointUse }
                        </td>
                        <th width="200">사용 쿠폰 번호</th>
                        <td width="250">
                        	${co.pcNo }	
                        </td>
                    </tr>
                    <tr>
                        <th width="200">총 결제금액</th>
                        <td width="250" colspan="3" style="font-size: 15px;">${co.amount }</td>
                    </tr>
                    
                    <c:if test="${co.refundNo != null}">				
                     <tr>
                         <th width="200">환불처리번호</th>
                         <td width="250">${co.refundNo }</td>
                        	<th width="200">환불요청일</th>
                         <td width="250">${co.requestDate }</td>
                     </tr>	
					</c:if>
                </table>
            </div>

            <div class="content_3">
                <b>상품 정보</b>
                <table class="table table-light table-sm">
                    <thead>
                        <tr>
                            <th width="130">클래스번호</th>
                            <th width="330">클래스명</th>
                            <th width="150">클래스가격</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${co.clNo }</td>
                            <td>${co.clName }</td>
                            <td>${co.clPrice }</td>
                        </tr>
                    </tbody>
                </table>
            </div> 
            <div align="center">
            	<c:if  test="${co.readingCheck eq 'N' }">
            	<button id="reBtn" class="btn btn-lg" type="submit" onclick="window.open('corcancleF.ad?ono=${co.coNo }','클래스주문취소페이지','width=550, height=380, menubar=no, status=no, toolbar=no, resizable=no')">주문취소</button>
            	</c:if>
                <input id="listBtn" class="btn btn-lg" type="button" onclick="location.href='orlist.ad'" value="목록보기">
            </div>   
        </div>

    </div>

</body>
</html>