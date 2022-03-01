<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
    .Wrapper{width: 1000px; height: auto; border: 1px solid;}
    #header{width: 100%; border: 1px solid;}
    #video{width: 70%; float:left; border: 1px solid;}
    #list{width:20%; float:left; padding: 10px; border: 1px solid;}
    #header>p{font-size: 22px; font-weight: 600;}
    #list p{font-size: 18px; font-weight: 600; background-color: lightsteelblue;}
    #list ul{list-style:none;}
</style>
</head>
<body>
    <div id="Wrapper">
        <div id="header">
            <p>${p.clName}</p>
        </div>
        <div id="video">
            <video src="${p.videoAddress}" controls autoplay style="width:100%;"></video>
        </div>
        <div id="list">
            <div class="chapter">
                <p>${p.chapter}</p>
                    	${p.subChapter}
	                    <ul style="display: none;">
	                        <li>1강.어쩌구</li>
	                        <li>2강.어쩌구</li>
	                        <li>3강.어쩌구</li>
	                        <li>4강.어쩌구</li>
	                    </ul>
            </div>
        </div>
    </div>
    <script>
        $(".chapter>p").click(function(){
            console.log("여기");
            console.log($(this).siblings("ul"));
            $(this).siblings("ul").slideToggle(600);
        })
    </script>
</body>
</html>