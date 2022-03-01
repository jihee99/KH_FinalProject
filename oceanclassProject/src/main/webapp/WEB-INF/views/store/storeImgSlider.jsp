<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
  <style>

  /* Make the image fully responsive*/
  #demo{
	  width:1200px;
	  height:370px;
	  margin:auto;
  }
  .carousel-inner{
	  height:330px;
	  margin: auto;
  }
  </style>
</head>
<body>

<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner" align="center">
  
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev" style="width:7%;">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next" style="width:7%;">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<script type="text/javascript">
	$(function(){ //페이지로딩되고 곧바로 호출
		
		selectStoreImgList();
	
	})
	
function selectStoreImgList(){
		
		
         $.ajax({
            url:"imgSlider.ma",
            success:function(list){
               
               console.log(list);
               
               let result = "";
                  result += "<div class='carousel-item active'>"
                     + "<img width='900' height='330' src='./resources/images/event/17.jpg'>"
                           + "</div>"
                           + "<div class='carousel-item'>"
                           + "<img width='900' height='330' src='./resources/images/event/18.jpg'>"
                                 + "</div>"
                                 + "<div class='carousel-item'>" 
                                 + "<img width='900' height='330' src='./resources/images/event/co1.jpg'>"
                                       + "</div>";
               $(".carousel-inner").html(result);
               
            },error:function(){
               console.log("슬라이드목록조회용 ajax 통신실패");
            }
         })
      }
</script>

</body>
</html>