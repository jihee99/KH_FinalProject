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
    #leave-text{
        font-size: 27px;
        font-weight: bolder;
        margin-bottom: 65px;
        color: rgb(52, 152, 219);
    }
    #top-text{
        color: rgb(52, 152, 219);
        font-size: 20px;
    }
    .form-group{
        display: flex;
        align-items: baseline;
        margin-top: 5px;
    }
    #leave-form{
        width: 360px;
        margin: 0 auto;
    }
    #findId {
        width: 250px;
        height: 50px !important;
        padding: 10px;
        border: 1px solid lightgray;
        border-radius: 5px;
        margin-right: 10px;
        /* box-shadow: 1px 1px 1px gray inset; */
    }
    #pwd{
        width: 350px;
        height: 50px;
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
    #delete-confirm{
        margin-bottom: 50px;
        color: black;
        font-weight: bolder;
    }
</style>
</head>
<body>
	<div style="width: 1600px; height: auto; margin: auto;">
        <jsp:include page="../../common/teacher/tcMypageSidebar.jsp" />
        <div id="wrap">
            <div id="logoImg" align="center">
                <img src="resources/images/logo.png" width="280px">
            </div>
            <div id="leave-form">
                <div id="leave-text" align="center">
                    <span>회원 탈퇴</span>
                </div>
                <form action="myDelete.me" method="post">
                    <input type="hidden" id="userId" name="userId" value="${loginUser.userId}">
                    <div align="center" id="delete-confirm">
                        <span>
                            강사 회원의 경우<br> 
                            모든 클래스 정리 이후 탈퇴가 가능하며 <br>
                            신청 시에는 14일 이내에 탈퇴 처리가 진행 됩니다. <br><br><br>
                            정말 탈퇴 하시겠습니까?
                        </span>
                    </div>

                    <div align="center">
                        <span id="top-text">
                            비밀번호 확인
                        </span>
                        <div class="form-group">
                        <input type="password" class="form-control" id="userPwd" placeholder="비밀번호 확인" name="userPwd" required> 
                        </div>
                    </div>

                    <button type="submit" id="findIdBtn" class="btn" style="background-color: rgb(228, 240, 250);">회원 탈퇴</button>
                    
                </form>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>