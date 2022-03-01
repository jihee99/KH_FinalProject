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
    /* 전체 감싸는 div */
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
    #content-wrap{
        margin: auto;
        width: 800px;
        height: 700px;
    }
    #cl-wrap{
        /* box-sizing: border-box; border:1px solid black; */
        display: flex;
        margin-bottom: 10px;
        margin-top: 10px;
    }
    #cl-box{
        margin-left: 15px;
        margin-top: 5px;
    }
    #cl-category{
        font-weight: bolder;
        font-size: 20px;
    }
    #cl-content{
        padding-top: 10px;
    }
    #num-btn{
        font-size: 23px;
        color: gray;
        font-weight: bolder;
    }
    #cl-num{
        margin-right: 25px;
        font-size: 20px;
    }
    /* 클래스 등록버튼 */
    #enrollBtn {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 400px;
        height: 50px;
        margin-bottom: 10px;
        margin-top: 80px;
    }
    #cl-content textarea{
        width: 450px;
        height: 60px;
        resize: none;
    }

</style>  
</head>
<body>
    
    <div style="width: 1600px; height: auto; margin: auto;">
    	<jsp:include page="../../common/teacher/tcMypageSidebar.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">내클래스 목록</span>
            </div>
            	<div id="content-wrap" style="overflow-y: scroll;">
	            <c:forEach var="cl" items="${ classList }">
	                <input type="hidden" id="clnum" name="clNo" value="${cl.clNo }">
	                <div id="cl-wrap">
	                    <div id="cl-img">
	                        <img src="${cl.clImg }" name="cl_img" style="width: 250px; height: 150px;">
	                    </div>
	                    <div id="cl-box">
	                        <div id="cl-category">
	                            <span>
	                                [${cl.category }] ${cl.clName }
	                            </span>
	                        </div>
	                        <div id="cl-content">
	                            <textarea style="border: none " name="cl_content">${cl.clContent }</textarea>
	                        </div>
	                        <div id="num-btn">
	                            <span id="cl-num">
	                                	수강상태 : ${cl.clStatus } &ensp; 조회수 : ${cl.count }
	                            </span>
		                            <button onclick="location.href='updateClassForm.tc?clNo=${cl.clNo}'" class="btn" style="background-color: rgb(107, 171, 213); color: white; height: 35px;">수정</button>
	                            <c:if test="${cl.clStatus eq '게시중' }">
	                            	<button onclick="location.href='endClass.tc?clNo=${cl.clNo}'" class="btn" style="background-color: rgb(41, 128, 185); color: white; height: 35px;">내리기</button>
	                            </c:if>
	                        </div>
	                    </div>
	                </div>
	                <hr>
	                </c:forEach>
            	</div>
            <div align="center">
            <button onclick="location.href='enrollClassForm.tc'" id="enrollBtn" class="btn" style="background-color: rgb(228, 240, 250);">새로운 클래스 등록하기</button>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>

</html>