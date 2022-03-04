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
	    margin-bottom: 80px;
	}
	.conhead{width: 100%; height: 15%;  margin-bottom: 25px;}
	.conhead>h2{width: 30%;}
	.conhead>a{float: right; margin-top: -20px;}
	.table{width: 90%; margin: auto; text-align: center;}
	.item{width: 85%; margin: 0 auto; margin-bottom: 20px; border: 1px solid lightgray;}
	.item img{width: 20%; height: 100px;}
	.item>p{width: 73%; float: right; margin-right: 40px; margin-top: 30px; text-align: left; font-size: 20px; font-weight: 600;}
	.all{display: block; margin: 0 auto; margin-top: 20px; margin-bottom: 20px;}
	.content1 a{text-decoration: none; color: black;}
	.content1>p{
    	text-align: center;
    	font-size : 24px;
    	font-weight: 800;
    	padding: 30px;
    	margin-top: 50px;
    	margin-bottom: 50px;
    }
    .content1>button{
    	display: block; 
    	margin: 0 auto;
    	background-color: rgb(107, 171, 213, 0.2);
    	font-sixe: 20px;
    	font-weight: 800;
    	width: 300px;
    }
	.content1>button{display: block; margin: 0 auto; margin-top: 20px; margin-bottom: 20px;}
	.content1 a{text-decoration: none; color: black;}
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
			        			<p>수강중인 클래스가 없습니다</p>
			        			<button type="button" class="btn btn-lg" onclick="moveClass();">클래스 구경가기!</button>
			        		</c:when>
				        	<c:otherwise>
						        <c:forEach var="c" items="${list}" begin="0" end="2">
						            <div class="item">
						            	<a><img src="${c.clImg}"></a>
						            	<input type="hidden" value="${c.clNo}">
						            	<p id="ctitle">
						            		[${c.category}]
							            	<c:choose>
							            		<c:when test="${fn:length(c.clName) gt 22}">
							            			<c:out value="${fn:substring(c.clName, 0, 21)}"></c:out>
							            			..
							            		</c:when>
							            		<c:otherwise>
							            			<c:out value="${c.clName}"></c:out>
							            		</c:otherwise>
							            	</c:choose>
						            	</p>
						            </div>
					            </c:forEach>
					            <button type="button" class="btn" onclick="myAllClass();">수강중 강의 전체 보기</button>  
					    	</c:otherwise>			        
				        </c:choose>    
				    </div>
				    
				    <script>
				    	function moveClass(){
				    		location.href="home.me";
				    	}
				    
				    	function myAllClass(){
				    		location.href='myIngClass.me';
				    	}
				    </script>
				    
				    <div class="content1">
				    	<c:choose>
					    	<c:when test="${empty list}">
					        	<div class="conhead">
						            <h2>나의 클래스 내역</h2>
						            <p style="text-align: center; font-size : 24px; margin-top: 80px; font-weight: 800;">클래스 내역이 없습니다</p>
						        </div>
					        </c:when>
					        <c:otherwise>
					        	<div class="conhead">
						            <h2>나의 클래스 내역</h2>
						            <a href="myAllClass.me">더보기</a>
						        </div>
						        <table class="table">
						            <thead>
						                <tr>	
						                	<th>카테고리</th>
						                    <th>클래스</th>
						                    <th>상태</th>
						                </tr>
						            </thead>
						            <tbody>
					        			<c:forEach var="co" items="${allList}" begin="0" end="3">
							                <tr>
							                	<td>${co.category}</td>
							                    <td>
							                    	<c:choose>
									            		<c:when test="${fn:length(co.clName) gt 21}">
									            			<c:out value="${fn:substring(co.clName, 0, 20)}"></c:out>
									            			..
									            		</c:when>
									            		<c:otherwise>
									            			<c:out value="${co.clName}"></c:out>
									            		</c:otherwise>
									            	</c:choose>
									            </td>
									            <td>${co.readingCheck}</td>
							                </tr>
							            </c:forEach>
				           			 </tbody>
				        		</table>
				        	</c:otherwise>
					    </c:choose>    
				    </div> 
				</div>
			</td>
		</tr>
	</table>
</body>
</html>