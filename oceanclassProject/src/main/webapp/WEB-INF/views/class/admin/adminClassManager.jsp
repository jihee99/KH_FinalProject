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
	tbody>tr{
		cursor:pointer;
	}
</style>
</head>
<body>
	<div class="outer">

		<div align="left">
	    	<jsp:include page="../../common/admin/adminSidebar.jsp" />
		</div>

        <div class="inner">
            <div class="title">
                <p style="color: gray; font-size: 30px; font-weight:bold;">클래스 관리</p>
                <br><br>

                <p>등록일 구간 조회</p>
                <input type="date" id="before"> ~ <input type="date" id="after">
                <img src="resources/images/search.png" style="width: 23px; height: 23px; cursor:pointer;" onclick="searchDate();">

                <div style="float: right;">
                    <select id="searchCategory" style="width:100px; height: 30px;">
                        <option id="cate1" value="1" selected>클래스명</option>
                        <option id="cate2" value="2">강사명</option>
                    </select>
                    <input type="text" id="searchText" style="width: 200px" placeholder="검색어 입력">
                    <img src="resources/images/search.png" style="width: 23px; height: 23px; cursor:pointer;" onclick="searchKeyword();">
                </div>
                <br><br>
                <hr>
            </div>

            <div class="content">
				<div>
			        <div align="right">
			            <select id="arrayClassList" style="width:150px; height: 30px;" onchange="changeArray(this);">
			                <option id="arraynew" value="new" selected>최신 등록순</option>
			                <option id="arrayold" value="old">오래된 등록순</option>
			            </select>
			        </div>
			        <br>
					
			        <div>
			            <button type="button" class="btn" style="background-color: #6babd5; width: 130px; color: white;" onclick="statusCons(1);">클래스 노출</button>
			            <button type="button" class="btn" style="background-color: lightgray; width: 130px;" onclick="statusCons(2);">클래스 미노출</button>
			            <div style="float: right;">
			                <input type="checkbox" id="yClass" value="1" onchange="ynck(this);">
			                <label for="yClass"> 노출 클래스</label>
			                <input type="checkbox" id="nClass" value="1" onchange="ynck(this);">
			                <label for="nClass"> 미노출 클래스</label>
			            </div>
			        </div>
			        <br>
			    </div>

			    <div>
			        <table id="classList" class="table table-hover classList">
			            <thead>
			                <tr style="background-color: #6babd5;">
			                    <th width="50"><input type="checkbox" onchange="allCheck(this);"></th>
			                    <th width="130">클래스번호</th>
			                    <th width="120">카테고리</th>
			                    <th>클래스명</th>
			                    <th width="100">강사명</th>
			                    <th width="100">가격</th>
			                    <th width="150">등록일</th>
			                    <th width="100">노출여부</th>
			                </tr>
			            </thead>
			            <tbody>
			            	<c:forEach var="c" items="${ cList }">
				                <tr>
				                    <td><input type="checkbox" class="checkboxs" value="${c.clNo}"></td>
				                    <td onclick="detailPage(${c.clNo});">${ c.clNo }</td>
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
				                    <td height="50" onclick="detailPage(${c.clNo});">${ c.clName }</td>
				                    <td onclick="detailPage(${c.clNo});">${ c.memNo }</td>
				                    <td onclick="detailPage(${c.clNo});"><fmt:formatNumber value="${ c.clPrice }" type="number"/>원</td>
				                    <td onclick="detailPage(${c.clNo});">${ c.clDate }</td>
				                    <td onclick="detailPage(${c.clNo});">${ c.clStatus }</td>
				                </tr>
			                </c:forEach>
			            </tbody>
			        </table>
			    </div>
			
			    <div id="pagingArea">
			        <ul class="pagination">
						<c:if test="${ pi.currentPage > 1 }">
							<li class="page-item"><a class="page-link" href="classManager.ad?cpage=${ pi.currentPage - 1 }&yclass=${ cm.yclass }&nclass=${ cm.nclass }&array=${ cm.array }&category=${ cm.category }&keyword=${ cm.keyword }&before=${ cm.before }&after=${ cm.after }">Previous</a></li>
						</c:if>
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="classManager.ad?cpage=${ p }&yclass=${ cm.yclass }&nclass=${ cm.nclass }&array=${ cm.array }&category=${ cm.category }&keyword=${ cm.keyword }&before=${ cm.before }&after=${ cm.after }">${ p }</a></li>
						</c:forEach>
						<c:if test="${ pi.currentPage != pi.maxPage }">
							<li class="page-item"><a class="page-link" href="classManager.ad?cpage=${ pi.currentPage + 1 }&yclass=${ cm.yclass }&nclass=${ cm.nclass }&array=${ cm.array }&category=${ cm.category }&keyword=${ cm.keyword }&before=${ cm.before }&after=${ cm.after }">Next</a></li>
						</c:if>
			        </ul>
			    </div>
            </div>
            
        </div>

    </div>

    <script>
    	window.onload = function(){
    		var yy = "${cm.yclass}"; 
    		var nn = "${cm.nclass}";
    		var array = "${cm.array}";
    		var category = "${cm.category}";
    		var keyword = "${cm.keyword}";
    		var before = "${cm.before}";
    		var after = "${cm.after}";
    		
    		//console.log(yy + " " + nn + " " + array + " " + category + " " + keyword + " " + before + " " + after);
    		
    		if(yy == '1'){ document.getElementById("yClass").checked = true; }
    		if(nn == '1'){ document.getElementById("nClass").checked = true; }
    		if(array == 'new'){ 
    			document.getElementById("arraynew").selected = true; 
   			} else{
    			document.getElementById("arrayold").selected = true; 
   			}
    		if(category == '1'){
    			document.getElementById("cate1").selected = true;
    			document.getElementById("searchText").value = keyword;
    		} else if(category == '2'){
    			document.getElementById("cate2").selected = true;
    			document.getElementById("searchText").value = keyword;
    		}
    		if(before != ""){
    			document.getElementById("before").value = before;
    			document.getElementById("after").value = after;
    		}
    	}
    	
    	function ynck(el){
    		var yck = document.getElementById("yClass");
    		var nck = document.getElementById("nClass");
    		
    		var array = "${cm.array}";
    		var category = "${cm.category}";
    		var keyword = "${cm.keyword}";
    		var before = "${cm.before}";
    		var after = "${cm.after}";
    		var cpage = "${pi.currentPage}";
    		
    		if(yck.checked == false && nck.checked == false){
    			alert("모두 해제할 수 없습니다.");
    			el.checked = true;
    		} else if(yck.checked == true && nck.checked == true){
    			location.href = "classManager.ad?cpage=" + cpage + "&yclass=1&nclass=1&array=" + array + "&category=" + category + "&keyword=" + keyword 
								+ "&before=" + before + "&after=" + after;
    		} else if(yck.checked == false && nck.checked == true){
    			location.href = "classManager.ad?cpage=" + cpage + "&yclass=&nclass=1&array=" + array + "&category=" + category + "&keyword=" + keyword 
				+ "&before=" + before + "&after=" + after;
    		} else if(yck.checked == true && nck.checked == false){
    			location.href = "classManager.ad?cpage=" + cpage + "&yclass=1&nclass=&array=" + array + "&category=" + category + "&keyword=" + keyword 
				+ "&before=" + before + "&after=" + after;
    		}
    	}
    	
    	function searchDate(){
    		// 대소 비교용
    		var searchBefore = parseInt(document.getElementById("before").value.split("-").join(""));
    		var searchAfter = parseInt(document.getElementById("after").value.split("-").join(""));
    		// location용
    		var yy = "${cm.yclass}"; 
    		var nn = "${cm.nclass}";
    		var array = "${cm.array}";
    		var category = "${cm.category}";
    		var keyword = "${cm.keyword}";
    		
    		if(document.getElementById("before").value == "" || document.getElementById("after").value == ""){
    			alert("날짜를 모두 선택해주세요.");
    		} else{
    			if(searchBefore > searchAfter){
    				alert("시작일을 더 빠른 날짜로 설정해주세요.");
    			} else{
    				location.href = "classManager.ad?cpage=1&yclass=" + yy + "&nclass=" + nn + "&array=" + array + "&category=" + category + "&keyword=" + keyword 
    								+ "&before=" + document.getElementById("before").value + "&after=" + document.getElementById("after").value;
    			}
    		}
   		}
    	
    	function searchKeyword(){
    		var searchCategory = document.getElementById("searchCategory").value;
    		var searchText = document.getElementById("searchText").value;
    		// location용
    		var yy = "${cm.yclass}"; 
    		var nn = "${cm.nclass}";
    		var array = "${cm.array}";
    		var before = "${cm.before}";
    		var after = "${cm.after}";
    		
    		if(searchText.replace(/ /gi, "").length < 2){
    			alert("검색어는 두  글자 이상 입력해야 합니다.");
    		} else{
    			location.href = "classManager.ad?cpage=1&yclass=" + yy + "&nclass=" + nn + "&array=" + array + "&category=" + searchCategory + "&keyword=" + searchText 
								+ "&before=" + before + "&after=" + after;
    		}
    		
    	}
    	
    	function changeArray(el){
    		var yy = "${cm.yclass}"; 
    		var nn = "${cm.nclass}";
    		var category = "${cm.category}";
    		var keyword = "${cm.keyword}";
    		var before = "${cm.before}";
    		var after = "${cm.after}";
    		var cpage = "${pi.currentPage}";
    		
    		location.href = "classManager.ad?cpage=" + cpage + "&yclass=" + yy + "&nclass=" + nn + "&array=" + el.value + "&category=" + category + "&keyword=" + keyword 
			+ "&before=" + before + "&after=" + after;
    	}
    	
	 	function allCheck(el){
	 		var checkboxs = document.getElementsByClassName("checkboxs");
	 		
 			for(var i=0; i<checkboxs.length; i++){
 				checkboxs[i].checked = el.checked;
 			}
	 	}
	 	
		function detailPage(clNo){
			
    		var yy = "${cm.yclass}"; 
    		var nn = "${cm.nclass}";
    		var array = "${cm.array}";
    		var category = "${cm.category}";
    		var keyword = "${cm.keyword}";
    		var before = "${cm.before}";
    		var after = "${cm.after}";
    		var cpage = "${pi.currentPage}";
			
			location.href = "classManagerReview.ad?cpage=1&clNo=" + clNo + "&array=new&category=&keyword=" 
							+ "&yclass=" + yy +"&nclass=" + nn + "&rarray=" + array + "&rcategory=" + category + "&rkeyword=" + keyword
							+ "&before=" + before + "&after=" + after + "&rpage=" + cpage;
		}
		
		function statusCons(num){
			var classShowForm = document.getElementById("classShowForm");
			var checkboxs = document.getElementsByClassName("checkboxs");
			var ckNum = 0;
			//var checkboxNo = [];
			var checkboxNo = new Array();
			
 			for(var i=0; i<checkboxs.length; i++){
 				if(checkboxs[i].checked == true){
 					ckNum += 1;
 				}
 			}
 			
 			/*
			for(var i=0; i<checkboxs.length; i++){
				checkboxNo.push(checkboxs[i].value);
			}
			
			console.log(checkboxNo);
 			*/
 			
 			if(ckNum < 1){
 				alert("한 개 이상의 클래스를 선택해주세요.");
 			} else {
 				
				for(var i=0; i<checkboxs.length; i++){
	 				if(checkboxs[i].checked == true){
	 					checkboxNo.push(checkboxs[i].value);
	 				}
				}
				
				if(num == 1){
					if(confirm("클래스를 노출처리 하시겠습니까?") == true){
						$.ajax({
							url:"classShows.ad",
							type : "post",
							data:{checkList:checkboxNo},
							success:function(result){
								if(result == 'yyyyy'){
									alert("클래스가 노출처리 되었습니다.");
									window.location.reload();
								} else{
									alert("클래스 노출처리에 실패하였습니다.");
								}
							}, error:function(){
								console.log("클래스 노출 ajax 통신 실패");
							}
						})
					}
				}else{
					if(confirm("클래스를 미노출처리 하시겠습니까?") == true){
						$.ajax({
							url:"classHides.ad",
							type : "post",
							data:{checkList:checkboxNo},
							success:function(result){
								if(result == 'yyyyy'){
									alert("클래스가 미노출처리 되었습니다.");
									window.location.reload();
								} else{
									alert("클래스 미노출처리에 실패하였습니다.");
								}
							}, error:function(){
								console.log("클래스 미노출 ajax 통신 실패");
							}
						})
					}
				}
				
 			}
		}
    </script>

</body>
</html>