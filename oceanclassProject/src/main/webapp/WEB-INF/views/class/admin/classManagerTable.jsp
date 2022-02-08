<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .classList{
        width: 1000px;
        margin: auto;
    }
    .classList th, .classList td{
        text-align: center;
    }
    #pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 150px;
		margin-bottom: 50px;
	}
</style>
</head>
<body>
    <div>
        <div align="right">
            <select style="width:150px; height: 30px;">
                <option selected>최신 등록순</option>
                <option>오래된 등록순</option>
            </select>
        </div>
        <br>

        <div>
            <button type="button" class="btn btn-info" style="background-color: #6babd5; width: 130px;">클래스 노출</button>
            <button type="button" class="btn" style="background-color: lightgray; width: 130px;">클래스 미노출</button>
            <div style="float: right;">
                <input type="checkbox" id="yClass" checked>
                <label for="yClass"> 노출 클래스</label>
                <input type="checkbox" id="nClass" checked>
                <label for="nClass"> 미노출 클래스</label>
            </div>
        </div>
        <br>
    </div>

    <div>
        <table id="classList" class="table table-hover classList">
            <thead>
                <tr style="background-color: #6babd5;">
                    <th><input type="checkbox"></th>
                    <th width="130">클래스번호</th>
                    <th width="120">카테고리</th>
                    <th width="250">클래스명</thw>
                    <th width="200">강사명</th>
                    <th width="100">가격</th>
                    <th width="100">등록일</th>
                    <th width="100">노출여부</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>3333</td>
                    <td>개발&데이터</td>
                    <td>클래스명한번좀길게써보겠습니다길게길게</td>
                    <td>강사명도길게한번</td>
                    <td>9,999,999</td>
                    <td>22-01-05</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>3332</td>
                    <td>드로잉</td>
                    <td>클래스명1</td>
                    <td>강사명1</td>
                    <td>12,000</td>
                    <td>22-01-04</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>3331</td>
                    <td>드로잉</td>
                    <td>클래스명1</td>
                    <td>강사명1</td>
                    <td>12,000</td>
                    <td>22-01-03</td>
                    <td>Y</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="pagingArea">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="">Previous</a></li>
    
            <li class="page-item"><a class="page-link" href="">1</a></li>
            <li class="page-item"><a class="page-link" href="">2</a></li>
            <li class="page-item"><a class="page-link" href="">3</a></li>

            <li class="page-item"><a class="page-link" href="">Next</a></li>
        </ul>
    </div>

</body>
</html>