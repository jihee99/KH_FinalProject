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
		width: 1200px;
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
    .thumbnail, .title, #likeImg{
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
	
		<input type="hidden" id="memNo" value="${ loginUser.memNo }">
        
		<div id="selectBar" class="form-group">
		<form action="storeSearchList.st" method="post">
			<select class="form-control" name="sel1" id="sel1" style="width: 15%; float: left; margin-right: 10px;">
				<option value="1">CLASS PRODUCT</option>
				<option value="2">OC EDITION</option>
				<option value="3">DIY KIT</option>
				<option selected style="display: none;">카테고리</option>
			</select>
		
			<select id="order" class="form-control" name="sel2" id="sel2" style="width: 15%;">
				<option selected value="4">인기순</option><!-- 구매수 높은 순 -->
				<option value="5">추천순</option><!-- 찜수 높은 순 -->
				<option value="6">리뷰순</option>
			</select>
		</form>
		</div>
		<div class="items">
			<c:forEach var="p" items="${ list }">
	            <div class="item" style="margin-right: 62px;">
	                <img src="${ p.productImg0 }" class="thumbnail" onclick="goDetail(${p.productNo});">
	                <div style="font-size: 13px;"><b>${ p.memberNo }</b></div>
	                <div class="title" onclick="goDetail(${p.productNo});">${ p.title }</div>
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
	                    <b>
	                        <span>${ p.price }</span>원 
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
        					value += "<div class='item' style='margin-right: 62px;'>"
        						   + 	"<img src='" + list[i].productImg0 + "' class='thumbnail' onclick='goDetail(" + list[i].productNo +  ");'>"
        	                	   + 	"<div style='font-size: 13px;'>" + "<b>" + list[i].memberNo + "</b>" + "</div>"
        	                	   + 	"<div class='title' onclick='goDetail(" + list[i].productNo +  ");'>" + list[i].title + "</div>"
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
		
	</script>

</body>
</html>