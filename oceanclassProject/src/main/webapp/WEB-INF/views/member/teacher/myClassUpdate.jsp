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
        display: flex;
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
    #enrollForm>div {
        padding-bottom: 20px;
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
    .input-area span{
        font-size: 12px;
        color: rgb(231, 76, 60);
        margin-left: 2px;
    }
    #enroll-form .btn {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 450px;
        height: 50px;
        margin-bottom: 10px;
    }
    .box .radio-box{
        margin-right: 25px;
        font-size: 22px;
        font-weight: bolder;
    }
    .box .input-area{
        width: 450px;
        /* display: flex; */
    }
    .box .input-area .rightBtn{
        height: 45px;
        margin-left: 5px;
        border: none;
        background-color: rgb(245, 249, 253);
    }
    .box .agree-box{
        width: 300px;
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 15px;
    }
    .box .agree-box .termsCheck{
        margin-bottom: 10px;
    }
    .box .agree-box .termsCheck input[type="checkbox"]{
        width: 20px;
        height: 20px;
        vertical-align: text-bottom;
    }
    /* 클래스 등록 버튼 */
    #classEnroll{
        background-color: rgb(213, 232, 248); 
        margin: auto;
        margin-top: 50px;
    }
    /* 키트 버튼 */
    .kitBtn{
        width: 216px;
        font-weight: bolder;
        border-radius: 4px;
        height: 40px;
        background-color: rgb(224, 224, 224);
        transition-duration: 0.3s;
    }
    .clicked_kitBtn{
    	background-color: rgb(209, 230, 245);
    }
    /* 연산 버튼 */
    #sum{
        background-color: rgb(52, 152, 219);
        border-radius: 4px;
        border-style: none;
        width: 40px;
        height: 42px;
        color: white;
        font-weight: bolder;
        font-size: 18px;
        margin-left: 10px;
        /* margin-right: 10px; */
    }
    input[type="text"]:disabled {
        background: rgb(158, 158, 158);
    }
