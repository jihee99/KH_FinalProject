<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    }
    /* 버튼들 */
    #findIdBtn {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 400px;
        height: 50px;
        margin-bottom: 10px;
        margin-top: 30px;
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
    input[type="text"]:disabled {
        background: lightgrey;
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
                <form action="myPageUpdate.tc" method="post" id="form-area" enctype="multipart/form-data">
                <input type="hidden" id="memNo" name="memNo" value="${loginUser.memNo}">
                <input type="hidden" id="userId" name="userId" value="${loginUser.userId}">    
				<input type="hidden" id="memNo" name="memNo" value="${loginTc.memNo}">
				
                    <span id="top-text">이름</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="name" value="${loginUser.userName }" name="userName" disabled> 
                    </div>

                    <span id="top-text">닉네임</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="nickName" value="${loginUser.nickName }" name="nickName" disabled> 
                    </div>

                    <span id="top-text">휴대전화 번호</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="phone" value="${loginUser.phone }" name="phone" disabled> 
                    </div>
                    
                    <span id="top-text">강사 이력</span>
                    <div class="form-group">
                        <textarea name="tcHistory" id="history" cols="51" rows="3" placeholder=" 강사 이력을 입력 하세요." style="border-color: lightgray; resize: none; border-radius: 4px;">${loginTc.tcHistory}</textarea>
                    </div>
                    <div class="form-group">
                    <input type="file" class="form-control" id="HistoryFile" name="reupfile" value="${loginTc.historyFile}" > 
                    </div>
                    <span id="top-text">이전파일</span>
                    <div class="form-group">
                    <input type="text" class="form-control" id="HistoryFile" name="historyFile" value="${loginTc.historyFile}" disabled> 
					</div>
					
                    <span id="top-text">강사 소개</span>
                    <div class="form-group">
                      <textarea name="tcIntroduce" id="intro" cols="51" rows="5" placeholder=" 내용을 입력 하세요." style="border-color: lightgray; resize: none; border-radius: 4px;" required>${loginTc.tcIntroduce}</textarea>
                    </div>

                    <span id="top-text">강사 소셜 미디어</span>
                    <div class="form-group">
	                    	<input type="text" class="form-control" id="SNS" placeholder="sns주소1" name="tcSns" style="width: 340px;" value="${sns}"> 
                    	<button id="plus" type="button" class="rightBtn" onclick="idCheck();">+</button>                    		
                    	
                    </div>
                    <div id="snsForm">
                    	<c:forTokens var="sns" items="${loginTc.tcSns }" delims=",">
	                    	<input type="text" class="form-control" id="SNS" placeholder="sns주소1" name="tcSns" style="width: 340px; margin-bottom:10px;" value="${sns}"> 
                    	</c:forTokens>
                        <!-- 플러스버튼 클릭시 sns 입력 폼이 들어올 자리 -->
                    </div>
                    
                    <script>
				      $(document).ready(function(){
				         let Snsform = 1;
				         let no = 2;
				         
				         $("#plus").click(function (){
				            if(Snsform >= 3){
				               alert("SNS 등록은 3개까지 가능 합니다.");
				               return;
				            }
				            $("#snsForm").append
                            ("<input type='text' placeholder=' sns주소" + no + "' name='tcSns' class='mr-2' style='width: 340px; height:40px; border: solid 1px lightgrey; margin-bottom:15px;' id='SNS" + no + "'>"); 
                            //$("input[name=opcount]").val(no);
                            no++;
                            Snsform++;
				         });                  
				      })
				   </script>
				   
                    <button type="submit" id="findIdBtn" class="btn" style="background-color: rgb(228, 240, 250);">수정하기</button>
                </form>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>