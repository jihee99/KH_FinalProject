<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
/* 찜하기 어떻게 할지 고민중
.checkbox .input:checked {
    background-image: url(https://img-shop.pstatic.net/cart/static/pc/20220118/136/image/icon_checkbox_20x20_green-5ea29ba9c7d082e58dab31430cd738ae.svg);
    background-repeat: no-repeat;
    background-size: cover;
}
.checkbox .input {
    background-image: url(https://img-shop.pstatic.net/cart/static/pc/20220118/136/image/icon_checkbox_20x20_white-7458b93102d0e841a2fc3dd7fbd4f61c.svg);
    background-repeat: no-repeat;
    background-size: cover;
    display: inline-block;
    border: 0;
    width: 20px;
    height: 20px;
    vertical-align: top;
    -webkit-appearance: none;
    cursor: pointer;
    outline: none;
}
*/
.inner_outer{
    margin: auto;
    font-family:tahoma, 나눔고딕, "Nanum Gothic", 맑은고딕, "Malgun Gothic", 돋움, dotum, helvetica, "Apple SD Gothic Neo", sans-serif;
}
.product_info{
    float: left;
    margin-left: 400px;
}
.product_title_image{
    width: 700px;
    height: 400px;
}
.menu_bar{
    width: 100%;
    height: 50px;
}
.menu_bar>ul{
    width:100%; 
    height:100%; 
    list-style-type: none;
    margin: auto; 
    padding:0;
}
.menu_bar>ul>li{
    float:left; 
    width:20%; 
    height:100%; 
    line-height: 50px; 
    text-align:center;
}
.menu_bar>ul>li a{
    text-decoration: none;
    color: rgb(98, 97, 97);
    font-size: 16px;
    font-weight: bold;
    font-family: 본고딕;
}
.quick_menu{
    width: 350px;
    height: 400px;
    position: absolute; /*stickey*/
    top: 53px;
    right: 400px;
    background:rgba(212, 212, 212, 0.493);
}
.product_discription{
    width:200px;
    height: 70px;
    margin: 20px 20px;
}
.product_merchant_name{font-size: 15px;}
.product_name{font-size: 20px;}
.price_area{float: right; height: 120px; margin-right: 10px;}
.discount_persent{font-size: 23px; font-family: sans-serif; font-weight: bold; color: steelblue;}
.price {font-size: 20px;}
.price_area>s{font-size:15px; color: rgb(146, 144, 144);position: absolute; right: 15px;}
.in_cart, .heart {
    width: 150px;
    height: 40px;
    margin-bottom: 5px;
}
.buy_now{width:305px; height: 40px; background: #4b81c8d8; color: white; border: none; border-radius: 5px;}
.button_area{position: absolute; left: 22px;}
.product_title_image>img{ width:100%; height:100%; object-fit: cover;}

.small_header{width: 100%; height: 50px;}
.small_header>span{font-weight: bold; font-family: 본고딕; font-size: 20px;}
.delivery, .refund{
    background:rgb(224, 226, 226);
    padding:20px;
    margin-bottom: 70px;
}
.messege_1, .messege_2{display: inline-block; margin-left: 20px;}
.confirm, .confirm2{margin-left: 20px;}
.fa-exclamation-circle, .fa-hand-holding-usd{float:left;}
</style>
</head>
<body>
	<div class="inner_outer">
        
        <hr>
        <br><br>
        <div class="product_info">
            <div class="product_title_image">
                <img src="https://cdn.class101.net/images/3d2d0e04-fee3-47f8-b5bc-e4d001a7c6e9/2048xauto.webp">
            </div>
            <br>
            <div class="menu_bar">
                <ul> <!--클릭하면 색 바뀌게-->
                    <li class="menu_1"><a href="">상품소개</a></li>
                    <li><a href="">상품리뷰(30)</a></li>
                    <li><a href="">상품문의</a></li>
                    <li><a href="">배송일정</a></li>
                    <li><a href=""style="color: steelblue;">환불정책</a></li>
                </ul>
            </div>
            <hr>
            <br><br>

            <div class="small_header">
                <span>배송일정</span>
            </div>
            <div class="delivery">
                <i class="fas fa-exclamation-circle fa-3x"></i>
                <span class="messege_1">배송 업체의 사정에 따라 2~7 영업일이 소요됩니다.</span>
                <br>
                <a href="" class="confirm">택배사 확인</a>
            </div>

            
            <div class="small_header">
                <span>환불정책</span>
            </div>
            <div class="refund">
                <i class="fas fa-hand-holding-usd fa-3x"></i>
                <span class="messege_2">상품 개봉 및 훼손 없이, 배송 완료 후 7일 이내인 경우에만 환불이 가능합니다.</span>
                <br>
                <a href="" class="confirm2">환불정책 확인</a>
            </div>


    

        <div class="quick_menu">
            <div class="product_discription">
                <span class="product_merchant_name">브랜드명</span> <br>
                <span class="product_name">상품명상품명</span> <br>
                <span class="delivery_fee">무료배송</span>
            </div>
            <div class="price_area">
                <s>50,000원</s> <br>
                <span class="discount_persent">30% </span>
                <span class="price">35,000원</span>
            </div>
            <br><br>
            <select name="" id="" style="width: 305px; height: 40px; margin-left:22px;">
                <option value="">옵션선택</option>
            </select>
            <br><br>
            <div class="button_area" align="center">
                <button type="button" class="in_cart">장바구니</button>
                <button type="button" class="heart"><i></i>찜</button> <br>
                <button type="button" class="buy_now">바로구매</button>
            </div>
        </div>

    </div>
</body>
</html>