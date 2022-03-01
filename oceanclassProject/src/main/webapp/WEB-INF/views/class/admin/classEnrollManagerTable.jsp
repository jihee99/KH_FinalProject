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
    .classList{
        width: 1000px;
        margin: auto;
    }
    .classList th, .classList td{
        text-align: center;
    }
    #pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 150px;
		margin-bottom: 50px;
	}
	.classList>tbody>tr:hover{
		cursor:pointer;
	}
</style>
</head>
<body>
    <div>
		<input type="hidden" id="arrayData" value="${map.array}">
		
		<form action="classListApproval.ad" onsubmit="return checkListCk();">
			<input type="hidden" name="cpage" value="${ pi.currentPage }">
			<input type="hidden" name="array" value="${ map.array }">
			<input type="hidden" name="category" value="${ map.category }">
			<input type="hidden" name="keyword" value="${ map.keyword }">
			
	        <div>
	            <button type="submit" class="btn" style="background-color: #6babd5; width: 80px; color: white;">승인</button>
	            <!--
	            <button type="button" class="btn" style="background-color: lightgray; width: 80px;">반려</button>
	            -->
	            <!--
	            <div style="float: right;">
	                <input type="checkbox" id="rClass">
	                <label for="rClass"> 반려된 클래스</label>
	                <input type="checkbox" id="yClass">
	                <label for="yClass"> 처리된 클래스</label>
	                <input type="checkbox" id="nClass" checked>
	                <label for="nClass"> 미처리 클래스</label>
	            </div>
	            -->
		        <div style="float:right;"> <!-- align="right" -->
		            <select style="width:150px; height: 30px;" onchange="listArray(this);">
		                <option id="op1" value="1">오래된 신청순</option>
		                <option id="op2" value="2">최신 신청순</option>
		            </select>
		        </div>
	        </div>
	        <br>
	    </div>
	
	    <div>
	        <table id="classList" class="table table-hover classList">
	            <thead>
	                <tr style="background-color: #6babd5;">
	                    <th width="50"><input type="checkbox" onchange="allCheck(this);"></th>
	                    <th width="120">카테고리</th>
	                    <th>클래스명</th>
	                    <th width="100">강사명</th>
	                    <th width="100">가격</th>
	                    <th width="150">신청일</th>
	                    <th width="100">처리상태</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:forEach var="c" items="${ cList }">
		                <tr>
		                    <td><input type="checkbox" name="checkList" class="checkboxs" value="${ c.clNo }"></td>
		                    <td onclick="detailPage(${c.clNo});">
		                    	<c:choose>
		                    		<c:when test="${ c.category == 1 }">
		                    			드로잉
		                    		</c:when>
		                    		<c:when test="${ c.category == 2 }">
		                    			요리
		                    		</c:when>
		                    		<c:when test="${ c.category == 3 }">
		                    			음악
		                    		</c:when>
		                    		<c:when test="${ c.category == 4 }">
		                    			운동
		                    		</c:when>
		                    		<c:when test="${ c.category == 5 }">
		                    			사진/영상
		                    		</c:when>
		                    		<c:when test="${ c.category == 6 }">
		                    			재테크
		                    		</c:when>
		                    		<c:when test="${ c.category == 7 }">
		                    			개발/데이터
		                    		</c:when>
		                    		<c:otherwise>
		                    			자기계발
		                    		</c:otherwise>
		                    	</c:choose>
		                    </td>
		                    <td onclick="detailPage(${c.clNo});">${ c.clName }</td>
		                    <td onclick="detailPage(${c.clNo});">${ c.memNo }</td>
		                    <td onclick="detailPage(${c.clNo});"><fmt:formatNumber value="${ c.clPrice }" type="number"/>원</td>
		                    <td onclick="detailPage(${c.clNo});">${ c.clDate }</td>
		                    <td onclick="detailPage(${c.clNo});">${ c.clStatus }</td>
		                </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	    </div>
    </form>
	
	<c:if test="${pi.listCount > 0 }">
		<div id="pagingArea">
			<ul class="pagination">
				<c:if test="${ pi.currentPage > 1 }">
					<li class="page-item"><a class="page-link" href="classEnrollManager.ad?cpage=${ pi.currentPage - 1 }&array=${map.array}&category=${map.category}&keyword=${map.keyword}&clNo=">Previous</a></li>
				</c:if>
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link" href="classEnrollManager.ad?cpage=${ p }&array=${map.array}&category=${map.category}&keyword=${map.keyword}&clNo=">${ p }</a></li>
				</c:forEach>
				<c:if test="${ pi.currentPage != pi.maxPage }">
					<li class="page-item"><a class="page-link" href="classEnrollManager.ad?cpage=${ pi.currentPage + 1 }&array=${map.array}&category=${map.category}&keyword=${map.keyword}&clNo=">Next</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>
	
	<script>
		window.onload = function(){
			var array = ${map.array};
			
			switch(array){
				case 1 : document.getElementById("op1").selected = true; break;
				case 2 : document.getElementById("op2").selected = true; break;
			}
			
			/*
        	var category = ${map.category}
        	var keyword = ${map.keyword}
			
			if(category == "1"){
				document.getElementById("cate1").selected = true;
				document.getElementById("cate2").selected = false;
				document.getElementById("searchKeyword").value = keyword;
			} else if(category == "2"){
				document.getElementById("cate2").selected = true;
				document.getElementById("cate1").selected = false;
				document.getElementById("searchKeyword").value = keyword;
			} 
			*/
			
		}
	
		function listArray(arrayNo){
			location.href = "classEnrollManager.ad?cpage=${ pi.currentPage }&array=" + arrayNo.value + "&category=${map.category}&keyword=${map.keyword}&clNo=";
		}
		
		function detailPage(clNo){
			location.href = "classEnrollManager.ad?cpage=${ pi.currentPage }&array=${map.array}&category=${map.category}&keyword=${map.keyword}&clNo=" + clNo;
		}
		
	 	function searchClassList(){
        	
        	var searchSelect = document.getElementById("searchSelect").value;
        	var searchKeyword = document.getElementById("searchKeyword").value;
        	
        	location.href = "classEnrollManager.ad?cpage=1&array=1&category=" + searchSelect + "&keyword=" + searchKeyword + "&clNo=";
        }
	 	
	 	function allCheck(el){
	 		//console.log(el.checked);
	 		var checkboxs = document.getElementsByClassName("checkboxs");
	 		
 			for(var i=0; i<checkboxs.length; i++){
 				checkboxs[i].checked = el.checked;
 			}
	 	}
	 	
	 	function checkListCk(){
	 		var checkboxs = document.getElementsByClassName("checkboxs");
	 		var ckNum = 0;
	 		
 			for(var i=0; i<checkboxs.length; i++){
 				if(checkboxs[i].checked == true){
 					ckNum += 1;
 				}
 			}

 			if(ckNum < 1){
 				alert("승인 할 클래스를 선택해주세요.");
 				return false;
 			} else {
 				if(confirm("승인하시겠습니까?")){
	 				return true;
 				} else{
 					return false;
 				}
 			}
 			
	 	}
	</script>

</body>
</html>