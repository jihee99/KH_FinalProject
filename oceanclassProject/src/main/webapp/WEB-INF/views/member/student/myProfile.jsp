<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./resources/css/stuMypage.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #join-form{
        width: 650px;
        margin: 0 auto;
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
    .box .input-area{
        width: 300px;
        display: flex;
    }
    .box .input-area input[type="text"]{
        margin-right: 5px;
        flex: 1;
    }
    .button{width: 50%; margin: 0 auto;}
    .btn{
        margin: 0 auto;
        margin-top: 20px;
        margin-left: 50px;
    }
    #changeProfile{
        background-color: rgb(213, 232, 248); 
    }
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
				        <h2>나의 프로필</h2>
				    </div>
				    <div id="join-form">
				        <div class="box">
				            <i class="bi bi-emoji-wink" style="font-size: 6rem;"></i>
				        </div>
				     
				        <div class="box">
				            <label class="textName" for="userId">아이디<span class="star">*</span></label>
				            <div class="input-area">
				                <input type="text" id="userId" name="userId" value="${loginUser.userId}" style="width: 215px;" disabled> 
				            </div>
				        </div>
				
				        <div class="box">
				            <label class="textName" for="userName">이름<span class="star">*</span></label>
				            <div class="input-area">
				                <input type="text" id="userPwdCk" name="userName" value="${loginUser.userName}" readonly>
				            </div>
				        </div>
				
				        <div class="box">
				            <label class="textName" for="nickName">닉네임<span class="star">*</span></label>
				            <div class="input-area">
				                <input type="text" id="nickName" name="nickName" value="${loginUser.nickName}" readonly>
				            </div>
				        </div>
				
				        <div class="box">
				            <label class="textName" for="phone">휴대전화 번호<span class="star">*</span></label>
				            <div class="input-area">
				                <input type="text" id="phone" name="phone" value="${loginUser.phone}" readonly>
				            </div>
				        </div>
				    </div>
				    
				    <div class="button">
					    <button type="button" id="changePwd" class="btn btn-light" onclick="changePwd();">비밀번호 변경</button>
					    <button type="button" id="changeProfile" class="btn" onclick="formProfile();">프로필 수정</button>
					</div>
					
				</div>

			</td>
		</tr>
	</table>

	
	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
		       		<div class="modal-title">비밀번호 변경</div>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
         				<span aria-hidden="true">&times;</span>
        			</button>
	      		</div>
				<div class="modal-body">
					<input type="hidden" id="memNo" value="${loginUser.memNo}">
					<p style="text-align:center;">변경할 비밀번호 : <input type="password" id="newPwd" name="newPwd" placeholder="영문,숫자 포함 6자리 이상" required></p>
					<p style="text-align:center; margin-left: 18px;">비밀번호 확인 : <input type="password" id="checkPwd" name="cheeckPwd"></p>
					<button type="button" id="changeBtn" class="btn btn-light btn-sm btn-block" style="margin:0 auto;">비밀번호 변경</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
	
		function formProfile(){
			location.href='formProfile.me'
		} 	
	
		function changePwd(){
			$(".modal").modal();
		}
		
		$("#changeBtn").click(function(){
			
			var newPwd = $("#newPwd").val();
			console.log(newPwd);
			// 비밀번호 정규 표현식
			const pwExp =/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{6,15}$/i;
			if (!pwExp.test(newPwd)) {
				console.log("여기");
				alert("비밀번호는 영문, 숫자 포함 6~15자리 입니다.");
				$("#newPwd").val('');
				$("#checkPwd").val('');
				$("#newPwd").focus();
			} else{
				console.log("저기");
				insertPwd();
			}
		
		});
		
		function insertPwd(){
			
			var newPwd = $("#newPwd").val();
			var checkPwd = $("#checkPwd").val();
			var memNo = $("#memNo").val();	
		
			if(newPwd != checkPwd){
				alert("비밀번호가 일치하지 않습니다");
				$("#newPwd").val('');
				$("#checkPwd").val('');
				$("#newPwd").focus();
			}else{
				$.ajax({
					url:"changePwd.me",
					data:{userPwd: newPwd, memNo: memNo},
					success:function(result){
						console.log(result);
						alert("비밀번호가 변경되었습니다");
						location.replace("myProfile.me");
					},error:function(){
						console.log("에러");
					}
						 
							
				})
			}
		}
			
		
	</script>

	
</body>
</html>