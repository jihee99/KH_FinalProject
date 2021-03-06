<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<link rel="stylesheet" href="./resources/css/stuMypage.css?3">
<style>
	#img{width: 100%; text-align: center;}
</style>
</head>
<body>
	<div class="side">
	    <div id="profile">
	    	<div id="img">
		    	<c:choose>
		    		<c:when test="${not empty loginUser.profileImg}">
		    			<img src="${loginUser.profileImg}" style="width: 90%; height: 150px;">
		    		</c:when>
		    		<c:otherwise>
		    			<i class="bi bi-person-circle" style="font-size: 6rem; color: cornflowerblue;"></i>
		    		</c:otherwise>
		    	</c:choose>
	    	</div>
	    	<p id="sideName">${loginUser.nickName}님</p>
	    </div>
	    <div class="menu">
	        <p>클래스 관리</p>
	        <ul>
	            <li><a href="myClass.me">나의 클래스</a></li>
	            <li><a href="myReview.me">클래스 문의/리뷰</a></li>  <!-- myReview.me -->
	            <li><a href="likeClass.me">찜한 클래스</a></li>
	        </ul>
	    </div>
	    <div class="menu">
	        <p>상품 관리</p>
	        <ul>
	            <li><a href="myShopping.me">주문 조회</a></li>
	            <li><a href="myShoppingReview.me">상품 문의/리뷰</a></li>
	            <li><a href="likeProduct.me">찜한 상품</a></li>
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