</style>
</head>
<body>
	<div style="height: auto; margin: auto; width: 1600px;">
        <jsp:include page="../../common/teacher/tcMypageSidebar.jsp" />
        <div id="wrap">
            <div id="top-area">
                <span id="bord-name">내클래스 등록</span>
            </div>
            <div id="enroll-form">
                <form action="updateClass.tc" method="post" id="enrollForm" enctype="multipart/form-data">
                <input type="hidden" name="clNo" value="${c.clNo }">    
                    <div class="box">
                        <label class="textName" for="st/tc">클래스 카테고리<span class="star">*</span></label>
                        <div class="input-area">
                            <select name="category" id="">
                                <option value="1">드로잉</option>
                                <option value="2">요리</option>
                                <option value="3">음악</option>
                                <option value="4">운동</option>
                                <option value="5">사진&영상</option>
                                <option value="6">재테크</option>
                                <option value="7">개발&데이터</option>
                                <option value="8">자기계발</option>
                            </select>
                        </div>
                    </div>
                    
                    <script>
                    	$(function(){
                    		$("select[name=category] option").each(function(){
                    			if($(this).val() == "${c.category}"){
                    				$(this).attr("selected", true);
                    			}
                    		})
                    	})
                    </script>

                    <div class="box">
                        <label class="textName" for="userId">클래스명<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="text" id="" name="clName" value="${c.clName }" disabled>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">클래스 설명<span class="star">*</span></label>
                        <div class="input-area">
                            <textarea name="clContent" id="" cols="58" rows="4">${c.clContent }</textarea>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">타이틀 이미지<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="file" id="" name="reupfile" onchange="loadImg(this);">
                                                         이전파일:
                            <img id="imgFile" width="450" height="230" src="${c.clImg}">
                            <input type="hidden" name="clImg" value="${c.clImg}">
                            <input type="hidden" name="originName" value="${c.clImg}">
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
                        <label class="textName" for="">소개 이미지<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="file" id="" name="reupfile" onchange="loadImg(this);">
                            	이전파일:
                            <input type="text" value="${c.clImg2}">
                            <input type="hidden" name="clImg2" value="${c.clImg2}">
                            <input type="hidden" name="originName" value="${c.clImg2}">
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">커리큘럼 이미지<span class="star">*</span></label>
                        <div class="input-area">
                            <input type="file" id="" class="w200" name="reupfile" onchange="loadImg(this);">
                            	이전파일:
                            <input type="text" value="${c.clImg3}">
                            <input type="hidden" name="clImg3" value="${c.clImg3}">
                            <input type="hidden" name="originName" value="${c.clImg3}">
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">클래스 가격<span class="star">*</span></label>
                        <div class="input-area">
                            <span style="color: black; font-weight: bolder; font-size: 20px;">수강료</span>
                            <input type="text" id="" class="w200" name="" value="원" style="width: 150px; font-weight: bolder; text-align: right; margin-left: 15px;" disabled>
                            <button id="sum" type="button" class="rightBtn" onclick="idCheck();">X</button>
                            <input type="text" id="" class="w200" name="" value="회" style="width: 133px; font-weight: bolder; text-align: right; margin-left: 15px;" disabled>

                        </div>
                    </div>
                    <div class="box">
                        <label class="textName"></label>
                        <div class="input-area">
                            <button id="sum" type="button" class="rightBtn" onclick="idCheck();"  style="margin-left: 80px;">=</button>
                            <span style="color: black; font-weight: bolder; font-size: 20px;">최종 수강료</span>
                            <input type="text" id="" class="w200" name="" value="${c.clPrice }원" style="width: 192px; font-weight: bolder; text-align: right; margin-left: 15px;" disabled>
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">해시 태그<span class="star"></span></label>
                        <div class="input-area">
                            <input type="text" id="" class="w200" name="hashtag" value="${c.hashtag }">
                        </div>
                    </div>

                    <div class="box">
                        <label class="textName" for="">키트 유무<span class="star">*</span></label>
                        <div class="input-area">
                            <button id="kitBtn" name="kit" value="Y" type="button" class="rightBtn btn-light kitBtn" onclick="test(1);">키트 있음</button>
                            <button id="notKitBtn" name="kit" value="N" type="button" class="rightBtn btn-light kitBtn" onclick="test(2);">키트 없음</button>
                            <input type="hidden" id="tt" name="kit">
                        </div>
                    </div>
                    <script>
                    	// 선택한 키트값
                    	$(function(){
                    		
                    		var kit = document.getElementById("kitBtn").val;
                            console.log(kit);
                    		
                    		if(kit == "Y"){
                    			$('#kitBtn').css('background-color', 'rgb(209, 230, 245)');
                    			$("#kitfile").attr("disabled", false);
                    			$("#tt").val("Y");
                    		}else{
                    			$('#notKitBtn').css('background-color', 'rgb(209, 230, 245)');
                    			$("#kitfile").attr("disabled", true);
                    			$("#tt").val("N");
                    		}
                    	})
                    </script>
                    <script type="text/javascript">
	                    function test(num){
	                    	   if(num == 1) {
	                    	       $("#tt").val("Y");
	                    	   }else{
	                    	       $("#tt").val("N");
	                    	   }
	                    	}
                    </script>
                    <script>
	                    // 키트 있음/없음 버튼(클릭시 배경색 변경과 키트이미지 활성화/비활성화)
	                    $(function() {
	                        $("#kitBtn").click(function() { 
	                            $('#kitBtn').css('background-color', 'rgb(209, 230, 245)');
								$("#kitfile").attr("disabled", false);
	                            $('#notKitBtn').css('background-color', 'rgb(224, 224, 224)');
	                    	});
	
	                        $("#notKitBtn").click(function() { 
	                            $('#notKitBtn').css('background-color', 'rgb(209, 230, 245)');
								$("#kitfile").attr("disabled", true);
	                            $('#kitBtn').css('background-color', 'rgb(224, 224, 224)');
	                    	});
	                    })	
                    </script>
                    <div class="box">
                        <label class="textName" for="">키트소개 이미지<span class="star"></span></label>
                        <div class="input-area">
                            <input type="file" id="kitfile" class="w200" name="reupfile" onchange="loadImg(this);">
                        	<c:if test="${ not empty c.clKitImg }">
                        	이전파일:
                        		<input type="text" value="${c.clKitImg}">
                            	<input type="hidden" name="clKitImg" value="${c.clKitImg}">
                            	<input type="hidden" name="originName" value="${c.clKitImg}">
                            </c:if>
                        </div>
                    </div>
                    <button type="submit" id="classEnroll" class="btn">클래스 수정하기</button>
                </form>
            </div>
            <br><br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>
</html>