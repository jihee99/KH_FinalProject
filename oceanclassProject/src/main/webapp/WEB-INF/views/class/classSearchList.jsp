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
		<div id="selectBar" class="form-group">
			<select class="form-control" style="width: 15%; float: left; margin-right: 10px;">
				<option>개발&데이터</option>
				<option>드로잉</option>
				<option>사진&영상</option>
				<option>요리</option>
				<option>음악</option>
				<option>운동</option>
				<option>자기계발</option>
				<option>재태크</option>
				<option selected style="display: none;">카테고리</option>
			</select>

			<select id="order" class="form-control" style="width: 15%;">
				<option value="like" selected>인기순</option><!-- 찜 수 높은 순 -->
				<!--<option>추천순</option>-->
				<option value="date">최신순</option>
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
			                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
			                <span>${ c.like}</span>
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
						<li class="page-item"><a class="page-link" href="">Previous</a></li>
				
						<li class="page-item"><a class="page-link" href="">1</a></li>
						<li class="page-item"><a class="page-link" href="">2</a></li>
						<li class="page-item"><a class="page-link" href="">3</a></li>
		
						<li class="page-item"><a class="page-link" href="">Next</a></li>
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
    
        $(function(){
            price();
        })

        function price(){
            var price = document.getElementsByClassName("classPrice");

            for(let i=0; i<price.length; i++) {

                var originPrice = price[i].innerHTML;
                var price1 = originPrice.substring(0, originPrice.length - 3);
                var price2 = originPrice.substring(originPrice.length - 3);

                price[i].innerHTML = price1 + "," + price2;
            }

        }

    </script>



</body>
</html>