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
		.table{
			width:80%; 
			margin:auto;
			margin-left: 100px;
			background-color: rgba(107, 171, 213, 0.38);
			margin-bottom: 20px;
		}
		table th{ 
			width: 25%; 
			padding:15px; 
			padding-bottom: 10px;
			}
		table td{
			text-align: left;
		}
		.bottom{margin-left: 150px;}
		#back{ margin-left: 380px;}
    </style>
    
</head>
<body>

	<jsp:include page="../common/header.jsp" />
    <div class="wrapper my-5">
        <div class="head py-3">
            <p><h2>HELP</h2></p>
        </div>
        <div class="button my-3">
            <button type="button" class="btn btn-outline-primary">공지사항</button>
            <button type="button" class="btn btn-outline-primary">FAQ</button>
            <button type="button" class="btn btn-outline-primary">1:1문의</button>
        </div>
        <div class="content my-5">
            <table class="table table-bordered">
                    <tr>
                        <th>제목</th>
                        <td>공지1입니다</td>
                    </tr>
                    <tr>
                        <th >작성날짜</th>
                        <td>2022-01-01</td>
                    </tr>
                    <tr>
                        <th >조회수</th>
                        <td>270</td>
                    </tr>
                    <tr>
                        <th>문의내용</th>
                        <td><textarea name="" id="" cols="50" rows="10">내용웅앵웅~</textarea></td>
                    </tr>
            </table>
            <button type="button" class="btn btn-primary" id="back">목록으로</button>
        </div>
        <div class="paging"></div>
    </div>
</body>
</html>