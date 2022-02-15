<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    /* 게시판이름 영역*/
    #top-area{
        height: 100px;
        margin-top: 50px;
        /* display: flex; */
        margin-bottom: 90px;
    }
    /* 게시판이름 */
    #bord-name{
        color: rgb(107, 171, 213);
        font-weight:bolder;
        font-size: 30px;
    }
    #enroll-form{
        width: 650px;
        margin: 0 auto;
        display: flex;
    }
    #detailForm>div {
        padding-bottom: 30px;
        display: flex;
    }
    #enroll-text{
        font-size: 24px;
        font-weight: bolder;
        margin-bottom: 25px;
        color: rgb(107, 171, 213);
    }
    .textName {
        float: left;
        width: 180px;
        font-size: 20px;
        font-weight: bold;
        height: 40px;
        line-height: 40px;
        text-align: left;
        margin-right: 35px;
    }
    .input-area input{
        height: 45px;
        width: 450px;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 5px;
        margin-right: 5px;
        /* flex: 1; */
    }
    .input-area select{
        height: 45px;
        width: 150px;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 5px;
        margin-right: 5px;
        /* flex: 1; */
    }
    .input-area textarea{
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 5px;
        margin-right: 5px;
        resize: none;
    }
    .box .input-area{
        width: 450px;
        /* display: flex; */
    }
    /* 등록,취소  버튼 */
    #btnBox{
        margin: auto;
        justify-content: center;
    }
    #btnBox button{
        margin-top: 70px;
        width: 100px;
        margin-left: 30px;
    }
</style>
</head>
<body>
	<div style="height: auto; margin: auto; width: 1600px;">
        <jsp:include page="../../common/admin/adminSidebar.jsp" />
        <div id="wrap">
            <div id="top-area">
                <span id="bord-name">이벤트 수정/삭제</span>
            </div>
            <div id="enroll-form">
                <form action="" method="post" id="detailForm" enctype="multipart/form-data">
                    <input type="hidden" id="memNo" name="mno" value="${loginUser.memNo}">
                    <input type="hidden" id="eventNo" name="eno" value="${e.eventNo}">
                    <div class="box">
                        <label class="textName" for="">이벤트 카테고리<span class="star">*</span></label>
                        <div class="input-area">
                            <select name="category" id="">
                                <option value="A">전체</option>
                                <option value="C">클래스</option>
                                <option value="S">스토어</option>
                                <option value="P">포인트</option>
                                <option value="R">댓글</option>
                                <option value="CP">기타</option>
                            </select>
                        </div>
                    </div>
					<script>
                    	$(function(){
                    		$("select[name=category] option").each(function(){
                    			if($(this).val() == "${e.category}"){
                    				$(this).attr("selected", true);
                    			}
                    		})
                    	})
                    </script>
                    <div class="box">
                        <label class="textName" for="">제목<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="" name="eventTitle" value="${e.eventTitle}" required>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">내용<span class="star">*</span></label>
                        <div class="input-area">
                            <textarea name="eventContent" id="" cols="58" rows="8">${e.eventContent}</textarea>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">파일 첨부<span class="star">*</span></label>
                        <div class="input-area">
                            <img id="imgFile" width="450" height="230" src="${e.img}">
                        	<input type="hidden" name="filePath" value="${e.img}">
                        	<input type="hidden" name="img" value="${e.img}">
                            <input type="file" id="" name="reupfile" onchange="loadImg(this);">
                        </div>
                    </div>
                    
                    <script>
                        function loadImg(inputFile) {
                            if(inputFile.files.length == 1) {
                                const reader = new FileReader();
                                reader.readAsDataURL(inputFile.files[0]);

                                reader.onload = function(e) {
                                    $("#imgFile").attr("src", e.target.result);
                                }
                            }
                        }
                    </script>
                    

                    <div class="box">
                        <label class="textName" for="">해시 태그<span class="star"></span></label>
                        <div class="input-area">
                            <input type="text" id="" name="tag" value="${e.tag}">
                        </div>
                    </div>
                    <div id="btnBox">
                        <button id="Enroll" onclick="postFormSubmit(1);" class="btn" style="background-color: rgb(107, 171, 213); color: white;">수정</button>
                        <button type="button" id="cancel" onclick="history.back()" class="btn" style="background-color:gray; color: white;" >취소</button>
                        <button id="Enroll" onclick="postFormSubmit(2);" class="btn" style="background-color: rgb(211, 84, 0); color: white;">종료</button>
                    </div>
                </form>
            </div>
            <script>
           		function postFormSubmit(num){
           			if(num == 1){ // 수정하기 클릭시
           				$("#detailForm").attr("action", "evUpdate.ad").submit();
           			}else{ // 종료하기 클릭시
           				$("#detailForm").attr("action", "evEnd.ad").submit();
           			}
           		}
           	</script>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>