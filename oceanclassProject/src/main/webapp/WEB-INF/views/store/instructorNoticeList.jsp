<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="./resources/css/store/instructorStoreQnaList.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#detailBtn{width: 50px; height: 30px; border-radius: 5px; border: none; background: gray; color: white;}
.qnaBody tr:hover{cursor:pointer;}
</style>
</head>
<body>
<div style="width: 1600px; height: auto; margin: auto;">
	<!-- 강사용 메뉴바 연결하기 	-->
	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
	 	
	<div class="innerOuter">
        <div class="headMenu">
        	<br><br>
            <b>강사 공지사항</b>
        </div>
        <div class="content">
            
            <div class="content_table">
                <table class="table table-sm table-light" align="center">
                    <thead>
                        <tr>
                            <th width="150">번호</th>
                            <th width="300">제목</th>
                            <th width="180">작성일</th>
                        </tr>
                    </thead>
                    <tbody class="qnaBody">
                    	<c:forEach var="n" items="${list }">
	                    	<tr>
	                            <td class="noNo">${n.noNo }</td>
	                            <td>${n.noTitle }</td>
	                            <td>${n.createDate }</td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="btn_group" align="center">
				<c:choose>
	           		<c:when test="${pi.currentPage eq 1 }">
	           			<button class="btn btn-light" disabled>&lt;</button>
	           		</c:when>
	           		<c:otherwise>
	           			<button class="btn btn-light" onclick="location.href='nlist.in?cpage=${pi.currentPage - 1}'">&lt;</button>
	           		</c:otherwise>
	           	</c:choose>
	                   
	   			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	   				<button class="btn btn-light" onclick="location.href='nlist.in?cpage=${p}'">${p }</button>
	   			</c:forEach>
	   
	   			<c:choose>
	               	<c:when test="${pi.currentPage eq pi.maxPage }">
	           			<button class="btn btn-light" disabled>&gt;</button>
	               	</c:when>
	               	<c:otherwise>
	               		<button class="btn btn-light" onclick="location.href='nlist.in?cpage=${pi.currentPage + 1}'">&gt;</button>
	               	</c:otherwise>
	            </c:choose>
			</div>
        </div>
        
        <script>

        	$(".qnaBody tr").click(function(){
        		console.log($(this).children(".noNo").text());
        		location.href="ndetail.in?nno="+$(this).children(".noNo").text();
        	});
       </script>
    </div>
    </div>
</body>
</html>