<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>

/*채팅관련 스타일*/
#iChat{position: fixed; top: 600px; left: 1400px; background: none; border: none;}
#iChat>img{width: 80px;}

#iChatModal{box-sizing: border-box; width: 400px; position: fixed; left: 1090px;}
#iChatModal div{box-sizing: border-box;}
.modal-dialog{height: 500px;}
.modal-content{height: 500px; border: 5px solid green;}

.modal-header table img{width: 60px;}
.modal-header table b{margin-left: 10px; font-size: 14px;}

.modal-body{height: 350px; border:4px solid red;}
.modal-body div{margin:2px; background: lightgray; border-radius: 15px; padding: 10px;}
.modal-body b, p{font-size: 13px;}

.modal-footer{float: left; border: 5px solid yellowgreen;}
.modal-footer input{
  height: 40px; width: 80%;
  background: lightgray; border-radius: 5px; border: none;
}
.modal-footer button{height: 40px; background: none; border: none; margin-top: 2px; margin-left: 5px;}
.modal-footer button img{height: 38px;}

/*채팅관련 스타일*/
#iChat{position: fixed; top: 600px; left: 1400px; background: none; border: none;}
#iChat>img{width: 80px;}

#iChatModal{box-sizing: border-box; width: 400px; position: fixed; margin-top: 100px; left: 1090px; display: none;}
#iChatModal div{box-sizing: border-box;}
.modal_dialog{height: 500px;}
.modal_content{height: 500px; border: 5px solid green;}

.modal_header{height: 80px; border: 5px solid salmon;}
.modal_header table{float: left; margin: 5px;}
.modal_header table img{width: 60px;}
.modal_header table b{margin-left: 10px; font-size: 14px;}
.modal_header button{float: right; margin: 10px;}

.modal_body{height: 350px;}
.modal_body div{margin-top: 10px; margin-left: 10px; margin-right:10px; background: lightgray; border-radius: 15px; padding: 10px;}
.modal_body b, p{font-size: 13px;}

.modal_footer{float: left; border: 5px solid yellowgreen;}
.modal_footer input{
  height: 40px; width: 320px;
  background: lightgray; border-radius: 5px; border: none;
}
.modal_footer button{height: 40px; background: none; border: none; margin-top: 2px; margin-left: 5px; position:absolute;}
.modal_footer button img{height: 38px;}
</style>
</head>
<body>

        <button id="iChat" onclick="">
	  		<img src="resources/images/iChatImg.png">
		</button>
	
<!-- The Modal -->
	<div id="iChatModal">
		<form action="">
		    <div class="modal_dialog">
			<div class="modal_content">
	
			<!-- Modal Header -->
			<div class="modal_header">
				<table border="1">
					<tr>
						<td><img src="resources/images/logoOnlyImg.png"></td>
						<td><b>Instructor Center</b></td>
					</tr>
				</table>
				
				<button type="button" class="close">&times;</button>
			</div>
	
			<!-- Modal body -->
			<div class="modal_body">
				<div>
					<b>OceanClass 고객센터</b><br>
					<p>
					반갑습니다! 문의 내용을 입력해주시면 알맞은 담당자를 <br> 연결해드릴게요!
					<br><br>
					OceanClass는 고객센터를 통해 강사님들과 소통하고 <br>있습니다.
					<br><br>
					고객센터 운영시간 10:00 ~ 19:00
				  </p>
				</div>
			</div>
	
			<!-- Modal footer -->
			<div class="modal_footer">
				<input type="text">
				<button type="submit" class="">
					<img src="resources/images/chat.png">	
				</button>
			</div>
		</div>
		</div>
	  </form>
	</div>

	<script>
	$(function(){
		$("#iChat").click(function(){
			if($("#iChatModal").css("display")=="none"){
				$("#iChatModal").show();
			}
		})
		$(".close").click(function(){
			$("#iChatModal").css("display","none");
		})
	})
	</script>
</body>
</html>