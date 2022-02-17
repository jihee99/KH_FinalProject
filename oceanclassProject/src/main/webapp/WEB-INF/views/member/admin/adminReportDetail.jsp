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

<link rel="stylesheet" href="./resources/css/adminReportDetail.css">
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
            <form action="">
	            <input type="button" id="reBtn" class="btn btn-sm" value="복구하기">
	            <button id="deBtn" class="btn btn-sm" onclick="">삭제하기</button>
	            <table>
	                <tr>
	                    <th width="180">신고번호</th>
	                    <td width="300">${rp.reportNo }</td>
	                    <th width="180">게시글분류</th>
	                    <td width="300">
	                       	<c:choose>
	                       		<c:when test="${rp.refCategory eq 'SR'}">
	                       			스토어 리뷰
	                       		</c:when>
	                       		<c:when test="${rp.refCategory eq 'CR'}">클래스 리뷰</c:when>
	                       		<c:otherwise>댓글</c:otherwise>
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
	            <div>
	
	               ${rp.rpContent }
	
	            </div>
	        </div>
        </form>
        <div align="center">
            <br>
            <button class="btn" style="background: lightgray;" onclick="history.back();">목록보기</button>
        </div>
    </div>

</body>
</html>