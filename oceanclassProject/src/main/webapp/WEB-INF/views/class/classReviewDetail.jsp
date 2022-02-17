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
            <div style="font-weight: bold; font-size: 17px; color: #6babd5;">실제 수강생 후기 전체 보기</div>
            <hr>
            <img src="resources/images/back.png" width="20" height="20" onclick="location.href='classReviewList.me?cpage=${ returnPage }&clNo=${ reviewClNo }'" style="cursor:pointer;">
			<br><br>
			
            <div class="reviewContent">
                <div class="profile">
                    <div style="float:left; margin-right: 10px;">
                        <img src="" width="50px" height="50px">
                    </div>
                    <div>
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

                <div class="reviewContent" style="margin-top: 10px;">
                    <pre style="width:100%;">
                    <c:if test="${ !empty cr.filePath }">
<img src="${ cr.filePath }" width="400">
					</c:if>
${ cr.content }
                    </pre>
                </div>

                <div class="reivewFooter" style="font-size: 13px;">
                    <button type="button" class="btn" style="background-color: lightgray; margin-bottom: 5px; height:30px; line-height: 15px;">
                        <img src="resources/images/like.png" width="20" height="20">
                        <span style="font-size: 13px;">
                            도움이 됐어요
                        </span>
                    </button>
                    <span style="margin-left:5px;">${ cr.recommend }명에게 도움이 되었어요!</span>
                    <br><br>
                    <span>댓글 ${ replyList.size() }</span>
                    <span style="float:right">신고하기</span>
                </div>
            </div>
            <br>

            <div class="reply">
            	<form id="replyArea">
	                <div class="inputArea">
	                    <img src="resources/images/reply2.png" width="40px" height="40px" style="margin-bottom: 5px;">
	                    <input type="text" class="form-control" style="width: 400px; display: inline-block;" placeholder="댓글 내용을 입력해주세요.">
	                    <button type="submit" class="btn" style="background-color: #6babd5; width: 80px; color: white; margin-bottom: 5px;">등록</button>
	                </div><br>
                </form>

				<c:forEach var="r" items="${ replyList }">
	                <div class="viewArea" style="margin-top: 10px;">
	                    <div class="profile">
	                        <div style="float:left; margin-right: 10px;">
	                            <img src="" width="30px" height="30px">
	                        </div>
	                        <div style="line-height: 30px;">
	                            <span style="font-size: 15px;">${ r.nickName }</span>
	                            <span style="font-size: 12px; color: gray;">${ r.replyDate }</span>
                            	<span style="text-align:right">수정</span>
                            	<span align="right">삭제</span>
	                        </div>
	                    </div>
	
	                    <div class="replyContent" style="margin-top: 10px;">
	                        <pre>
${ r.replyContent }	                        
							</pre>
	                    </div>
	                </div>
                </c:forEach>
                
	            <div id="pagingArea">
	                <ul class="pagination">
		                <c:if test="${ pi.currentPage > 1 }">
								<li class="page-item"><a class="page-link" href="classReviewDetail.me?crNo=${ cr.crNo }&cpage=${ pi.currentPage - 1 }&clNo=${ reviewClNo }&rpage=${returnPage}">Previous</a></li>
						</c:if>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<li class="page-item"><a class="page-link" href="classReviewDetail.me?crNo=${ cr.crNo }&cpage=${ p }&clNo=${ reviewClNo }&rpage=${returnPage}">${ p }</a></li>
						</c:forEach>
						
						<c:if test="${ pi.currentPage != pi.maxPage }">
								<li class="page-item"><a class="page-link" href="classReviewDetail.me?crNo=${ cr.crNo }&cpage=${ pi.currentPage + 1 }&clNo=${ reviewClNo }&rpage=${returnPage}">Next</a></li>
						</c:if>
	                </ul>
	            </div>
                
            </div>

        </div>

    </div>

</body>
</html>