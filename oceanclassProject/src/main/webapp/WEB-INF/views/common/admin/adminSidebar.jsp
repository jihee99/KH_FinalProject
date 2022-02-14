<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./resources/css/adminMain.css">
    
</head>
<body>
	<!-- 
		메인페이지랑 사이드바 분리해서 나중에 if(loginUser ne null) 조건구문 추가하기
		-> loginUser ne null adminMainPage보여지게
		-> loginUser eq null alert 접근권한이 없습니다. 하고 사용자 메인페이지로 이동
		
	 -->
	 <c:if test="${not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg"/>
	</c:if>
	
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
                        <li><a href="orlist.ad">주문 내역 관리</a></li>
                        <li><a href="pclist.ad">포인트/쿠폰 관리</a></li>
                        <li><a href="rplist.ad">신고내역 조회/검색</a></li>
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
        </div>
    </div>  
</body>
</html>