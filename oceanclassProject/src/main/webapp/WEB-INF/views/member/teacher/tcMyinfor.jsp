<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        width: 1000px;
        height: auto;
        margin: auto;
        margin-top: 50px;
    }
    /* 게시판이름 영역*/
    #top-area{
        height: 100px;
        margin-top: 50px;
        display: flex;
        justify-content: space-between;
    }
    /* 게시판이름 */
    #bord-name{
        color: rgb(107, 171, 213);
        font-weight:bolder;
        font-size: 30px;
    }
    .img-box{
        margin: 0 auto;
        width: 100px;
    }
    /* 프로필 area */
    #content-wrap{
        margin: 0 auto;
        width: 400px;
        margin-top: 50px;
        height: 600px;
    }
    /* 버튼들 */
    #findIdBtn {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 400px;
        height: 50px;
        margin-bottom: 10px;
        margin-top: 20px;
    }
    #updateBtn{
    	display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 400px;
        height: 50px;
        margin-bottom: 10px;
        margin-top: 20px;
    }
    /* 박스 이름 */
    #top-text{
        font-size: 20px;
        font-weight: bolder;
    }
    form .form-group{
        display: flex;
        margin-bottom: 5px;
    }#phoneUpdate{
    	background-color: rgb(228, 240, 250);
        border-radius: 4px;
        border-style: none;
        width: 55px;
    }
    .phoneUdBtn{
        background-color: rgb(228, 240, 250);
        border-radius: 4px;
        border-style: none;
        width: 55px;
    }
    #edit-icon{
		display: block;
		bottom: 0;
		width: 30px;
		height: 30px;
		border: 1px solid black;
		border-radius: 50px;
		background-color: white;
		font-size: 20px;
		text-align: center;
		padding-top: 4px;
		color: lightgrey;
		text-decoration: none;
		cursor: pointer;
        margin-left: 75px;
        background-color: black;
        margin-top: -25px;
	}
    /* 모달창 */
    .modalMsg-area{
            font-weight: bolder;
            font-size: 17px;
            margin-bottom: 35px;
            height: 70px;
            text-align: center;
            margin-left: 11px;
    }
    #deletebtn-area>*{
            color: white;
            font-weight: bolder;
            font-size: 15px;
            height: 35px;
            line-height: 5px;
            width: 170px;
            margin-top: -10px;
    }
    #confirm{
        display: flex;
        margin: auto;
        margin-bottom: 5px;
    }
    #check{
        display: flex;
        margin: auto;
        margin-bottom: 5px;
    }
    #confirm-btn{
        background-color: rgb(228, 240, 250);
        margin-right: 2px;
        line-height: 22px;
        color: black;
    }
    #closebtn{
        background-color: gray;
        margin-left: 2px;
    }
    #imgFile{
        border-radius: 250px;
        object-fit: cover;
        /*
        border: 1px solid black;
        height: 100px;
        border-style: none;
        */
    }
