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
	    margin-bottom: 40px;
	}
	.conhead{width: 100%; height: 15%;  margin-bottom: 25px;}
	.conhead>h2{width: 30%;}
	.conhead>a{float: right; margin-top: -20px;}
	.table{width: 90%; margin: auto; text-align: center;}
	.item{width: 80%; height: 100px; margin: 0 auto; margin-bottom: 20px; border: 1px solid lightgray;}
	.item img{width: 22%; height: 100px;}
	#ctitle{width: 74%; height: 30px; float: right; margin-right: 25px; margin-top: 10px; text-align: left; font-size: 20px; font-weight: 800; overflow: hidden; text-overflow: ellipsis;}
	#status{width: 70%; height: 30px; float: right; margin-right: 50px; margin-top: -50px;}
	#status>span{font-size: 18px; margin-left: 10px;}
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
				        <c:forEach var="c" items="${list}">
				            <div class="item">
				            	<a><img src="${c.clImg}"></a>
				            	<input type="hidden" value="${c.clNo}">
				            	<p id="ctitle">
				            		[${c.category}]
					            	${c.clName}
				            	</p>
				            	<p id="status">
				            		<c:choose>
				            			<c:when test="${c.readingCheck eq '수강중'}">
				            				<span class="badge bg-primary"><c:out value="${c.readingCheck}"/> </span>
				            			</c:when>
				            			<c:when test="${c.readingCheck eq '수강전'}">
				            				<span class="badge bg-warning"><c:out value="${c.readingCheck}"/> </span>
				            			</c:when>
				            			<c:otherwise>
				            				<span class="badge bg-secondary"><c:out value="${c.readingCheck}"/> </span>
				            			</c:otherwise>
				            		</c:choose>
				            	</p>
				            </div>
			            </c:forEach>
				    </div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>