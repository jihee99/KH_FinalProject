<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        border: 5px solid #6babd5; 
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
            

            <div class="border" align="center">
                <br>
                <i class="far fa-grin-squint fa-3x"></i>
                <br>
                <h1>결제가 완료되었습니다!</h1> <br>
                <span>감사합니다!</span>
                <br>
                <span>고객님이 주문하신 주문번호는</span> <br>
                <b style="color:#6babd5; font-size:20px;">${orderNo}</b> <span>입니다.</span>
                <br><br><br><br>
                <span>주문하신 내역과 배송정보는 마이페이지의<br>
                    "주문내역"에서 확인하실 수 있습니다.
                </span>
            </div>
            
            <button align="center" type="button" style="background:#6babd5; width:200px; height:50px; color:white; font-size:15px; display:block; margin:auto; margin-top:30px;"  
            onclick="location.href='/oceanclass'">메인으로 돌아가기</a>
        </main>
    </div>
</body>
</html>