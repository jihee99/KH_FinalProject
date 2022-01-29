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

<style>
	 div{box-sizing: border-box;}
    #header{
        width:73%;
        padding-top: 20px;
        margin:auto;
    }

    #header>div{width:100%; margin-bottom:10px}
    #header_1{height:75px}
    #header_2{text-align: center;}

    #header_1>div{height:100%; float:left;}
    #header_1_left{width:30%;position:relative;}
    #header_1_center{width:40%; margin-bottom:20px;}
    #header_1_right{width:30%;}

    #header_1_center>img{width:40%; display : block; margin: auto;}
    #header_1_right{text-align: right; line-height:35px; font-size: 12px; text-indent: 35px;}
    #header_1_right>a{margin: 5px; text-decoration:none; color:black}
    #header_1_right>a:hover{cursor: pointer;}

    .header_2_box{width:65%; height:100%; list-style-type: none; margin: auto; text-align: center; padding:0; display: inline-block;}
    .header_2_menu{float:left; width: 24%; height:100%; line-height: 30px; text-align:center; margin: 2px;}
    .header_2_menu>a{display: block; text-decoration: none; color: black; font-size: 18px; font-weight: 700;}
    
    .header_2_menu>ul>li{width:50%; height:100%; line-height: 35px; text-align:left; font-size: 13px;}
    .header_2_menu a:hover{color: rgb(107, 171, 213); font-size: 20px; text-decoration: none; }

    .header_2_detail{width:100%; height:100%; list-style-type: none; padding-top: 20px; padding-left: 20px; display: none;}
    .header_2_detail>li>a{text-decoration: none; font-size: 13px; color: black;}
    .header_2_detail>li>a:hover{color: rgb(107, 171, 213); font-size: 13px; text-decoration: none;}

    .header_2_menu a:hover+.header_2_detail{display: block;}
    .header_2_detail:hover{display: block;}

    /* 내용 담길 전체 div 가로길이 고정 */
    .innerOuter{width: 80%; margin:auto; padding:5% 10%;}
</style>

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
                        <li><a href="">클래스상품</a></li>
                        <li><a href="">굿즈</a></li>
                        <li><a href="">??</a></li>
                    </ul>
                </li>
                

                <li class="header_2_menu"><a href="">EVENT</a></li>

                
                <li class="header_2_menu"><a href="">HELP</a></li>
            </ul>
        </div>
        
    </div>
</body>
</html>