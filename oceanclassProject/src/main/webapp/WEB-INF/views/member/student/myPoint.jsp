<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.searchBar{margin-bottom: 50px;}
	.searchBar>p{
		margin: 0 auto;
		font-size:28px; 
		padding-left: 100px; 
		padding-right: 100px;
		width: 50%;
	}
	.conhead{
        width: 100%;
	    height: 15%;
	}
	.content1{
	    width: 100%;
	    height: 40%;
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

	<div class="content">
	    <h2>나의 포인트/쿠폰</h2>
	    <div class="searchBar">
	        <p style="text-align: right;"> <i class="bi bi-coin" style="font-size: 2.5rem;"></i> 포인트 100p</p>
	        <p style="text-align: left;"> <i class="bi bi-cash" style="font-size: 2.5rem;"></i> 쿠폰 1장</p>
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
		            <tr>
		                <td>22/01/13</td>
		                <td>포인트 적립</td>
		                <td>상품 구매</td>
		                <td>+100</td>
		                <td>2022/07/12</td>
		            </tr>
		            <tr>
		                <td>22/01/07</td>
		                <td>쿠폰 적립</td>
		                <td>이벤트 당첨</td>
		                <td>1000원 할인</td>
		                <td>2023/01/06</td>
		            </tr>
		        </tbody>
		    </table>
	    </div>
	    
	    <!-- 사용내역 없을 경우 -->
	    <div class="content1">
		    <h3> 사용내역 </h3>
		    <p> 사용내역이 없습니다 </p>
    	</div>
	</div>

</body>
</html>