<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
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
    .form-group input{
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
                      <input type="text" class="form-control" id="_id" placeholder="아이디를 입력하세요." name="userId" required>
                      <!-- <div class="valid-feedback"></div>
                      <div class="invalid-feedback">아이디를 입력해주세요</div> -->
                    </div>
                    <!-- 비밀번호 인풋 null일 때-->
                    <div class="form-group">
                      <input type="password" class="form-control" id="_pwd" placeholder="비밀번호를 입력하세요." name="userPwd" required>
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
                        <input type="checkbox" id="idSaveCheck" name="idChk" value = "true">
                        <span id="fix" href="" style="margin-right: 10px;">아이디 기억하기</span>
                        <input type="checkbox" disabled id="pwdSaveCheck" name="idChk" value = "true">
                        <span id="fix" href="">비밀번호 기억하기</span>
                    </div>

                    <button type="submit" id="_btnLogin" class="btn" style="background-color: rgb(228, 240, 250);">로그인 하기</button>
                    <!-- <button type="submit" class="btn" style="background-color: rgb(232, 248, 239);">네이버로 로그인 하기</button> -->
                	
                	<!-- Naver Login Btn --> 
                	<div id="naverIdLogin" > 
	                	<a id="naverIdLogin_loginButton"> 
	                		<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0" width="100%" height="55px" style="max-width:400px;max-height:60px"/> 
	                	</a> 
                	</div>

					
					<script type="text/javascript"> 
					var naverLogin = new naver.LoginWithNaverId({ 
						clientId: "Jrjt2SGEiCrkTfdJbLaH", 
						callbackUrl: "http://localhost:8888/oceanclass/", 
						isPopup: false, 
						/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */ 
						}); 
					/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */ 
					naverLogin.init(); 
					
					/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */ 
					window.addEventListener('load', function () { 
						naverLogin.getLoginStatus(function (status) { 
							if (status) { 
								/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */ 
								console.log(naverLogin.accessToken.accessToken) 
								var email = naverLogin.user.getEmail(); 
								var profileImage = naverLogin.user.getProfileImage(); 
								var name = naverLogin.user.getName(); 
								var uniqId = naverLogin.user.getId(); 
								if( email == undefined || email == null) { 
									alert("이메일은 필수정보입니다. 정보제공을 동의해주세요."); 
									/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */ 
									naverLogin.reprompt(); 
									return; 
									
								}else if( name == undefined || name == null){ 
									alert("회원이름은 필수정보입니다. 정보제공을 동의해주세요."); 
									naverLogin.reprompt(); 
									return; 
									
								}else{ 
									// 성공 
									} 
								} else { 
									console.log("callback 처리에 실패하였습니다."); 
									} 
							}); 
						});

					</script>
                	
                </form>
            </div>
            
            <script type="text/javascript">
            function setCookie(cookieName, value, exdays){
                var exdate = new Date();
                exdate.setDate(exdate.getDate() + exdays);
                var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
                document.cookie = cookieName + "=" + cookieValue;
            }
             
            function deleteCookie(cookieName){
                var expireDate = new Date();
                expireDate.setDate(expireDate.getDate() - 1); //어제날짜를 쿠키 소멸날짜로 설정
                document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
            }
             
            function getCookie(cookieName) {
                cookieName = cookieName + '=';
                var cookieData = document.cookie;
                var start = cookieData.indexOf(cookieName);
                var cookieValue = '';
                if(start != -1){
                    start += cookieName.length;
                    var end = cookieData.indexOf(';', start);
                    if(end == -1)end = cookieData.length;
                    cookieValue = cookieData.substring(start, end);
                }
                return unescape(cookieValue);
            }
            
            $(document).ready(function() {
                //Id 쿠키 저장
                var userInputId = getCookie("userInputId");
                $("input[name='userId']").val(userInputId); 
                 
                if($("input[name='userId']").val() != ""){ 
                    $("#idSaveCheck").attr("checked", true); 
                    $("#pwdSaveCheck").removeAttr("disabled");
                }
                 
                $("#idSaveCheck").change(function(){ 
                    if($("#idSaveCheck").is(":checked")){                     
                           //id 저장 클릭시 pwd 저장 체크박스 활성화
                           $("#pwdSaveCheck").removeAttr("disabled");
                           $("#pwdSaveCheck").removeClass('no_act');
                        var userInputId = $("input[name='userId']").val();
                        setCookie("userInputId", userInputId, 365);
                    }else{ 
                        deleteCookie("userInputId");
                        $("#pwdSaveCheck").attr("checked", false); 
                        deleteCookie("userInputPwd");
                        $("#pwdSaveCheck").attr("disabled", true);
                        $("#pwdSaveCheck").addClass('no_act');
                    }
                });
                 
              
                $("input[name='userId']").keyup(function(){ 
                    if($("#idSaveCheck").is(":checked")){ 
                        var userInputId = $("input[name='userId']").val();
                        setCookie("userInputId", userInputId, 365);
                    }
                });
                
                //Pwd 쿠키 저장 
                var userInputPwd = getCookie("userInputPwd");
                $("input[name='userPwd']").val(userInputPwd); 
                 
                if($("input[name='userPwd']").val() != ""){ 
                    $("#pwdSaveCheck").attr("checked", true);
                    $("#pwdSaveCheck").removeClass('no_act');
                }
                 
                $("#pwdSaveCheck").change(function(){ 
                    if($("#pwdSaveCheck").is(":checked")){ 
                        var userInputPwd = $("input[name='userPwd']").val();
                        setCookie("userInputPwd", userInputPwd, 365);
                    }else{ 
                        deleteCookie("userInputPwd");
                    }
                });
                 
              
                $("input[name='userPwd']").keyup(function(){ 
                    if($("#pwdSaveCheck").is(":checked")){ 
                        var userInputPwd = $("input[name='userPwd']").val();
                        setCookie("userInputPwd", userInputPwd, 365);
                    }
                });
            });
        </script>
            
            <div class="loginBottom" align="center">
                <div id="join">
                    아직도 OceanClass 회원이 아니신가요? &ensp;<a style="color: rgb(52, 152, 219);" href="joinUsForm.me">회원가입 하기</a>
                </div>
                <div id="find">
                    <a href="">아이디 찾기</a>&ensp; 
                    <a href="">비밀번호 재설정</a>
                </div>
                <!-- 아이디 비번 틀렸을때 -->
                <!-- <div id="checkResult" style="font-size:1.5em; color: rgb(192, 57, 43); font-weight: bolder;">
                    <img src="resources/images/warning.jpg" width="25px">
                    아이디 혹은 비밀번호를 다시 확인 하세요.
                </div>-->
                
            </div>
        </div>
    </div>
</body>
</html>