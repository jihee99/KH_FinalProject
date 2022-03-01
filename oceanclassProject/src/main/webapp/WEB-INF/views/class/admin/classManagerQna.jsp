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
    
    .info{
        width: 1000px;
        margin: auto;
    }
    .info th, .info td{
        text-align: center;
    }
    #pagingArea{
		width:fit-content;
	}
	
   	.classList{
        width: 1000px;
        margin: auto;
    }
    .classList th, .classList td{
        text-align: center;
    }
    #pagingAreaQna{
		width:fit-content;
		margin:auto;
		margin-top: 50px;
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
			    <hr>
            </div>
		
			<div class="content">
			
			    <div>
	                <div id="pagingArea" align="left">
				        <ul class="pagination">
				            <li class="page-item" style="margin-right:10px; cursor:pointer;"><a class="page-link" onclick="listPage();">목록으로 이동</a></li>
				            <li class="page-item"><a class="page-link" style="cursor:pointer;" onclick="reviewPage();">리뷰 관리</a></li>
				            <li class="page-item"><a class="page-link"><b>문의 관리</b></a></li>
				        </ul>
				    </div>
			        <button type="button" class="btn" style="background-color: #6babd5; width: 130px; color: white;" onclick="statusController(1);">클래스 노출</button>
			        <button type="button" class="btn" style="background-color: lightgray; width: 130px;" onclick="statusController(2);">클래스 미노출</button>
			        <br><br>
			        
			        <div>
			            <table class="table info">
			                <thead>
			                    <tr style="background-color: #6babd5;">
			                        <th width="130">클래스번호</th>
			                        <th width="120">카테고리</th>
			                        <th width="250">클래스명</thw>
			                        <th width="200">강사명</th>
			                        <th width="100">가격</th>
			                        <th width="100">등록일</th>
			                        <th width="100">노출여부</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <tr>
			                        <td>${ c.clNo }</td>
			                        <td>
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
			                        <td height="50">${ c.clName }</td>
			                        <td>${ c.memNo }</td>
			                        <td><fmt:formatNumber value="${ c.clPrice }" type="number"/>원</td>
			                        <td>${ c.clDate }</td>
			                        <td>${ c.clStatus }</td>
			                    </tr>
			                </tbody>
			            </table>
			        </div>
			    </div>
			    <br><br>
			
			    <div>
			        <p style="font-size:20px;"><b>클래스 문의 관리</b></p>
			
			        <div>
			        
			            <div>
					        <button type="button" class="btn" style="background-color: #6babd5; width: 130px; color: white;" onclick="qnaCon(1);">문의 노출</button>
					        <button type="button" class="btn" style="background-color: lightgray; width: 130px;" onclick="qnaCon(2);">문의 미노출</button>
					
					        <div style="float: right;">
					            <select id="searchCategory" style="width:100px; height: 30px;">
					                <option id="cate1" value="1">문의번호</option>
					                <option id="cate2" value="2">작성자</option>
					                <option id="cate3" value="3">제목</option>
					                <option id="cate4" value="4">내용</option>
					            </select>
					            <input id="searchText" type="text" style="width: 200px" placeholder="검색어 입력">
					            <img src="resources/images/search.png" style="width: 23px; height: 23px; cursor:pointer;" onclick="searchKeyword();">
					        </div>
					
					        <span style="float: right; margin-right: 20px;">
					            <select id="arraySelect" style="width:150px; height: 30px;" onchange="arrayChange(this);">
					                <option id="arraynew" value="new">등록일 빠른순</option>
					                <option id="arrayold" value="old">등록일 느린순</option>
					            </select>
					        </span>
					    </div>
					    <br>
					
					    <div>
					        <table id="classList" class="table table-hover classList">
					            <thead>
					                <tr style="background-color: #6babd5;">
					                    <th width="30"><input type="checkbox" onchange="allCheck(this);"></th>
					                    <th width="100">리뷰번호</th>
					                    <th width="150">작성자</th>
					                    <th width="200">제목</th>
					                    <th>내용</th>
					                    <th width="100">등록일</th>
					                    <th width="100">노출여부</th>
					                </tr>
					            </thead>
					            <tbody>
				                	<c:forEach var="cq" items="${ cqList }">
						                <tr>
						                    <td><input type="checkbox" class="checkboxs" value="${ cq.csQnaNo }"></td>
						                    <td>${ cq.csQnaNo }</td>
						                    <td>${ cq.memNo }</td>
						                    <td>${ cq.title }</td>
						                    <td>${ cq.content }</td>
						                    <td>${ cq.createDate }</td>
						                    <td>${ cq.status }</td>
						                </tr>
					                </c:forEach>
					            </tbody>
					        </table>
					    </div>
					
						<c:if test="${pi.listCount > 0 }">
							<div id="pagingAreaQna">
								<ul class="pagination">
									<c:if test="${ pi.currentPage > 1 }">
										<li class="page-item">
											<a class="page-link" 
											href="classManagerQna.ad?cpage=${pi.currentPage - 1}&clNo=${c.clNo}&array=${ cm.array }&category=${ cm.category }&keyword=${cm.keyword}&yclass=${cm.yclass}&nclass=${cm.nclass}&rarray=${rarray}&rcategory=${rcategory}&rkeyword=${rkeyword}&before=${cm.before}&after=${cm.after}&rpage=${cm.rpage}">
											Previous</a>
										</li>
									</c:if>
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<li class="page-item">
											<a class="page-link" 
											href="classManagerQna.ad?cpage=${ p }&clNo=${c.clNo}&array=${ cm.array }&category=${ cm.category }&keyword=${cm.keyword}&yclass=${cm.yclass}&nclass=${cm.nclass}&rarray=${rarray}&rcategory=${rcategory}&rkeyword=${rkeyword}&before=${cm.before}&after=${cm.after}&rpage=${cm.rpage}">
											${ p }</a>
										</li>
									</c:forEach>
									<c:if test="${ pi.currentPage != pi.maxPage }">
										<li class="page-item">
											<a class="page-link" 
											href="classManagerQna.ad?cpage=${ pi.currentPage + 1}&clNo=${c.clNo}&array=${ cm.array }&category=${ cm.category }&keyword=${cm.keyword}&yclass=${cm.yclass}&nclass=${cm.nclass}&rarray=${rarray}&rcategory=${rcategory}&rkeyword=${rkeyword}&before=${cm.before}&after=${cm.after}&rpage=${cm.rpage}">
											Next</a>
										</li>
									</c:if>
								</ul>
							</div>
						</c:if>
					    
			        </div>
			        
			    </div>
			    <br><br><br>
			
		    </div>
    	</div>
    </div>

	<script>
		window.onload = function(){
			var clNo = "${c.clNo}";
			var array = "${cm.array}";
			var category = "${cm.category}";
			var keyword = "${cm.keyword}";
			
			if(array == 'new'){ 
    			document.getElementById("arraynew").selected = true; 
   			} else{
    			document.getElementById("arrayold").selected = true; 
   			}
			
			if(category == ""){
				document.getElementById("cate1").selected = true;
			} else if(category == "1"){
				document.getElementById("cate1").selected = true;
				document.getElementById("searchText").value = keyword;
			} else if(category == "2"){
				document.getElementById("cate2").selected = true;
				document.getElementById("searchText").value = keyword;
			} else if(category == "3"){
				document.getElementById("cate3").selected = true;
				document.getElementById("searchText").value = keyword;
			} else{
				document.getElementById("cate4").selected = true;
				document.getElementById("searchText").value = keyword;
			}
		}
	
		function listPage(){
			var rpage = "${cm.rpage}";
    		var yy = "${cm.yclass}"; 
    		var nn = "${cm.nclass}";
    		var array = "${rarray}";
    		var category = "${rcategory}";
    		var keyword = "${rkeyword}";
    		var before = "${cm.before}";
    		var after = "${cm.after}";
    		
			location.href = "classManager.ad?cpage=" + rpage + "&yclass=" + yy + "&nclass=" + nn 
						+ "&array=" + array + "&category=" + category + "&keyword=" + keyword
						+ "&before=" + before + "&after=" + after;
		}
		
		function statusController(num){
			var clNo = "${c.clNo}";
			
			if(num == 1){
				if(confirm("클래스를 노출하시겠습니까?") == true){
					$.ajax({
						url:"classShow.ad",
						data:{clNo:clNo},
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
			} else{
				if(confirm("클래스를 미노출하시겠습니까?") == true){
					$.ajax({
						url:"classHide.ad",
						data:{clNo:clNo},
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
		
		function arrayChange(el){
			var cpage = "${pi.currentPage}";
			var clNo = "${c.clNo}";
			var category = "${cm.category}";
			var keyword = "${cm.keyword}";
			
			var yy = "${cm.yclass}";
			var nn = "${cm.nclass}";
    		var rarray = "${rarray}";
    		var rcategory = "${rcategory}";
    		var rkeyword = "${rkeyword}";
    		var before = "${cm.before}";
    		var after = "${cm.after}";
    		var rpage = "${cm.rpage}";
			
			location.href = "classManagerQna.ad?cpage=" + cpage + "&clNo=" + clNo + "&array=" + el.value + "&category=" + category
					+ "&keyword=" + keyword + "&yclass=" + yy +"&nclass=" + nn + "&rarray=" + rarray + "&rcategory=" + rcategory 
					+ "&rkeyword=" + rkeyword + "&before=" + before + "&after=" + after + "&rpage=" + rpage;
		}
		
		function searchKeyword(){
			var cpage = "${pi.currentPage}";
			var clNo = "${c.clNo}";
			var array = "${cm.array}";
			
			var yy = "${cm.yclass}";
			var nn = "${cm.nclass}";
    		var rarray = "${rarray}";
    		var rcategory = "${rcategory}";
    		var rkeyword = "${rkeyword}";
    		var before = "${cm.before}";
    		var after = "${cm.after}";
    		var rpage = "${cm.rpage}";
			
			var searchText = document.getElementById("searchText").value;
			var searchCategory = document.getElementById("searchCategory").value;
			
			var regExp = /^[0-9]+$/g;
			
			if(searchCategory == '1' && searchText.replace(/ /gi, "").length < 1){
				alert("검색어는 한 글자 이상 입력해야 합니다.");
			} else if(searchCategory == '1' && regExp.test(searchText) == false){
				alert("숫자만 입력해주세요.");
			} else{
				location.href = "classManagerQna.ad?cpage=" + cpage + "&clNo=" + clNo + "&array=" + array + "&category=" + searchCategory
								+ "&keyword=" + searchText + "&yclass=" + yy +"&nclass=" + nn + "&rarray=" + rarray + "&rcategory=" + rcategory 
								+ "&rkeyword=" + rkeyword + "&before=" + before + "&after=" + after + "&rpage=" + rpage;
			}
		}
		
	 	function allCheck(el){
	 		var checkboxs = document.getElementsByClassName("checkboxs");
	 		
 			for(var i=0; i<checkboxs.length; i++){
 				checkboxs[i].checked = el.checked;
 			}
	 	}
		
		function qnaCon(num){
			var checkboxs = document.getElementsByClassName("checkboxs");
			var ckNum = 0;
			var checkboxNo = new Array();
			
 			for(var i=0; i<checkboxs.length; i++){
 				if(checkboxs[i].checked == true){
 					ckNum += 1;
 				}
 			}
 			
 			if(ckNum < 1){
 				alert("한 개 이상의 클래스를 선택해주세요.");
 			} else {
 				
				for(var i=0; i<checkboxs.length; i++){
	 				if(checkboxs[i].checked == true){
	 					checkboxNo.push(checkboxs[i].value);
	 				}
				}
				
				if(num == 1){
					if(confirm("문의를 노출처리 하시겠습니까?") == true){
						$.ajax({
							url:"qnaShows.ad",
							type : "post",
							data:{checkList:checkboxNo},
							success:function(result){
								if(result == 'yyyyy'){
									alert("문의가 노출처리 되었습니다.");
									window.location.reload();
								} else{
									alert("문의 노출처리에 실패하였습니다.");
								}
							}, error:function(){
								console.log("문의 노출 ajax 통신 실패");
							}
						})
					}
				}else{
					if(confirm("문의를 미노출처리 하시겠습니까?") == true){
						$.ajax({
							url:"qnaHides.ad",
							type : "post",
							data:{checkList:checkboxNo},
							success:function(result){
								if(result == 'yyyyy'){
									alert("문의가 미노출처리 되었습니다.");
									window.location.reload();
								} else{
									alert("문의 미노출처리에 실패하였습니다.");
								}
							}, error:function(){
								console.log("문의 미노출 ajax 통신 실패");
							}
						})
					}
				}
				
 			}
 			
		}
		
		function reviewPage(){
			var clNo = "${cm.clNo}";
			var yy = "${cm.yclass}";
			var nn = "${cm.nclass}";
    		var rarray = "${rarray}";
    		var rcategory = "${rcategory}";
    		var rkeyword = "${rkeyword}";
    		var before = "${cm.before}";
    		var after = "${cm.after}";
    		var rpage = "${cm.rpage}";
    		
			location.href = "classManagerReview.ad?cpage=1&clNo=" + clNo + "&array=new&category=&keyword=" 
			+ "&yclass=" + yy +"&nclass=" + nn + "&rarray=" + rarray + "&rcategory=" + rcategory + "&rkeyword=" + rkeyword
			+ "&before=" + before + "&after=" + after + "&rpage=" + rpage;
		}
	</script>
</body>
</html>