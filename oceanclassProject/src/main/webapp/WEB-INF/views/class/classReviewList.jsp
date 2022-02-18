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
        /*height: 1000px;*/
        margin:auto;
    }
    .outer>div{
        margin: 30px;
    }
    #pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 50px;
	}
	.reviewItem{
		margin-bottom: 50px;
		cursor: pointer;
	}
</style>
</head>
<body>

	<c:if test="${ !empty alertMsg }">
		<script>
			alert('${ alertMsg }');
		</script>
		<c:remove var="alertMsg" />
	</c:if>

    <div class="outer">
        <div>
            <div style="font-weight: bold; font-size: 17px; color: #6babd5;">실제 수강생 후기 전체 보기</div>
            <hr><br>

            <div id="reviewZone">
            	<c:forEach var="ri" items="${ reviewList }">
	            	<div class="reviewItem" onclick="location.href='classReviewDetail.me?crNo=${ ri.crNo }&cpage=1&clNo=${ reviewClNo }&rpage=${ pi.currentPage }'">
		                <div class="profile">
		                    <div style="float:left; margin-right: 10px;">
		                        <img src="" width="50px" height="50px">
		                    </div>
		                    <div>
		                        <div style="font-weight: bold;">${ ri.memNo }</div>
		                        <div style="display: flex;">
		                            <div style="margin-right: 5px;">
		                                <img src="resources/images/star.png" width="12px" height="12px">
		                                <c:choose>
		                                	<c:when test="${ 1.0 <= ri.star && ri.star < 1.5 }">
												<img src="resources/images/star2.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
											</c:when>
											<c:when test="${ 1.5 <= ri.star && ri.star < 2.0  }">
												<img src="resources/images/star3.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
											</c:when>
											<c:when test="${ 2.0 <= ri.star && ri.star < 2.5 }">
												<img src="resources/images/star.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
											</c:when>
											<c:when test="${ 2.5 <= ri.star && ri.star < 3.0 }">
												<img src="resources/images/star.png" width="12px" height="12px">
												<img src="resources/images/star3.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
											</c:when>
											<c:when test="${ 3.0 <= ri.star && ri.star < 3.5 }">
												<img src="resources/images/star.png" width="12px" height="12px">
												<img src="resources/images/star.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
											</c:when>
											<c:when test="${ 3.5 <= ri.star && ri.star < 4.0 }">
												<img src="resources/images/star.png" width="12px" height="12px">
												<img src="resources/images/star.png" width="12px" height="12px">
												<img src="resources/images/star3.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
											</c:when>
											<c:when test="${ 4.0 <= ri.star && ri.star < 4.5 }">
												<img src="resources/images/star.png" width="12px" height="12px">
												<img src="resources/images/star.png" width="12px" height="12px">
												<img src="resources/images/star.png" width="12px" height="12px">
												<img src="resources/images/star2.png" width="12px" height="12px">
											</c:when>
											<c:when test="${ 4.5 <= ri.star && ri.star < 5.0 }">
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
		                            <div style="font-size: 13px; color: gray; line-height: 27px;">${ ri.createDate }</div>
		                        </div>
		                    </div>
		                </div>
		
		                <div class="reviewContent" style="margin-top: 10px;">
		                    <pre style="width:100%; white-space: pre-wrap;">
            					<c:if test="${ !empty ri.filePath }">
<img src="${ ri.filePath }" width="400">
								</c:if>
${ ri.content }
		                    </pre>
						</div>
		   
		                <div class="reivewFooter" style="font-size: 13px;">
		                    <span>댓글 ${ ri.replyNum }</span>
		                    <span style="margin-left: 10px;">
		                        <img src="resources/images/like.png" width="15" height="15"> ${ ri.recommend }
		                    </span>
		                    <!-- <span style="float:right">신고하기</span> -->
		                </div>
		            </div>
				</c:forEach>
            </div>
	            
            <div id="pagingArea">
                <ul class="pagination">
                	<c:if test="${ pi.currentPage > 1 }">
							<li class="page-item"><a class="page-link" href="classReviewList.me?cpage=${ pi.currentPage - 1 }&clNo=${ reviewClNo }">Previous</a></li>
					</c:if>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="classReviewList.me?cpage=${ p }&clNo=${ reviewClNo }">${ p }</a></li>
					</c:forEach>
					<c:if test="${ pi.currentPage != pi.maxPage }">
							<li class="page-item"><a class="page-link" href="classReviewList.me?cpage=${ pi.currentPage + 1 }&clNo=${ reviewClNo }">Next</a></li>
					</c:if>
                </ul>
            </div>
        </div>

    </div>

</body>
</html>