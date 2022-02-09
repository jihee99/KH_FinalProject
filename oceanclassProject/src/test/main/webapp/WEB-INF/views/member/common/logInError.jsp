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
    #login-text{
        font-size: 25px;
        font-weight: bolder;
        margin-bottom: 15px;
    }
    #login-form{
        width: 300px;
        margin: 0 auto;
    }
    #userIdPwd {
        width: 300px;
        height: 50px !important;
        padding: 10px;
        border: 1px solid lightgray;
        border-radius: 5px;
        /* box-shadow: 1px 1px 1px gray inset; */
    }
    #login-form button {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 300px;
        height: 50px;
        margin-bottom: 10px;
        
    }
    #login-fix{
        margin-bottom: 15px;
    }
    #ck {
        width: 18px;
        height: 18px;
        margin-right: 5px;
    }
    #fix{
        font-size: 16px;
        color: gray;
    }
    .loginBottom {
        margin: 0 auto;
        width: 400px;
        margin-top: 20px;
        font-size: 13px;
    }

    #join {
        margin-bottom: 5px;
        font-weight: bold;
        text-decoration-line: none;
        color: gray;
    }
    #find{
        margin-bottom: 15px; 
    }
    a {
        font-weight: bold;
        color: gray;
        text-decoration-line: none;
    }

    a:hover {
        color: rgb(52, 152, 219);
    }

    .notifyRed {
        font-size: 13px;
        color: red;
        font-weight: bold;
    }
</style>
</head>
<body>
	<div style="height: auto; margin: auto;">
        <div id="wrap">
            <div id="logoImg" align="center">
                <img src="resources/images/logo.png" width="280px">
            </div>
            <div id="login-form">
                <div id="login-text">
                    <span>Log in</span>
                </div>
                <form action="login.me" method="post">
                    <!-- id 인풋 null일 때-->
                    <div class="form-group">
                      <input type="text" class="form-control" id="userIdPwd" placeholder="아이디를 입력하세요." name="userId" required>
                      <!-- <div class="valid-feedback"></div>
                      <div class="invalid-feedback">아이디를 입력해주세요</div> -->
                    </div>
                    <!-- 비밀번호 인풋 null일 때-->
                    <div class="form-group">
                      <input type="password" class="form-control" id="userIdPwd" placeholder="비밀번호를 입력하세요." name="userPwd" required>
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
                    <div id="login-fix">
                        <input type="checkbox" id="ck">
                        <span id="fix" href="">로그인 상태 유지</span>
                    </div>

                    <button type="submit" class="btn" style="background-color: rgb(228, 240, 250);">로그인 하기</button>
                    <button type="submit" class="btn" style="background-color: rgb(232, 248, 239);">네이버로 로그인 하기</button>
                </form>

                
            </div>
            <div class="loginBottom" align="center">
                <div id="join">
                    아직도 OceanClass 회원이 아니신가요? &ensp;<a style="color: rgb(52, 152, 219);" href="joinUsForm.me">회원가입 하기</a>
                </div>
                <div id="find">
                    <a href="">아이디 찾기</a>&ensp; 
                    <a href="">비밀번호 재설정</a>
                </div>
                <!-- 아이디 비번 틀렸을때 -->
                <div id="checkResult" style="font-size:1.5em; color: rgb(192, 57, 43); font-weight: bolder;">
                    <img src="resources/images/warning.jpg" width="25px">
                    아이디 혹은 비밀번호를 다시 확인 하세요.
                </div>
                
            </div>
        </div>
    </div>
</body>
</html>