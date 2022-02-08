<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/header.css">
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

</head>
<body>
	 <div id="header">
        <div id="header_1">
            <div id="header_1_left"></div>
            <div id="header_1_center">
                 <img src="resources/images/logo.png">
            </div>
            <div id="header_1_right">

			<c:choose>
				<c:when test="${ empty loginUser }">
                <!-- 로그인 전 -->
                <a href="loginForm.me">로그인</a>
                <a href="joinUsForm.me">회원가입</a>
                </c:when>
                <c:otherwise>
                <!-- 로그인 후 -->
                <label style="font-size: 16px;"><span id="userName" style="font-weight: bolder;">${ loginUser.userName }</span> 님 반가워요!</label> &nbsp;&nbsp;
                <a href="logout.me" style="font-size: 16px;">로그아웃</a>&nbsp;
                <img src="resources/images/smallCart.png" style="width: 32px;" value="장바구니">&nbsp;&nbsp;&nbsp;
                <img src="resources/images/user.png" style="width: 32px;" value="마이페이지">
                 </c:otherwise>
               </c:choose>
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
                

                <li class="header_2_menu"><a href="eventMain.ev">EVENT</a></li>

                
                <li class="header_2_menu"><a href="helpList.he">HELP</a></li>
            </ul>
        </div>
        
    </div>
</body>
</html>