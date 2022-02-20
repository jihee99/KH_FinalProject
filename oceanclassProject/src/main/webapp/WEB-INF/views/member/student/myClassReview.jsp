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
    <link rel="stylesheet" href="./resources/css/stuMypage.css?second">
<style>
	.conhead{
        width: 100%;
	    height: 15%;
	}
	.content1{
	    width: 100%;
	    height: 50%;
	}
	.conhead>h2{width: 30%;}
	.conhead>a{
		float: right; 
		margin-top: -20px; 
		text-decoration: none;
		color: black;	
	}
	table{
	    width: 90%;
	    margin: auto;
	    text-align: center;
	}
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
					        <h2>클래스 문의</h2>
					        <a href="?page=myClassQnaDetail.jsp">더보기</a>
					    </div>
					    <table class="table">
					        <thead>
					            <tr>
					                <th>클래스</th>
					                <th>문의날짜</th>
					                <th>답변상태</th>
					            </tr>
					        </thead>
					        <tbody>
					            <tr>
					                <td>여자의 힘은 여자가 기른다! 샤크코치의 근력 운동!</td>
					                <td>2022-01-02</td>
					                <td>답변완료</td>
					            </tr>
					        </tbody>
					    </table>
					</div>  
					<div class="content1">
					    <div class="conhead">
					        <h2>클래스 리뷰</h2>
					        <a href="myClassReviewDetail.me">더보기</a>
					    </div>
					    <table class="table">
					        <thead>
					            <tr>
					                <th>클래스</th>
					                <th>리뷰</th>
					            </tr>
					        </thead>
					        <tbody>
					        	<c:choose>
					        		<c:when test="${empty list}">
					        			<p>등록된 리뷰가 없습니다</p>
					        		</c:when>
					        		<c:otherwise>
					        			<c:forEach var="c" items="${list}" begin="0" end="4">
								            <tr>
								                <td>${c.clName}</td>
								                <td>
									                <c:choose>
								            		<c:when test="${fn:length(c.content) gt 25}">
								            			<c:out value="${fn:substring(c.content, 0, 24)}"></c:out>
								            			..
								            		</c:when>
								            		<c:otherwise>
								            			<c:out value="${c.content}"></c:out>
								            		</c:otherwise>
									            	</c:choose>
								                </td>
								            </tr>
							            </c:forEach>
					        		</c:otherwise>
					        	</c:choose>
					        </tbody>
					    </table>
					    
					 </div> 
			  	</div>
			</td>
		</tr>
	</table>

</body>
</html>