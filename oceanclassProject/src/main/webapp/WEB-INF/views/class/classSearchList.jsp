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
	#outer{
		width: 1000px;
        margin:auto;
        margin-top: 50px;
	}
	.items{
        width: 100%;
        margin-top: 50px;
    }
    .items_title{
        font-size: 20px;
    }
    .item{
        width: 200px;
        margin-top: 20px;
        display: inline-block;
    }
    .item>span{
        font-size: 12px;
    }
    .item *{
        cursor:pointer;
    }
    .thumbnail{
        width: 100%;
        height: 200px;
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

	<jsp:include page="../common/header.jsp" />

	<div id="outer">
		<div id="selectBar" class="form-group">
			<select class="form-control" id="sel1" style="width: 15%; float: left; margin-right: 10px;">
				<option>개발&데이터</option>
				<option>드로잉</option>
				<option>사진&영상</option>
				<option>요리</option>
				<option>음악</option>
				<option>운동</option>
				<option>자기계발</option>
				<option>재태크</option>
				<option selected style="display: none;">카테고리</option>
			</select>

			<select id="order" class="form-control" id="sel1" style="width: 15%;">
				<option selected>인기순</option><!-- 구매수 높은 순 -->
				<option>추천순</option><!-- 찜수 높은 순 -->
				<option>최신순</option>
			</select>
		</div>

		<div class="items">
            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>
        </div>

        <div class="items">
            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>
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
		
	<jsp:include page="../common/footerBar.jsp" />

</body>
</html>