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
    #idFind-form{
        width: 350px;
        margin: 0 auto;
    }
    #goingLogin {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 350px;
        height: 50px;
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
                    <span>비밀번호 변경 성공</span>
                </div>
                <form action="" method="post">
                    <div id="guide-text" align="center">
                        <span style="color: black; font-size: 20px;">성공적으로 비밀번호가 <br>
                            변경 되었습니다.</span>
                    </div>
                    <br><br>
                    <div>
                        <span style="color: gray;">아이디</span>
                    </div>
                    <div id="id-area">
                        <span id="idName">${ loginUser.userId }</span>
                        <span id="idDate" style="color: gray;">가입일 ${ loginUser.enrollDate }</span>
                    </div>

                    <button type="submit" id="goingLogin" class="btn" style="background-color: rgb(228, 240, 250);">로그인 하러가기</button>
                    
                </form>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>