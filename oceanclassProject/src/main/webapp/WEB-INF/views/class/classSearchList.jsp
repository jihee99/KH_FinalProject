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
	#outer{
		width: 1000px;
        margin:auto;
        margin-top: 50px;
	}
	.items{
        width: 100%;
        margin-top: 50px;
    }
    .items_title{
        font-size: 20px;
    }
    .item{
        width: 290px;
        display: inline-block;
        margin:10px;
        margin-bottom: 70px;
    }
    .item>span{
        font-size: 12px;
    }
    .item *{
        cursor:pointer;
    }
    .thumbnail{
        width: 100%;
        height: 180px;
    }
	#pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 135px;
		margin-bottom: 50px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div id="outer">
		<input type="hidden" id="currentPateDate" value="${ pi.currentPage }">
		<input type="hidden" id="keywordData" value="${ keyword }">
		<input type="hidden" id="categoryData" value="${ category }">
		<input type="hidden" id="arrayData" value="${ array }">
		
		<div id="selectBar" class="form-group">
			<select id="categoryList" class="form-control" style="width: 15%; float: left; margin-right: 10px;" onchange="conditionCate();">
				<option value="0" id="cate0">카테고리</option>
				<option value="1" id="cate1">드로잉</option>
				<option value="2" id="cate2">요리</option>
				<option value="3" id="cate3">음악</option>
				<option value="4" id="cate4">운동</option>
				<option value="5" id="cate5">사진&영상</option>
				<option value="6" id="cate6">재태크</option>
				<option value="7" id="cate7">개발&데이터</option>
				<option value="8" id="cate8">자기계발</option>
			</select>

			<select id="order" class="form-control" style="width: 15%;" onchange="conditionArray();">
				<option value="like" id="arrayLike">인기순</option><!-- 찜 수 높은 순 -->
				<!--<option>추천순</option>-->
				<option value="date" id="arrayDate">최신순</option>
			</select>
		</div>
		
		<c:choose>
			<c:when test="${ empty list }">
				<div style="margin-top:50px; width:100%; height:500px;">
					검색 결과가 없습니다.
				</div>
			</c:when>
			<c:otherwise>
				<div class="items">
					<c:forEach var="c" items="${ list }">
			            <div class="item" onclick="page(${ c.clNo })">
			                <img src="${ c.clImg }" class="thumbnail">
			                <div style="font-size: 13px;"><b>${ c.memNo }</b></div>
			                <div>${ c.clName }</div>
			                <div id="likeArea">
				                <img src="resources/images/heart2.png" style="width: 20px; height: 20px;">
				                <span>${ c.like}</span>
			                </div>
			                <!--  
			                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
			                <span>
			                    <span>99</span>%
			                </span>
			                -->
			                <div>
			                    <b>
			                        <span class="classPrice">${ c.clPrice }</span>원 
			                    </b>
			                </div>
			            </div>
		            </c:forEach>
		        </div>
		        
				<div id="pagingArea">
					<ul class="pagination">
						<c:if test="${ pi.currentPage > 1 }">
							<li class="page-item"><a class="page-link" href="classSearchList.me?cpage=${ pi.currentPage - 1 }&keyword=${ keyword }&category=${ category }&array=${ array }">Previous</a></li>
						</c:if>
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="classSearchList.me?cpage=${ p }&keyword=${ keyword }&category=${ category }&array=${ array }">${ p }</a></li>
						</c:forEach>
						<c:if test="${ pi.currentPage != pi.maxPage }">
							<li class="page-item"><a class="page-link" href="classSearchList.me?cpage=${ pi.currentPage + 1 }&keyword=${ keyword }&category=${ category }&array=${ array }">Next</a></li>
						</c:if>
					</ul>
				</div>
			</c:otherwise>
		
		</c:choose>

	</div>
		
	<jsp:include page="../common/footerBar.jsp" />
	
    <script>

        function page(classNo){
           	location.href = 'classDetail.me?referNo=' + classNo;
        }
    
        window.onload = function(){
            var price = document.getElementsByClassName("classPrice");

            for(let i=0; i<price.length; i++) {

                var originPrice = price[i].innerHTML;
                var price1 = originPrice.substring(0, originPrice.length - 3);
                var price2 = originPrice.substring(originPrice.length - 3);

                price[i].innerHTML = price1 + "," + price2;
            }
            
            var cpageD = document.getElementById("currentPateDate");
			var keywordD = document.getElementById("keywordData");
			var categoryD = document.getElementById("categoryData");
			var arrayD = document.getElementById("arrayData");
			
			var cate0 = document.getElementById("cate0");
			var cate1 = document.getElementById("cate1");
			var cate2 = document.getElementById("cate2");
			var cate3 = document.getElementById("cate3");
			var cate4 = document.getElementById("cate4");
			var cate5 = document.getElementById("cate5");
			var cate6 = document.getElementById("cate6");
			var cate7 = document.getElementById("cate7");
			var cate8 = document.getElementById("cate8");
			
			var arrayLike = document.getElementById("arrayLike");
			var arrayDate = document.getElementById("arrayDate");
			
			switch(categoryD.value){
				case '0' : cate0.selected = true; break;
				case '1' : cate1.selected = true; break;
				case '2' : cate2.selected = true; break;
				case '3' : cate3.selected = true; break;
				case '4' : cate4.selected = true; break;
				case '5' : cate5.selected = true; break;
				case '6' : cate6.selected = true; break;
				case '7' : cate7.selected = true; break;
				case '8' : cate8.selected = true; break;
			}
			
			switch(arrayD.value){
				case 'like' : arrayLike.selected = true; break;
				case 'date' : arrayDate.selected = true; break;
			}

        }
        
		function conditionCate(){
			// 방금 조회 해 올때의 기록
			var cpageD = document.getElementById("currentPateDate");
			var keywordD = document.getElementById("keywordData");
			var arrayD = document.getElementById("arrayData");

			// 새로운 기록
			var category = document.getElementById("categoryList");
			
			location.href = "classSearchList.me?cpage=" + cpageD.value + "&keyword=" + keywordD.value + "&category=" + category.value + "&array=" + arrayD.value;
		}
		
		function conditionArray(){
			// 방금 조회 해 올때의 기록
			var cpageD = document.getElementById("currentPateDate");
			var keywordD = document.getElementById("keywordData");
			var categoryD = document.getElementById("categoryData");

			// 새로운 기록
			var array = document.getElementById("order");

			location.href = "classSearchList.me?cpage=" + cpageD.value + "&keyword=" + keywordD.value + "&category=" + categoryD.value + "&array=" + array.value;
			
		}

    </script>



</body>
</html>