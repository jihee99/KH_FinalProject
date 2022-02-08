<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
    .review_detail{width: 800px; height: auto;}
    .mini_header>img{ margin: auto; display: block;}
    .mini_header>p{margin:auto; height: 45px; background:rgb(88, 159, 230); color: white; font-weight: bold; font-size: 25px;}
    
    .product_info{width: 300px; height: 150px; display: block; margin: auto; margin-bottom: 60px; margin-top: 20px;}
    .product_title_img{float: left; width:120px; height: 130px; margin-right:15px;}
    .merchant_name, .product_option{font-size: 13px; color: rgb(112, 112, 112);}
    .product_name{font-size: 15px;}

    .star_rating{font-weight: bold; font-size: 20px;}
    .total{color:rgb(139, 137, 137); font-weight: bold;}
    .star_rating_area{margin-bottom: 80px;}

    .review_list{margin-bottom: 60px; height: auto; margin-left: 30px;}
    .user_detail>button{background:none; border: none; font-weight: bold; font-size: 13px; cursor: pointer;}
    .user_detail{width: 400px; height: 80px;}
    .user_detail>span{ display:inline-block; margin-top: 12px;}
    .user_image{width: 50px; height: 50px; border: 1px solid; position:inline-block; float:left; margin-right: 10px;}
    .product_name_small{font-size: small; color: rgb(88, 88, 88);}
    .content{font-family: 본고딕; font-size: 15px; display:inline-block; width:650px; height: auto; margin-bottom: 10px;}
    .recommend{width: 200px; height: 30px; margin-right: 10px; cursor: pointer; background:rgb(211, 212, 212); border: none; border-radius: 5px;}
    .thumbnail_image{width:150px; height:120px; border: 1px solid; margin-bottom: 10px;}
    
</style>
</head>
<body>
<div class="review_detail">


        <div class="mini_header">
            <img src="logo.png" width="150px"><br>
            <p align="center">문의상세</p>
        </div>

        <div class="product_info">
            <img src="" class="product_title_img">
            <span class="merchant_name">브랜드명</span> <br>
            <span class="product_name">상품명상품명</span><br>
            <span class="product_option">선택합옵션(색상:흰색)</span>
            <br>
        </div>
        
            <div class="review_list">
                <div class="review">
                    <div class="user_detail">
                        <div class="user_image">
                            <img src="" alt="">
                        </div>
                        <span class="user_name">user01</span>
                        <span class="enroll_date">2022.01.31</span>
                        <button type="button">신고</button>
                    </div>
                    <div class="review_content">
                        <span class="product_name_small">상품명상품명상품명</span> <br>
                        <span class="content">이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가?</span>
                    </div>
                    <hr>
                    <div class="answer_area">
                        <span style="font-weight:bold">답변:</span>
                        <span>답변은 어쩌구 저쩌구 입니다</span>
                    </div>
                </div>
            </div>

            <div class="review_list">
                <div class="review">
                    <div class="user_detail">
                        <div class="user_image">
                            <img src="" alt="">
                        </div>
                        <span class="user_name">user01</span>
                        <span class="enroll_date">2022.01.31</span>
                        <button type="button">신고</button>
                    </div>
                    <div class="review_content">
                        <span class="product_name_small">상품명상품명상품명</span> <br>
                        <span class="content">이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가?</span>
                    </div>
                    <hr>
                    <div class="answer_area">
                        <span style="font-weight:bold">답변:</span>
                        <span>답변은 어쩌구 저쩌구 입니다</span>
                    </div>
                </div>
            </div>

            <div class="review_list">
                <div class="review">
                    <div class="user_detail">
                        <div class="user_image">
                            <img src="" alt="">
                        </div>
                        <span class="user_name">user01</span>
                        <span class="enroll_date">2022.01.31</span>
                    </div>
                    <div class="review_content">
                        <span class="product_name_small">비밀글입니다.</span> <br>
                        
                    </div>
                    <hr>
                    <div class="answer_area">
                        <span style="font-weight:bold">답변완료</span>
                        <span></span>
                    </div>
                </div>
            </div>

            <div class="page">
                <nav aria-label="...">
                    <ul class="pagination .pagination-sm justify-content-center">
                      <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item active" aria-current="page">
                        <a class="page-link" href="#">2</a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                      </li>
                    </ul>
                  </nav>
            </div>

    </div>
</body>
</html>