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
    .detail *{
        font-size: 17px;
    }
    .detail>tbody>tr{
        height: 45px;
        /*border-bottom:1px solid lightgray;*/
    }
    #pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 100px;
		margin-bottom: 50px;
	}
</style>
</head>
<body>
    <div>
        <button type="button" onclick="classApproval(${cl.clNo});" class="btn" style="background-color: #6babd5; width: 80px; color: white;">승인</button>
        <button type="button" class="btn" style="background-color: lightgray; width: 80px;" data-toggle="modal" data-target="#myModal">반려</button>
    </div>
    <br><br>

    <table class="detail">
        <tbody>
            <tr style="width: 1000px;">
                <th style="width: 200px; height:70px;">클래스 카테고리</th>
                <td style="width: 800px;">
                	<c:choose>
                   		<c:when test="${ cl.category == 1 }">
                   			드로잉
                   		</c:when>
                   		<c:when test="${ cl.category == 2 }">
                   			요리
                   		</c:when>
                   		<c:when test="${ cl.category == 3 }">
                   			음악
                   		</c:when>
                   		<c:when test="${ cl.category == 4 }">
                   			운동
                   		</c:when>
                   		<c:when test="${ cl.category == 5 }">
                   			사진/영상
                   		</c:when>
                   		<c:when test="${ cl.category == 6 }">
                   			재테크
                   		</c:when>
                   		<c:when test="${ cl.category == 7 }">
                   			개발/데이터
                   		</c:when>
                   		<c:otherwise>
                   			자기계발
                   		</c:otherwise>
                   	</c:choose>
                </td>
            </tr>
            <tr>
                <th style="height:70px;">클래스 명</th>
                <td>${ cl.clName }</td>
            </tr>
            <tr>
                <th style="height:70px;">클래스 설명</th>
                <td>${ cl.clContent }</td>
            </tr>
            <tr>
                <th style="height:70px;">강사명</th>
                <td>${ cl.memNo }</td>
            </tr>
            <tr>
                <th>타이틀 이미지</th>
                <td style="text-decoration: underline;">
                	<div style="height:20px;"></div>
                	<img src="${ cl.clImg }" style="width:70%;">
                	<div style="height:20px;"></div>
                	<hr>
                </td>
            </tr>
            <tr>
                <th>클래스 소개 이미지</th>
                <td style="text-decoration: underline;">
                	<div style="height:20px;"></div>
                	<img src="${ cl.clImg2 }" style="width:70%;">
                	<div style="height:20px;"></div>
                	<hr>
                </td>
            </tr>
            <tr>
                <th>커리큘럼 이미지</th>
                <td style="text-decoration: underline;">
                	<div style="height:20px;"></div>
                	<img src="${ cl.clImg3 }" style="width:70%;">
                	<div style="height:20px;"></div>
                </td>
            </tr>
            <tr>
                <th style="height:70px;">클래스 가격</th>
                <td><fmt:formatNumber value="${ cl.clPrice }" type="number"/>원</td>
            </tr>
            <tr>
                <th style="height:70px;">준비물 키트 유무</th>
                <td>
                	<c:choose>
                		<c:when test="${ cl.kit == 'Y' }">
		                    <div style="background-color: #6babd5; width: 100px; text-align: center; font-weight: bold; border-radius: 10px;">키트 있음</div>
                		</c:when>
                		<c:otherwise>
		                    <div style="background-color: lightgray; width: 100px; text-align: center; font-weight: bold; border-radius: 10px;">키트 없음</div>
                		</c:otherwise>
                	</c:choose>
                </td>
            </tr>
            <c:if test="${ cl.kit == 'Y' }">
	            <tr>
	                <th style="height:70px;">키트 소개 이미지</th>
	                <td style="text-decoration: underline;">
	                	<div style="height:20px;"></div>
	                	<img src="${ cl.clKitImg }" style="width:60%;">
	                	<div style="height:20px;"></div>
	                </td>
	            </tr>
            </c:if>
        </tbody>
    </table>
	
    <div id="pagingArea">
        <ul class="pagination">
            <!-- <li class="page-item"><a class="page-link" href="">Previous</a></li> -->
            <li class="page-item"><a class="page-link" onclick="history.back();">목록</a></li>
            <!-- <li class="page-item"><a class="page-link" href="">Next</a></li> -->
        </ul>
    </div>

    <!-- 반려시 보여질 modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <form action="classReturn.ad" method="post" onsubmit="return reasonCk();">
            <input type="hidden" name="clNo" value=${ cl.clNo }>
            <input type="hidden" name="cpage" value="${ pi.currentPage }">
			<input type="hidden" name="array" value="${ map.array }">
			<input type="hidden" name="category" value="${ map.category }">
			<input type="hidden" name="keyword" value="${ map.keyword }">
            <div class="modal-dialog">
        
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">반려 이유 작성</h4>
                    </div>
                    <div class="modal-body">
                        <textarea name="reason" id="reason" style="width: 100%; height: 200px; resize: none;" placeholder="반려 이유를 작성해주세요."></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn" style="background-color: #6babd5;">작성</button>
                        <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>
                    </div>
                </div>
        
            </div>
        </form>
    </div>
    
    <script>
    	function classApproval(clNo){
    		if(confirm("승인하시겠습니까?") == true){
    			location.href = "classApproval.ad?cpage=${pi.currentPage}&array=${map.array}&category=${map.category}&keyword=${map.keyword}&clNo=" + clNo;
    		}
    	}
    	
    	function reasonCk(){
    		if(document.getElementById("reason").value.replace(/ /gi, "").length < 5){
    			alert("반려 이유는 5글자 이상 작성해야합니다.");
	    		return false;
    		}
    		
			return true;
    	}
    </script>
</body>
</html>