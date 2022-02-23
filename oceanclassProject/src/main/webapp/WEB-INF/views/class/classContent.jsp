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
    /*
    #slide{
        width: 100%;
        height: 450px;
        margin-bottom: 70px;
        cursor:pointer;
    }
    #slideShow{
    	width: 800px;
    	height: 400px;
    	overflow: hidden;
    }
    */
    #slider-wrap {
	    width: 100%;
	    height: 400px;
	    position: relative;
	    overflow: hidden;
	}
	
	#slider-wrap ul#slider {
	    height: 100%;
	    position: absolute;
	    top: 0;
	    left: 0;
	}
	
	#slider-wrap ul#slider li {
	    float: left;
	    position: relative;
	    width: 600px;
	    height: 400px;
	}
	
	#slider-wrap ul#slider li>div {
	    position: absolute;
	    top: 20px;
	    left: 35px;
	}
	
	#slider-wrap ul#slider li>div h3 {
	    font-size: 36px;
	    text-transform: uppercase;
	}
	
	#slider-wrap ul#slider li>div span {
	    font-size: 21px;
	}
	
	#slider-wrap ul#slider li img {
	    display: block;
	    width: 100%;
	    height: 100%;
	}
	
	ul{
		list-style:none;
		padding-left:0;
	}
	
	li img{
		cursor:pointer;
	}
	
	/*btns*/
	.slider-btns {
	    position: absolute;
	    width: 50px;
	    height: 60px;
	    top: 50%;
	    margin-top: -25px;
	    line-height: 57px;
	    text-align: center;
	    cursor: pointer;
	    background: rgba(0, 0, 0, 0.1);
	    z-index: 100;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -khtml-user-select: none;
	    -ms-user-select: none;
	    -webkit-transition: all 0.1s ease;
	    -o-transition: all 0.1s ease;
	    transition: all 0.1s ease;
	}
	
	.slider-btns:hover {
	    background: rgba(0, 0, 0, 0.3);
	}
	
	#next {
	    right: -50px;
	    border-radius: 7px 0px 0px 7px;
	    color: #eee;
	}
	
	#previous {
	    left: -50px;
	    border-radius: 0px 7px 7px 7px;
	    color: #eee;
	}
	
	#slider-wrap.active #next {
	    right: 0px;
	}
	
	#slider-wrap.active #previous {
	    left: 0px;
	}
	
	/*bar*/
	#slider-pagination-wrap {
	    min-width: 20px;
	    margin-top: 350px;
	    margin-left: auto;
	    margin-right: auto;
	    height: 15px;
	    position: relative;
	    text-align: center;
	}
	
	#slider-pagination-wrap ul {
	    width: 100%;
	}
	
	#slider-pagination-wrap ul li {
	    margin: 0 4px;
	    display: inline-block;
	    width: 5px;
	    height: 5px;
	    border-radius: 50%;
	    background: #fff;
	    opacity: 0.5;
	    position: relative;
	    top: 0;
	}
	
	#slider-pagination-wrap ul li.active {
	    width: 12px;
	    height: 12px;
	    top: 3px;
	    opacity: 1;
	    -webkit-box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
	    box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
	}
	
	/*ANIMATION*/
	#slider-wrap ul,
	#slider-pagination-wrap ul li {
	    -webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	    -o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	    transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	}
    
    
    
    <!-- -->
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
        <div id="slide" align="center">

        </div>
        
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
    		
    		// 슬라이드 관련
			var slide = document.getElementById("slide");
    		
    		$.ajax({
    			url:"mainSlide.me",
    			success:function(data){
    				
    	       		$(document).on("click", "li>img", function(){
    	    			location.href = "detailEvent.ev?eno=" + $(this).next().val();
    	       		})
    				
    				let value = "<div id='slider-wrap'>"
    						  + "<ul id='slider'>";

					for(let i in data){
    					value += "<li>" + "<img src='" + data[i].img + "'>" + "<input type='hidden' value='" + data[i].eventNo + "'>" + "</li>";
					}
					
					value += "</ul><div class='slider-btns' id='next'><span>▶</span></div>"
						   + "<div class='slider-btns' id='previous'><span>◀</span></div>"
						   + "<div id='slider-pagination-wrap'>" + "<ul>" + "</ul>" + "</div>" + "</div>";
    				
    				slide.innerHTML = value;
    				
    				//slide-wrap
    				var slideWrapper = document.getElementById('slider-wrap');
    				//current slideIndexition
    				var slideIndex = 0;
    				//items
    				var slides = document.querySelectorAll('#slider-wrap ul li');
    				//number of slides
    				var totalSlides = slides.length;
    				//get the slide width
    				var sliderWidth = slideWrapper.clientWidth;
    				//set width of items
    				slides.forEach(function (element) {
    				    element.style.width = sliderWidth + 'px';
    				})
    				//set width to be 'x' times the number of slides
    				var slider = document.querySelector('#slider-wrap ul#slider');
    				slider.style.width = sliderWidth * totalSlides + 'px';

    				// next, prev
    				var nextBtn = document.getElementById('next');
    				var prevBtn = document.getElementById('previous');
    				nextBtn.addEventListener('click', function () {
    				    plusSlides(1);
    				});
    				prevBtn.addEventListener('click', function () {
    				    plusSlides(-1);
    				});

    				// hover
    				slideWrapper.addEventListener('mouseover', function () {
    				    this.classList.add('active');
    				    clearInterval(autoSlider);
    				});
    				slideWrapper.addEventListener('mouseleave', function () {
    				    this.classList.remove('active');
    				    autoSlider = setInterval(function () {
    				        plusSlides(1);
    				    }, 3000);
    				});


    				function plusSlides(n) {
    				    showSlides(slideIndex += n);
    				}

    				function currentSlides(n) {
    				    showSlides(slideIndex = n);
    				}

    				function showSlides(n) {
    				    slideIndex = n;
    				    if (slideIndex == -1) {
    				        slideIndex = totalSlides - 1;
    				    } else if (slideIndex === totalSlides) {
    				        slideIndex = 0;
    				    }

    				    slider.style.left = -(sliderWidth * slideIndex) + 'px';
    				    pagination();
    				}

    				//pagination
    				slides.forEach(function () {
    				    var li = document.createElement('li');
    				    document.querySelector('#slider-pagination-wrap ul').appendChild(li);
    				})

    				function pagination() {
    				    var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
    				    dots.forEach(function (element) {
    				        element.classList.remove('active');
    				    });
    				    dots[slideIndex].classList.add('active');
    				}

    				pagination();
    				var autoSlider = setInterval(function () {
    				    plusSlides(1);
    				}, 3000);
						   
    				/*
		    		var slideImg = document.getElementsByClassName("mainSlideImg");
		    		var slideTitle = document.getElementsByClassName("mainSlideTitle");
				    slideImg[0].style.display = 'inline';
				    slideTitle[0].style.display = 'block';
				    
				    window.setInterval(function(){
						for(var i=1; i<slideImg.length; i++){
					    	console.log("zz");
						}
				    }, 100000000);
		    		*/
    			}, error:function(){
    				console.log("메인페이지 슬라이드 ajax 통신 실패");
    			}
    		})
    		
    		// hot|new 관련
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