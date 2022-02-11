<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    <link rel="stylesheet" href="./resources/css/stuMypage.css">
<style>
     #info>p{
     	width: 90%;
     	margin: auto;
     	margin-top: 100px;
     	font-size: 18px;
     	word-wrap: break-word;
     }
     #deleteMem{margin-left: 300px; margin-top: 50px;}
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
				    <h2>회원 탈퇴</h2>
				    <div id="info">
					    <p>
					    1. 기존 아이디로 재가입이 불가능 합니다. 회원 탈퇴를 신청하시면 해당 아이디는 즉시 탈퇴 처리되며, 탈퇴한 아이디는 재사용 및 복구가 불가능합니다.<br> <br>
						2. 회원 탈퇴시 수강중인 강의와 진행중인 주문에 대한 조회가 불가능하며 모든 작성글은 <br>탈퇴 후 삭제할 수 없습니다. 게시물 등의 삭제를 원하시는 경우에는 반드시 직접 삭제 후, <br>탈퇴 신청을 해 주시기 바랍니다.<br> <br>
						3. 위 항목에 동의하시면 아래 비밀번호 확인 후 탈퇴 신청을 진행해주시기 바랍니다.<br> <br>
					    </p>
						   
				    </div>
					<button id="deleteMem" type="button" class="btn btn-info btn-lg" >회원탈퇴</button>
				</div>
			</td>
		</tr>
	</table>
	
	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form action="myDelete.me" method="post">
						비밀번호를 입력해주세요.
						<input type="hidden" id="userId" name="userId" value="${loginUser.userId}">
						<input type="password" placeholder="비밀번호 입력" id="userPwd" name="userPwd" required>
						<button type="submit" id="delBtn" class="btn btn-light btn-sm btn-block" style="margin:0 auto;">확인</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$("#deleteMem").click(function(){
			$(".modal").modal();
		});
	</script>
	

    

</body>
</html>