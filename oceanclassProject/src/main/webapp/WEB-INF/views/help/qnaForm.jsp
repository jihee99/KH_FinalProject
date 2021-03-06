<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		table th, table td{padding: 15px;}
		table td{
			width: 85%;
			text-align: left;
		}
		.button{margin-left: 140px; margin-top: 70px;}
    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
    <div class="innerOuter my-5">
        <div class="head py-3">
            <p>1:1 문의 작성</p>
        </div>
        <div class="content my-5">
        	<form id="enrollQna" method="post" action="insertQna.he"> 
				<input type="hidden" id="memNo" name="memNo" value="${loginUser.memNo}">
				<input type="hidden" id="nickName" name="nickName" value="${loginUser.nickName}">
				<table>
					<tr>
					    <th><label for="category">*카테고리</label></th>
					    <td>
					        <select name="category">
					            <option value="C">클래스</option>
					            <option value="S">스토어</option>
					            <option value="E">기타</option>
					        </select>
					    </td>
                    </tr>
					<tr>
                        <th><label for="title">*제목</label></th>
                        <td><input type="text" id="qnaTitle" class="form-control" name="qnaTitle" required></td>
                    </tr>
					<tr>
                        <th><label for="content">*내용</label></th>
                        <td><textarea id="qnaContent" class="form-control" required name="qnaContent" rows="10" style="resize:none;"></textarea></td>
                    </tr>
					<tr>
						<th>비밀글 <input type="checkbox"></th>
						<td><input type="password" id="pwd" class="form-control-sm" name="pwd" placeholder="비밀번호입력(4자리)"></td>
					</tr>
				</table>	
				
				<div class="button">
	                <button type="submit" class="btn">등록</button>
	                <button type="reset" class="btn">취소</button>
            	</div>
        	</form>
        </div>
    </div>
	<jsp:include page="../common/footerBar.jsp" />
</body>
</html>