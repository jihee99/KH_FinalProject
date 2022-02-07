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
    #tableBox{
        height: 700px;
    }
</style>  
</head>
<body>
    
    <div style="width: 1600px; height: auto; margin: auto;">
    	<jsp:include page="../../common/teacher/tcMypageSidebar.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">클래스 문의 관리</span>
            </div>
            <div id="classCategory">
                <select name="" id="">
                    <option value="">보미 강사의 강아지 훈련 클래스</option>
                    <option value="">올바른 강아지 산책 클래스</option>
                    <option value="">무의미하게 시간 보내는 클래스</option>
                </select>
            </div>
            <div id="content-wrap" >
                <div class="answerRadio">
                    <div class="radio-box">
                        <input type="radio" name="answer" id="answer" checked>
                        <label for="">답변</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" name="answer" id="noanswer">
                        <label for="">미답변</label>
                    </div>
                </div>
                <div id="tableBox">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th width="450px">제목</th>
                                <th width="150px">작성자</th>
                                <th width="150px">작성일</th>
                                <th width="100px">답변상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>강사님 궁긍해요 어떻게 해야 하나요</td>
                                <td>보미사랑</td>
                                <td>2022-01-02</td>
                                <td>답변</td>
                            </tr>
                            <tr>
                                <td>수강도중 문의사항이 생겼습니다.. 빠른 답변 부탁요</td>
                                <td>보미</td>
                                <td>2022-01-02</td>
                                <td>답변</td>
                            </tr>
                            <tr>
                                <td>강사님 궁긍해요 어떻게 해야 하나요</td>
                                <td>보미콧물</td>
                                <td>2022-01-02</td>
                                <td>답변</td>
                            </tr>
                            <tr>
                                <td>강사님 궁긍해요 어떻게 해야 하나요</td>
                                <td>보미럽</td>
                                <td>2022-01-02</td>
                                <td>미답변</td>
                            </tr>
                            <tr>
                                <td>강사님 궁긍해요 어떻게 해야 하나요</td>
                                <td>보미사랑</td>
                                <td>2022-01-02</td>
                                <td>답변</td>
                            </tr>
                        </tbody>
                    </table>
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