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
    <link rel="stylesheet" href="./resources/css/helpMain.css?1">
    
<style>
	.content>table{
		width: 80%; 
		margin:auto;
		background-color: rgba(107, 171, 213, 0.3);
		margin-bottom: 50px;
	}
	table th{ 
		width: 20%; 
		padding:15px; 
		padding-bottom: 10px;
		text-align: center;
	}
	table td{
		text-align: left;
	}
	.text{
		height: 300px;
		valign: middle;
	}
	.content>button{display: block; margin: auto; background: rgb(107, 171, 213);}
</style>
    
</head>
<body>

	<jsp:include page="../common/header.jsp" />
    <div class="innerOuter my-5">
        <div class="head">
            <p>공지사항</p>
        </div>
        <div class="content my-5">
            <table class="table table-bordered">
				<tr>
                    <th>제목</th>
                    <td colspan="3">${n.noTitle}</td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>${n.category}</td>
                    <th>작성날짜</th>
                    <td>${n.createDate}</td>
                </tr>
                <tr>
                    <th class="text">문의내용</th>
                    <td colspan="3" class="text">${n.noContent}</td>
                </tr>
            </table>
            <button type="button" class="btn" onclick="history.back()">목록으로</button>
        </div>
    </div>
</body>
</html>