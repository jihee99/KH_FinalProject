<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style>
    .innerOuter{width:1000px; margin: auto;}

    .headMenu{text-align: left;} 
    .headMenu>b{font-size: 28px; font-weight: 800; margin-left: 10px; color: rgb(107, 171, 213);}

    .head_2{height: 60px;}
    .head_2 input{height: 32px; margin-top: 20px; margin-left: 10px; width: 250px; float: left;}
    .head_2 button{height: 32px; margin-top: 20px; border-radius: 5px; border: none; float: left;}
    
    .content{width: 100%; padding: 5px 8px;}
	.content table{text-align: center; width: 100%; line-height: 24px; font-size:14px;}
    .content thead{line-height: 35px; background: lightgray;}    

    .btn_group{margin: 20px 0px; position: relative;}  
</style>
</head>
<body>
 	<!--
        신고횟수 3회 이상인 회원은
        블랙리스트로 상태 변경
        복구 처리시 == 신고횟수 0으로 변경, 회원상태 변경
    -->

    <!-- 관리자 사이드바 연결 -->
    <jsp:include page="../../common/admin/adminSidebar.jsp" />
    
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>블랙리스트 회원 관리</b>
        </div>
        <div class="head_2">
            <div class="head_2_left">
                <form id="searchForm">
                    <input type="text" id="searchKey" placeholder="아이디를 입력하세요"> 
                    <button type="submit">검색</button>
                </form>
            </div>
        </div>
        <div class="content">
            <table align="center">
                <thead>
                    <tr>
                        <th width="100">회원번호</th>
                        <th width="100">아이디</th>
                        <th width="100">닉네임</th>
                        <th width="100">이름</th>
                        <th width="80">신고횟수</th>
                        <th width="80">회원상태</th>
                        <th width="100"></th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="b" items="${blList }" >
                    <tr>
	                    <td>${b.memNo }</td>
	                    <td>${b.userId }</td>
	                    <td>${b.nickName }</td>
	                    <td>${b.userName }</td>
                	    <td>${b.report }</td>
	                    <td>
	                    	<c:choose>
	                    		<c:when test="${b.userStatus eq 'Y' }">유효</c:when>
	                    		<c:when test="${b.userStatus eq 'H' }">휴면</c:when>
	                    		<c:when test="${b.userStatus eq 'B' }">블랙</c:when>
	                    		<c:otherwise>탈퇴</c:otherwise>	                    		
	                    	</c:choose>
	                    </td>
	                    <td>
	                        <button onclick="location.href='bmback.ad?mno=${b.memNo}'">복구</button>
	                        <button onclick="location.href='bmout.ad?mno=${b.memNo}'">탈퇴</button>	                        
	                    </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
		<div class="btn_group" align="center">
			<c:choose>
           		<c:when test="${pi.currentPage eq 1 }">
           			<button class="btn btn-light" disabled>&lt;</button>
           		</c:when>
           		<c:otherwise>
           			<button class="btn btn-light" onclick="location.href='blList.ad?cpage=${pi.currentPage - 1}'">&lt;</button>
           		</c:otherwise>
           	</c:choose>
                   
   			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
   				<button class="btn btn-light" onclick="location.href='blList.ad?cpage=${p}'">${p }</button>
   			</c:forEach>
   
   			<c:choose>
               	<c:when test="${pi.currentPage eq pi.maxPage }">
           			<button class="btn btn-light" disabled>&gt;</button>
               	</c:when>
               	<c:otherwise>
               		<button class="btn btn-light" onclick="location.href='blList.ad?cpage=${pi.currentPage + 1}'">&gt;</button>
               	</c:otherwise>
            </c:choose>
        	</div>
    </div>
</body>
</html>