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
        width: 700px;
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
        width: 750px;
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
        width: 550px;
        height: 90px;
        resize: none;
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
            <div id="review">
                <span id="allReview">총 후기 <span id="number">5</span>건 /</span>
                <span id="starAverage">별점평균 <span id="number">4.8</span>점</span>
            </div>
            <div id="content-wrap" style="overflow-y: scroll;">
                <c:forEach var="tr" items="${ tcReviewList }">
                <div id="cl-wrap">
                <input type="hidden" name="clNo" value="${ tr.clNo }">
                    <div id="cl-img">
                        <img src="${tr.filePath }" style="width: 140px;" name="">
                        <div class="star" align="center">
                            <span>★★★★★</span>
                        </div>
                    </div>
                    <div id="cl-box">
                        <div id="cl-category">
                            <span>
                                	${tr.clName }
                            </span>
                        </div>
                        <div id="cl-content">
                            <textarea style="border: none ">${tr.content }</textarea>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>

</html>