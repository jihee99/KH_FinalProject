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
    .detail *{
        font-size: 17px;
    }
    .detail>tbody>tr{
        height: 45px;
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
        <button type="button" class="btn btn-info" style="background-color: #6babd5; width: 80px;">승인</button>
        <button type="button" class="btn" style="background-color: lightgray; width: 80px;" data-toggle="modal" data-target="#myModal">반려</button>
    </div>
    <br><br>

    <table class="detail">
        <tbody>
            <tr style="width: 1000px;">
                <th style="width: 200px;">클래스 카테고리</th>
                <td style="width: 800px;">요리</td>
            </tr>
            <tr>
                <th>클래스 명</th>
                <td>1조의 쿠킹교실</td>
            </tr>
            <tr>
                <th>클래스 설명</th>
                <td>
                    1조와 함께 쿠킹해요! 쿠키와 빵을 잘 만드는 방법!
                </td>
            </tr>
            <tr>
                <th>강사 아이디</th>
                <td>teacher01</td>
            </tr>
            <tr>
                <th>타이틀 이미지</th>
                <td style="text-decoration: underline;">파일명.jpg (719MB)</td>
            </tr>
            <tr>
                <th>클래스 소개 이미지</th>
                <td style="text-decoration: underline;">파일명.jpg (719MB)</td>
            </tr>
            <tr>
                <th>커리큘럼 이미지</th>
                <td style="text-decoration: underline;">파일명.jpg (719MB)</td>
            </tr>
            <tr>
                <th>클래스 가격</th>
                <td>최종 수강료 : 100,000원 (5개월 할부시 20,000원)</td>
            </tr>
            <tr>
                <th>준비물 키트 유무</th>
                <td>
                    <!-- 키트 유무에 따라 노출되는 div 다름-->
                    <div style="background-color: #6babd5; width: 100px; text-align: center; font-weight: bold; border-radius: 10px;">
                        키트 있음
                    </div>
                    <div style="background-color: lightgray; width: 100px; text-align: center; font-weight: bold; border-radius: 10px; display: none;">
                        키트 없음
                    </div>
                </td>
            </tr>
            <tr>
                <th>키트 소개 이미지</th>
                <td style="text-decoration: underline;">파일명.jpg (719MB)</td>
            </tr>
        </tbody>
    </table>

    <div id="pagingArea">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="">Previous</a></li>
            <li class="page-item"><a class="page-link" href="">목록</a></li>
            <li class="page-item"><a class="page-link" href="">Next</a></li>
        </ul>
    </div>

    <!-- 반려시 보여질 modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <form action="" method="post">
            <div class="modal-dialog">
        
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">반려 이유 작성</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <textarea style="width: 100%; height: 200px; resize: none;" placeholder="반려 이유를 작성해주세요."></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn" data-dismiss="modal" style="background-color: #6babd5;">작성</button>
                        <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>
                    </div>
                </div>
        
            </div>
        </form>
    </div>
</body>
</html>