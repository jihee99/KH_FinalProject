<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/adminMain.css">
    
</head>
<body>
    <div class="wrapper">
        <div class="side">
            <div id="logo">
                <img src="resources/images/logo.png" width="100%">
            </div>
            <div id="search">
                <input type="text" style="width:60%">
                <button class="btn-xs">검색</button>
            </div>
            <div id="menu">
                <div id="menu1">
                    <p>회원 관리</p>
                    <ul>
                        <li><a href="memlist.ad">전체 회원 관리</a></li>
                        <li><a href="">주문 내역 관리</a></li>
                        <li><a href="pclist.ad">포인트/쿠폰 관리</a></li>
                        <li><a href="">신고내역 조회/검색</a></li>
                    </ul>
                </div>
                <div id="menu2">
                    <p>클래스 관리</p>
                    <ul>
                        <li><a href="" id="classEnrollManager">클래스 등록 관리</a></li>
                        <li><a href="" id="classManager">클래스 관리</a></li>
                    </ul>
                </div>
                <div id="menu3">
                    <p>스토어 관리</p>
                    <ul>
                        <li><a href="">상품 관리</a></li>
                        <li><a href="">리뷰 관리</a></li>
                        <li><a href="">문의 관리</a></li>
                        <li><a href="">발주 관리</a></li>
                    </ul>
                </div>
                <div id="menu4">
                    <p>통계 관리</p>
                    <ul>
                        <li><a href="">회원 통계</a></li>
                        <li><a href="">클래스 통계</a></li>
                        <li><a href="">상품 통계</a></li>
                    </ul>
                </div>
                <div id="menu5">
                    <p>고객센터</p>
                    <ul>
                        <li><a href="">공지사항 관리</a></li>
                        <li><a href="">FAQ 관리</a></li>
                        <li><a href="">1:1문의 관리</a></li>
                        <li><a href="">이벤트 관리</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="contentArea">
            <div id="header">
                <span class="material-icons">manage_accounts</span> 관리자1
            </div>
            <div id="content">
            </div>
        </div>
    </div>  
</body>
</html>