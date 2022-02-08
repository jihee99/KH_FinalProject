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

            <div id="reviewZone">
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
                        <pre style="width:100%; height:150px;">
<img src="" width="200" height="100">
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
                        <span>댓글 0</span>
                        <span style="margin-left: 10px;">
                            <img src="resources/images/like.png" width="15" height="15">
                            0
                        </span>
                        <span style="float:right">신고하기</span>
                    </div>
                </div>
                <br>

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
                        <pre style="width:100%; height:150px;">
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
                        <span>댓글 0</span>
                        <span style="margin-left: 10px;">
                            <img src="resources/images/like.png" width="15" height="15">
                            0
                        </span>
                        <span style="float:right">신고하기</span>
                    </div>
                </div>
                <br>

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
                        <pre style="width:100%; height:150px;">
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
                        <span>댓글 0</span>
                        <span style="margin-left: 10px;">
                            <img src="resources/images/like.png" width="15" height="15">
                            0
                        </span>
                        <span style="float:right">신고하기</span>
                    </div>
                </div>
                <br>

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
        </div>

    </div>

    <script>

    </script>

</body>
</html>