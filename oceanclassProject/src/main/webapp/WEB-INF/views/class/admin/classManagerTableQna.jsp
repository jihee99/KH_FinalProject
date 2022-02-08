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
    #pagingAreaQna{
		width:fit-content;
		margin:auto;
		margin-top: 50px;
	}
</style>
</head>
<body>
    <div>
        <button type="button" class="btn" style="background-color: #6babd5; width: 130px; color: white;">문의 노출</button>
        <button type="button" class="btn" style="background-color: lightgray; width: 130px;">문의 미노출</button>

        <div style="float: right;">
            <select style="width:100px; height: 30px;">
                <option selected>문의번호</option>
                <option>작성자</option>
                <option>내용</option>
            </select>
            <input type="text" style="width: 200px" placeholder="검색어 입력">
            <img src="resources/images/search.png" style="width: 23px; height: 23px;">
        </div>

        <span style="float: right; margin-right: 20px;">
            <select style="width:150px; height: 30px;">
                <option selected>등록일 빠른순</option>
                <option>등록일 느린순</option>
            </select>
        </span>
    </div>
    <br>

    <div>
        <table id="classList" class="table table-hover classList">
            <thead>
                <tr style="background-color: #6babd5;">
                    <th width="30"><input type="checkbox"></th>
                    <th width="100">문의번호</th>
                    <th width="150">작성자</th>
                    <th width="520">내용</thw>
                    <th width="100">등록일</th>
                    <th width="100">노출여부</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>103</td>
                    <td>작성자닉네임</td>
                    <td>가격이 얼마인가요?</td>
                    <td>22-01-05</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>102</td>
                    <td>작성자닉네임</td>
                    <td>가격이 얼마인가요?</td>
                    <td>22-01-05</td>
                    <td>Y</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>101</td>
                    <td>작성자닉네임</td>
                    <td>가격이 얼마인가요?</td>
                    <td>22-01-05</td>
                    <td>Y</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="pagingAreaQna">
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