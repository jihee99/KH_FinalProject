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
        width: 360px;
        margin: 0 auto;
    }
    #findId {
        width: 360px;
        height: 50px !important;
        padding: 10px;
        border: 1px solid lightgray;
        border-radius: 5px;
        margin-right: 10px;
        /* box-shadow: 1px 1px 1px gray inset; */
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
                    <span>비밀번호 찾기</span>
                </div>
                <form action="findPwd.me" method="post">
                    
                    <span id="top-text">휴대폰 번호</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="findId" placeholder="휴대번호(숫자만)" name="phone" required>                      
                    </div>

                    <span id="top-text">성함</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="findId" placeholder="회원가입시 입력한 이름" name="userName" required>                      
                    </div>
                    
                    <span id="top-text">아이디</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="findId" placeholder="회원가입시 입력한 아이디" name="userId" required>                      
                    </div>
                    <button type="submit" id="findIdBtn" class="btn" style="background-color: rgb(228, 240, 250);">비밀번호 재설정</button>
                    
                    <!-- 일치하는 회원정보가 없을 경우 -->
                    <!--
                    <div id="checkResult" style="margin-top: 25px;">
                        <div align="center">
                            <img src="resources/images/warning.jpg" width="25px">
                            <span style="font-size:1.4em; color: rgb(192, 57, 43); font-weight: bolder;">일치하는 회원정보가 없습니다</span>
                        </div>
                        <div align="center">
                        <a href="" style="color: rgb(127, 127, 127); font-size: 0.9em; margin: auto; text-decoration: underline;">회원가입 하기</a>
                        </div>
                    </div>
                    -->
                </form>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>