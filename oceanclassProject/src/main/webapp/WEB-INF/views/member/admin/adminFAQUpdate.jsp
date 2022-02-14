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
        /* display: flex; */
        margin-bottom: 90px;
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
        padding-bottom: 30px;
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
    .box .input-area{
        width: 450px;
        /* display: flex; */
    }
    /* 등록,취소  버튼 */
    #btnBox{
        margin: auto;
        justify-content: center;
    }
    #btnBox button{
        margin-top: 70px;
        width: 100px;
        margin-left: 30px;
    }
</style>
</head>
<body>
	<div style="height: auto; margin: auto; width: 1600px;">
        <jsp:include page="../../common/admin/adminSidebar.jsp" />
        <div id="wrap">
            <div id="top-area">
                <span id="bord-name">FAQ 수정</span>
            </div>
            <div id="enroll-form">
                <form action="" method="post" id="enrollForm">
                    <div class="box">
                        <label class="textName" for="">FAQ 카테고리<span class="star">*</span></label>
                        <div class="input-area">
                            <select name="" id="">
                                <option value="">클래스</option>
                                <option value="">스토어</option>
                                <option value="">기타</option>
                            </select>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">제목<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="" name="" value="상품 등록이 허용 되기까지 며칠이 소요 되나요?" required>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">내용<span class="star">*</span></label>
                        <div class="input-area">
                            <textarea name="" id="" cols="58" rows="8">상품등록까진 귀찮으면 2주요.</textarea>
                        </div>
                    </div>
                    <div id="btnBox">
                        <button type="submit" id="Enroll" class="btn" style="background-color: rgb(107, 171, 213); color: white;">수정</button>
                        <button type="submit" id="cancel" class="btn" style="background-color:gray; color: white;" >취소</button>
                    </div>
                </form>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>