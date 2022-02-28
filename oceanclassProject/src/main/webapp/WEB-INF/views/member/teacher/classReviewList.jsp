<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 전체 감싸는 div */
    .wrap{
        width: 1000px;
        height: auto;
        margin: auto;
        margin-top: 50px;
    }
    #review{
        margin: auto;
        width: 800px;
        margin-bottom: 10px;
    }
    #classCategory{
        margin: auto;
        width: 700px;
    }
    #classCategory select{
        margin: auto;
        width: 700px;
        height: 45px;
        margin-bottom: 80px;
    }
    /* 게시판이름 영역*/
    #top-area{
        height: 100px;
        margin-top: 50px;
        display: flex;
        justify-content: space-between;
    }
    /* 게시판이름 */
    #bord-name{
        color: rgb(107, 171, 213);
        font-weight:bolder;
        font-size: 30px;
    }
    #content-wrap{
        margin: auto;
        width: 800px;
        height: 680px;
        border: 1px solid gray;
    }
    #cl-img{
        margin-left: 15px;
        margin-top: 17px;
    }
    #cl-wrap{
        /* box-sizing: border-box; border:1px solid black; */
        display: flex;
        margin-bottom: 10px;
        margin-top: 10px;
    }
    #cl-box{
        margin-left: 15px;
        margin-top: 5px;
    }
    #cl-category{
        font-weight: bolder;
        font-size: 20px;
        margin-top: 5px;
    }
    #cl-content{
        padding-top: 10px;
    }
    #cl-content textarea{
        width: 600px;
        height: 90px;
        resize: none;
        background-color: white;
    }
    /* 클래스 등록버튼 */
    #enrollBtn {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 400px;
        height: 50px;
        margin-bottom: 10px;
        margin-top: 80px;
    }
    .star{
        font-size: 28px;
        margin-top: -5px;
    }
    #allReview{
        font-size: 28px;
    }
    #starAverage{
        font-size: 17px;
    }
    #number{
        color: rgb(107, 171, 223);
        font-weight: bolder;
    }
</style>  
</head>
<body>
    
    <div style="width: 1600px; height: auto; margin: auto;">
    	<jsp:include page="../../common/teacher/tcMypageSidebar.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">클래스 리뷰 관리</span>
            </div>
            <c:set var="starSum" value="0" />
				<c:forEach var="tcr" items="${ tcReviewList }">
		    		<c:set var="starSum" value="${ starSum + tcr.star }" />
				</c:forEach>
            <c:set var="starAverage" value="${ starSum / tcReviewList.size() }" />
            <div id="review">
                <span id="allReview">총 후기 <span id="number">${ tcReviewList.size() }</span>건 /</span>
                <span id="starAverage">별점평균 <span id="number">${ starAverage }</span>점</span>
            </div>
            <div id="content-wrap" style="overflow-y: scroll;">
                <c:forEach var="tr" items="${ tcReviewList }">
                <div id="cl-wrap">
                    <div id="cl-img">
                    	<c:choose>
                    		<c:when test="${not empty tr.filePath }">
                        		<img src="${tr.filePath }" style="width: 150px;" name="">
                        	</c:when>
                        	<c:otherwise>
                        		<img src="resources/images/logoOnlyImg.png" style="width: 140px;" name="">
                        	</c:otherwise>
                        </c:choose>
                        <div class="star" align="center">
                            <span>
                            <img src="resources/images/star.png" width="15px" height="15px">
                                <c:choose>
                                	<c:when test="${ 1.0 <= tr.star && tr.star < 1.5 }">
										<img src="resources/images/star2.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
									</c:when>
									<c:when test="${ 1.5 <= tr.star && tr.star < 2.0  }">
										<img src="resources/images/star3.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
									</c:when>
									<c:when test="${ 2.0 <= tr.star && tr.star < 2.5 }">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
									</c:when>
									<c:when test="${ 2.5 <= tr.star && tr.star < 3.0 }">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star3.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
									</c:when>
									<c:when test="${ 3.0 <= tr.star && tr.star < 3.5 }">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
									</c:when>
									<c:when test="${ 3.5 <= tr.star && tr.star < 4.0 }">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star3.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
									</c:when>
									<c:when test="${ 4.0 <= tr.star && tr.star < 4.5 }">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star2.png" width="15px" height="15px">
									</c:when>
									<c:when test="${ 4.5 <= tr.star && tr.star < 5.0 }">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star3.png" width="15px" height="15px">
									</c:when>
									<c:otherwise>
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star.png" width="15px" height="15px">
										<img src="resources/images/star.png" width="15px" height="15px">
									</c:otherwise>
                                </c:choose>
                            
                            </span>
                        </div>
                    </div>
                    <div id="cl-box" style="cursor:pointer;" onclick="detailPage(${tr.crNo})">
                    <input type="hidden" name="clNo" value="${ tr.clNo }">
                        <div id="cl-category">
                            <span>
                                	${tr.clName }
                            </span>
                        </div>
                        <div id="cl-content">
                            <textarea style="border: none" readonly disabled >${tr.content }</textarea>
                        </div>
                    </div>
                </div>
            <script>
	            function detailPage(crNo){
	    			window.open('classReviewDetail.me?crNo=' + crNo + '&cpage=1&clNo=${tr.clNo}&rpage=1', "클래스리뷰목록", "width=650, height=800, resizeable=no, location=no");
	    		}
            </script>
            </c:forEach>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>

</html>