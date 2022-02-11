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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="./resources/css/helpMain.css?6">
<style>
	.content>ul{
		list-style: none;
		text-align: center;
		padding: 20px;
	}
	.con{width: 90%; margin:0 auto; margin-top: 15px;}
	.t{background: rgb(224, 224, 224); padding: 10px; }
	.c{display: none; width: 80%; margin:0 auto; padding-top: 10px; height: 50px; margin-bottom: 50px; align:justify;}
	.selected{background: rgb(107, 171, 213, 0.2);}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <div class="innerOuter my-3">
        <div class="head py-3">
            <p>FAQ</p>
        </div>
        <div class="button my-3 mb-5">
            <button type="button" class="btn" onclick="location.href='helpList.he';">공지사항</button>
            <button type="button" class="btn" onclick="location.href='faqMain.he';">FAQ</button>
            <button type="button" class="btn" onclick="location.href='qnaMain.he';">1:1문의</button>
        </div>
       
        <div class="content">
        	<ul>
        		<c:forEach var="f" items="${list}"> 
	        		<li class="con">
	        			<h6 class="t">[${f.category}] ${f.faqTitle}</h6>
	        			<p class="c">${f.faqContent}</p>
	        		</li>
        		</c:forEach>
        	</ul>
        </div>
        
        <script>
        	$(".con>.t").click(function(){
        		console.log($(this).text());
        		$(this).toggleClass("selected");
        		$(".con>t").not(this).removeClass("selected");
        		
        		var target = $(this).parents(".con").find(".c");
        		//console.log(target);
        		//$(this).next().slideDown();
        		target.slideToggle(300);
        	});
        </script>
		
    </div>
    
    <br> <br> <br> 
    <jsp:include page="../common/footerBar.jsp" />
    
</body>
</html>