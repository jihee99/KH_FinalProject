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
    #iChat{position: sticky; top: 600px; left: 1400px; background: none; border: none;}
    #iChat>img{width: 80px;}

    #iChatModal{position: sticky;  top: 80px; left: 1090px; border: 1px solid red;}
    
    .modal-content{ height: 500px; border: 1px solid green;}
    .modal{width: 400px; border: 1px solid yellow;}

    .modal-dialog{border: 1px solid blue; height: 500px;}
    .modal-body div{background: lightgray; border-radius: 15px; padding: 10px;}
    .modal-body b, p{font-size: 13px;}

    .modal-footer{float: left;}
    .modal-footer input{
      background: lightgray; border-radius: 5px; 
      box-sizing: border-box; border: none; height: 40px; width: 80%;
    }
    .modal-footer button{height: 40px; background: none; border: none;}
    .modal-footer button img{height: 36px;}
</style>
</head>
<body>

	
	<button id="iChat" onclick=""  data-toggle="modal" data-target="#iChatModal">
	  <img src="images\iChatImg.png">
	</button>
	
	
	<!-- The Modal -->
	<div class="modal" id="iChatModal">
		<form action="">
			<div class="modal-dialog">
				<div class="modal-content">
				
					<!-- Modal Header -->
					<div class="modal-header">
						<table border="1">
							<tr>
								<td><img src="images\logoOnlyImg.png" width="50px;"></td>
								<td><b style="margin-left: 5px;">Instructor Center</b></td>
							</tr>
						</table>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
				
					<!-- Modal body -->
					<div class="modal-body">
						<div>
							<b>OceanClass 고객센터</b><br>
							<p>
								반갑습니다! 문의 내용을 입력해주시면 알맞은 담당자를 <br> 연결해드릴게요!
								<br><br>
								OceanClass는 고객센터를 통해 강사님들과 소통하고있습니다.
								<br><br>
								고객센터 운영시간 10:00 ~ 19:00
							</p>
						</div>
					</div>
				
					<!-- Modal footer -->
					<div class="modal-footer">
						<input type="text">
						<button type="submit" class="">
							<img src="images\chat.png">
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
	   function myModal(){
	        $("#iChatModal").show();
	    }
	</script>
</body>
</html>