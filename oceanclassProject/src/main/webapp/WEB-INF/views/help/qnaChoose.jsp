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
    <link rel="stylesheet" href="./resources/css/helpMain.css">
<style>
	.content{
		width: 80%;
		height: 600px;
		padding: 30px;
		border: 1px solid;
	}
	.content>button{margin: 100px; }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="innerOuter my-3">
        <div class="head py-3">
            <p>1:1문의</p>
        </div>
        <div class="content">
        	
        	<i class="bi bi-pencil-square" style="border: 1px solid; font-size: 5rem;"></i>
        	<i class="bi bi-chat-dots" style="font-size: 5rem;"></i>
        	<button type="button" class="btn btn-outline-primary" onclick="location.href='qnaList.he';">문의 등록</button>
        	<button class="btn btn-info">실시간 상담</button>
        	
        </div>
        
    </div>

	<jsp:include page="../common/footerBar.jsp" />
	
</body>
</html>