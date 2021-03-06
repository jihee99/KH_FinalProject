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
<style>
	.wrapper{ width: 1500px; height: auto;}
	.side{width: 15%; height: 100%; background-color: ghostwhite; float: left; padding : 5px;}
	.contentArea{ width: 85%; height: 100%; float: left;}
	/* 관리자1 표시 */
	#header{margin-left: 1150px; height: 5%;}
	/* 사이드바 스타일 */
	#menu div{
	    float: left; margin-top: 30px; margin-left: 15px; margin-bottom: 20px;}
	#menu li{ list-style: none; }
	#menu p{font-weight: bolder; font-size: 18px; color: rgb(107, 171, 213); margin-left: 15px; margin-bottom: 5px;}
	#menu a{text-decoration: none; float: left; color: grey; margin-top: 5px; margin-left: 5px; font-size: 15px;}
	#menu a:hover{text-decoration: underline; font-weight: bolder;}
	#logo img:hover{backgroundColor: black;}
</style>
</head>
<body>

	<c:if test="${not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg"/>
	</c:if>
	
    <div class="wrapper">
        <div class="side">
            <div id="logo">
                <img src="resources/images/logo.png" width="100%" onclick="location.href='${pageContext.request.contextPath}'">
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
                        <li><a href="classEnrollManager.ad?cpage=1&array=1&category=&keyword=&clNo=" id="classEnrollManager">클래스 등록 관리</a></li>
                        <li><a href="classManager.ad?cpage=1&yclass=1&nclass=&array=new&category=&keyword=&before=&after=" id="classManager">클래스 관리</a></li>
                    </ul>
                </div>
                <div id="menu3">
                    <p>스토어 관리</p>
                    <ul>
                        <li><a href="productManager.st">상품 관리</a></li>
                        <li><a href="reviewManager.st">리뷰 관리</a></li>
                        <li><a href="qnaManager.st">문의 관리</a></li>
                        <li><a href="orderManager.st">발주 관리</a></li>
                    </ul>
                </div>
                <div id="menu4">
                    <p>고객센터</p>
                    <ul>
                        <li><a href="noticeList.ad">공지사항 관리</a></li>
                        <li><a href="faqList.ad">FAQ 관리</a></li>
                        <li><a href="qnaList.ad">1:1문의 관리</a></li>
                        <li><a href="eList.ad">이벤트 관리</a></li>
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