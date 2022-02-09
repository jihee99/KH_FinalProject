<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <button class="btn" id="blueBtn">등록</button>
                </div>

                <div id="statusBox">
                    <button class="btn">전체</button>
                    <button class="btn">진행중</button>
                    <button class="btn">종료</button>
                </div>

                <div id="eventBox">
                    <div id="imgBox">
                        <div class="img">
                            <img src="resources/images/event1.jpg" style="width: 480px; height: 210px;">
                            <p>새해 이벤트! 댓글 달고 어흥 쿠폰 받자!</p>
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
                </div>
                <div class="paging" align="center">
                    <button class="btn btn-light">&lt;</button>
                    
                    <button class="btn btn-light">1</button>
                    <button class="btn btn-light">2</button>
                    <button class="btn btn-light">3</button>
                    <button class="btn btn-light">4</button>
                    <button class="btn btn-light">5</button>
                    
                    <button class="btn btn-light">&gt;</button>
                </div>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>

</html>