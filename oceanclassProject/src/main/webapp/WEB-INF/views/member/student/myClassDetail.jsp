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
	.content1{
	    width: 100%;
	    border: 1px solid;
	    margin-bottom: 40px;
	}
	.conhead{width: 100%; height: 15%;  margin-bottom: 25px;}
	.conhead>h2{width: 30%;}
	.conhead>a{float: right; margin-top: -20px;}
	.table{width: 90%; margin: auto; text-align: center;}
	.item{width: 80%; margin: 0 auto; border: 1px solid;}
	.item img{width: 30%;}
	.item>p{width: 50%; float: right; padding-right: 30px; margin-right: 80px; text-align: left; font-size: 20px; font-weight: 800;}
</style>
</head>
<body>
	<table id="mainTable">
		<tr>
			<td colspan="2" style="height:200px;"><jsp:include page="mypageHeader.jsp" flush="false" /></td>
		</tr>
		
		<tr>
			<td id="mainSide"><jsp:include page="mypageSidebar.jsp" flush="false" /></td>
			<td id="mainContent">
				<div class="content">
				    <div class="content1">
				        <div class="conhead">
				            <h2>나의 클래스</h2>
				        </div>
				        <c:choose>
			        		<c:when test="${empty list}">
			        			<p>찜한 클래스가 없습니다</p>
			        			<button type="button" class="btn btn-lg">지금 찜하러 가기!</button>
			        		</c:when>
				        	<c:otherwise>
						        <c:forEach var="c" items="${list}">
						            <div class="item">
						            	<a><img src="${c.clImg}"></a>
						            	<input type="hidden" value="${c.clNo}">
						            	<p id="ctitle">
							            	<c:choose>
							            		<c:when test="${fn:length(c.clName) gt 25}">
							            			<c:out value="${fn:substring(c.clName, 0, 24)}"></c:out>
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
				</div>
			</td>
		</tr>
	</table>
</body>
</html>