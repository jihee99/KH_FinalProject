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
	.contentq{width:100%; padding: 20px;}
    #qna{
        width: 100%;
        text-align: center;
        margin-top: 30px;
    }
    #mainTable #content{vertical-align: top;}
</style>
</head>
<body>

	<div class="contentq">
    <h2>1:1 문의 내역</h2>
    <div class="searchBar">
        <p>기간검색</p>
        <button>1주일</button>
        <button>15일</button>
        <button>1개월</button>
        <div id="search">
            <select name="type" id="type">
                <option value="title">제목</option>
                <option value="value">분류</option>
            </select>
            <input type="text">
            <button>검색</button>
        </div>
    </div>
    <table id="qna">
        <thead>
            <tr>
                <th>날짜</th>
                <th>분류</th>
                <th>제목</th>
                <th>답변유무</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>22/01/13</td>
                <td>클래스</td>
                <td>수강 도중 환불 가능한가요?</td>
                <td>답변</td>
            </tr>
            <tr>
                <td>22/01/13</td>
                <td>클래스</td>
                <td>수강 도중 환불 가능한가요?</td>
                <td>답변</td>
            </tr>
            <tr>
                <td>22/01/13</td>
                <td>클래스</td>
                <td>수강 도중 환불 가능한가요?</td>
                <td>답변</td>
            </tr>
            <tr>
                <td>22/01/13</td>
                <td>클래스</td>
                <td>수강 도중 환불 가능한가요?</td>
                <td>답변</td>
            </tr>
            <tr>
                <td>22/01/13</td>
                <td>클래스</td>
                <td>수강 도중 환불 가능한가요?</td>
                <td>답변</td>
            </tr>
        </tbody>
    </table>
</div>

</body>
</html>