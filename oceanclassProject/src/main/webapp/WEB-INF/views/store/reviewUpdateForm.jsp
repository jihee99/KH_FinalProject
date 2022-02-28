<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
   .review_detail{width: 600px; height: auto;}
   .mini_header>img{ margin: auto; display: block;}
   .mini_header>p{margin:auto; height: 45px; background:rgb(88, 159, 230); color: white; font-weight: bold; font-size: 25px;}
   
   .product_info{width: 300px; height: 150px; display: block; margin: auto; margin-bottom: 10px; margin-top: 20px;}
   .product_title_img{float: left; width:120px; height: 130px; margin-right:15px;}
   .merchant_name, .product_option{font-size: 13px; color: rgb(112, 112, 112);}
   .product_name{font-size: 15px;}

   .input_file_btn{
       display: block;
       width: 300px;
       height: 25px;
       text-align: center;
       padding: 6px 25px;
       border: 2px dotted;
       font-size: 16px;
       color: rgb(0, 0, 0);
       cursor: pointer;
   }

   .question1, .question2{font-weight: bold; font-size: 18px; display: block; margin:auto;}
   .question1{width: 180px; margin-bottom: 10px; margin-top: 20px;}
   .question2{width: 160px; margin-top: 20px;}
   .please_star{display: block; width:125px; margin:auto; font-size: 12px; color: rgb(112, 110, 110); margin-top: 10px; margin-bottom: 20px;}

   .review_content {display:block; margin: auto;}
   .input_file_btn{margin: auto;}
   .button_area>button{width: 150px; height: 40px; border: none; font-weight: bold; font-family: 본고딕;}
   .registration{background:rgb(88, 159, 230); color: white;}
   .cancel{color: rgb(83, 83, 83);}
   #counter{display: block; margin-left: 470px;}
   
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
</style>
</head>
<body>
<div class="review_detail">


        <div class="mini_header">
            <img src="./resources/images/logo.png" width="150px"><br>
            <p align="center">리뷰수정</p>
        </div>
        <hr>
        
		<form action="reviewUpdatePage.st" class="form-area" id="form-area" method="post" enctype="multipart/form-data" >
	        <div class="star_rating_area">
	                <input type="hidden" name="memberNo" value="${ loginUser.memNo }">
	                <input type="hidden" name="productNo" value="${ sr.productNo }">
	                <input type="hidden" name="reviewNo" value="${sr.reviewNo }">
	            <span class="question1">상품은 만족하셨나요?</span>
	            <div class="star_area" align="center">
                     <div class="star-rating">
                     	<input type="hidden" id="rating" value="${sr.rating}"/>
                     	<c:choose>
                     		<c:when test="${sr.rating == 5}">
		                        <input type="radio" id="5-stars" name="rating" value="5" checked/>
		                        <label for="5-stars" class="star">&#9733;</label>                     			
		                        <input type="radio" id="4-stars" name="rating" value="4" />
		                        <label for="4-stars" class="star">&#9733;</label>
		                        <input type="radio" id="3-stars" name="rating" value="3" />
		                        <label for="3-stars" class="star">&#9733;</label>
		                        <input type="radio" id="2-stars" name="rating" value="2" />
		                        <label for="2-stars" class="star">&#9733;</label>
		                        <input type="radio" id="1-star" name="rating" value="1" />
		                        <label for="1-star" class="star">&#9733;</label>
                     		</c:when>
                     		<c:when test="${sr.rating == 4 }">
                     			<input type="radio" id="5-stars" name="rating" value="5" />
		                        <label for="5-stars" class="star">&#9733;</label>                     			
		                        <input type="radio" id="4-stars" name="rating" value="4" checked/>
		                        <label for="4-stars" class="star">&#9733;</label>
		                        <input type="radio" id="3-stars" name="rating" value="3" />
		                        <label for="3-stars" class="star">&#9733;</label>
		                        <input type="radio" id="2-stars" name="rating" value="2" />
		                        <label for="2-stars" class="star">&#9733;</label>
		                        <input type="radio" id="1-star" name="rating" value="1" />
		                        <label for="1-star" class="star">&#9733;</label>
                     		</c:when>
                     		<c:when test="${sr.rating == 3 }">
                     		    <input type="radio" id="5-stars" name="rating" value="5" />
		                        <label for="5-stars" class="star">&#9733;</label>                     			
		                        <input type="radio" id="4-stars" name="rating" value="4" />
		                        <label for="4-stars" class="star">&#9733;</label>
		                        <input type="radio" id="3-stars" name="rating" value="3" checked/>
		                        <label for="3-stars" class="star">&#9733;</label>
		                        <input type="radio" id="2-stars" name="rating" value="2" />
		                        <label for="2-stars" class="star">&#9733;</label>
		                        <input type="radio" id="1-star" name="rating" value="1" />
		                        <label for="1-star" class="star">&#9733;</label>
                     		</c:when>
                     		<c:when test="${sr.rating == 2 }">
                     		    <input type="radio" id="5-stars" name="rating" value="5" />
		                        <label for="5-stars" class="star">&#9733;</label>                     			
		                        <input type="radio" id="4-stars" name="rating" value="4" />
		                        <label for="4-stars" class="star">&#9733;</label>
		                        <input type="radio" id="3-stars" name="rating" value="3" />
		                        <label for="3-stars" class="star">&#9733;</label>
		                        <input type="radio" id="2-stars" name="rating" value="2" checked/>
		                        <label for="2-stars" class="star">&#9733;</label>
		                        <input type="radio" id="1-star" name="rating" value="1" />
		                        <label for="1-star" class="star">&#9733;</label>
                     		</c:when>
                     		<c:when test="${sr.rating == 1 }">
                     		    <input type="radio" id="5-stars" name="rating" value="5" />
		                        <label for="5-stars" class="star">&#9733;</label>                     			
		                        <input type="radio" id="4-stars" name="rating" value="4" />
		                        <label for="4-stars" class="star">&#9733;</label>
		                        <input type="radio" id="3-stars" name="rating" value="3" />
		                        <label for="3-stars" class="star">&#9733;</label>
		                        <input type="radio" id="2-stars" name="rating" value="2" />
		                        <label for="2-stars" class="star">&#9733;</label>
		                        <input type="radio" id="1-star" name="rating" value="1" checked/>
		                        <label for="1-star" class="star">&#9733;</label>
                     		</c:when>
                     	</c:choose>
                      </div>
	            </div>
	            <span class="please_star">별점을 입력해주세요.</span>
	        </div>
	        <hr>
	
	        <div class="content_area">
	            <span class="question2">상품은 어떠셨나요?</span><br>
	            <textarea name="content" id="reviewContent" cols="60" rows="10" class="review_content" placeholder="상품에 대한 솔직한 평가를 작성해주세요. (최소10자)" maxlength="500">${sr.content }</textarea>
	            <span id="counter">0/1000</span>
	        </div>
	        <br><br>
			
	        <div class="file_registration">
	            <label for="input_file" class="input_file_btn"><i class="fas fa-camera"></i> 사진/동영상 첨부하기</label>
	            <input type="file" id="input_file" name="reupfile" style="display: none;" onchange="insertThumbnail(this);" >
	            
	        </div>
	        
	        <br>
	        <div class="thumbnailArea" align="center"> 
	           <img src="${sr.img }" id="thumbnailArea" style="width:100px; height:100px;">
	        </div>
	        <br>
	        <div class="button_area" align="center">
	            <button type="button" class="cancel" onclick="window.close();">취소</button>
	            <button type="button" class="registration" onclick="updateReviewFormCheck();">수정완료</button>
	        </div>
	     </form>

    </div>
    
    <script>
    
    // 유효성 검사
    function updateReviewFormCheck(){
    	
		var file = document.getElementById("input_file").value;
		
        var star = document.querySelectorAll('input[type="radio"]:checked');
        
		var content = document.getElementById("reviewContent").value;
		
		var pathpoint = file.lastIndexOf('.');
		var filepoint = file.substring(pathpoint+1, file.length);
		var filetype = filepoint.toLowerCase();
    	
		
		if(content.length < 5 ){
			alert("후기 내용은 5글자 이상 입력해야 합니다.");
		} else if(star.length == 0){
			alert("별점을 입력해주세요!");
		} else if(file == ""){
			document.getElementById("form-area").submit();
			alert("리뷰 수정 완료!");
		} else if(filetype != 'jpg' && filetype != 'gif' && filetype != 'png' && filetype != 'jpeg' && filetype != 'bmp'){
			alert("후기 내용에는 사진 파일만 첨부할 수 있습니다.");
		} else if(filetype == 'bmp'){
			var q = confirm('BMP 파일은 웹 상에서 사용하기엔 적절한 이미지 포맷이 아닙니다.\n그래도 첨부 하시겠습니까?');
	        if(q == true){
	        	return true;
	        } else {
	        	return false;
	        }
		}  else {
			document.getElementById("form-area").submit();
			alert("리뷰 수정 완료!");
			
		}
		
	}
    
    function counter(){
    	    document.getElementById("reviewContent").keyup(function (){
		    var content = document.getElementById("reviewContent").value;
		    document.getElementById("counter").html("("+content.length+" / 최대 200자)");
	
		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        document.getElementById("counter").html("(200 / 최대 200자)");
		    }
		}); 
    }
	
	function insertThumbnail(inputFile){
		if(inputFile.files.length == 1){
			// 파일을 읽어들일 객체
			const reader = new FileReader();
			// 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url 부여
			reader.readAsDataURL(inputFile.files[0]);
			// 파일 읽어들이기가 완료되었을때 실행할 함수 정의
			reader.onload = function(e) {
				// e.target.result -> 읽어들인 파일의 고유한 url 정의되어있음
				document.getElementById("thumbnailArea").src = e.target.result;
				document.getElementById("thumbnailArea").style.display = 'block';
			}
		} else { // 선택되었던 파일 취소
			document.getElementById("thumbnailArea").src = null;
			document.getElementById("thumbnailArea").style.display = 'none';
		}
	}
	

    </script>
</body>
</html>