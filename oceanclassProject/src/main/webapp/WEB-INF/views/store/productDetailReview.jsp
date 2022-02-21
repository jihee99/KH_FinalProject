<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>

.reviewOuter{width:700px;}
.review{margin-bottom: 50px; height: auto;}
.small_header{width: 100%; height: 90px;}
.small_header>span{font-weight: bold; font-family: 본고딕; font-size: 20px;}
.small_header>button{float: right; width: 100px; height: 30px; background:steelblue; color: white; border: none; border-radius: 5px;}
.user_detail>button{background:none; border: none; font-weight: bold; font-size: 13px; cursor: pointer;}
.user_detail{width: 400px; height: 80px;}
.user_image{width: 50px; height: 50px; border: 1px solid; position:inline-block; float:left; margin-right: 10px;}
.product_name_small{font-size: small; color: rgb(88, 88, 88);}
.content{font-family: 본고딕; font-size: 15px; display:inline-block; width:650px; margin-bottom: 10px;}
.recommend{width: 200px; height: 30px; margin-right: 10px; cursor: pointer; background:rgb(211, 212, 212); border: none; border-radius: 5px;}
.thumbnail_image{width:150px; height:120px; border: 1px solid; margin-bottom: 10px;}
.more_review{width:700px; height: 50px; background:rgb(211, 229, 236); border: none; border-radius: 5px; cursor: pointer;}
</style>
</head>
<body>
		
		<div class="innerOuter">
				
			    <form action="reviewList.st" method="post">
                <input type="hidden" name="pno" value="${ p.productNo }">
                </form>
                
            <div class="reviewOuter">
	            <div class="small_header">
	                <span>리뷰(${ c.totalCount }) </span>
	                <span class="star_rating">
	                    <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
	                    <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
	                    <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
	                    <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
	                    <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
	                    (${ c.starAvg })
	                </span>
	                <button type="button" class="input_review">리뷰작성</button>
	            </div>
				
	            <div class="review_list">
	            	<c:forEach var="srm" items="${srMainList}" end="4">
		                <div class="review">
		                    <div class="user_detail">
		                        <div class="user_image">
		                        	<c:choose>
		                        		<c:when test="${srm.profile eq null }">
		                        			<img src="">
		                        		</c:when>
		                        		<c:otherwise>
		                        			<img src="${srm.profile}">
		                        		</c:otherwise>
		                        	</c:choose>
		                        </div>
		                        <span>
		                            <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
		                        </span><br>
		                        <span class="user_name">${srm.nickname}</span>
		                        <span class="enroll_date">${srm.reviewDate}</span>
		                        <button type="button">신고</button>
		                    </div>
		                    <div class="review_content">
		                        <span class="product_name_small">${p.title }</span> <br>
		                        <span class="content">${srm.content}</span>
		                        <div class="thumbnail_image">
		                            <img src="" class="thumb">
		                        </div>
		                    </div>
		                    <div class="recommend_area">
		                        <button type="button" class="recommend"><i class="far fa-thumbs-up"></i> 도움이 됐어요</button>
		                        <span>${srm.reconum}명에게 도움이 되었어요.</span>
		                    </div>
		                </div>
	                </c:forEach>
	            </div>
	            <div class="bottom_area">
	                <button type="button" class="more_review">더 많은 리뷰 보러가기</button>
	            </div>
            </div>
		</div>
		
		<script>

		
		function allReview(pno){
            window.open("storeReviewList.st?cpage=1&&pno=" + pno, "스토어리뷰목록", "width=650, height=800, resizeable=no, location=no");
        }
		</script>

</body>
</html>