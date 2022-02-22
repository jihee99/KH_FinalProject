<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        margin-bottom:30px;
    }
    .item{
        width: 290px;
        display: inline-block;
        margin:20px;
        margin-bottom: 30px;
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
</style>
</head>
<body>

    <div id="outer">
        <div id="silde">나중에 silde들어갈자리</div>
        
        <div class="items">
            <div class="items_title"><b>· HOT CLASS</b></div>
           	<div id="hotClass"></div>
        </div>

        <div class="items">
            <div class="items_title"><b>· NEW CLASS</b></div>
           	<div id="newClass"></div>
        </div>

        <div style="height: 150px;"></div>

    </div>

    <script>
		
    	window.onload = function(){
    		
    		var hotClass = document.getElementById("hotClass");
    		var newClass = document.getElementById("newClass");
    		
    		$.ajax({
    			url:"classHotList.me",
    			success:function(data){
    				let value = "";
    				for(let i in data){
    					
    					var price1 = data[i].clPrice;
    					var price2 = price1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    					
    					value += "<div class='item' onclick='classPage(" + data[i].clNo + ")'>"
							   + "<img src='" + data[i].clImg + "' class='thumbnail'>"
							   + "<div style='font-size: 13px; margin-top:10px;'><b>" + data[i].memNo + "</b></div>"
							   + "<div style='height:50px;'>" + data[i].clName + "</div>"
							   + "<div class='likeArea'>"
							   + "<img src='resources/images/heart2.png' style='width: 20px; height: 20px;'>"
							   + "<span> " + data[i].like + "</span>"
							   + "</div>"
							   + "<div><b><span class='classPrice'>" + price2 + "</span>원</b></div>"
							   + "</div>";
    				}
    				
    				hotClass.innerHTML = value;
    				
    			}, error:function(){
    				console.log("메인페이지 클래스 hot ajax 통신 실패");
    			}
    		})
    		
    		$.ajax({
    			url:"classNewList.me",
    			success:function(data){
    				let value = "";
    				for(let i in data){
    					
    					var price1 = data[i].clPrice;
    					var price2 = price1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    					
    					value += "<div class='item' onclick='classPage(" + data[i].clNo + ")'>"
						   + "<img src='" + data[i].clImg + "' class='thumbnail'>"
						   + "<div style='font-size: 13px; margin-top:10px;'><b>" + data[i].memNo + "</b></div>"
						   + "<div>" + data[i].clName + "</div>"
						   + "<div class='likeArea'>"
						   + "<img src='resources/images/heart2.png' style='width: 20px; height: 20px;'>"
						   + "<span> " + data[i].like + "</span>"
						   + "</div>"
						   + "<div><b><span class='classPrice'>" + price2 + "</span>원</b></div>"
						   + "</div>";
    				}
    				
    				newClass.innerHTML = value;
    				
    			}, error:function(){
    				console.log("메인페이지 클래스 hot ajax 통신 실패");
    			}
    		})
    		
    	}
    	
    	function classPage(clNo){
    		location.href = "classDetail.me?referNo=" + clNo;
    	}
    
    </script>

</body>
</html>