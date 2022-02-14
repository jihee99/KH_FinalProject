<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #outer{
        width: 1000px;
        margin:auto;
        margin-top: 20px;
    }
    #silde{
        background-color: skyblue;
        width: 100%;
        height: 250px;
    }
    .items{
        width: 100%;
        margin-top: 50px;
    }
    .items_title{
        font-size: 20px;
    }
    .item{
        width: 199px;
        margin-top: 20px;
        display: inline-block;
        box-sizing: border-box;
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
    .more_btn{text-decoration: none; color: rgb(172, 171, 171);}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

    <div id="outer">
        <div id="silde">나중에 silde들어갈자리</div>
        
        <div class="items">
            <div class="items_title"><b>· HOT ITEM</b> <!--띄어쓰기-->
                <a href="storeSearchList.st" class="more_btn">+more</a>
            </div>
            
            
			<c:forEach var="p" items="${ list }" end="3">
	            <div class="item" style="margin-right: 62px;">
	                <img src="${ p.productImg0 }" class="thumbnail" onclick="">
	                <div style="font-size: 13px;"><b>${ p.memberNo }</b></div>
	                <div class="title">${ p.title }</div>
	                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
	                <span>찜수11</span>
	                <div>
	                    <b>
	                        <span>${ p.price }</span>
	                        원 
	                    </b>
	                </div>
            		<input type="hidden" id="pno" name="pno" value="${ p.productNo }">
	            </div>
			</c:forEach>
			
			<script>
	        	$(function(){
	        		$(".item").click(function(){
	        			location.href = 'productMain.pr?pno=' + $("#pno").value();
	        		});
	        	})
	        	
	        	$(function(){
	        		$(".title").click(function(){
	        			location.href = 'productMain.pr?pno=' + $("#pno").value();
	        		});
	        	})
			</script>
			

        <div class="items">
            <div class="items_title"><b>· NEW ITEM</b> <!--띄어쓰기-->
                <a href="storeSearchList.st" class="more_btn">+more</a>
            </div>

			<c:forEach var="p" items="${ list }" end="3">
	            <div class="item" style="margin-right: 62px;">
	                <img src="${ p.productImg0 }" class="thumbnail">
	                <div style="font-size: 13px;"><b>${ p.memberNo }</b></div>
	                <div>${ p.title }</div>
	                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
	                <span>찜수11</span>
	                <div>
	                    <b>
	                        <span>${ p.price }</span>
	                        원 
	                    </b>
	                </div>
	            </div>
	           	
			</c:forEach>

        </div>

        <div style="height: 150px;"></div>

    </div>
    
    <jsp:include page="../common/footerBar.jsp" />
    
</body>
</html>