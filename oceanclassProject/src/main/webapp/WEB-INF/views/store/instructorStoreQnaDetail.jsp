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
    .wrap{ width: 1000px; height: auto; margin: auto; margin-top: 50px; }
    #content-wrap{ box-sizing: border-box; border:2px solid gray; height:auto;}
    #top-area{ height: 100px; margin-top: 50px; display: flex; justify-content: space-between;}
    #bord-name{color: rgb(107, 171, 213); font-weight:bolder; font-size: 30px; }
   
    #ptitle-area{margin-top:10px; display: flex; font-size: 20px; font-weight: bolder; height: 30px; color: gray; line-height: 47px; padding-left: 15px;}
   	#p-title{width:750px;}
    #backBtn{background-color: gray; color: white; font-weight: bolder; height: 32px; padding-top:3px; margin-right: 3px; margin-left:20px;}
	#reportBtn{background: rgb(177, 5, 5); color: white; font-weight: bolder; height: 32px; padding-top:3px; margin-right: 3px;}
	
    #title-area{disply: flex; margin-bottom: 25px; margin-top: -5px; padding-left: 15px; }
    #title{ font-weight: bolder;  font-size: 22px;}
    #sysdate{color: gray; padding-top: 10px;  font-size: 15px; float:left; display:flex;}
	#writer{width:450px; color:black; padding-right:10px;}
    #content-area{ width: 950px; padding-left: 24px; align-content: center; }
    #content-text{ border: none; resize: none; }
   
    #reply-area{height: 220px; margin-left: 20px; margin-bottom: 5px; }
	#submitBtn{height:150px; width:100px; background-color: rgb(107, 171, 213); font-weight: bold; color:white;}
    #answerBtn{height:150px; width:100px; background-color: rgb(107, 171, 213); font-weight: bold; color:white;}
    #reply-box{ border: none; resize: none; padding:10px; box-sizing: border-box;}
    
    #btn-box a{ display: inline-block; color: lightslategrey; margin-right: 5px; }

</style>  
</head>
<body>


   	<jsp:include page="../common/teacher/tcMypageSidebar.jsp" />
	<div class="wrap">
	    <div id="top-area">
	        <span id="bord-name">스토어 문의 관리</span>
	    </div>
		<div id="content-wrap">
		    <div id="ptitle-area">
		        <div id="p-title">${sq.productName }</div>
		        <input type="button" class="btn" id="backBtn" value="목록보기" onclick="history.back();">
		        <input type="button" class="btn" id="reportBtn" value="신고하기">
			</div>		    
			
			<hr style="border: solid 1px rgb(179, 178, 178); width: 970px; margin-left:10px;">
			<div id="title-area">
			    <div id="title">${sq.title }</div>
				<div id="sysdate">
					<div style="Width:500px;" align="left">작성일 : ${sq.createDate }</div>
					<div id="writer" align="right">작성자 : <b>${sq.userId }</b></div>	
				</div>
			</div>
			<form action="sqanswer.in" method="post">
				<input type="hidden" name="csQno" value="${sq.csQno }">
				<div id="content-area" align="center">
				    <img src="${sq.filePath }" style="width: 350px;">
					<br><br>
					<textarea id="content-text" cols="123" rows="6" readonly>${sq.content }</textarea>
				</div>
				<hr style="border: solid 1px rgb(179, 178, 178); width: 970px; margin-left:10px;">
				     
				<div id="reply-area">                
					<table id="reply-table">
						<tr>
							<td>
								<textarea name="answerContent" id="reply-box" rows="5" cols="110" placeholder="답변내용을 입력하세요"><c:if test="${sq.answerContent ne null }">${sq.answerContent }</c:if></textarea>
							</td>
							<td>
								<button id="submitBtn" type="submit" class="btn">저장하기</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<br>
	</div>

</body>

</html>