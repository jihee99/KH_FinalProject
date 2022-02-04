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
    <link rel="stylesheet" href="./resources/css/eventMain.css?2">
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
    <div class="innerOuter my-3">
        <div class="head py-3">
            <p>EVENT</p>
        </div>
        <div class="button">
            <button type="button" class="btn btn-outline-primary">전체</button>
            <button type="button" class="btn btn-outline-primary">클래스</button>
            <button type="button" class="btn btn-outline-primary">스토어</button>
            <button type="button" class="btn btn-outline-primary">포인트</button>
            <button type="button" class="btn btn-outline-primary">댓글</button>
            <button type="button" class="btn btn-outline-primary">기타</button>
        </div>
        <div class="content">
            <div class="img">
                <img src="" alt="" style="width: 100%; height: 100%;">
                <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
            </div>
            <div class="img">
                <img src="" alt="" style="width: 100%; height: 100%;">
                <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
            </div>
            <div class="img">
                <img src="" alt="" style="width: 100%; height: 100%;">
                <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
            </div>
            <div class="img">
                <img src="" alt="" style="width: 100%; height: 100%;">
                <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
            </div>
            <div class="img">
                <img src="" alt="" style="width: 100%; height: 100%;">
                <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
            </div>
            <div class="img">
                <img src="" alt="" style="width: 100%; height: 100%;">
                <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
            </div>
        </div>
        
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
    
    <jsp:include page="../common/footerBar.jsp" />
    
</body>
</html>