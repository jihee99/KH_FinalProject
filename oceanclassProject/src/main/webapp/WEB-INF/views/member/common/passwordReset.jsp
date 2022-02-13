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
        width: 250px;
        height: 50px !important;
        padding: 10px;
        border: 1px solid lightgray;
        border-radius: 5px;
        margin-right: 10px;
        /* box-shadow: 1px 1px 1px gray inset; */
    }
    .form-group input[type="password"]{
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
    #findPwdBtn {
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
                    <span style="color: rgb(52, 152, 219);">가입이력이 확인되었습니다! <br><br></span><span>비밀번호 재설정</span>
                </div>
                <form action="updatePwd.me" method="post">
                    <input type="hidden" class="form-control" id="userId" name="userId" value="${loginUser.userId}"> 
                    <span id="top-text">변경할 비밀번호</span>
                    <div>
                    <div class="form-group">
                      <input type="password" class="form-control" id="userPwd" placeholder="비밀번호(영문,숫자 포함 6자리 이상)" name="userPwd" required> 
                    </div>
                    <div id="checkPw" style="font-size:0.8em;"></div>
                    </div>
                    
                    <script>
                    	$(function(){
                    		
                    		// 비밀번호 정규 표현식
    						const pwExp =/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{6,15}$/i;
    						
    						// 비밀번호 정규표현식 확인
    						$('#userPwd').blur(function () {
    							if (!pwExp.test($(this).val())) {
    								console.log(pwExp.test($(this).val()));
    								$('#checkPw').text("비밀번호는 영문, 숫자 포함 6~15자리 입니다.");
    								$('#checkPw').css('color', 'red');
    								$('#userPwd').css('border', '2px solid red');
    								$('#userPwd').focus();
    								$("#findPwdBtn :submit").attr("disabled", true)
    							} else {
    								$('#checkPw').text('');
    								$('#userPwd').css('border', '1px solid black');
    								$("#findPwdBtn :submit").removeAttr("disabled");
    							}
    						});
                    	})	
                    </script>

                    <span id="top-text">비밀번호 확인</span>
                    <div>
                    <div class="form-group">
                      <input type="password" class="form-control" id="userPwdCk" placeholder="비밀번호 확인" name=userPwdCk required> 
                    </div>
                    <div id="checkPwCk" style="font-size:0.8em;"></div>
					</div>
                    <button type="submit" id="findPwdBtn" class="btn" style="background-color: rgb(228, 240, 250);">변경 완료</button>
                    
                    <script>
                    $(function(){
                		
						// 비밀번호 일치 확인
						$('#userPwdCk').blur(function () {
							if ($('#userPwd').val() != $('#userPwdCk').val()) {
								$('#checkPwCk').text("비밀번호가 일치하지 않습니다.");
								$('#checkPwCk').css('color', 'red');
								$('#userPwdCk').css('border', '2px solid red');
								$("#joinForm :submit").attr("disabled", true)
							}else {
								$('#checkPwCk').text('');
								$('#userPwdCk').css('border', '1px solid black');
								$("#joinForm :submit").removeAttr("disabled");
							}
						});
                	})	
                    </script>
                    
                </form>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>