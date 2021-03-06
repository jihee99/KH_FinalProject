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
	.content1{width: 100%; margin-bottom: 40px;}
	.conhead{width: 100%; height: 15%;  margin-bottom: 25px;}
	.conhead>h2{width: 30%;}
	.conhead>a{float: right; margin-top: -20px;}
	.table{width: 100%; margin: auto; text-align: center;}
	.item{width: 800px; height: 100px; margin: 0 auto; margin-bottom: 20px; border: 1px solid lightgray; display: flex;}
	.item img{width: 200px; height: 100px;}
	.item>p{width: 450px; float: right; margin-right: 25px; margin-top: 30px; padding-left: 10px; text-align: left; font-size: 20px; font-weight: 800;}
	.item>button{width: 150px; height: 50px; margin-top: 25px;}
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
				            	<p id="ctitle">
				            		[${c.category}]
					            	<c:choose>
					            		<c:when test="${fn:length(c.clName) gt 30}">
					            			<c:out value="${fn:substring(c.clName, 0, 29)}"></c:out>
					            			..
					            		</c:when>
					            		<c:otherwise>
					            			<c:out value="${c.clName}" />
					            		</c:otherwise>
					            	</c:choose>
				            	</p>
				            	<input type="hidden" id="clNo" value="${c.clNo}">
				            	<button type="button" class="btn btn-info" onclick="playVideo();">수강하기</button>
				            </div>
			            </c:forEach>
				    </div>
				</div>
			</td>
		</tr>
	</table>
	
	<script>
		function playVideo(){
			let clNo = $("#clNo").val();
			console.log(clNo);
			location.href='playVideo.me?clNo=' + clNo;
		}
	</script>
</body>
</html>