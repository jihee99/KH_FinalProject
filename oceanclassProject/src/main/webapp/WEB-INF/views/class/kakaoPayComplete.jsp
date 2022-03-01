<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/css/cartStyle.css" rel="stylesheet" type="text/css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link type="text/css" rel="stylesheet" href="https://img-shop.pstatic.net/cart/static/pc/20220119/136/css/global.css?1642573329292">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .content{
        border: 5px solid steelblue; 
        border-radius: 6px; 
        width: 600px; 
        height: 470px; 
        margin: auto;
        margin-top: 100px;
        margin-bottom: 100px;
        font-size: 14px;
    }
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />

    <div class="content" align="center">
        <br>
        <i class="far fa-grin-squint fa-3x"></i>
        <br><br>
        <h3>감사합니다! 주문이 완료되었습니다!</h3><br>
        <div style="font-size:20px;">
	        <div>고객님의 주문번호는</div>
	        <div style="color:steelblue; font-weight: bold;">${ coNo }</div>
	        <div>입니다.</div>
        </div>
        <br><br>
        
        <!-- 
        <c:choose>
        	<c:when test="${ co.paymentOption == 1 }">
        		<div>
        			입금하실 계좌번호는 <b>국민은행 123456-00-9876543 이수민</b> 입니다.<br>
        			입금 확인까지는 약간의 시간이 소요될 수 있으며, 확인 된 후 클래스 수강이 가능합니다.<br>
        			즐거운 Ocean Class 되세요! <img src="resources/images/order.png" width="25" height="25">
        		</div>
        	</c:when>
        	<c:otherwise>
		        <div>
					주문하신 클래스는<br>
					마이페이지의 "클래스조회"에서 확인하실 수 있습니다.<br>
        			즐거운 Ocean Class 되세요! <img src="resources/images/order.png" width="25" height="25">
		        </div>
        	</c:otherwise>
        </c:choose>
         -->
        <div>
			주문하신 클래스는<br>
			마이페이지의 "클래스조회"에서 확인하실 수 있습니다.<br>
      		즐거운 Ocean Class 되세요! <img src="resources/images/order.png" width="25" height="25">
		</div>
        <br><br>

        <button type="button" onclick="myPage();" class="btn" style="background-color: #6babd5;color: white;">마이페이지로 이동</button>

    	<!-- 주문한 정보 (kakao에서 넘겨받은)
    	<h2>${info}</h2>
    	-->
    </div>
    

	<script>
		function myPage(){
			location.href = "myPage.me";
		}
	</script>
	
    <jsp:include page="../common/footerBar.jsp" />

</body>
</html>