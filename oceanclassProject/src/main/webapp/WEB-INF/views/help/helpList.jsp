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
	<link rel="stylesheet" href="./resources/css/helpMain.css?2">
</head>
<body>

	<jsp:include page="../common/header.jsp" />
    <div class="innerOuter my-3">
        <div class="head py-3">
            <p>HELP</p>
        </div>
        <div class="button my-3">
            <button type="button" class="btn btn-outline-primary">공지사항</button>
            <button type="button" class="btn btn-outline-primary">FAQ</button>
            <button type="button" class="btn btn-outline-primary">1:1문의</button>
        </div>
        <div class="content my-5">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th style="width:60%;">제목</th>
                        <th>작성날짜</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>공지사항 1</td>
                        <td>2022-01-27</td>
                        <td>421</td>
                    </tr>
                    <tr>
                        <td>공지사항 1</td>
                        <td>2022-01-27</td>
                        <td>421</td>
                    </tr>
                    <tr>
                        <td>공지사항 1</td>
                        <td>2022-01-27</td>
                        <td>421</td>
                    </tr>
                    <tr>
                        <td>공지사항 1</td>
                        <td>2022-01-27</td>
                        <td>421</td>
                    </tr>
                    <tr>
                        <td>공지사항 1</td>
                        <td>2022-01-27</td>
                        <td>421</td>
                    </tr>
                    <tr>
                        <td>공지사항 1</td>
                        <td>2022-01-27</td>
                        <td>421</td>
                    </tr>
                    <tr>
                        <td>공지사항 1</td>
                        <td>2022-01-27</td>
                        <td>421</td>
                    </tr>
                    <tr>
                        <td>공지사항 1</td>
                        <td>2022-01-27</td>
                        <td>421</td>
                    </tr>
                    <tr>
                        <td>공지사항 1</td>
                        <td>2022-01-27</td>
                        <td>421</td>
                    </tr>
                    <tr>
                        <td>공지사항 1</td>
                        <td>2022-01-27</td>
                        <td>421</td>
                    </tr>
                </tbody>
            </table>
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