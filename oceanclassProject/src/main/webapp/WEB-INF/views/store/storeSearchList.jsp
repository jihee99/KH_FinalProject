<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#outer {
	width: 1200px;
	margin: auto;
	margin-top: 50px;
}
.items {
	width: 100%;
	margin-top: 50px;
}
.items_title {
	font-size: 20px;
}

.item {
	width: 220px;
	display: inline-block;
	box-sizing: border-box;
	margin: 30px;
	margin-bottom: 30px;
}

.item>span {
	font-size: 12px;
}

.thumbnail, .title, #likeImg {
	cursor: pointer;
}

.thumbnail {
	width: 100%;
	height: 200px;
}

#pagingArea {
	width: fit-content;
	margin: auto;
	margin-top: 150px;
	margin-bottom: 50px;
}
</style>
</head>
<body>


	<jsp:include page="../common/header.jsp" />

	<div id="outer">

		<input type="hidden" id="memNo" value="${ loginUser.memNo }">

		<div id="selectBar" class="form-group">
			<form action="storeSearchList.st" method="post">
				<select class="form-control" name="sel1" id="categoryList" style="width: 15%; float: left; margin-right: 10px;" onchange="conditionCate();">
					<option value="0" id="cate0">카테고리</option>
					<option value="1" id="cate1">CLASS PRODUCT</option>
					<option value="2" id="cate2">OC EDITION</option>
					<option value="3" id="cate3">DIY KIT</option>
				</select> 
				<select id="order" class="form-control" name="sel2" style="width: 15%;" onchange="conditionArray();">
					<option value="like" id="arrayLike">인기순</option>
					<!-- 찜수 높은 순 -->
					<option value="date" id="arrayDate">최신순</option>
					<option value="rev" id="arrayrev">리뷰많은순</option>
				</select>
			</form>
		</div>
			
		<c:choose>
			<c:when test="${ empty list }">
				<div style="margin-top:50px; width:100%; height:500px;">
					검색 결과가 없습니다.
				</div>
			</c:when>
			<c:otherwise>
			<div class="items">
				<c:forEach var="p" items="${ list }">
					<div class="item">
						<img src="${ p.productImg0 }" class="thumbnail" onclick="goDetail(${p.productNo});">
						<div style="font-size: 13px;">
							<b>${ p.nickname }</b>
						</div>
						<div class="title" style="height: 50px;" onclick="goDetail(${p.productNo});">${ p.title }</div>
						<div id="likeArea">
							<c:choose>
								<c:when test="${ p.likeCk == 1 }">
									<img src="resources/images/heart2.png" width="20" height="20" id="likeImg" onclick="likeCk(${p.productNo}, this);">
								</c:when>
								<c:otherwise>
									<img src="resources/images/heart1.png" width="20" height="20" id="likeImg" onclick="likeCk(${p.productNo}, this);">
								</c:otherwise>
							</c:choose>
							<span id="likeCount">${ p.like}</span>
						</div>
						<div>
							<b> <span>${ p.price }</span>원
							</b>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>

		<div id="pagingArea">
			<ul class="pagination">

				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="storeSearchList.st?cpage=${ pi.currentPage - 1 }&keyword=${ keyword }&category=${ category }&array=${ array }">Previous</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link" href="storeSearchList.st?cpage=${ p }&keyword=${ keyword }&category=${ category }&array=${ array }">${ p }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="storeSearchList.st?cpage=${ pi.currentPage + 1 }&keyword=${ keyword }&category=${ category }&array=${ array }">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

	</div>	
		<input type="hidden" id="currentPateDate" value="${ pi.currentPage }">
		<input type="hidden" id="keywordData" value="${ keyword }">
		<input type="hidden" id="categoryData" value="${ category }">
		<input type="hidden" id="arrayData" value="${ array }">



	<jsp:include page="../common/footerBar.jsp" />

	<script>
		
    	$(function(){
    		$("#sel1").change(function(){
        		let value = $(this).val();
        		let value3 = $(this).next().val();
        		
        		$.ajax({
        			url:"categorySearch.cs",
        			data:{category:value,
        				  memberNo:document.getElementById("memNo").value,
        				  sort:value3},
        			success:function(list){
        				let value = "";
        				for(let i in list){
        					value += "<div class='item'>"
        						   + 	"<img src='" + list[i].productImg0 + "' class='thumbnail' onclick='goDetail(" + list[i].productNo +  ");'>"
        	                	   + 	"<div style='font-size: 13px;'>" + "<b>" + list[i].nickname + "</b>" + "</div>"
        	                	   + 	"<div class='title' style='height=50px;' onclick='goDetail(" + list[i].productNo +  ");'>" + list[i].title + "</div>"
        	   	                   + 	"<div id='likeArea'>";
        			        if( list[i].likeCk == 1){
        			        	value +=  	"<img src='resources/images/heart2.png' width='20' height='20' id='likeImg' onclick='likeCk(" + list[i].productNo + ", this);'>";
        			        }else {
        			        	value +=  	"<img src='resources/images/heart1.png' width='20' height='20' id='likeImg' onclick='likeCk(" + list[i].productNo +  ", this);'>";
        			                }
        	   	            	value +=    "<span id='likeCount'>" + list[i].like + "</span>"
        		                   +    "</div>"
        	                	   + 	"<div>"
        	                       +		"<b>"
        	                       + 			"<span>" + list[i].price + "</span>"
        	                       +		"원"
        	                       + 		"</b>"
        	                       + 	"</div>"
        	                	   + "</div>";
        	                	   
        				}
        				
        				$(".items").html(value);
        			},error:function(){
        				alert("에러발생");
        			}
        		})
        	})
    	  })

		
		function goDetail(no) {
			   location.href = "productMain.pr?pno=" + no;
			}
    	
		function likeCk(pno, img){
			//console.log(window.event.target);
			
    			 if(document.getElementById("memNo").value == ""){
    	                alert("로그인 후 이용 가능한 서비스 입니다.");
    	            } else{
    	                $.ajax({
    	                    url:"likeStore.st",
    	                    data:{
    	                        memNo:document.getElementById("memNo").value,
    	                        referNo:pno
    	                    }, success:function(likeResult){
    							console.log(likeResult);
    	                        if(likeResult.message == 'ss'){
    	                            img.src = "resources/images/heart2.png";
    	                            $(img).next().html(likeResult.likeCount);
    	                            alert("찜 목록에 추가 되었습니다!");
    	                        } else if(likeResult.message == 'dd'){
    	                        	img.src = "resources/images/heart1.png";
    	                            $(img).next().html(likeResult.likeCount);
    	                            alert("찜 목록에서 삭제되었습니다.");
    	                        } else {
    	                            alert("비정상적인 요청입니다.");
    	                        }
    	                    	
    	                    }, error:function(){
    	                        console.log("찜하기 ajax 통신 실패");
    	                    }
    	           	    })
    	            }
    		}
		
        window.onload = function(){
            
            var cpageD = document.getElementById("currentPateDate");
			var keywordD = document.getElementById("keywordData");
			var categoryD = document.getElementById("categoryData");
			var arrayD = document.getElementById("arrayData");
			
			var cate0 = document.getElementById("cate0");
			var cate1 = document.getElementById("cate1");
			var cate2 = document.getElementById("cate2");
			var cate3 = document.getElementById("cate3");
			
			var arrayLike = document.getElementById("arrayLike");
			var arrayDate = document.getElementById("arrayDate");
			// 리뷰많은순
			
			switch(categoryD.value){
				case '0' : cate0.selected = true; break;
				case '1' : cate1.selected = true; break;
				case '2' : cate2.selected = true; break;
				case '3' : cate3.selected = true; break;
			}
			
			switch(arrayD.value){
				case 'like' : arrayLike.selected = true; break;
				case 'date' : arrayDate.selected = true; break;
				case 'rev' : arrayRev.selected = true; break;
			}

        }
        
		function conditionCate(){
			// 방금 조회 해 올때의 기록
			var cpageD = document.getElementById("currentPateDate");
			var keywordD = document.getElementById("keywordData");
			var arrayD = document.getElementById("arrayData");

			// 새로운 기록
			var category = document.getElementById("categoryList");
			
			location.href = "storeSearchList.st?cpage=" + cpageD.value + "&keyword=" + keywordD.value + "&category=" + category.value + "&array=" + arrayD.value;
		}
		
		function conditionArray(){
			// 방금 조회 해 올때의 기록
			var cpageD = document.getElementById("currentPateDate");
			var keywordD = document.getElementById("keywordData");
			var categoryD = document.getElementById("categoryData");

			// 새로운 기록
			var array = document.getElementById("order");

			location.href = "storeSearchList.st?cpage=" + cpageD.value + "&keyword=" + keywordD.value + "&category=" + categoryD.value + "&array=" + array.value;
			
		}
		
	</script>

</body>
</html>