</style>
</head>
<body>
    <div style="width: 1600px; height: auto; margin: auto;">
        <jsp:include page="../../common/teacher/tcMypageSidebar.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">내정보 / 수정</span>
            </div>
            <div id="content-wrap">
                <form action="" method="post" id="form-area" enctype="multipart/form-data">
                <input type="hidden" id="memNo" name="memNo" value="${loginUser.memNo}">
				<input type="hidden" id="userId" name="userId" value="${loginTc.userId}">
                    <div class="form-group">
                        <div class="img-box">
                        <c:if test="${ not empty loginUser.profileImg }">
                            <img src="${loginUser.profileImg}" style="width: 110px;" id="imgFile" name="profileImg">
                            <input type="hidden" name="profileImg" value="${loginUser.profileImg}">
                            <label for="ifile" id="edit-icon" class="material-icons icon">edit</label>
                            <input type="file" id="ifile" name="reupfile" onchange="loadImg(this);" hidden>
                        </c:if>
                        </div>
                    </div>

                    <script>
                        function loadImg(inputFile) {
                            if(inputFile.files.length == 1) {
                                const reader = new FileReader();
                                reader.readAsDataURL(inputFile.files[0]);

                                reader.onload = function(e) {
                                    $("#imgFile").attr("src", e.target.result);
                                }
                            }
                        }
                    </script>

                    <span id="top-text">이름</span>
                    <div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="userName" value="${loginUser.userName }" name="userName" required> 
                    </div>
	                    <p id="checkName" style="font-size:0.8em;"></p>
                    </div>
                    
                    <script>
						$(function(){
	                		
	                		// 이름 정규 표현식
							const nameExp = /^[가-힣]{2,}$/;
							
							// 이름 정규표현식 ajax
							$('#userName').blur(function () {
								if (!nameExp.test($(this).val())) {
									$('#checkName').text("한글로 두글자 이상 입력해 주십시오.");
									$('#checkName').css('color', 'red');
									$('#userName').css('border', '2px solid red');
									$("#updateBtn").attr("disabled", true)
								} else {
									$('#checkName').text('');
									$('#userName').css('border', '1px solid black');
									$("#updateBtn").removeAttr("disabled");
								}
							});
	                	})
					</script>

                    <span id="top-text">닉네임</span>
                    <div>
	                    <div class="form-group" id="">
	                      <input type="text" class="form-control" id="nickName" value="${loginUser.nickName }" name="nickName" required> 
	                    </div>
                        <p id="nickResult" style="font-size:0.8em;"></p>
                    </div>
                    
                    <script>
					$(function(){
						
						const $nickInput = $("#form-area input[name=nickName]");
						const nickExp = /^[가-힣\d]{2,6}$/;
						
						$nickInput.keyup(function(){
							//console.log($idInput.val());
							
								
							if($nickInput.val().length >= 2){
								
								$.ajax({
									url:"nickCheck.me",
									data:{nickCheck:$nickInput.val()},
									success:function(result){
										
										if(result == "NNNN") { //사용불가능
											$("#nickResult").show();
											$("#nickResult").css("color", "red").text("중복된 아이디가 존재합니다.");
											// 버튼 비활성화
											$("#updateBtn").attr("disabled", true)
											console.log(result);
											
										}else if(result == "NNNY"){ // 사용가능
											$("#nickResult").show();
											$("#nickResult").css("color", "blue").text("사용 가능한 닉네임입니다!");
											// => 버튼 활성화
											$("#updateBtn").removeAttr("disabled");
										}
										
									},error:function(){
										console.log("닉네임 중복체크용 ajax 통신 실패");
									}
								});	
								
							}
						})
						
					})
				</script>

                    <span id="top-text">휴대전화 번호</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="phone" value="${loginUser.phone }" style="width: 340px;" required> 
                      <button id="phoneUpdate" type="button" class="rightBtn btn-sm" class="phoneUdBtn" data-toggle="modal" data-target="#phoneModal">수정</button>
                    </div>
                    <!-- 번호인증 모달 -->
                    <div class="modal fade" id="phoneModal">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content" style="width: 400px;">
                                <div class="modal-header">
                                    <span style="font-weight: bolder;">휴대폰 인증하기</span>
                                    <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                                </div>
                                <div style="margin-left: 15px;">
                                    <span style="font-size: small; color: grey;">번호 수정을 위해 본인의 휴대폰 번호를 인증해 주세요</span>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body" align="center">
                                    <div class="modalMsg-area">
                                        <div id="confirm">
                                            <input type="text" class="form-control" id="phone2" placeholder="휴대전화 번호(숫자만)" name="phone" style="width: 250px;" required> 
                                            <button id="phoneChk" type="button" class="phoneUdBtn" style="width: 90px; height: 38px; background-color: lightgray;">인증받기</button>
                                        	<input type="hidden" id="phoneDoubleChk"/>
                                        </div>
                                        <div id="phoneResult" style="font-size:0.8em;"></div>
                                        <div id="check">
                                            <input type="number" class="form-control" id="phone3" name="" style="width: 250px;" disabled required> 
                                            <button id="phoneChk2" type="button" class="phoneUdBtn" style="width: 90px; height: 38px;">확인</button>
                                        	<input type="hidden" id="phoneDoubleChk"/>
                                        </div>
                                        <div id="phoneResult2" style="font-size:0.8em;"></div>
                                    </div>
                                    <div id="deletebtn-area">
                                    	<button onclick="formSubmit(2)" class="btn" id="confirm-btn">확인</button>
                                    	<button type="button" class="btn" data-dismiss="modal" id="closebtn">닫기</button>
                                    </div>              
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                    var code2 = ""; 
                    $("#phoneChk").click(function(){ 
                    	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); 
                    	var phone = $("#phone2").val(); 
                    		$.ajax({ 
                    			type:"GET", 
                    			url:"phoneCheck?phone=" + phone, 
                    			cache : false, 
                    			success:function(data){ 
                   					if(data == "error"){ 
                   						alert("휴대폰 번호가 올바르지 않습니다.") 
                   						$("#PhoneChk").text("유효한 번호를 입력해주세요."); 
                   						$("#PhoneChk").css("color","red"); 
                   						$("#phone").attr("autofocus",true); 
                    				}else{ 
                    					$("#phone3").attr("disabled",false); 
                    					$("#phoneChk2").css("display","inline-block"); 
                    					$("#PhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오."); 
                    					$("#PhoneChk").css("color","green"); 
                    					$("#phone").attr("readonly",true); 
                    					code2 = data; 
                    				} 
                    			} 
                    	}); 
                    });

                  //휴대폰 인증번호 대조 
                  $("#phoneChk2").click(function(){ 
                	  if($("#phone3").val() == code2){ 
                		  alert("인증정보가 일치 합니다.")
                		  $("#PhoneChk2").text("인증번호가 일치합니다."); 
                		  $("#PhoneChk2").css("color","green"); 
                		  $("#phoneDoubleChk").val("true"); 
                		  $("#phone3").attr("disabled",true); 
                	  }else{ 
                		  $("#PhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
                		  $("#PhoneChk").css("color","red"); 
                		  $("#phoneDoubleChk").val("false"); 
                		  $(this).attr("autofocus",true); 
                	} 
                });

				   </script>
				   
                    <button onclick="formSubmit(1)" id="findIdBtn" class="btn" style="background-color: lightgray; margin-top: 40px;">비밀번호 변경하기</button>
                    <button onclick="formSubmit(2)" id="updateBtn" class="btn" style="background-color: rgb(228, 240, 250);">수정하기</button>
                    <button onclick="formSubmit(3)" id="findIdBtn" class="btn" style="background-color: lightgray;">탈퇴하기</button>
                </form>
            </div>
            <script>
           		function formSubmit(num){
           			if(num == 1){ 
           				$("#form-area").attr("action", "findPwdForm.me").submit();
           			}else if(num == 2){ 
           				$("#form-area").attr("action", "updateInforPage.tc").submit();
           			}else{
           				$("#form-area").attr("action", "deleteForm.tc").submit();
           			}
           		}
           	</script>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>