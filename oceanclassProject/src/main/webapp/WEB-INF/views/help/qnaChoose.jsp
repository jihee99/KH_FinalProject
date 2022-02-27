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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./resources/css/helpMain.css?1">
<style>
	.content{
		width: 80%;
		height: 300px;
		padding: 20px;
	}
	.content>p{
		width: 50%;
		height: 100%;
		float: left;
	}
	.bi{
		display: block;
		width: 22%;
		margin: 0 auto;
	}
	.content button{display: block; margin: 0 auto;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="innerOuter my-5">
        <div class="head py-3">
            <p>1:1문의</p>
        </div>
        <div class="content">
        	
        	<p><i class="bi bi-pencil-square align-middle" style="font-size: 5rem; color: gray;"></i><button type="button" class="btn" onclick="location.href='qnaList.he';">문의 등록</button></p>
        	
        	<p><i class="bi bi-chat-left-dots align-middle" style="font-size: 5rem; color: gray;"></i><button class="btn">실시간 상담</button></p>
        	
        </div>
        
    </div>

	<jsp:include page="../common/footerBar.jsp" />
	
</body>
</html>