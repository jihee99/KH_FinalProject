<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
.wrapper{
    width: 1500px;
    position:fixed; 
}
.side{
    /* margin-top: 50px; */
    width: 15%;
    height: 100%;
    float: left;
    padding : 5px;
}
#header{margin-left: 1150px;}
#menu div{
    float: left;
    margin-top: 20px;
    margin-left: 15px;
}
#menu li{ list-style: none; }
#menu p{
    font-weight: bolder;
    font-size: 18px;
    color: rgb(107, 171, 213);
    margin-left: 15px;
    margin-bottom: 5px;
}
#menu a{
    text-decoration: none;
    float: left;
    color: grey;
    margin-top: 5px;
    margin-left: 5px;
    font-size: 15px;
}
#menu a:hover{
    text-decoration: underline;
    font-weight: bolder;
}
#search input{width: 100px; margin-left: 15px;}

/*채팅관련 스타일*/
#iChat{position: sticky; top: 600px; left: 1400px; background: none; border: none;}
#iChat>img{width: 80px;}

#iChatModal{position: sticky; top: 100px; left: 1090px; border: 1px solid red;}

.modal-content{height: 550px; border: 1px solid green;}
.modal{width: 400px;}

.modal-dialog{border: 1px solid blue; height: 550px;}
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

    <div class="wrapper">
        <div class="side">
            <div id="logo">
                <img src="resources/images/logo.png" width="100%">
            </div>
            <!--  
            <div id="search">
                <input type="text" style="width:60%">
                <button class="btn-xs">검색</button>
            </div>
            -->
            <div id="menu">
                <div id="menu1">
                    <p>강사 정보</p>
                    <ul>
                        <li><a href="?page=tcMyPage.jsp">강사 정보</a></li>
                    </ul>
                </div>
                <div id="menu2">
                    <p>클래스 관리</p>
                    <ul>
                        <li><a href="">내 클래스</a></li>
                        <li><a href="">클래스 리뷰 관리</a></li>
                        <li><a href="">클래스 문의 관리</a></li>
                    </ul>
                </div>
                <div id="menu3">
                    <p>스토어 관리</p>
                    <ul>
                        <li><a href="">내 상품</a></li>
                        <li><a href="">상품 리뷰 관리</a></li>
                        <li><a href="">상품 문의 관리</a></li>
                        <li><a href="">재고 관리</a></li>
                        <li><a href="">주문 배송 관리</a></li>
                    </ul>
                </div>
                <div id="menu4">
                    <p>통계 분석</p>
                    <ul>
                        <li><a href="">클래스 분석</a></li>
                        <li><a href="">상품 분석</a></li>
                    </ul>
                </div>
                <div id="menu5">
                    <p>고객센터</p>
                    <ul>
                        <li><a href="">공지사항</a></li>
                    </ul>
                </div>
            </div>
        </div>
     	<button id="iChat" onclick=""  data-toggle="modal" data-target="#iChatModal">
			<img src="resources/images/iChatImg.png">
		</button>
	</div> 
	
  	<!-- The Modal -->
	<div class="modal" id="iChatModal">
		<form action="">
			<div class="modal-dialog">
				<div class="modal-content">
				
					<!-- Modal Header -->
					<div class="modal-header">
						<table border="1">
							<tr>
								<td><img src="resources/images/logoOnlyImg.png" width="50px;"></td>
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
							<img src="resources/images/chat.png">
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