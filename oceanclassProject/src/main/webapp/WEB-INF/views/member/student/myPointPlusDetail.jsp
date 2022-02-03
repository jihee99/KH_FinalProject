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
	.conhead{margin-bottom: 70px;}
	.table{
		width:100%;
		margin-top: 30px;
		text-align: center;
	}
	.paging{margin-top: 70px;}
</style>
</head>
<body>

	<div class="content">
		<div class="conhead">
	    	<h2>적립내역</h2>
	    </div>
	    <table class="table">
	        <thead>
	            <tr>
	                <th>날짜</th>
	                <th>사유</th>
	                <th>금액</th>
	                <th>유효기간</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td>22/01/13</td>
	                <td>상품 구매</td>
	                <td>+100</td>
	                <td>2022/07/12</td>
	            </tr>
	            <tr>
	                <td>22/01/07</td>
	                <td>이벤트 당첨</td>
	                <td>1000원 할인</td>
	                <td>2023/01/06</td>
	            </tr>
	            <tr>
	                <td>22/01/13</td>
	                <td>상품 구매</td>
	                <td>+100</td>
	                <td>2022/07/12</td>
	            </tr>
	            <tr>
	                <td>22/01/07</td>
	                <td>이벤트 당첨</td>
	                <td>1000원 할인</td>
	                <td>2023/01/06</td>
	            </tr><tr>
	                <td>22/01/13</td>
	                <td>상품 구매</td>
	                <td>+100</td>
	                <td>2022/07/12</td>
	            </tr>
	            <tr>
	                <td>22/01/07</td>
	                <td>이벤트 당첨</td>
	                <td>1000원 할인</td>
	                <td>2023/01/06</td>
	            </tr><tr>
	                <td>22/01/13</td>
	                <td>상품 구매</td>
	                <td>+100</td>
	                <td>2022/07/12</td>
	            </tr>
	            <tr>
	                <td>22/01/07</td>
	                <td>이벤트 당첨</td>
	                <td>1000원 할인</td>
	                <td>2023/01/06</td>
	            </tr>
	        </tbody>
	    </table>
	    
	    <div class="paging" align="center">
			<button class="btn btn-light">&lt;</button>
			
			<button class="btn btn-light">1</button>
			<button class="btn btn-light">2</button>
			<button class="btn btn-light">3</button>
			<button class="btn btn-light">4</button>
			<button class="btn btn-light">5</button>
			
			<button class="btn btn-light">&gt;</button>
		</div>
		
	</div>

</body>
</html>