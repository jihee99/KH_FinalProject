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
    <link rel="stylesheet" href="./resources/css/eventMain.css?5">
<style>
	.reply>input{
		margin: 0 auto;
		margin-bottom: 30px;
	}
	.innerOuter>button{
		display: block;
		width: 250px;
		margin: 0 auto;
		margin-top: 80px;
		margin-bottom: 50px;
		background: rgb(224, 224, 224)
	}
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
    <div class="innerOuter my-3">
        <div class="head py-5">
            <p>${e.eventTitle}</p>
        </div>
        <div class="tag"><p>${e.tag}<p></div>
        <div class="content">
        	<img src="${e.img}" style="width: 100%; height: 100%;">
        </div>
		<c:if test="${not empty list}">
	        <div class="reply">
	        	<c:choose>
	        		<c:when test="${not empty loginUser}">
	        			<p>${loginUser.nickName}</p><input type="text"><button class="btn btn-sm">등록</button>
	        		</c:when>
	        		<c:otherwise>
	        			<p></p><input type="text" placeholder="로그인 후 이용 가능합니다" disabled><button class="btn btn-sm">등록</button>
	        		</c:otherwise>
	        	</c:choose>
	        	<table class="table">
	        		<c:forEach var="r" items="${list}">
			            <tr>
			                <td style="font-weight:600;">${r.nickName}</td>
			                <td>${r.replyContent}</td>
			                <td>${r.replyDate}</td>
			            </tr>
		            </c:forEach>
	        	</table>
	        </div>
        </c:if>
       	<button type="button" class="btn" onclick="history.back()">목록으로</button>
    </div>    
	
	 <jsp:include page="../common/footerBar.jsp" />
	
</body>
</html>