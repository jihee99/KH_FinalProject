<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/stuMypage.css?3">

</head>
<body>
	<div class="side">
	    <div id="profile">
	    	<img src="${loginUser.profileImg}">
	    	<p id="sideName">${loginUser.nickName}님</p>
	    </div>
	    <div class="menu">
	        <p>클래스 관리</p>
	        <ul>
	            <li><a href="?page=myClass.jsp">나의 클래스</a></li>
	            <li><a href="?page=myClassReview.jsp">클래스 문의/후기</a></li>
	            <li><a href="?page=myClassLike.jsp">찜한 클래스</a></li>
	        </ul>
	    </div>
	    <div class="menu">
	        <p>상품 관리</p>
	        <ul>
	            <li><a href="?page=myShopping.jsp">주문 조회</a></li>
	            <li><a href="?page=myShoppingReview.jsp">상품 문의/후기</a></li>
	            <li><a href="?page=myShoppingLike.jsp">찜한 상품</a></li>
	        </ul>
	    </div>
	    <div class="menu">
	        <p>내 정보 관리</p>
	        <ul>
	            <li><a href="myQna.me">1:1 문의 내역</a></li>
	            <li><a href="pointCoupon.me">내 포인트/쿠폰</a></li>
	            <li><a href="myProfile.me">나의 프로필</a></li>
	            <li><a href="myDeleteForm.me">회원 탈퇴</a></li>
	        </ul>
	    </div>
	</div>  
	
	
</body>
</html>