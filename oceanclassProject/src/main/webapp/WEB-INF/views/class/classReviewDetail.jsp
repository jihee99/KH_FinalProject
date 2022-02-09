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
    .outer{
        width: 600px;
        height: 1100px;
        margin:auto;
        border: 1px solid black;
    }
    .outer>div{
        margin: 30px;
    }
    #pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}
</style>
</head>
<body>

    <div class="outer">
        <div>
            <div style="font-weight: bold; font-size: 17px;">실제 수강생 후기 전체 보기</div>
            <hr><br>

            <div class="reviewContent">
                <div class="profile">
                    <div style="float:left; margin-right: 10px;">
                        <img src="" width="50px" height="50px">
                    </div>
                    <div>
                        <div style="font-weight: bold;">김하나</div>
                        <div style="display: flex;">
                            <div style="margin-right: 5px;">
                                <img src="resources/images/star.png" width="12px" height="12px">
                                <img src="resources/images/star.png" width="12px" height="12px">
                                <img src="resources/images/star.png" width="12px" height="12px">
                                <img src="resources/images/star.png" width="12px" height="12px">
                                <img src="resources/images/star.png" width="12px" height="12px">
                            </div>
                            <div style="font-size: 13px; color: gray; line-height: 27px;">2022년 01월 01일</div>
                        </div>
                    </div>
                </div>

                <div class="reviewContent" style="margin-top: 10px;">
                    <pre style="width:100%; height: 500px;">
<img src="" width="500" height="300">
이것은리뷰내용입니다
길게길게 써보는중~
여러
줄
작
성
시
옆에 스크롤~
                    </pre>
                </div>

                <div class="reivewFooter" style="font-size: 13px;">
                    <button type="button" class="btn" style="background-color: lightgray; margin-bottom: 5px; height:30px; line-height: 15px;">
                        <img src="resources/images/like.png" width="20" height="20">
                        <span style="font-size: 13px;">
                            도움이 됐어요
                        </span>
                    </button>
                    <span style="margin-left:5px;">0명에게 도움이 되었어요!</span>
                    <br>
                    <span>댓글 1</span>
                    <span style="float:right">신고하기</span>
                </div>
            </div>
            <br>

            <div class="reply">
                <div class="inputArea">
                    <img src="resources/images/reply2.png" width="40px" height="40px" style="margin-bottom: 5px;">
                    <input type="text" class="form-control" style="width: 400px; display: inline-block;" placeholder="댓글 내용을 입력해주세요.">
                    <button type="button" class="btn" style="background-color: #6babd5; width: 80px; color: white; margin-bottom: 5px;">등록</button>
                </div>

                <div class="viewArea" style="margin-top: 10px;">
                    <div class="profile">
                        <div style="float:left; margin-right: 10px;">
                            <img src="" width="30px" height="30px">
                        </div>
                        <div style="line-height: 30px;">
                            <span style="font-size: 15px;">김댓글</span>
                            <span style="font-size: 12px; color: gray;">2022년 01월 01일</span>
                        </div>
                    </div>

                    <div class="replyContent" style="margin-top: 10px;">
                        <pre>
댓글 내용 들어가는 자리
댓글댓글
댓
글!
                        </pre>
                    </div>
                </div>
            </div>

            <div id="pagingArea">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="">목록</a></li>
                    <li class="page-item"><a class="page-link" href="">Next</a></li>
                </ul>
            </div>
        </div>

    </div>

</body>
</html>