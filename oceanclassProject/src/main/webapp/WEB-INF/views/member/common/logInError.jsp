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
                    <!-- id ?????? null??? ???-->
                    <div class="form-group">
                      <input type="text" class="form-control" id="userIdPwd" placeholder="???????????? ???????????????." name="userId" required>
                      <!-- <div class="valid-feedback"></div>
                      <div class="invalid-feedback">???????????? ??????????????????</div> -->
                    </div>
                    <!-- ???????????? ?????? null??? ???-->
                    <div class="form-group">
                      <input type="password" class="form-control" id="userIdPwd" placeholder="??????????????? ???????????????." name="userPwd" required>
                      <!-- <div class="valid-feedback"></div>
                      <div class="invalid-feedback">??????????????? ??????????????????</div> -->
                    </div>
        
                    <!--
                    // ????????? ????????? ??? 
                    <div>
                      <p class="notifyRed">?????????????????? ????????? ?????????</p>
                    </div>
        
                    // ???????????? ????????? ???
                    <div>
                      <p class="notifyRed">??????????????? ???????????????</p>
                    </div>
                    -->
                    <div id="login-fix">
                        <input type="checkbox" id="idSaveCheck" name="idChk" value = "true">
                        <span id="fix" href="" style="margin-right: 10px;">????????? ????????????</span>
                        <input type="checkbox" disabled id="pwdSaveCheck" name="idChk" value = "true">
                        <span id="fix" href="">???????????? ????????????</span>
                    </div>

                    <button type="submit" class="btn" style="background-color: rgb(228, 240, 250);">????????? ??????</button>
                    <button type="submit" class="btn" style="background-color: rgb(255, 224, 73);">???????????? ????????? ??????</button>
                </form>

                <script type="text/javascript">
            function setCookie(cookieName, value, exdays){
                var exdate = new Date();
                exdate.setDate(exdate.getDate() + exdays);
                var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
                document.cookie = cookieName + "=" + cookieValue;
            }
             
            function deleteCookie(cookieName){
                var expireDate = new Date();
                expireDate.setDate(expireDate.getDate() - 1); //??????????????? ?????? ??????????????? ??????
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
                //Id ?????? ??????
                var userInputId = getCookie("userInputId");
                $("input[name='userId']").val(userInputId); 
                 
                if($("input[name='userId']").val() != ""){ 
                    $("#idSaveCheck").attr("checked", true); 
                    $("#pwdSaveCheck").removeAttr("disabled");
                }
                 
                $("#idSaveCheck").change(function(){ 
                    if($("#idSaveCheck").is(":checked")){                     
                           //id ?????? ????????? pwd ?????? ???????????? ?????????
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
                
                //Pwd ?????? ?????? 
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
            </div>
            <div class="loginBottom" align="center">
                <div id="join">
                    ????????? OceanClass ????????? ???????????????? &ensp;<a style="color: rgb(52, 152, 219);" href="joinUsForm.me">???????????? ??????</a>
                </div>
                <div id="find">
                    <a href="">????????? ??????</a>&ensp; 
                    <a href="">???????????? ?????????</a>
                </div>
                <!-- ????????? ?????? ???????????? -->
                <div id="checkResult" style="font-size:1.5em; color: rgb(192, 57, 43); font-weight: bolder;">
                    <img src="resources/images/warning.jpg" width="25px">
                    ????????? ?????? ??????????????? ?????? ?????? ?????????.
                </div>
                
            </div>
        </div>
    </div>
</body>
</html>