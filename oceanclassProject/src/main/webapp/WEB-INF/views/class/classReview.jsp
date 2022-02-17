<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    .reveiwOuter{
        width: 650px;
        margin:auto;
        margin-top: 20px;
        margin-bottom: 100px;
        box-sizing: border-box;
    }
    #imgZone>img{
        margin-right: 10px;
    }
    .bestReview{
        display: inline-block;
        width: 300px; 
        height: 250px;
        margin:10px;
        margin-bottom: 30px;
    }
</style>
</head>
<body>
    <div class="reviewOuter">
        
        <p style="color: #6babd5; font-weight: bold;">실제 수강생 후기</p>
        <br>
        
        <c:choose>
        	<c:when test="${ !empty crList }">
		        <div id="starZone" align="center">
		            <img src="resources/images/star.png" width="30px" height="30px">
		            
		    		<c:set var="starSum" value="0" />
					<c:forEach var="cr" items="${ crList }">
			    		<c:set var="starSum" value="${ starSum + cr.star }" />
					</c:forEach>
		            <c:set var="starAverage" value="${ starSum / crList.size() }" />
					
					<c:choose>
						<c:when test="${ 1 <= starAverage && starAverage < 1.5 }">
							<img src="resources/images/star2.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
						</c:when>
						<c:when test="${ 1.5 <= starAverage && starAverage < 2  }">
							<img src="resources/images/star3.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
						</c:when>
						<c:when test="${ 2 <= starAverage && starAverage < 2.5 }">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
						</c:when>
						<c:when test="${ 2.5 <= starAverage && starAverage < 3 }">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star3.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
						</c:when>
						<c:when test="${ 3 <= starAverage && starAverage < 3.5 }">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
						</c:when>
						<c:when test="${ 3.5 <= starAverage && starAverage < 4 }">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star3.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
						</c:when>
						<c:when test="${ 4 <= starAverage && starAverage < 4.5 }">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star2.png" width="30px" height="30px">
						</c:when>
						<c:when test="${ 4.5 <= starAverage && starAverage < 5 }">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star.png" width="30px" height="30px">
							<img src="resources/images/star3.png" width="30px" height="30px">
						</c:when>
						<c:otherwise>
				            <img src="resources/images/star.png" width="30px" height="30px">
					        <img src="resources/images/star.png" width="30px" height="30px">
					        <img src="resources/images/star.png" width="30px" height="30px">
					        <img src="resources/images/star.png" width="30px" height="30px">
						</c:otherwise>
					</c:choose>	
			
		            <span id="average" style="font-size: 20px; font-weight: bold; margin-left: 5px;">
	            		<fmt:formatNumber value="${ starAverage }" pattern=".0"/><br>
		            </span>
		            <br>
		            
		            <span style="color: gray; font-size: 15px;">총 ${ crList.size() }개</span>
		            
		            <button type="button" class="btn" style="background-color: lightgray; width: 120px; font-size: 13px; height: 30px; line-height: 10px; margin-left: 10px; font-weight: bold;" data-toggle="modal" data-target="#reviewModal">후기 작성하기</button>
		        </div>
			
				<c:if test="${ !empty crTopList }">
			        <br>
			        <div id="imgZone" align="center">
			        	<c:forEach var="r" items="${ crTopList }">
				            <img src="${ r.filePath }" width="100px" height="100" style="cursor:pointer;" onclick="detailPage(${r.crNo})">
			        	</c:forEach>
			        </div>
				</c:if>
	            <hr>
		
		        <div id="reviewZone">
		        	<c:forEach var="r" items="${ crMainList }">
		                <div class="bestReview" style="cursor:pointer;" onclick="detailPage(${r.crNo})">
		                    <div class="profile">
		                        <div style="float:left; margin-right: 10px;">
		                            <img src="" width="50px" height="50px">
		                        </div>
		                        <div>
		                            <div style="font-weight: bold;">${ r.memNo }</div>
		                            <div style="display: flex;">
		                                <div style="margin-right: 5px;">
		                                    <img src="resources/images/star.png" width="12px" height="12px">
											<c:choose>
												<c:when test="${ 1.0 <= r.star && r.star < 1.5 }">
													<img src="resources/images/star2.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
												</c:when>
												<c:when test="${ 1.5 <= r.star && r.star < 2.0  }">
													<img src="resources/images/star3.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
												</c:when>
												<c:when test="${ 2.0 <= r.star && r.star < 2.5 }">
													<img src="resources/images/star.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
												</c:when>
												<c:when test="${ 2.5 <= r.star && r.star < 3.0 }">
													<img src="resources/images/star.png" width="12px" height="12px">
													<img src="resources/images/star3.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
												</c:when>
												<c:when test="${ 3.0 <= r.star && r.star < 3.5 }">
													<img src="resources/images/star.png" width="12px" height="12px">
													<img src="resources/images/star.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
												</c:when>
												<c:when test="${ 3.5 <= r.star && r.star < 4.0 }">
													<img src="resources/images/star.png" width="12px" height="12px">
													<img src="resources/images/star.png" width="12px" height="12px">
													<img src="resources/images/star3.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
												</c:when>
												<c:when test="${ 4.0 <= r.star && r.star < 4.5 }">
													<img src="resources/images/star.png" width="12px" height="12px">
													<img src="resources/images/star.png" width="12px" height="12px">
													<img src="resources/images/star.png" width="12px" height="12px">
													<img src="resources/images/star2.png" width="12px" height="12px">
												</c:when>
												<c:when test="${ 4.5 <= r.star && r.star < 5.0 }">
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
		                                <div style="font-size: 13px; color: gray; line-height: 27px;">${ r.createDate }</div>
		                            </div>
		                        </div>
		                    </div>
		    
		                    <div class="reviewContent" style="margin-top: 10px;">
		                        <pre style="width:100%; height:150px; white-space: pre-wrap;">${ r.content }</pre>
		                    </div>
			    
		                    <div class="reivewFooter" style="font-size: 13px;">
		                        <span>댓글 ${ r.replyNum }</span>
		                        <span>
		                            <img src="resources/images/like.png" width="15" height="15" style="margin-bottom: 5px; margin-left: 5px;"> ${ r.recommend }
		                        </span>
		                        <!--  <span style="float:right">신고하기</span>-->
		                    </div>
		                </div>
		        	</c:forEach>
	                
		            <br><br>
		            <div class="allReview">
		                <button type="button" class="btn" style="background-color: #6babd5; width: 100%; color: white;" onclick="allReview(${c.clNo});">모든 리뷰 보기</button>
		                <!-- 버튼 누르면 새창 띄워지게 -->
		            </div>    
		
		        </div>
        	</c:when>
        	<c:otherwise>
            	<div>
            		아직 해당 클래스에 후기가 존재하지 않습니다.<br>
            		후기를 작성해보세요!
            	</div><br>
	            <button type="button" class="btn" style="background-color: lightgray; width: 120px; font-size: 13px; height: 30px; line-height: 10px;" data-toggle="modal" data-target="#reviewModal">후기 작성하기</button>
        	</c:otherwise>
        </c:choose>
    </div>

    <!-- 글 작성하기시 보여질 modal -->
    <div id="reviewModal" class="modal fade" role="dialog">
        <form action="" method="post">
            <div class="modal-dialog">
        
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">글 작성하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <input type="file" name="thumbnail">
                        <textarea style="width: 100%; height: 200px; resize: none; margin-top: 10px;" placeholder="내용을 작성해주세요."></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn" data-dismiss="modal" style="background-color: #6babd5;">작성</button>
                        <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>
                    </div>
                </div>
        
            </div>
        </form>
    </div>

	<script>
		function allReview(clNo){
            window.open("classReviewList.me?cpage=1&&clNo=" + clNo, "클래스리뷰목록", "width=650, height=800, resizeable=no, location=no");
        }
		
		function detailPage(crNo){
			window.open('classReviewDetail.me?crNo=' + crNo + '&cpage=1&clNo=${c.clNo}&rpage=1', "클래스리뷰목록", "width=650, height=800, resizeable=no, location=no");
		}
	</script>

</body>	
</html>