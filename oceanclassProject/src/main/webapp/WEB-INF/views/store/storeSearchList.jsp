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
        width: 200px;
        margin-top: 20px;
        display: inline-block;
    }
    .item>span{
        font-size: 12px;
    }
    .item *{
        cursor:pointer;
    }
    .thumbnail{
        width: 100%;
        height: 200px;
    }
	#pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 150px;
		margin-bottom: 50px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div id="outer">
		<div id="selectBar" class="form-group">
		<form action="storeSearchList.st" method="post">
			<select class="form-control" name="sel1" id="sel1" style="width: 15%; float: left; margin-right: 10px;">
				<option value="1">CLASS PRODUCT</option>
				<option value="2">OC EDITION</option>
				<option value="3">DIY KIT</option>
				<option selected style="display: none;">카테고리</option>
			</select>
		</form>
			
			<select id="order" class="form-control" name="sel2" id="sel2" style="width: 15%;">
				<option selected>인기순</option><!-- 구매수 높은 순 -->
				<option>추천순</option><!-- 찜수 높은 순 -->
				<option>리뷰순</option>
			</select>
		</div>
		<div class="items">
			<c:forEach var="p" items="${ list }">
	            <div class="item" style="margin-right: 62px;">
	                <img src="${ p.productImg0 }" class="thumbnail">
	                <div style="font-size: 13px;"><b>${ p.memberNo }</b></div>
	                <div>${ p.title }</div>
	                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
	                <span>12345</span>
	                <div>
	                    <b>
	                        <span>${ p.price }</span>
	                        원 
	                    </b>
	                </div>
	            </div>
			</c:forEach>
		</div>

		<div id="pagingArea">
			<ul class="pagination">

				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>					
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="storeSearchList.st?cpage=${ pi.currentPage-1 }">Previous</a></li>					
					</c:otherwise>				
				</c:choose>
		
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link" href="storeSearchList.st?cpage=${ p }">${ p }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="storeSearchList.st?cpage=${ pi.currentPage+1 }">Next</a></li>					
					</c:otherwise>	
				</c:choose>
			</ul>
		</div>
		
	</div>

	
		
	<jsp:include page="../common/footerBar.jsp" />
	
	<script>
		$("select[name=sel1]").change(function(){
			console.log($(this).val()); //value값 가져오기
			
			//$((this)).val().submit();
		});
		
    	$(function(){
    		$("#sel1").change(function(){
        		let value = $(this).val();
        		//console.log(value);
        		$.ajax({
        			url:"categorySearch.cs",
        			data:{category:value},
        			success:function(list){
        				console.log(list);
        				let value = "";
        				for(let i in list){
        					value += "<div class='item' style='margin-right: 62px;'>"
        						   + 	"<img src='" + list[i].productImg0 + "' class='thumbnail'>"
        	                	   + 	"<div style='font-size: 13px;'>" + "<b>" + list[i].memberNo + "</b>" + "</div>"
        	                	   + 	"<div>" + list[i].title + "</div>"
        	                	   + 	"<img src='resources/images/heart1.png' style='width: 15px; height: 15px;'>"
        	                       + 	"<span>" + list[i].productNo + "</span>"
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
		
	</script>

</body>
</html>