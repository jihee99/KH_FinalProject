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
    <link rel="stylesheet" href="./resources/css/header.css?1">
    <link rel="stylesheet" href="./resources/css/eventMain.css?3">
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
    <div class="innerOuter my-3">
    	<hr class="my-2">
        <div class="head py-5">
            <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
        </div>
        <div class="tag"><p>#2022 #홀앙희 #왕크왕귀 #갓생살자!<p></div>
        <div class="content">
        	<img src="" alt="" style="width: 100%; height: 100%;">
        </div>
        <div class="reply">
        	<p>모니카</p><input type="text"><button class="btn btn-secondary">등록</button>
        	<table class="table">
	            <tr>
	                <td>아이키</td>
	                <td>이미 갓생사는 중인데 뭘 해야 하지? 흠..</td>
	            </tr>
	            <tr>
	                <td>리정</td>
	                <td>2022년에 xc90 꼭 뽑아야지!!</td>
	            </tr>
        	</table>
        </div>
    </div>    
	
	 <jsp:include page="../common/footerBar.jsp" />
	
</body>
</html>