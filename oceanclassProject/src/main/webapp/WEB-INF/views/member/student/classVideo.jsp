<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
    #header{width: 100%;}
    #header>bi{float:left;}
    #video{width: 80%; height: 630px; float:left;}
    #list{width:20%; height: 630px; float:left; padding: 10px;}
    #header>p{font-size: 28px; font-weight: 600;}
    #list p{font-size: 20px; font-weight: 600; background-color: lightsteelblue;}
    #list ul{list-style:none;}
    #title{width: 100%;}
    #title>p{font-size: 24px; font-weight: 600px; margin-top: 20px;}
    #list p:hover, .bi:hover{cursor:pointer;}
    #list li:hover{cursor:pointer; font-weight: bolder;}
</style>
</head>
<body>
    <div id="Wrapper" style="width: 1600px; height: auto; margin: 0 auto;">
        <div id="header">
        	<i class="bi bi-chevron-left" id="back" style="color: cornflowerblue; font-weight: 800;">뒤로가기</i>
            <p>${p.clName}</p>
        </div>
        <div id="video">
            <video src="${p.videoAddress}" controls autoplay style="width:100%; height: 90%"></video>
             <div id="title">
	        	<p>1.무작정 따라해보기</p>
	        </div>
        </div>
        <div id="list" style="overflow-y: scroll;">
        	<c:set var="chapArr" value="${fn:split(p.chapter, '/')}" />
        	<!-- 
        	<c:set var="subChapArr" value="${fn:split(p.subChapter, '/')}" />
        	<c:set var="subChapIndexArr" value="${fn:split(subChapArr, ' ')}" />
        	 -->
        	<c:forEach var="c" items="${chapArr}">
	            <div class="chapter">
	                <p>${c}</p>
	                	<ul style="display:none;">
		                        <li>1.무작정 따라해보기</li>
		                        <li>2.뜻과 의미 생각하며 따라해보기</li>
		                        <li>3.실전에 적용해보기</li>
		                </ul>
	            </div>
            </c:forEach>
        </div>
    </div>
    
    <script>
        $(".chapter>p").click(function(){
            console.log("여기");
            console.log($(this).siblings("ul"));
            $(this).siblings("ul").slideToggle(600);
        })
        
        $("#back").click(function(){
        	location.href="myIngClass.me";
        })
    </script>
</body>
</html>