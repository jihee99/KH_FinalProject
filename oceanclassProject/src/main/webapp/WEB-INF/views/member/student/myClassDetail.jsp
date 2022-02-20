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
	.conhead{
        width: 100%;
	    height: 15%;
	}
	.content1, .content2{
	    width: 100%;
	    height: 50%;
	}
	.conhead>h2{width: 30%;}
	.conhead>a{float: right; margin-top: -20px;}
	table{
	    width: 90%;
	    margin: auto;
	    text-align: center;
	}
</style>
</head>
<body>
	<div class="content">
	    <div class="content1">
	        <div class="conhead">
	            <h2>수강중인 클래스</h2>
	            <a>더보기</a>
	        </div>
	        <a>썸네일~~~~~</a>
	        <a>썸네일~~~~~</a>
	    </div>  
	    <div class="content2">
	        <div class="conhead">
	            <h2>나의 클래스 내역</h2>
	            <a>더보기</a>
	        </div>
	        <table class="table">
	            <thead>
	                <tr>
	                    <th>클래스</th>
	                    <th>상태</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>샤크코치의 근력운동</td>
	                    <td>수강중</td>
	                </tr>
	        </table>
	    </div> 
	</div>
</body>
</html>