<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    }
    #cl-content{
        padding-top: 10px;
    }
    #num-btn{
        font-size: 23px;
        color: gray;
        font-weight: bolder;
    }
    #cl-num{
        margin-right: 25px;
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
    #cl-content textarea{
        width: 450px;
        height: 60px;
        resize: none;
    }

</style>  
</head>
<body>
    
    <div style="width: 1600px; height: auto; margin: auto;">
    	<jsp:include page="../../common/teacher/tcMypageSidebar.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">내클래스 목록</span>
            </div>
            <div id="content-wrap">
                <div id="cl-wrap">
                    <div id="cl-img">
                        <img src="../../../../resources/images/bomi7.jpg" style="width: 250px; height: 150px;">
                    </div>
                    <div id="cl-box">
                        <div id="cl-category">
                            <span>
                                [운동] 보미 강사의 강아지 훈련 클래스
                            </span>
                        </div>
                        <div id="cl-content">
                            <textarea style="border: none ">어떤 악마견 비글견도 다 천사견으로 만들어 드립니다 세상에 나쁜 강아지는 없다! 보미 훈경 클래스면 모두모두 천사강쥐</textarea>
                        </div>
                        <div id="num-btn">
                            <span id="cl-num">
                                수강생 수 : 350 &ensp; 조회수 : 719
                            </span>
                            <button class="btn" style="background-color: rgb(107, 171, 213); color: white; height: 35px;">수정</button>
                            <button class="btn" style="background-color: rgb(41, 128, 185); color: white; height: 35px;">내리기</button>
                        </div>
                    </div>
                </div>
                <hr>
                <div id="cl-wrap">
                    <div id="cl-img">
                        <img src="resources/images/bomi7.jpg" style="width: 150px;">
                    </div>
                    <div id="cl-box">
                        <div id="cl-category">
                            <span>
                                [운동] 보미 강사의 강아지 훈련 클래스
                            </span>
                        </div>
                        <div id="cl-content">
                            <textarea style="border: none ">어떤 악마견 비글견도 다 천사견으로 만들어 드립니다 세상에 나쁜 강아지는 없다! 보미 훈경 클래스면 모두모두 천사강쥐</textarea>
                        </div>
                        <div id="num-btn">
                            <span id="cl-num">
                                수강생 수 : 350 &ensp; 조회수 : 719
                            </span>
                            <button class="btn" style="background-color: rgb(107, 171, 213); color: white; height: 35px;">수정</button>
                            <button class="btn" style="background-color: rgb(41, 128, 185); color: white; height: 35px;">내리기</button>
                        </div>
                    </div>
                </div>
                <hr>
                <div id="cl-wrap">
                    <div id="cl-img">
                        <img src="resources/images/bomi7.jpg" style="width: 150px;">
                    </div>
                    <div id="cl-box">
                        <div id="cl-category">
                            <span>
                                [운동] 보미 강사의 강아지 훈련 클래스
                            </span>
                        </div>
                        <div id="cl-content">
                            <textarea style="border: none ">어떤 악마견 비글견도 다 천사견으로 만들어 드립니다 세상에 나쁜 강아지는 없다! 보미 훈경 클래스면 모두모두 천사강쥐</textarea>
                        </div>
                        <div id="num-btn">
                            <span id="cl-num">
                                수강생 수 : 350 &ensp; 조회수 : 719
                            </span>
                            <button class="btn" style="background-color: rgb(107, 171, 213); color: white; height: 35px;">수정</button>
                            <button class="btn" style="background-color: rgb(41, 128, 185); color: white; height: 35px;">내리기</button>
                        </div>
                    </div>
                </div>
                <hr>
                <div align="center">
                <button type="submit" id="enrollBtn" class="btn" style="background-color: rgb(228, 240, 250);">새로운 클래스 등록하기</button>
                </div>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>

</html>