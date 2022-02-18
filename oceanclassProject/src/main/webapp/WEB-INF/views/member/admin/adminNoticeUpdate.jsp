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
    #adminNoticeUdForm>div {
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
                <span id="bord-name">공지사항 수정</span>
            </div>
            <div id="enroll-form">
                <form action="" method="post" id="adminNoticeUdForm" enctype="multipart/form-data">
                    <input type="hidden" id="memNo" name="mno" value="${loginUser.memNo}">
                    <input type="hidden" id="noNo" name="noNo" value="${n.noNo}">
                    <div class="box">
                        <label class="textName" for="">공지사항 카테고리<span class="star">*</span></label>
                        <div class="input-area">
                            <select name="category" id="">
                                <option value="C">클래스</option>
			                    <option value="S">스토어</option>
			                    <option value="T">강사</option>
			                    <option value="E">기타</option>
                            </select>
                        </div>
                    </div>
                    
					<script>
                    	$(function(){
                    		$("select[name=category] option").each(function(){
                    			if($(this).val() == "${n.category}"){
                    				$(this).attr("selected", true);
                    			}
                    		})
                    	})
                    </script>
                    
                    <div class="box">
                        <label class="textName" for="">제목<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="" name="noTitle" value="${ n.noTitle }" required>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">내용<span class="star">*</span></label>
                        <div class="input-area">
                            <textarea name="noContent" id="" cols="58" rows="8">${ n.noContent }</textarea>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">파일 첨부<span class="star">*</span></label>
                        <div class="input-area">
                        	<c:if test="${ not empty n.img }">
	                            <img id="imgFile" width="450" height="230" src="${n.img}">
	                            <input type="hidden" name="filePath" value="${n.img}">
	                            <input type="hidden" name="img" value="${n.img}">
                            </c:if>
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
                    <div id="btnBox">
                        <button onclick="postFormSubmit();" id="Enroll" class="btn" style="background-color: rgb(107, 171, 213); color: white;">수정</button>
                        <button type="button" onclick="history.back()" id="cancel" class="btn" style="background-color:gray; color: white;" >취소</button>
                    </div>
                </form>
            </div>
            <script>
           		function postFormSubmit(){
           			$("#adminNoticeUdForm").attr("action", "noticeUpdate.ad").submit();
           		}
           	</script>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>