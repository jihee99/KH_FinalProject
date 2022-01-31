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
    #logoImg{
        margin-top: 50px;
        margin-bottom: 70px;
    }
    #idFind-text{
        font-size: 25px;
        font-weight: bolder;
        margin-bottom: 65px;
    }
    #top-text{
        color: rgb(52, 152, 219);
    }
    .form-group{
        display: flex;
        align-items: baseline;
        margin-top: 5px;
    }
    #idFind-form{
        width: 350px;
        margin: 0 auto;
    }
    #userIdPwd {
        width: 250px;
        height: 50px !important;
        padding: 10px;
        border: 1px solid lightgray;
        border-radius: 5px;
        margin-right: 10px;
        /* box-shadow: 1px 1px 1px gray inset; */
    }
    .rightBtn{
        width: 90px;
        height: 45px;
        /* margin-left: 5px; */
        border: none;
        background-color: rgb(228, 240, 250);
    }
    #findIdBtn {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 350px;
        height: 50px;
        margin-bottom: 10px;
        margin-top: 30px;
    }
    .notifyRed {
        font-size: 13px;
        color: red;
        font-weight: bold;
    }
</style>
</head>
<body>
	<div style="width: 1400px; height: auto; margin: auto;">
        <div id="wrap">
            <div id="logoImg" align="center">
                <img src="resources/images/logo.png" width="280px">
            </div>
            <div id="idFind-form">
                <div id="idFind-text" align="center">
                    <span>아이디 찾기</span>
                </div>
                <form action="" method="post">
                    <!-- id 인풋 null일 때-->
                    <span id="top-text">휴대폰 번호</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="userIdPwd" placeholder="휴대번호(숫자만)" name="userId" required>
                      <button type="button" class="rightBtn btn-sm" onclick="idCheck();">본인 인증</button>
                      <!-- <div class="valid-feedback"></div>
                      <div class="invalid-feedback">아이디를 입력해주세요</div> -->
                    </div>
                    <!-- 비밀번호 인풋 null일 때-->
                    <span id="top-text">인증 번호</span>
                    <div class="form-group">
                      <input type="password" class="form-control" id="userIdPwd" placeholder="SMS로 수신된 인증번호" name="userPwd" required>
                      <button type="button" class="rightBtn btn-sm" onclick="idCheck();">확인</button>
                      <!-- <div class="valid-feedback"></div>
                      <div class="invalid-feedback">비밀번호를 입력해주세요</div> -->
                    </div>
        
                    <!--
                    // 아이디 틀렸을 시 
                    <div>
                      <p class="notifyRed">등록되지않은 아이디 입니다</p>
                    </div>
        
                    // 비밀번호 틀렸을 시
                    <div>
                      <p class="notifyRed">비밀번호가 틀렸습니다</p>
                    </div>
                    -->

                    <button type="submit" id="findIdBtn" class="btn" style="background-color: rgb(228, 240, 250);">아이디 찾기</button>
                </form>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>