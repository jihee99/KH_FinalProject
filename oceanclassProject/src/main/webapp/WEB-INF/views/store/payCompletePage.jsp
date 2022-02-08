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
<style>
    .border{
        border: 5px solid steelblue; 
        border-radius: 6px; 
        width:500px; 
        height: 350px; 
        margin: auto;
        margin-top: 200px;
        font-size: 14px;
    }
    .border>span, .border>h1{display: block; margin: auto;}
</style>
</head>
<body>
 	<div class="cart">
        <main class="page_cart">
            <div class="cart_header">
                <h2 class="title on">
                    <a href="" class="link">결제완료</a>
                </h2>
                <ol class="step">
                    <li>
                        <em>장바구니</em>
                    </li>
                    <li>
                        주문/결제
                    </li>
                    <li>
                        완료
                    </li>
                </ol>
            </div>

            <div class="border" align="center">
                <br>
                <i class="far fa-grin-squint fa-3x"></i>
                <br>
                <h1>결제가 완료되었습니다!</h1> <br>
                <span>감사합니다!</span>
                <br>
                <span>고객님이 주문하신 주문번호는</span> <br>
                <span style="color:steelblue">0101010101</span> <span>입니다.</span>
                <br><br><br><br>
                <span>주문하신 내역과 배송정보는 마이페이지의<br>
                    "주문내역"에서 확인하실 수 있습니다.
                </span>
            </div>
        </main>
    </div>
</body>
</html>