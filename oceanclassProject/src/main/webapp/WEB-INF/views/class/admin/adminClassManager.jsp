<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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

		<div align="left">
	    	<jsp:include page="../../common/admin/adminMain.jsp" />
		</div>

        <div class="inner">
            <div class="title">
                <p style="color: gray; font-size: 30px; font-weight:bold;">클래스 관리</p>
                <br><br>

                <p>등록일 구간 조회</p>
                <input type="date" value="before"> ~ <input type="date" value="after">
                <img src="resources/images/search.png" style="width: 23px; height: 23px;">

                <div style="float: right;">
                    <select style="width:100px; height: 30px;">
                        <option selected>클래스명</option>
                        <option>강사명</option>
                        <option>클래스번호</option>
                    </select>
                    <input type="text" style="width: 200px" placeholder="검색어 입력">
                    <img src="resources/images/search.png" style="width: 23px; height: 23px;">
                </div>
                <br><br>
                <hr>
            </div>

            <div class="content">
                <!-- 상세페이지 미클릭시/클릭시 div display 상태 변경 -->
                <div class="content1">
                    <!-- 클래스 목록 보여지는 div -->
                    <jsp:include page="classManagerTable.jsp" />
                </div>

                <div class="content2" style="display: none;">
                    <!-- 클래스 상세보기시 보여지는 div -->
                    <jsp:include page="classManagerDetail.jsp" />
                </div>
            </div>
        </div>

    </div>

    <script>
        $(function(){
            $("#classList>tbody>tr").click(function(){
                $(".content1").css("display", "none");
                $(".content2").css("display", "block");
            })
        })
    </script>

</body>
</html>