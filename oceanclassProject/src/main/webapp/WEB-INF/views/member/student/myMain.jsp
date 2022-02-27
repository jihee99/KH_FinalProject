<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/stuMypage.css">
<style>
	.conhead{
        width: 100%;
	    height: 15%;
	}
	.content1{
	    width: 100%;
	    height: 30%;
	}
	.conhead>h2{width: 30%; font-weight: 900;}
	.conhead>a{float: right; margin-top: -30px;}
    .item{width:25%; float:left; margin: 30px; margin-top: 40px; overflow: hidden;}
    .item img{display:block; width: 100%; height: 130px;}
    .item>p{text-align: center; font-size: 20px; font-weight: 600;}
    a{text-decoration: none; color: black; font-weight: 600;}
	#move{width: 100%; height: 120px; border:none;}
    #move>#img{display:block; width: 100%; height: 100%;}
</style>
</head>
<body>
	<div class="content">
	    <div class="content1">
	        <div class="conhead">
	            <h2>나의 클래스</h2>
	            <a href="myClass.me">더보기</a>
	        </div>
            <c:choose>
        		<c:when test="${empty list}">
        			<p>수강중인 클래스가 없습니다</p>
        			<button type="button" class="btn btn-lg">클래스 구경 가기!</button>
        		</c:when>
	        	<c:otherwise>
			        <c:forEach var="c" items="${list}" begin="0" end="2">
			            <div class="item">
			            	<a><img src="${c.clImg}"></a>
			            	<input type="hidden" value="${c.clNo}">
			            	<p id="ctitle">
				            	<c:choose>
				            		<c:when test="${fn:length(c.clName) gt 12}">
				            			<c:out value="${fn:substring(c.clName, 0, 11)}"></c:out>
				            			..
				            		</c:when>
				            		<c:otherwise>
				            			<c:out value="${c.clName}"></c:out>
				            		</c:otherwise>
				            	</c:choose>
			            	</p>
			            </div>
		            </c:forEach>
		    	</c:otherwise>			        
	        </c:choose>  
	    </div>  
	    <div class="content1">
	        <div class="conhead">
	            <h2>찜한 클래스</h2>
	            <a href="likeClass.me">더보기</a>
	        </div>
	        <c:choose>
        		<c:when test="${empty list}">
        			<p>찜한 클래스가 없습니다</p>
        			<button type="button" class="btn btn-lg">지금 찜하러 가기!</button>
        		</c:when>
	        	<c:otherwise>
			        <c:forEach var="c" items="${classLikeList}" begin="0" end="2">
			            <div class="item">
			            	<form id="classDetail" method="post" action="classDetail.me">
			            		<input type="hidden" id="referNo" name="referNo" value="${c.clNo}">
				                <button id="move" type="submit"><img src="${c.clImg}" id="img"></button>
				            </form>
			            	<p id="ctitle">
				            	<c:choose>
				            		<c:when test="${fn:length(c.clName) gt 12}">
				            			<c:out value="${fn:substring(c.clName, 0, 11)}"></c:out>
				            			..
				            		</c:when>
				            		<c:otherwise>
				            			<c:out value="${c.clName}"></c:out>
				            		</c:otherwise>
				            	</c:choose>
			            	</p>
			            </div>
		            </c:forEach>
		    	</c:otherwise>			        
	        </c:choose>
	    </div>  
        <div class="content1">
	        <div class="conhead">
	            <h2>찜한 상품</h2>
	            <a href="likeProduct.me">더보기</a>
	        </div>
	        <c:choose>
        		<c:when test="${empty list}">
        			<p>찜한 상품이 없습니다</p>
        			<button type="button" class="btn btn-lg">지금 찜하러 가기!</button>
        		</c:when>
	        	<c:otherwise>
			        <c:forEach var="s" items="${storeLikeList}" begin="0" end="2">
			            <div class="item">
			            	<form id="productMain" method="post" action="productMain.pr">
			            		<input type="hidden" id="pno" name="pno" value="${s.productNo}">
				                <button id="move" type="submit"><img src="${s.productImg0}" id="img"></button>
				            </form>
			            	<p id="ctitle">
				            	<c:choose>
				            		<c:when test="${fn:length(s.title) gt 30}">
				            			<c:out value="${fn:substring(s.title, 0, 29)}"></c:out>
				            			..
				            		</c:when>
				            		<c:otherwise>
				            			<c:out value="${s.title}"></c:out>
				            		</c:otherwise>
				            	</c:choose>
			            	</p>
			            </div>
		            </c:forEach>
		    	</c:otherwise>			        
	        </c:choose>
	    </div>  
	</div>
</body>
</html>