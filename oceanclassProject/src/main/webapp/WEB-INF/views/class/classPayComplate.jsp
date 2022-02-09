<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        height: 400px; 
        margin: auto;
        margin-top: 200px;
        margin-bottom: 200px;
        font-size: 14px;
    }
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />

    <div class="content" align="center">
        <br>
        <i class="far fa-grin-squint fa-3x"></i>
        <br>
        <h1>결제가 완료되었습니다!</h1><br>
        <div>고객님의 주문번호는</div>
        <div style="color:steelblue; font-weight: bold;">0101010101</div>
        <div>입니다.</div>
        <br><br>
        <div>
            주문하신 클래스는 마이페이지의<br>
            "클래스조회"에서 확인하실 수 있습니다.
        </div>
        <br>

        <button type="button" class="btn" style="background-color: #6babd5;color: white;">마이페이지로 이동</button>
    </div>

    <jsp:include page="../common/footerBar.jsp" />

</body>
</html>