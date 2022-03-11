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
	
	\
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
	   
	
	.items {
		width: 100%;
		margin-top: 50px;
	}
	
	.items_title {
		font-size: 20px;
	}
	
	.item {
		width: 220px;
		display: inline-block;
		box-sizing: border-box;
		margin: 30px;
	    margin-bottom: 30px;
	}
	
	.item>span {
		font-size: 12px;
	}
	
	.item * {
		cursor: pointer;
	}
	
	.thumbnail {
		width: 100%;
		height: 200px;
	}
	
	.more_btn {
		text-decoration: none;
		color: rgb(172, 171, 171);
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div id="outer">
        <div id="slide" align="center">
			<!-- 슬라이드 이미지 들어갈 영역 -->
        </div>

		<input type="hidden" id="memNo" value="${ loginUser.memNo }">

		<div class="items">
			<div class="items_title">
				<b>· HOT ITEM</b>
				<!--띄어쓰기-->
				<a href="storeSearchList.st" class="more_btn">+more</a>
			</div>

			<c:forEach var="h" items="${ hlist }" end="3">
				<div class="item" >
					<img src="${ h.productImg0 }" class="thumbnail"
						onclick="goDetail(${h.productNo});">
					<div style="font-size: 13px;">
						<b>${ h.nickname }</b>
					</div>
					<div class="title" style="height:50px;" onclick="goDetail(${h.productNo});">${ h.title }</div>
					<div id="likeArea">
						<c:choose>
							<c:when test="${ h.likeCk == 1 }">
								<img src="resources/images/heart2.png" width="20" height="20"
									id="likeImg" onclick="likeCk(${h.productNo}, this);">
							</c:when>
							<c:otherwise>
								<img src="resources/images/heart1.png" width="20" height="20"
									id="likeImg" onclick="likeCk(${h.productNo}, this);">
							</c:otherwise>
						</c:choose>
						<span id="likeCount">${ h.like}</span>
					</div>
					<div>
						<b> <span>${ h.price }</span>원
						</b>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<script>	
				
		window.onload = function(){
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
		}
		
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


		<div class="items">
			<div class="items_title">
				<b>· NEW ITEM</b>
				<!--띄어쓰기-->
				<a href="storeSearchList.st" class="more_btn">+more</a>
			</div>

			<c:forEach var="n" items="${ nlist }" end="3">
				<div class="item">
					<img src="${ n.productImg0 }" class="thumbnail"
						onclick="goDetail(${n.productNo});">
					<div style="font-size: 13px;">
						<b>${ n.memberNo }</b>
					</div>
					<div class="title" style="height:50px;" onclick="goDetail(${n.productNo});">${ n.title }</div>
					<div id="likeArea">
						<c:choose>
							<c:when test="${ n.likeCk == 1 }">
								<img src="resources/images/heart2.png" width="20" height="20"
									id="likeImg" onclick="likeCk(${n.productNo}, this);">
							</c:when>
							<c:otherwise>
								<img src="resources/images/heart1.png" width="20" height="20"
									id="likeImg" onclick="likeCk(${n.productNo}, this);">
							</c:otherwise>
						</c:choose>
						<span id="likeCount">${ n.like}</span>
					</div>
					<div>
						<b> <span>${ n.price }</span>원
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