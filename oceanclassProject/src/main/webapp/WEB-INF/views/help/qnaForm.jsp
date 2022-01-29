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
    	table{
    		width:80%; 
			margin:auto;
			margin-left: 100px;
			background-color: rgba(107, 171, 213, 0.38);
			margin-bottom: 20px;
		}
		table th{ width: 25%; padding:15px;}
		table td{
			text-align: left;
		}
		.bottom{margin-left: 150px;}
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
            <table>
                    <tr>
                        <th>카테고리*</th>
                        <td>
                            <select name="national">
                                <option value="c">클래스</option>
                                <option value="s">스토어</option>
                                <option value="e">기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th >제목*</th>
                        <td><textarea name="" id="" cols="50" rows="1" style="resize:none">환불되나요
                        </textarea></td>
                    </tr>
                    <tr>
                        <th>내용*</th>
                        <td><textarea name="" id="" cols="50" rows="10" style="resize:none">강의 3개 들었는데 환불되나욤
                        </textarea></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="file"></td>
                    </tr>
                    <tr>
                        <th colspan="2">비밀글입니다<input type="radio"> <input type="number" placeholder="비밀번호입력(4자리)"></th>
                    </tr>
            </table>
            <div class="button bottom">
                <button type="button" class="btn btn-outline-primary">등록</button>
                <button type="button" class="btn btn-outline-primary">취소</button>
            </div>
        </div>
        <div class="paging"></div>
    </div>

</body>
</html>