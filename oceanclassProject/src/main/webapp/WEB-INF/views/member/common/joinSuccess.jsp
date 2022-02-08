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
        margin-bottom: 40px;
    }
    #idFind-form{
        width: 350px;
        margin: 0 auto;
        margin-top: 150px;
    }
    #goingLogin {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 350px;
        height: 60px;
        margin-bottom: 10px;
        margin-top: 10px;
    }
    #id-area{
        display: flex;
        justify-content: space-between;
        align-items:flex-end;
    }
    #idName{
        color: rgb(52, 152, 219);
        font-size: 35px;
        font-weight: bolder;
    }
    .notifyRed {
        font-size: 13px;
        color: red;
        font-weight: bold;
    }
    #welcome{
        font-size: 40px;
        color:rgb(52, 152, 219);
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
                    <span id="welcome">Welcome Ocean!</span>
                </div>
                <form action="loginForm.me" method="post">
                    <div id="guide-text" align="center">
                        <span style="color: black; font-size: 18px; font-weight: bolder;">환영합니다! <br>
                            회원가입에 성공 하셨습니다!</span>
                    </div>
                    <br><br>

                    <button type="submit" id="goingLogin" class="btn" style="background-color: rgb(228, 240, 250);">로그인 하러가기</button>
                    
                    
                    
                </form>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>