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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
        margin-bottom: 50px;
        /* display: flex; */
    }
    /* 게시판이름 */
    #bord-name{
        color: rgb(107, 171, 213);
        font-weight:bolder;
        font-size: 30px;
        margin-bottom: 150px;
    }
    #content-wrap{
        margin: auto;
    }
    #cl-img{
        margin-left: 15px;
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
        width: 450px;
        height: 100px;
        resize: none;
    }
    .answerRadio{
        display: flex;
        font-size: 20px;
        font-weight: bolder;
        float: right;
        margin-bottom: 10px;
    }
    #noanswer{
        margin-left: 25px;
    }
    .table{
        text-align: center;
        margin-bottom: 100px;
    }
    #eventBox{
        margin-bottom: 40px;
    }
    /* 버튼 박스 */
    #btnBox{
        text-align: right;
        margin-bottom: 30px;
    }
    #btnBox .btn{
        width: 70px;
        height: 30px;
        line-height: 1;
    }
    #blueBtn{
        background-color: rgb(107, 171, 213);
        color: white;
    }
    #statusBox{
        display: flex;
        justify-content:space-between;
        margin-bottom: 50px;
    }
    #statusBox button{
        width: 250px;
        background-color: lightgray;
    }
    #imgBox{
        display: flex;
        justify-content:space-between;
        margin-bottom: 15px;
    }
    .img p{
        text-align: center;
    }
</style>  
</head>
<body>
    
    <div style="width: 1600px; height: auto; margin: auto;">
    	<jsp:include page="../../common/admin/adminMain.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">이벤트 관리</span>
            </div>
            <!-- 회원 조회 -->
            <div id="content-wrap">

                <div id="btnBox">
                    <button class="btn" id="blueBtn" onclick="location.href='';">등록</button>
                </div>

                <div id="statusBox">
                    <button class="btn">전체</button>
                    <button class="btn" name="STATUS" value="Y">진행중</button>
                    <button class="btn" name="STATUS" value="N">종료</button>
                </div>

                <div id="eventBox">
                
                <c:forEach var="e" items="${ list }">
                    <div id="imgBox">
                        <div class="img">
                            <img src="resources/images/event1.jpg" style="width: 480px; height: 210px;">
                            <p>${e.eventContent }</p>
                        </div>
                        <div class="img">
                            <img src="resources/images/event2.jpg" alt="" style="width: 480px; height: 210px;">
                            <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
                        </div>
                    </div>
                    <div id="imgBox">
                        <div class="img">
                            <img src="resources/images/event5.jpg" alt="" style="width: 480px; height: 210px;">
                            <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
                        </div>
                        <div class="img">
                            <img src="resources/images/event4.png" alt="" style="width: 480px; height: 210px;">
                            <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                
                <div class="paging" align="center">
                
                <c:choose>
                	<c:when test="${ pi.currentPage eq 1 }">
                		<li class="page-item disabled"><a href="#">Previous</a></li>
                    </c:when>
                	<c:otherwise>
                    	<button class="btn btn-light"><a href="aeList.bo?cpage=${ pi.currentPage-1 }">&lt;</a></button>
                	</c:otherwise>
               </c:choose>
                
               <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">     
                    <button class="btn btn-light"><a href="aeList.bo?cpage=${ p }">${ p }</a></button>
               </c:forEach>
               
               <c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">     
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    </c:when>
                    <c:otherwise>
                    	<button class="btn btn-light"><a href="list.bo?cpage=${ pi.currentPage+1 }">&gt;</a></button>
                	</c:otherwise>
                </c:choose>
                
                </div>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>

</html>