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
    #wrap{
        width: 1000px;
        height: auto;
        margin: auto;
    }
    /* 게시판이름 영역*/
    #top-area{
        height: 100px;
        margin-top: 50px;
        display: flex;
    }
    /* 게시판이름 */
    #bord-name{
        color: rgb(107, 171, 213);
        font-weight:bolder;
        font-size: 30px;
    }
    #enroll-form{
        width: 650px;
        margin: 0 auto;
        display: flex;
    }
    #enrollForm>div {
        padding-bottom: 20px;
        display: flex;
    }
    #enroll-text{
        font-size: 24px;
        font-weight: bolder;
        margin-bottom: 25px;
        color: rgb(107, 171, 213);
    }
    .textName {
        float: left;
        width: 180px;
        font-size: 20px;
        font-weight: bold;
        height: 40px;
        line-height: 40px;
        text-align: left;
        margin-right: 35px;
    }
    .input-area input{
        height: 45px;
        width: 450px;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 5px;
        margin-right: 5px;
        /* flex: 1; */
    }
    .input-area select{
        height: 45px;
        width: 150px;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 5px;
        margin-right: 5px;
        /* flex: 1; */
    }
    .input-area textarea{
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 5px;
        margin-right: 5px;
        resize: none;
    }
    .input-area span{
        font-size: 12px;
        color: rgb(231, 76, 60);
        margin-left: 2px;
    }
    #enroll-form .btn {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 450px;
        height: 50px;
        margin-bottom: 10px;
    }
    .box .radio-box{
        margin-right: 25px;
        font-size: 22px;
        font-weight: bolder;
    }
    .box .input-area{
        width: 450px;
        /* display: flex; */
    }
    .box .input-area .rightBtn{
        height: 45px;
        margin-left: 5px;
        border: none;
        background-color: rgb(245, 249, 253);
    }
    .box .agree-box{
        width: 300px;
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 15px;
    }
    .box .agree-box .termsCheck{
        margin-bottom: 10px;
    }
    .box .agree-box .termsCheck input[type="checkbox"]{
        width: 20px;
        height: 20px;
        vertical-align: text-bottom;
    }
    /* 클래스 등록 버튼 */
    #classEnroll{
        background-color: rgb(213, 232, 248); 
        margin: auto;
        margin-top: 50px;
    }
    /* 키트 버튼 */
    #kitBtn{
        width: 216px;
        font-weight: bolder;
        border-radius: 4px;
        height: 40px;
    }
    /* 연산 버튼 */
    #sum{
        background-color: rgb(52, 152, 219);
        border-radius: 4px;
        border-style: none;
        width: 40px;
        height: 42px;
        color: white;
        font-weight: bolder;
        font-size: 18px;
        margin-left: 10px;
        /* margin-right: 10px; */
    }
</style>
</head>
<body>
	<div style="height: auto; margin: auto; width: 1600px;">
        <jsp:include page="../../common/teacher/tcMypageSidebar.jsp" />
        <div id="wrap">
            <div id="top-area">
                <span id="bord-name">내클래스 등록</span>
            </div>
            <div id="enroll-form">
                <form action="" method="post" id="enrollForm">
                    <div class="box">
                        <label class="textName" for="st/tc">클래스 카테고리<span class="star">*</span></label>
                        <div class="input-area">
                            <select name="" id="">
                                <option value="">드로잉</option>
                                <option value="">요리</option>
                                <option value="">음악</option>
                                <option value="">운동</option>
                                <option value="">사진&영상</option>
                                <option value="">재테크</option>
                                <option value="">개발&데이터</option>
                                <option value="">자기계발</option>
                            </select>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="userId">클래스명<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="" name="" placeholder="클래스명을 입력 하세요." required>
                            <span>클래스명은 등록 후 수정이 불가능 합니다. 신중히 입력해 주세요.</span>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">클래스 설명<span class="star">*</span></label>
                        <div class="input-area">
                            <textarea name="" id="" cols="58" rows="4" placeholder="간단한 클래스 설명을 입력 하세요."></textarea>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">타이틀 이미지<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="file" id="" name="" required>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">소개 이미지<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="file" id="" name="">
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">커리큘럼 이미지<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="file" id="" class="w200" name="userId">
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">클래스 가격<span class="star">*</span></label>
                        <div class="input-area">
                            <span style="color: black; font-weight: bolder; font-size: 20px;">수강료</span>
                            <input type="text" id="" class="w200" name="" value="원" style="width: 150px; font-weight: bolder; text-align: right; margin-left: 15px;" required>
                            <button id="sum" type="button" class="rightBtn" onclick="idCheck();">X</button>
                            <input type="text" id="" class="w200" name="" value="회" style="width: 133px; font-weight: bolder; text-align: right; margin-left: 15px;" required>

                        </div>
                    </div>
                    <div class="box">
                        <label class="textName"></label>
                        <div class="input-area">
                            <button id="sum" type="button" class="rightBtn" onclick="idCheck();"  style="margin-left: 80px;">=</button>
                            <span style="color: black; font-weight: bolder; font-size: 20px;">최종 수강료</span>
                            <input type="text" id="" class="w200" name="" value="원" style="width: 192px; font-weight: bolder; text-align: right; margin-left: 15px;" required>
                            <span style="margin-left: 80px;">클래스 가격은 등록 후 수정이 불가능 합니다. 신중히 입력해 주세요.</span>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">해시 태그<span class="star"></span></label>
                        <div class="input-area">
                            <input type="text" id="" class="w200" name="" placeholder="해시태그를 입력 하세요." required>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">키트 유무<span class="star">*</span></label>
                        <div class="input-area">
                            <button id="kitBtn" type="button" class="rightBtn btn-light" onclick="idCheck();" style="background-color: rgb(209, 230, 245);">키트 있음</button>
                            <button id="kitBtn" type="button" class="rightBtn btn-light" onclick="idCheck();" style="background-color: rgb(224, 224, 224);">키트 없음</button>
                        </div>
                    </div>
                    <div class="box">
                        <label class="textName" for="">키트소개 이미지<span class="star"></span></label>
                        <div class="input-area">
                            <input type="file" id="" class="w200" name="">
                        </div>
                    </div>
                    <button type="submit" id="classEnroll" class="btn">새로운 클래스 등록하기</button>
                </form>
            </div>
            <br><br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>