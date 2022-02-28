<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #join-form{
        width: 650px;
        margin: 0 auto;
        margin-top: 50px;
        display: flex;
        flex-direction: column;
    }
    .bi{display: block; width: 100px; margin: 0 auto;}
    .textName {
        float: left;
        width: 180px;
        font-size: 20px;
        font-weight: bold;
        height: 40px;
        line-height: 40px;
        text-align: right;
        margin-right: 20px;
    }
    input[type=text] {
        height: 45px;
        width: 500px;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 10px;
    }
    .box{margin-bottom: 25px;}
    .box .input-area{width: 300px; display: flex;}
    .box .input-area input[type="text"]{margin-right: 5px; flex: 1;}
    .button{width: 50%; margin: 0 auto;}
    .btn{
        margin: 0 auto;
        margin-top: 20px;
        margin-left: 50px;
    }
    #changeBtn{background-color: rgb(213, 232, 248); }
    #preview{width: 150px; margin:0 auto;}
</style>
</head>
<body>
    <table id="mainTable">
		<tr>
			<td colspan="2" style="height:200px;"><jsp:include page="mypageHeader.jsp" flush="false" /></td>
		</tr>
		
		<tr>
			<td id="mainSide"><jsp:include page="mypageSidebar.jsp" flush="false" /></td>
			<td id="mainContent">
				
				<div class="content">
		    		<div id="join-text">
		                <h2>프로필 수정</h2>
		            </div>
		            <div id="join-form">
		                <form id="changeProfile" method="post" action="changeProfile.me" enctype="multipart/form-data">
		                	<input type="hidden" id="memNo" name="memNo" value="${loginUser.memNo}">
		                    <div class="box">
		                   		<div id="preview">
		                   			<c:if test="${not empty loginUser.profileImg}">
						    			<img src="${loginUser.profileImg}" style="width: 200px;">
						    		</c:if>
		                   		</div>
		                    </div>
		                    
		                    <div class="box">
		                        <label class="textName" for="upfile">프로필 이미지</label>
		                        <input type="file" id="upfile" name="upfile" class="form-control" accept=".gif, .jpg, .png" style="width: 300px;">
		                    </div>
		                 
		
		                    <div class="box">
		                        <label class="textName" for="userId">아이디</label>
		                        <div class="input-area">
		                            <input type="text" id="userId" name="userId" value="${loginUser.userId}" style="width: 215px;" disabled> 
		                        </div>
		                    </div>
		
		                    <div class="box">
		                        <label class="textName" for="userName">이름</label>
		                        <div class="input-area">
		                            <input type="text" id="userName" name="uuserName" value="${loginUser.userName}" disabled>
		                        </div>
		                    </div>
		
		                    <div class="box">
		                        <label class="textName" for="nickName">닉네임<span class="star">*</span></label>
		                        <div class="input-area">
		                            <input type="text" id="nickName" name="nickName" class="w200" value="${loginUser.nickName}" required>
		                            <button type="button" class="rightBtn btn-sm btn-light" onclick="nickCheck();">중복 확인</button>
		                        </div>
		                    </div>
		                    
		                    <script>
		                    	function nickCheck(){
		                    		let $nickInput = $("#nickName").val();
									const nickExp = /^[가-힣\d]{2,6}$/;	// 닉네임 정규 표현식
									
									if (!nickExp.test($nickInput)) {
										alert("한글과 숫자 2~6 자리로 입력해 주십시오.");
										$("#nickName").val('');
										$("#nickName").focus();
									} else {
										$.ajax({
			                    			url:"checkNick.me",
			                    			data:{nickName:$nickInput},
			                    			success:function(result){
			                    				//console.log(result);
			                    				if(result>0){
			                    					alert("중복된 닉네임입니다. 다른 닉네임을 사용해주세요.");
			                    					$("#nickName").val('');
													$("#nickName").focus();
			                    				}else{
				                    				alert("사용가능한 닉네임입니다");
			                    				}
			                    			},error:function(){
			                    				console.log("닉네임중복체크실패");
			                    			}
			                    		})
									}
		                    	}
		                    </script>
		                     
		                    <div class="box">
		                        <label class="textName" for="phone">휴대전화 번호<span class="star">*</span></label>
		                        <div class="input-area">
		                            <input type="text" id="phone" name="phone" class="w200" value="${loginUser.phone}" required>
		                            <button type="button" class="rightBtn btn-sm btn-light" onclick="phoneCheck();">본인 인증</button>
		                        </div>
		                        <div id="phoneResult" style="font-size:0.8em;"></div>
		                    </div>
		                    
		                    <script>
								$(function(){
			                		
									const phoneExp = /^[\d]{11}$/; // 휴대번호 정규 표현식
									
									$('#phone').blur(function () {
										if (!phoneExp.test($(this).val())) {
											$('#phoneResult').text("올바른 휴대폰 번호를 숫자만 입력해 주세요.");
											$('#phoneResult').css('color', 'red');
											$('#phone').css('border', '2px solid red');
											$("#joinForm :submit").attr("disabled", true)
										} else {
											$('#phoneResult').text("본인인증을 진행해주세요.");
											$('#phoneResult').css('color', 'blue');
											$('#phone').css('border', '1px solid black');
										}
									});
			                	});
			                	
			                	var code2 = ""; 
			                    function phoneCheck(){ 
			                    	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); 
			                    	var phone = $("#phone").val(); 
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
			                    					$("#phone2").attr("disabled",false); 
			                    					$("#phoneChk2").css("display","inline-block"); 
			                    					$("#PhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오."); 
			                    					$("#PhoneChk").css("color","green"); 
			                    					$("#phone").attr("readonly",true); 
			                    					code2 = data; 
			                    				} 
			                    			} 
			                    	}); 
			                    };
							</script>
		                    
		                    <div class="box">
		                        <label class="textName"></label>
		                        <div class="input-area">
		                            <input type="text" id="checkNo" name="checkNo" placeholder="인증번호" required>
		                            <button type="button" class="rightBtn btn-sm btn-light" onclick="numCheck();">인증 확인</button>
		                            <input type="hidden" id="phoneDoubleChk"/>
		                        </div>
		                        <div id="PhoneChk" style="font-size:0.8em;"></div>
		                    </div>
		                    
		                    <script>
		                    //휴대폰 인증번호 대조 
		                    function numCheck(){ 
			                  	  if($("#checkNo").val() == code2){ 
			                  		  $("#PhoneChk").text("인증번호가 일치합니다."); 
			                  		  $("#PhoneChk").css("color","green"); 
			                  		  $("#phoneDoubleChk").val("true"); 
			                  		  $("#checkNo").attr("disabled",true); 
			                  	  }else{ 
			                  		  $("#PhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
			                  		  $("#PhoneChk").css("color","red"); 
			                  		  $("#phoneDoubleChk").val("false"); 
			                  		  $(this).attr("autofocus",true); 
			                  	} 
			                  };
		                    </script>
		                    
		                    <div class="button">
							    <button type="submit" class="btn">수정</button>
							    <button type="reset" class="btn btn-light">취소</button>
							</div>
		                </form>
		                <br><br><br><br><br><br>
		    		</div>
				</div>
				
			</td>
		</tr>
	</table>
	
	<script>
		$('#upfile').change(function(){
			setPreview(this);
		})
		
		function setPreview(input) {
			if (input.files && input.files[0]) {
				var reader = new window.FileReader();
				reader.onload = function(e) {
					$('#preview').html("<img src="+e.target.result+" style='width: 100%; object-fit:cover;'>");
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
    
</body>
</html>

</body>
</html>