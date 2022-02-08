<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
    .review_detail{width: 600px; height: auto;}
    .mini_header>img{ margin: auto; display: block;}
    .mini_header>p{margin:auto; height: 45px; background:rgb(88, 159, 230); color: white; font-weight: bold; font-size: 25px;}
    
    .product_info{width: 300px; height: 150px; display: block; margin: auto; margin-bottom: 10px; margin-top: 20px;}
    .product_title_img{float: left; width:120px; height: 130px; margin-right:15px;}
    .merchant_name, .product_option{font-size: 13px; color: rgb(112, 112, 112);}
    .product_name{font-size: 15px;}

    .input_file_btn{
        display: block;
        width: 300px;
        height: 25px;
        text-align: center;
        padding: 6px 25px;
        border: 2px dotted;
        font-size: 16px;
        color: rgb(0, 0, 0);
        cursor: pointer;
    }

    .question1, .question2{font-weight: bold; font-size: 18px; display: block; margin:auto;}
    .question1{width: 180px; margin-bottom: 10px; margin-top: 20px;}
    .question2{width: 160px; margin-top: 20px;}
    .please_star{display: block; width:125px; margin:auto; font-size: 12px; color: rgb(112, 110, 110); margin-top: 10px; margin-bottom: 20px;}

    .review_content {display:block; margin: auto;}
    .input_file_btn{margin: auto;}
    .button_area>button{width: 150px; height: 40px; border: none; font-weight: bold; font-family: 본고딕;}
    .registration{background:rgb(88, 159, 230); color: white;}
    .cancel{color: rgb(83, 83, 83);}
    #counter{display: block; margin-left: 470px;}
</style>
</head>
<body>
<div class="review_detail">


        <div class="mini_header">
            <img src="logo.png" width="150px"><br>
            <p align="center">리뷰작성</p>
        </div>

        <div class="product_info">
            <img src="" class="product_title_img">
            <span class="merchant_name">브랜드명</span> <br>
            <span class="product_name">상품명상품명</span><br>
            <span class="product_option">선택합옵션(색상:흰색)</span>
            <br>
        </div>
        <hr>

        <div class="star_rating_area">
            <span class="question1">상품은 만족하셨나요?</span>
            <div class="star" align="center">
                <i class="far fa-star fa-2x"></i><i class="far fa-star fa-2x"></i><i class="far fa-star fa-2x"></i><i class="far fa-star fa-2x"></i><i class="far fa-star fa-2x"></i>
            </div>
            <span class="please_star">별점을 입력해주세요.</span>
        </div>
        <hr>

        <div class="content_area">
            <span class="question2">상품은 어떠셨나요?</span><br>
            <textarea name="" id="" cols="60" rows="10" class="review_content" placeholder="상품에 대한 솔직한 평가를 작성해주세요. (최소10자)" maxlength="500"></textarea>
            <span id="counter">0/1000</span>
        </div>
        <br><br>

        <div class="file_registration">
            <label for="input_file" class="input_file_btn"><i class="fas fa-camera"></i> 사진/동영상 첨부하기</label>
            <input type="file" id="input_file" style="display: none;">
        </div>
        <!--이미지 미리보기 추가-->
        <br>
        <div class="checkbox" align="center">     
            <input type="checkbox"> 
            <span>리뷰 등록시 옵션정보 안보이게 할래요</span>
        </div>
        <br>
        <div class="button_area" align="center">
            <button type="" class="cancel">취소</button>
            <button type="" class="registration">등록</button>
        </div>

    </div>
</body>
</html>