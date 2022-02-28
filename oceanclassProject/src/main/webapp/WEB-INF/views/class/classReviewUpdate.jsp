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
        /*height: 1100px;*/
        margin:auto;
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
            <div style="font-weight: bold; font-size: 17px; color: #6babd5;">리뷰 수정하기</div>
            <hr>
            <img src="resources/images/back.png" width="20" height="20" onclick="location.href='classReviewList.me?cpage=${ returnPage }&clNo=${ reviewClNo }'" style="cursor:pointer;">
			<br><br>
			
            <div class="reviewContent">
                <div class="profile">
                    <div style="float:left; margin-right: 10px;">
                       <c:choose>
                      		<c:when test="${ !empty cr.profile }">
                           		<img src="${ cr.profile }" width="40px" height="40px">
                      		</c:when>
                      		<c:otherwise>
                           		<img src="resources/images/user.png" width="40px" height="40px">
                      		</c:otherwise>
                      	</c:choose> 
                    </div>
                    <div>
                    	<c:if test="${ loginUser.nickName == cr.memNo }">
	               	    	<div style="float:right;">
		                    	<button type="button" onclick="updateReview(${cr.crNo}, ${reviewClNo}, ${returnPage}, ${ loginUser.memNo })" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">수정</button>
		                    	<button type="button" onclick="deleteReview(${cr.crNo}, ${reviewClNo}, ${returnPage});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
	                    	</div>
                    	</c:if>
                        <div style="font-weight: bold;">${ cr.memNo }</div>
                        <div style="display: flex;">
                            <div style="margin-right: 5px;">
                                <img src="resources/images/star.png" width="12px" height="12px">
                                <c:choose>
                                	<c:when test="${ 1.0 <= cr.star && cr.star < 1.5 }">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 1.5 <= cr.star && cr.star < 2.0  }">
										<img src="resources/images/star3.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 2.0 <= cr.star && cr.star < 2.5 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 2.5 <= cr.star && cr.star < 3.0 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star3.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 3.0 <= cr.star && cr.star < 3.5 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 3.5 <= cr.star && cr.star < 4.0 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star3.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 4.0 <= cr.star && cr.star < 4.5 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 4.5 <= cr.star && cr.star < 5.0 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star3.png" width="12px" height="12px">
									</c:when>
									<c:otherwise>
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
									</c:otherwise>
                                </c:choose>
                            </div>
                            <div style="font-size: 13px; color: gray; line-height: 27px;">${ cr.createDate }</div>
                        </div>
                    </div>
                </div>

                <div class="reviewContent" style="margin-top: 10px; margin-bottom:50px;">
                    <pre style="width:100%; white-space: pre-wrap;">
                    <c:if test="${ !empty cr.filePath }">
<img src="${ cr.filePath }" width="400">
					</c:if>
${ cr.content }
                    </pre>
                </div>

                <div class="reivewFooter" style="font-size: 13px;">
                <c:choose>
                	<c:when test="${ recoCk == 'Y' && !empty loginUser}">
        			    <button type="button" id="recommendBtn" onclick="recommendCk();" class="btn" style="background-color: #6babd5; margin-bottom: 5px; height:30px; line-height: 15px; color: white;">
	                        <img src="resources/images/like.png" width="20" height="20">
	                        <span style="font-size: 13px;">도움이 됐어요</span>
	                    </button>
                	</c:when>
                	<c:otherwise>
	                    <button type="button" id="recommendBtn" onclick="recommendCk();" class="btn" style="background-color: lightgray; margin-bottom: 5px; height:30px; line-height: 15px;">
	                        <img src="resources/images/like.png" width="20" height="20">
	                        <span style="font-size: 13px;">도움이 됐어요</span>
	                    </button>
                	</c:otherwise>
                </c:choose>
                    <span style="margin-left:5px;">${ cr.recommend }명에게 도움이 되었어요!</span>
                    <br><br>
                    <span>
                    	댓글 ${ cr.replyNum }
                    </span>
                    <span style="float:right">신고하기</span>
                </div>
            </div>
            <br>

        </div>

    </div>
    
    <script>

    </script>

</body>
</html>