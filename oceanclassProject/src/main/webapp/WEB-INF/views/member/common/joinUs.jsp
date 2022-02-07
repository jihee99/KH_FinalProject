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
        margin-bottom: 25px;
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
    
    .input-area input{
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
    #joinBtn{
        background-color: rgb(213, 232, 248); 
        float: right;
        margin-right: 17px;
    }
</style>
</head>
<body>
	<div style="height: auto; margin: auto; width: 1400px;">
        <div id="wrap">
            <div id="logoImg" align="center">
                <img src="resources/images/logo.png" width="280px">
            </div>
            <div id="join-text" align="center">
                <span>회원 가입</span>
            </div>
            <div id="join-form">
                <form action="" method="post" id="joinForm">
                    <div class="box">
                        <label class="textName" for="st/tc">회원 구분 선택<span class="star">*</span></label>
                        <div class="radio-box">
                            <input type="radio" name="st/tc" id="st/tc" checked>
                            <label for="">학생 회원</label>
                        </div>
                        <div class="radio-box">
                            <input type="radio" name="st/tc" id="st/tc">
                            <label for="">강사 회원</label>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="userId">아이디<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="userId" name="userId" placeholder="아이디(2~12자리)" style="width: 215px;" required>
                            <button type="button" class="rightBtn btn-sm btn-light" onclick="idCheck();">중복 확인</button>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="userPwd">비밀번호<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호(영문,숫자 포함 6자리 이상)" required>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="userPwdCk">비밀번호 확인<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="password" id="userPwdCk" name="userPwdCk" placeholder="비밀번호 확인" required>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="userPwdCk">이름<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="userPwdCk" name="userPwdCk" placeholder="이름" required>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="userId">닉네임<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="userId" class="w200" name="userId" placeholder="닉네임(한 2~8 / 영 2~12)" required>
                            <button type="button" class="rightBtn btn-sm btn-light" onclick="idCheck();">중복 확인</button>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="userId">휴대전화 번호<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="userId" class="w200" name="userId" placeholder="휴대전화 번호(숫자만)" required>
                            <button type="button" class="rightBtn btn-sm btn-light" onclick="idCheck();">본인 인증</button>
                        </div>
                    </div>
                    <div class="box">
                        <label class="textName"></label>
                        <div class="input-area">
                            <input type="number" id="userId" class="w200" name="userId" placeholder="인증번호" required>
                            <button type="button" class="rightBtn btn-sm btn-light" onclick="idCheck();">인증 확인</button>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName">약관동의</label>
                        <div id="termsBox" class="agree-box">
                            <div class="termsCheck">
                                <input type="checkbox" id="agreeAll">
                                <span class="checkText">전체 동의</span>
                            </div>
                            <script>
	                            $(function() {
								    $("#agreeAll").click(function(){
								        if($(this).is(":checked")){
								            $(".agreeCheck").prop('checked', true);
								        } else {
								            $(".agreeCheck").prop('checked', false);
								        }
								    });
								});
                            </script>

                            <hr>
                            <div class="termsCheck">
                                <input type="checkbox" class="agreeCheck" required>
                                <a href="" class="checkText" data-toggle="modal" data-target="#terms1">마케팅 수신 동의</a> 
                                <span class="smallSpan">(선택)</span><span class="star"></span>
                            </div>
                            <div class="termsCheck">
                                <input type="checkbox" class="agreeCheck" required>
                                <a href="" class="checkText" data-toggle="modal" data-target="#terms2">이용약관 동의</a> 
                                <span class="smallSpan">(필수)</span><span class="star"></span>                            
                            </div>
                            <div class="termsCheck">
                                <input type="checkbox" class="agreeCheck" required>
                                <a href="" class="checkText" data-toggle="modal" data-target="#terms3">개인정보 수집 및 이용동의</a> 
                                <span class="smallSpan">(필수)</span><span class="star"></span>                            
                            </div>

                            <!-- terms2 Moda1 -->
                            <div class="modal" id="terms1">
                                <div class="modal-dialog modal-dialog-scrollable">
                                <div class="modal-content">
                                
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                    <h5 class="modal-title" style="font-weight: bold;">마케팅 수신 동의</h5>
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                    </div>
                                    
                                    <!-- Modal body -->
                                    <div class="modal-body" style="padding: 50px">
                                        <p>제 1조 (목적) OceanClass 마케팅 수신 동의는 주식회사 월드클래스(이하 “조”라고 합니다)가 제공하는 서비스와 관련하여 회사와 이용 고객(또는 회원) 간에 서비스의 이용 조건 및 절차, 회사와 회원 간의 권리, 의무 및 책임 사항 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

                                        <p> 오션 클래스 에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(네이버앱 알림 또는 문자), 
                                            이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 오션 클래스 가입 이후 
                                            추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 
                                            이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
                                        </p>
                                    </div>
                                    
                                    <!-- Modal footer -->
                                    <div class="modal-footer" align="center">
                                    <button type="button" class="btn" style="color: rgb(107, 171, 213); margin: auto;" data-dismiss="modal">확인</button>
                                    </div>
                                    
                                </div>
                                </div>
                            </div>

                            <!-- terms2 Moda2 -->
                            <div class="modal" id="terms2">
                                <div class="modal-dialog modal-dialog-scrollable">
                                <div class="modal-content">
                                
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                    <h5 class="modal-title" style="font-weight: bold;">이용약관</h5>
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                    </div>
                                    
                                    <!-- Modal body -->
                                    <div class="modal-body" style="padding: 50px">
                                        <p>제 1조 (목적) OceanClass 서비스 이용약관(이하 “약관”이라 합니다)은 주식회사 월드클래스(이하 “조”라고 합니다)가 제공하는 서비스와 관련하여 회사와 이용 고객(또는 회원) 간에 서비스의 이용 조건 및 절차, 회사와 회원 간의 권리, 의무 및 책임 사항 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

                                        <p> 제 2조 (용어) 본 약관에서 사용하는 용어의 정의는 다음 각 호와 같으며, 정의되지 않은 용어에 대한 해석은 관계법령 및 서비스별 안내에서 정하는 바에 따릅니다.
                                        1. OceanClass 서비스(이하 “서비스”라 합니다): 이용 고객 또는 회원이 PC, 휴대형 단말기, 태블릿PC 등 각종 유무선 기기 또는 프로그램을 통하여 이용할 수 있도록 회사가 제공하는 반려동물 관련 컨텐츠 및 전문가 큐레이션 서비스, SNS 및 그 외 관련된 서비스를 말합니다.
                                        2. 회원: 회사의 서비스에 접속하여 본 약관에 동의하고 ID와 PASSWORD를 발급 받았으며 회사가 제공하는 서비스를 이용하는 고객을 포괄적으로 의미합니다.
                                        3. 회원정보: 회사가 가입신청자에게 회원가입 신청양식(이하 “신청양식"이라 합니다)에 기재를 요청하는 가입신청자의 개인정보와 회원의 식별과 서비스 이용을 위하여 회원이 입력하고 서비스 내 공개된 개인정보를 의미합니다.
                                        4. ID(고유번호): 회원 식별과 회원의 본 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합을 말합니다. 본 서비스에서는 E-mail 주소를 ID로 사용합니다.
                                        5. PASSWORD(비밀번호): 회원의 정보 보호를 위해 회원 자신이 설정한 문자와 숫자의 조합을 말합니다.
                                        6. 게시물: 회원이 회사가 제공하는 서비스에 게시 또는 등록하는 부호(URL 포함), 문자, 음성, 음향, 영상(동영상 포함), 이미지(사진 포함), 파일 등 일체의 정보를 말합니다.
                                        </p>

                                        <p>이하 생략</p>
                                    </div>
                                    
                                    <!-- Modal footer -->
                                    <div class="modal-footer" align="center">
                                    <button type="button" class="btn" style="color: rgb(107, 171, 213); margin: auto;" data-dismiss="modal">확인</button>
                                    </div>
                                    
                                </div>
                                </div>
                            </div>

                            <!-- terms1 Modal3 -->

                            <div class="modal" id="terms3">
                                <div class="modal-dialog modal-dialog-scrollable">
                                <div class="modal-content">
                                
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                    <h5 class="modal-title" style="font-weight: bold;">개인정보 수집 및 이용동의</h5>
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                    </div>
                                    
                                    <!-- Modal body -->
                                    <div class="modal-body" style="padding: 50px">
                                        <h5 style="font-weight: bold;">수집방법</h5>
                                        <p>회원가입(필수)</p>

                                        <h5 style="font-weight: bold;">수집 항목</h5>
                                        <p>닉네임, 이메일, 비밀번호, 주소</p>

                                        <h5 style="font-weight: bold;">수집 및 이용목적</h5>
                                        <p>서비스 이용 및 상담, 환불 및 문의 회신, 마케팅 및 서비스개선을 위한 분석 등</p>

                                        <h5 style="font-weight: bold;">보유 및 이용기간</h5>
                                        <p>회원탈퇴 및 목적 달성 후 지체없이 삭제합니다.</p>
                                        <p>단, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령의 규정에 따라 거래 관계 확인을 위해 개인정보를 일정기간 보유할 수 있습니다.</p>
                                    </div>
                                    
                                    <!-- Modal footer -->
                                    <div class="modal-footer" align="center">
                                    <button type="button" class="btn" style="color: rgb(107, 171, 213); margin: auto;" data-dismiss="modal">확인</button>
                                    </div>
                                    
                                </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <button type="submit" id="joinBtn" class="btn">Join Us !</button>
                </form>
                <br><br><br><br><br><br>
            </div>
        </div>
    </div>
</body>
</html>