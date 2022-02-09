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
	h4{color: gray; font-weight: bolder; margin-bottom: 25px;}
</style>
</head>
<body>
	<div class="content">
		<div class="content1">
		    <div class="conhead">
		        <h2>상품 문의</h2>
		        <a href="?page=myShoppingQnaDetail.jsp">더보기</a>
		    </div>
		    <table class="table">
		        <thead>
		            <tr>
		                <th>상품</th>
		                <th>내용</th>
		                <th>답변상태</th>
		            </tr>
		        </thead>
		        <tbody>
		            <tr>
		                <td>갤럭시Z-FLIP3 라벤더 색상 자급제..</td>
		                <td>퀵으로 배송 받을 수 있나요?..</td>
		                <td>답변완료</td>
		            </tr>
		            <tr>
		                <td>갤럭시Z FLIP 라벤더 색상 자급제..</td>
		                <td>퀵으로 배송 받을 수 있나요?..</td>
		                <td>답변완료</td>
		            </tr>
		            <tr>
		                <td>갤럭시Z FLIP 라벤더 색상 자급제..</td>
		                <td>퀵으로 배송 받을 수 있나요?..</td>
		                <td>답변완료</td>
		            </tr>
		        </tbody>
		    </table>
		</div>  
		<div class="content1">
		    <div class="conhead">
		        <h2>상품 후기</h2>
		        <a href="?page=myShoppingReviewDetail.jsp">더보기</a>
		    </div>
		    <!-- 후기 있을 경우 -->
		    <table class="table">
		        <thead>
		            <tr>
		                <th>상품</th>
		                <th>내용</th>
		                <th>날짜</th>
		            </tr>
		        </thead>
		        <tbody>
		            <tr>
		                <td>갤럭시Z FLIP 라벤더 색상 자급제..</td>
		                <td>역시 다른건 다 필요없고 이쁜게 진리인..</td>
		                <td>2021-02-10</td>
		            </tr>
		            <tr>
		                <td>갤럭시Z FLIP 라벤더 색상 자급제..</td>
		                <td>역시 다른건 다 필요없고 이쁜게 진리인..</td>
		                <td>2021-02-10</td>
		            </tr>
		            <tr>
		                <td>갤럭시Z FLIP 라벤더 색상 자급제..</td>
		                <td>역시 다른건 다 필요없고 이쁜게 진리인..</td>
		                <td>2021-02-10</td>
		            </tr>
		        </tbody>
		    </table>
		    
		    <!-- 후기 없을 경우  -->
		    <h4>등록한 후기가 없습니다.</h4>
		    <button class="btn btn-info">후기 등록하고 포인트 받기!</button>
		</div> 
	</div>

</body>
</html>