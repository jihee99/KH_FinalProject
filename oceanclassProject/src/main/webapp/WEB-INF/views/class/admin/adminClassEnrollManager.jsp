<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	.outer{
		margin:auto;
        width: 1600px;
	}
    .inner{
        float: left;
    }
    .title{
        width: 1000px;
        margin: 50px;
    }
    .content{
        width: 1000px;
        margin: 50px;
    }
</style>
</head>
<body>
	<div class="outer">

		<c:if test="${not empty alertMsg }">
			<script>
				alert("${alertMsg}");
			</script>
			<c:remove var="alertMsg"/>
		</c:if>
	
		<div align="left">
	    	<jsp:include page="../../common/admin/adminSidebar.jsp" />
		</div>

        <div class="inner">
            <div class="title">
                <p style="color: gray; font-size: 30px; font-weight:bold;">클래스 등록 관리</p>
                <br><br>
				
				<!-- 
				<form id="dateForm" action="dateClassEnrollList.ad">
	                <p>신청일 구간 조회</p>
	                <input type="date" id="before" name="before"> ~ <input type="date" id="after" name="after">
	                <img src="resources/images/search.png" style="width: 23px; height: 23px;" onclick="dateFormSubmit();">
				</form>
				 -->
                <div style="float: right;">
                    <select id="searchSelect" style="width:100px; height: 30px;">
                        <option id="cate1" value="1" selected>클래스명</option>
                        <option id="cate2" value="2">강사명</option>
                    </select>
                    <input type="text" id="searchKeyword" style="width: 200px" placeholder="검색어 입력">
                    <img src="resources/images/search.png" onclick="searchClassList();" style="width: 23px; height: 23px; cursor:pointer;">
                </div>
                <br><br>
                <hr>
            </div>

            <div class="content">
                <!-- 상세페이지 미클릭시/클릭시 div display 상태 변경 -->
                <div id="content1" style="display:block">
                    <!-- 등록 신청한 클래스 보여지는 div -->
                    <jsp:include page="classEnrollManagerTable.jsp" />
                </div>

                <div id="content2" style="display: none;">
                    <!-- 클래스 상세보기시 보여지는 div -->
                    <jsp:include page="classEnrollManagerDetail.jsp" />
                </div>
            </div>
        </div>

    </div>

    <script>
        window.onload = function(){
        	
        	var clNo = ${map.classNo};
        	
        	//var category = ${map.category}
        	//var keyword = ${map.keyword}        
        	
        	/*
            $("#classList>tbody>tr").click(function(){
                $(".content1").css("display", "none");
                $(".content2").css("display", "block");
            })
            */
            
            if(clNo != ""){
            	document.getElementById("content1").style.display = "none";
            	document.getElementById("content2").style.display = "block";
            }
        	
        }
        	
        
        /*
        function dateFormSubmit(){
        	
        	if(document.getElementById("before").value == null || document.getElementById("after").value == null){
				alert("검색할 날짜를 모두 선택해주세요.");        		
        	} else{
	        	document.getElementById("dateForm").submit();
        	}
        	
        }
        */
        
       
    </script>
</body>
</html>