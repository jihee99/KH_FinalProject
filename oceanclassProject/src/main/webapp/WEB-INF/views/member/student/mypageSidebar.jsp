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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./resources/css/stuMypage.css">
</head>
<body>
	<div class="side">
	    <div id="profile"><img src="resources/images/bomi7.jpg"></div>
	    <div class="menu">
	        <p>클래스 관리</p>
	        <ul>
	            <li><a href="?page=myClass.jsp">나의 클래스</a></li>
	            <li><a href="?page=myClassReview.jsp">클래스 문의/후기</a></li>
	            <li><a href="">찜한 클래스</a></li>
	        </ul>
	    </div>
	    <div class="menu">
	        <p>상품 관리</p>
	        <ul>
	            <li><a href="?page=myShopping.jsp">주문 조회</a></li>
	            <li><a href="?page=myShoppingReview.jsp">상품 문의/후기</a></li>
	            <li><a href="">찜한 상품</a></li>
	        </ul>
	    </div>
	    <div class="menu">
	        <p>내 정보 관리</p>
	        <ul>
	            <li><a href="?page=myQna.jsp">1:1 문의 내역</a></li>
	            <li><a href="?page=myPoint.jsp">내 포인트/쿠폰</a></li>
	            <li><a href="?page=myProfile.jsp">나의 프로필</a></li>
	            <li><a href="?page=myDelete.jsp">회원 탈퇴</a></li>
	        </ul>
	    </div>
	</div>  
</body>
</html>