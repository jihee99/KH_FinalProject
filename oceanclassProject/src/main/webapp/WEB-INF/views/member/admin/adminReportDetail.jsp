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

<style>
.innerOuter{width:1000px; margin: auto;}
.headMenu{text-align: left;} 
.headMenu>b{font-size: 28px; font-weight: 800; margin-left: 10px; color: rgb(107, 171, 213);}

.content_1{width: 100%; text-align: left;}
.content_1>b{margin-left: 10px; font-size: 16px; line-height: 30px;}
.content_1 table{width: 990px; margin-left: 10px; border-collapse: separate; line-height: 33px;}
.content_1 table *{font-size: 14px;}
.content_1 table th{text-align: center; background: lightgray;}
.content_1 table td{padding-left: 10px;}

#deBtn{float:right; width: 90px; height: 35px; background: gray; font-size: 16px; color: white; margin: 2px;}
#reBtn{float:right; width: 90px; height: 35px; background: rgb(107, 171, 213); font-size: 16px; color: white; margin: 2px; margin-right: 10px;}

.reportContent{margin:10px; height: 150px; background: lightgray; padding: 20px;}  

</style>

</head>
<body>

    <!-- 관리자 사이드바 연결하기 -->
    <jsp:include page="../../common/admin/adminSidebar.jsp" />
    
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>신고내역 상세보기</b>
        </div>
        <div class="content_1">
            <br>
            <b>신고정보</b>
            <hr>
            
	            <button id="reBtn" class="btn btn-sm" onclick="location.href='rpback.ad?rpno=${rp.reportNo }&mno=${rp.reportMemNo }'">복구하기</button>
	            <button id="deBtn" class="btn btn-sm" onclick="location.href='rpdelete.ad?rpno=${rp.reportNo}&mno=${rp.reportMemNo }'">삭제하기</button>
	            <table>
	                <tr>
	                    <th width="180">신고번호</th>
	                    <td width="300" class="">${rp.reportNo }</td>
	                    <th width="180">게시글분류</th>
	                    <td width="300">
	                       <c:choose>
                        		<c:when test="${rp.refCategory eq 'SR'}">스토어 리뷰</c:when>
                        		<c:when test="${rp.refCategory eq 'SQ'}">스토어 문의</c:when>
                        		<c:when test="${rp.refCategory eq 'CR'}">클래스 리뷰</c:when>
                        		<c:when test="${rp.refCategory eq 'CQ'}">클래스 문의</c:when>
                        		<c:when test="${rp.refCategory eq 'R' }">댓글</c:when>
                        	</c:choose>
	                    </td>
	                </tr>
	                <tr>
	                    <th>작성자</th>
	                    <td>${rp.userId }</td>
	                    <th>처리상태</th>
	                    <td>${rp.status }</td>
	                </tr>
	                <tr>
	                    <th>신고사유</th>
	                    <td colspan="3">${rp.content }</td>
	                </tr>
	            </table>
	            <br>
	            <b>신고글 내용</b>
	            <div class="reportContent">
	
	               ${rp.rpContent }
	
	            </div>
	        </div>

        <div align="center">
            <br>
            <button class="btn" style="background: lightgray;" onclick="history.back();">목록보기</button>
        </div>
    </div>
</body>
</html>