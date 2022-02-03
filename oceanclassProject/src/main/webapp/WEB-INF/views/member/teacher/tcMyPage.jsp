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
    /* 박스 이름 */
    #top-text{
        font-size: 20px;
        font-weight: bolder;
    }
    .form-group{
        display: flex;
    }
    #phoneUpdate{
        background-color: rgb(228, 240, 250);
        border-radius: 4px;
        border-style: none;
        width: 55px;
    }
    #plus{
        background-color: rgb(52, 152, 219);
        border-radius: 4px;
        border-style: none;
        width: 38px;
        color: white;
        font-weight: bolder;
        font-size: 20px;
        margin-left: 10px;
    }
    #edit-icon{
		display: block;
		bottom: 0;
		width: 30px;
		height: 30px;
		border: 1px solid black;
		border-radius: 50px;
		background-color: white;
		font-size: 20px;/* 아이콘 크기조절ㅋㅋ */
		text-align: center;
		padding-top: 4px;
		color: lightgrey;
		text-decoration: none;
		cursor: pointer;
        margin-left: 75px;
        background-color: black;
        margin-top: -25px;
	}
</style>
</head>
<body>
    <div style="width: 1600px; height: auto; margin: auto;">
        <jsp:include page="../../common/teacher/tcMypageSidebar.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">강사정보 / 수정</span>
            </div>
            <div id="content-wrap">
                <form action="" method="post" id="form-area">
                    
                    <div class="form-group">
                        <div class="img-box">
                            <img src="resources/images/user.png" style="width: 100px;">
                            <label for="imgfile" id="edit-icon" class="material-icons icon">edit</label>
                            <input type="file" id="imgfile" hidden>
                        </div>
                    </div>

                    <span id="top-text">이름</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="name" placeholder="김혜선" name="name" required> 
                    </div>

                    <span id="top-text">닉네임</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="nickName" placeholder="짱보미" name="nickName" required> 
                    </div>

                    <span id="top-text">휴대전화 번호</span>
                    <div class="form-group">
                      <input type="number" class="form-control" id="phone" placeholder="01095227273" name="phone" style="width: 340px;" required> 
                      <button id="phoneUpdate" type="button" class="rightBtn btn-sm" onclick="idCheck();">수정</button>
                    </div>

                    <span id="top-text">강사 이력</span>
                    <div class="form-group">
                      <input type="file" class="form-control" id="history" placeholder="강사 이력을 입력 하세요." name="history" required> 
                    </div>

                    <span id="top-text">강사 소개</span>
                    <div class="form-group">
                      <textarea name="" id="intro" cols="51" rows="5" placeholder="내용을 입력 하세요." style="border-color: lightgray; resize: none; border-radius: 4px;"></textarea>
                    </div>

                    <span id="top-text">강사 소셜 미디어</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="SNS" placeholder="유튜브 주소" name="SNS" style="width: 340px;" required> 
                      <button id="plus" type="button" class="rightBtn" onclick="idCheck();">+</button>
                    </div>
                    <div>
                        <!-- 플러스버튼 클릭시 sns 입력 폼이 들어올 자리 -->
                    </div>

                    <button type="submit" id="findIdBtn" class="btn" style="background-color: lightgray; margin-top: 40px;">비밀번호 변경하기</button>
                    <button type="submit" id="findIdBtn" class="btn" style="background-color: rgb(228, 240, 250);">수정하기</button>
                    <button type="submit" id="findIdBtn" class="btn" style="background-color: lightgray;">탈퇴하기</button>

                </form>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>