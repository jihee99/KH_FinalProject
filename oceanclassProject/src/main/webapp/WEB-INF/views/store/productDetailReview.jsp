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
.product_detail_image>img{width: 100%; object-fit: cover;}

.review_list{margin-bottom: 30px; height: auto;}
.small_header{width: 100%; height: 90px;}
.small_header>span{font-weight: bold; font-family: 본고딕; font-size: 20px;}
.small_header>button{float: right; width: 100px; height: 30px; background:steelblue; color: white; border: none; border-radius: 5px;}
.user_detail>button{background:none; border: none; font-weight: bold; font-size: 13px; cursor: pointer;}
.user_detail{width: 400px; height: 80px;}
.user_image{width: 50px; height: 50px; border: 1px solid; position:inline-block; float:left; margin-right: 10px;}
.product_name_small{font-size: small; color: rgb(88, 88, 88);}
.content{font-family: 본고딕; font-size: 15px; display:inline-block; width:650px; height: auto; margin-bottom: 10px;}
.recommend{width: 200px; height: 30px; margin-right: 10px; cursor: pointer; background:rgb(211, 212, 212); border: none; border-radius: 5px;}
.thumbnail_image{width:150px; height:120px; border: 1px solid; margin-bottom: 10px;}
.more_review{width:700px; height: 50px; background:rgb(211, 229, 236); border: none; border-radius: 5px; cursor: pointer;}
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
                    <li><a href="" style="color: steelblue;">상품리뷰(30)</a></li>
                    <li><a href="">상품문의</a></li>
                    <li><a href="">배송일정</a></li>
                    <li><a href="">환불정책</a></li>
                </ul>
            </div>
            <hr>
            <br><br>

            <div class="small_header">
                <span>리뷰(30) </span>
                <span class="star_rating">
                    <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
                    <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
                    <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
                    <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
                    <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
                    (4.9)
                </span>
                <button type="button" class="input_review">리뷰작성</button>
            </div>

            <div class="review_list">
                <div class="review">
                    <div class="user_detail">
                        <div class="user_image">
                            <img src="" alt="">
                        </div>
                        <span>
                            <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
                        </span><br>
                        <span class="user_name">user01</span>
                        <span class="enroll_date">2022.01.31</span>
                        <button type="button">신고</button>
                    </div>
                    <div class="review_content">
                        <span class="product_name_small">상품명상품명상품명</span> <br>
                        <span class="content">이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가?</span>
                        <div class="thumbnail_image">
                            <img src="" class="thumb">
                        </div>
                    </div>
                    <div class="recommend_area">
                        <button type="button" class="recommend"><i class="far fa-thumbs-up"></i> 도움이 됐어요</button>
                        <span>n명에게 도움이 되었어요.</span>
                    </div>
                </div>
            </div>
            
            <div class="bottom_area">
                <button type="button" class="more_review">더 많은 리뷰 보러가기</button>
            </div>
            
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