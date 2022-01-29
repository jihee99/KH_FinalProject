<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/header.css">
</head>
<body>
	 <div id="header">
        <div id="header_1">
            <div id="header_1_left"></div>
            <div id="header_1_center">
                 <img src="resources/images/logo.png">
            </div>
            <div id="header_1_right">

                <!-- 로그인 전 -->
                <a href="">로그인</a>
                <a href="">회원가입</a>
                
                <!-- 로그인 후 
                <img src="" value="장바구니">
                <img src="" value="마이페이지">
                 -->
            </div>
        </div>

        <!--각 페이지 넘어가서 해당 메뉴에 글자 색 효과 넣기 rgb(107, 171, 213) -->

        <div id="header_2">

            <ul class="header_2_box">
                <li class="header_2_menu">
                    <a href="">CLASS</a>
                    <ul class="header_2_detail">
                        <li><a href="">개발&데이터</a></li>
                        <li><a href="">드로잉</a></li>
                        <li><a href="">사진&영상</a></li>
                        <li><a href="">요리</a></li>
                        <li><a href="">음악</a></li>
                        <li><a href="">운동</a></li>
                        <li><a href="">자기계발</a></li>
                        <li><a href="">재태크</a></li>
                    </ul>
                </li>

                <li class="header_2_menu">
                    <a href="">STORE</a>
                    <ul class="header_2_detail">
                        <li><a href="">클래스 상품</a></li>
                        <li><a href="">OC 에디션</a></li>
                        <li><a href="">DIY Kit</a></li>
                    </ul>
                </li>
                

                <li class="header_2_menu"><a href="">EVENT</a></li>

                
                <li class="header_2_menu"><a href="">HELP</a></li>
            </ul>
        </div>
        
    </div>
</body>
</html>