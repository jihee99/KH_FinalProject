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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./resources/css/stuMypage.css?1">
<style>
	.searchBar>div{float:left; width: 35%; margin:0 auto; padding: 10px; margin-top: 15px;}
	.searchBar .bi{float: left; width: 20px; margin-top: -10px;}
	.searchBar p{
		float: left;
		font-size:24px; 
		width: 100px;
		margin: 0 auto;
		margin-left: 30px;
	}
	#point{margin-left: 180px;}
	.conhead{
        width: 100%;
	    height: 15%;
	}
	.content1{
	    width: 100%;
	    height: 40%;
	    margin-top: 50px;
	}
	.conhead>h2{width: 30%;}
	.conhead>a{
		float: right; 
		margin-top: -20px; 
		text-decoration: none;
		color: black;	
	}
	.table{
		width:100%;
		margin-top: 30px;
		text-align: center;
	}
	.content1>p{
		font-size: 20px;
		text-align: center;
		font-weight: bolder;
		margin-top: 50px;
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
				    <h2>나의 포인트/쿠폰</h2>
				 
					    <div class="searchBar">
					    	<div id="point">
					        	<i class="bi bi-coin" style="font-size: 2.5rem;"></i> 
					        	<p style="width: 200px;">포인트 100p</p>
					        </div>
					        <div id="content">
						        <i class="bi bi-cash" style="font-size: 2.5rem;"></i> 
						        <p>
						        	쿠폰 <a href="#" onclick="openModal();">${couponCount}</a>장
						        </p>
					        </div>
					    </div>
					    <div class="content1">
					    	<div class="conhead">
						    	<h3> 적립내역 </h3>
							    <a href="?page=myPointPlusDetail.jsp">더보기</a>
						    </div>
						    <table class="table">
						        <thead>
						            <tr>
						                <th>날짜</th>
						                <th>내역</th>
						                <th>사유</th>
						                <th>금액</th>
						                <th>유효기간</th>
						            </tr>
						        </thead>
								   <tbody>
								          
								   </tbody>
						    </table>
					    </div>
				    <!-- 사용내역 없을 경우 -->
				    <div class="content1">
					    <h3> 사용내역 </h3>
					    <p> 사용내역이 없습니다 </p>
			    	</div>
				</div>

			</td>
		</tr>
	</table>
	
	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
			 	<div class="modal-header">
			     	<h5 class="modal-title">쿠폰 내역</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         				<span aria-hidden="true">&times;</span>
        			</button>
		     	</div>
				<div class="modal-body">
					<table class="table">
				        <thead>
				            <tr>
				                <th>날짜</th>
				                <th>내역</th>
				                <th>사유</th>
				                <th>금액</th>
				                <th>유효기간</th>
				            </tr>
				        </thead>
						   <tbody>
						        <c:forEach var="c" items="${ list }" >
						            <tr>
						                <td>${c.endate}</td>
						                <td>쿠폰지급</td>
						                <td>이벤트</td>
						                <td>${c.discount}% 할인</td>
						                <td>${c.dedate}</td>
						            </tr>
						        </c:forEach>    
						   </tbody>
					</table>
				</div>
			 </div>
		</div>
	</div>
	
	<script>
		function openModal(){
			$(".modal").modal();
		}
	</script>

</body>
</html>