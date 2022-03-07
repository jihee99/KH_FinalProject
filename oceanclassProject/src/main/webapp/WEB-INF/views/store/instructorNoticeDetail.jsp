<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/css/store/instructorStoreOrderDetail.css">
<style>
.content_2{text-align:center;}
#nContent{border:none; padding:15px; resize: none; margin-top:20px; }
</style>
</head>
<body>

	<div style="width: 1600px; height: auto; margin: auto;">
    <!-- 강사 사이드 네비바 연결하기 -->
    <jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
	<!-- loginUser가 teacher일때만 보여지게 하기 -->
	<c:choose>
	<c:when test="${loginUser ne null and loginUser.grade eq 'T'}">
	    <div class="innerOuter">
	        <div class="headMenu">
	        	<br><br>
	            <b>강사 공지사항</b>
	        </div>
	        <div class="head_2">
	            <b>${n.noTitle }</b>
	            <hr>
	        </div>
	        <div class="content">

                <div class="content_1" style="text-align:right;">
                    	작성일 : ${n.createDate }
						&nbsp; 조회수 : ${n.count }
                </div>

                <div class="content_2">
                  <textarea id="nContent" rows="25" cols="140" readonly>${n.noContent }
                  </textarea> 
                </div>

                <div align="center">
                    <input type="button" id="listBtn" class="btn btn-lg" onclick="history.back();" value="목록보기">
                </div>   
                <br><br>

	        </div>
			<script>
				$(function(){
					var orderStatus = $("#os").val();
					console.log(orderStatus);
					
					$("select[name=status]").val(orderStatus).prop("selected", true);
	
					if(orderStatus == 1){
						$(".op1").prop("selected", true);
					}else if(orderStatus == 2){
						$(".op2").prop("selected", true);
					}else if(orderStatus == 3){
						$(".op3").prop("selected", true);
					}else if(orderStatus == 4){
						$(".op4").prop("selected", true);
					}else if(orderStatus == 5){
						$(".op5").prop("selected", true);
					}else if(orderStatus == 6){
						$(".op6").prop("selected", true);
					}else if(orderStatus == 7){
						$(".op7").prop("selected", true);
					}
	
				})
			</script>
	</c:when>
	<c:otherwise>
		<script>
		alert("접근권한이 없습니다.");
		location.href='/oceanclass';
		</script>
	</c:otherwise>
	</c:choose>
    </div>
    </div>
</body>
</html>