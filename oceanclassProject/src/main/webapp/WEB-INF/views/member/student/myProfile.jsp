<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #wrap{
        width: 90%;
        height: 100%;
        margin: auto;
        margin-top: -100px;
        border: 1px solid;
    }
    #logoImg{
        margin-top: 50px;
        margin-bottom: 50px;
    }
    #join-form{
        width: 650px;
        margin: 0 auto;
        display: flex;
    }
    #joinForm>div {
        padding-bottom: 20px;
        display: flex;
    }
    #join-text{
        font-size: 24px;
        font-weight: bolder;
        margin: 30px;
        color: rgb(107, 171, 213);
    }
    .textName {
        float: left;
        width: 160px;
        font-size: 20px;
        font-weight: bold;
        height: 40px;
        line-height: 40px;
        text-align: right;
        margin-right: 35px;
    }
    input[type=text] {
        height: 45px;
        width: 300px;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 10px;
    }

    input[type=password] {
        height: 45px;
        width: 300px;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 10px;
    }
    #join-form .btn {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 300px;
        height: 50px;
        margin-bottom: 10px;
    }
    .box .radio-box{
        margin-right: 25px;
        font-size: 22px;
        font-weight: bolder;
    }
    .box .radio-box input[type="radio"]{
        margin-right: 15px;
        width: 20px;
        height: 20px;
        /* vertical-align:text-bottom; */
        margin-top: 10px;
    }
    .box .input-area{
        width: 300px;
        display: flex;
    }
    .box .input-area input[type="text"]{
        margin-right: 5px;
        flex: 1;
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
    .btn{
        margin: 20px;
        margin-left: auto;
    }
    #changeProfile{
        background-color: rgb(213, 232, 248); 
        margin-right: 17px;
    }
</style>
</head>
<body>
	<div style="height: auto; margin: auto; width: 1400px;">
        <div id="wrap">
            <div id="join-text">
                <h2>나의 프로필</h2>
            </div>
            <div id="join-form">
                <form action="" method="post" id="joinForm">
                    <div class="box">
                        <i class="bi bi-person-circle" style="font-size: 6rem; margin: auto;"></i>
                    </div>
                 
                    <div class="box">
                        <label class="textName" for="userId">아이디<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="userId" name="userId" placeholder="사용자아이디" style="width: 215px;" readonly> 
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="userPwdCk">이름<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="userPwdCk" name="userPwdCk" placeholder="신정우" readonly>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="userId">닉네임<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="userId" class="w200" name="userId" placeholder="모니카쌤" readonly>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="userId">휴대전화 번호<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="userId" class="w200" name="userId" placeholder="010-1111-2222" readonly>
                        </div>
                    </div>
              
                    <button type="submit" id="changePass" class="btn btn-light" onclick="changePassword;">비밀번호 변경</button>
                    <button type="submit" id="changeProfile" class="btn" onclick="changeProfile();">프로필 수정</button>
                    <button type="reset" id="cancel" class="btn btn-light" onclick="myDelete();">회원탈퇴</button>
                
                </form>
                <br><br><br><br><br><br>
            </div>
			
            
        </div>
    </div>
    
</body>
</html>
</body>
</html>