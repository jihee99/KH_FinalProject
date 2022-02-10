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
		                <form id="changeProfile" method="post" action="changeProfile.me">
		                	<input type="hidden" id="memNo" name="memNo" value="${loginUser.memNo}">
		                    <div class="box">
		                   		<div id="preview"></div>
		                    </div>
		                   
		                    <div class="box">
		                        <label class="textName" for="st/tc">프로필 이미지</label>
		                        <input type="file" id="profileImg" name="profileImg" class="form-control" accept=".gif, .jpg, .png" style="width: 300px;">
		                    </div>
		                 
		
		                    <div class="box">
		                        <label class="textName" for="userId">아이디</label>
		                        <div class="input-area">
		                            <input type="text" id="userId" name="userId" value="${loginUser.userId}" style="width: 215px;" disabled> 
		                        </div>
		                    </div>
		
		                    <div class="box">
		                        <label class="textName" for="userPwdCk">이름</label>
		                        <div class="input-area">
		                            <input type="text" id="userPwdCk" name="userPwdCk" value="${loginUser.userName}" disabled>
		                        </div>
		                    </div>
		
		                    <div class="box">
		                        <label class="textName" for="userId">닉네임<span class="star">*</span></label>
		                        <div class="input-area">
		                            <input type="text" id="nickName" name="nickName" class="w200" value="${loginUser.nickName}" required>
		                            <button type="button" class="rightBtn btn-sm btn-light" onclick="idCheck();">중복 확인</button>
		                        </div>
		                    </div>
		
		                    <div class="box">
		                        <label class="textName" for="userId">휴대전화 번호<span class="star">*</span></label>
		                        <div class="input-area">
		                            <input type="text" id="phone" name="phone" class="w200" value="${loginUser.phone}" required>
		                            <button type="button" class="rightBtn btn-sm btn-light" onclick="idCheck();">본인 인증</button>
		                        </div>
		                    </div>
		                    <div class="box">
		                        <label class="textName"></label>
		                        <div class="input-area">
		                            <input type="text" id="checkNo" name="checkNo" placeholder="인증번호" required>
		                            <button type="button" class="rightBtn btn-sm btn-light" onclick="idCheck();">인증 확인</button>
		                        </div>
		                    </div>
		                    
		                    <div class="button">
							    <button type="submit" id="changeBtn" class="btn">수정</button>
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
		$('#profileImg').change(function(){
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