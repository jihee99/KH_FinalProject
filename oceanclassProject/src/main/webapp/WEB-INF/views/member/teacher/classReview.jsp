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
        width: 700px;
        height: 480px;
        border: 1px solid gray;
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
            <div id="classCategory">
                <select name="" id="">
                    <option value="">보미 강사의 강아지 훈련 클래스</option>
                    <option value="">올바른 강아지 산책 클래스</option>
                    <option value="">무의미하게 시간 보내는 클래스</option>
                </select>
            </div>
            <div id="review">
                <span id="allReview">총 후기 <span id="number">5</span>건 /</span>
                <span id="starAverage">별점평균 <span id="number">4.8</span>점</span>
            </div>
            <div id="content-wrap" style="overflow-y: scroll;">
                <div id="cl-wrap">
                    <div id="cl-img">
                        <img src="resources/images/bomi7.png" style="width: 140px;">
                        <div class="star" align="center">
                            <span>★★★★★</span>
                        </div>
                    </div>
                    <div id="cl-box">
                        <div id="cl-category">
                            <span>
                                모든 강아지한테 통하는 훈련 클래스에요!!
                            </span>
                        </div>
                        <div id="cl-content">
                            <textarea style="border: none ">강아지들이 다 좋아해요 제가 강아지를 101마리 키우고 있기때문에 확실히 압니다. 종류는 모두 같아요 요즘 검은옷을 즐겨입고 강아지로 모피를 만들기를 원하는 친구가 제 강아지</textarea>
                        </div>
                    </div>
                </div>
                
                <div id="cl-wrap">
                    <div id="cl-img">
                        <img src="resources/images/bomi7.jpg" style="width: 140px;">
                        <div class="star" align="center">
                            <span>★★★★★</span>
                        </div>
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
                    </div>
                </div>

                <div id="cl-wrap">
                    <div id="cl-img">
                        <img src="resources/images/bomi7.jpg" style="width: 140px;">
                        <div class="star" align="center">
                            <span>★★★★★</span>
                        </div>
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
                    </div>
                </div>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>

</html>