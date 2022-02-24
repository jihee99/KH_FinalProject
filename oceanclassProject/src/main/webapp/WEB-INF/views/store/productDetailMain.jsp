<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
.innerOuter{
    margin: auto;
    height:auto;
    font-family:tahoma, 나눔고딕, "Nanum Gothic", 맑은고딕, "Malgun Gothic", 돋움, dotum, helvetica, "Apple SD Gothic Neo", sans-serif;
}
.product_info{
    float: left;
}
.product_title_image{
    width: 700px;
    height: 400px;
}
.menu_bar{
    width: 100%;
    height: 50px;
}
.menu_bar>ul{
    width:100%; 
    height:100%; 
    list-style-type: none;
    margin: auto; 
    padding:0;
}
.menu_bar>ul>li{
    float:left; 
    width:20%; 
    height:100%; 
    line-height: 50px; 
    text-align:center;
}
.menu_bar>ul>li a{
    text-decoration: none;
    color: rgb(98, 97, 97);
    font-size: 16px;
    font-weight: bold;
    font-family: 본고딕;
}
.product_detail_image{
    width: 700px;
    height: auto;
    margin: auto;
}
.quick_menu{
    width: 350px;
    height: 400px;
    position: sticky;
    overflow:auto;
    top: 53px;
    right: 350px;
    background:rgba(212, 212, 212, 0.493);
    z-index:10;
}
.product_discription{
    width:200px;
    height: 70px;
    margin: 20px 20px;
}

.product_merchant_name{font-size: 15px;}
.product_name{font-size: 20px;}
.price_area{float: right; height: 120px; margin-right: 10px;}
.discount_persent{font-size: 23px; font-family: sans-serif; font-weight: bold; color: steelblue;}
.price {font-size: 20px;}
.price_area>s{font-size:15px; color: rgb(146, 144, 144);position: absolute; right: 15px;}
.in_cart, .heart {
    width: 150px;
    height: 40px;
    margin-bottom: 5px;
}
.buy_now{width:305px; height: 40px; background: #4b81c8d8; color: white;}
.button_area{position: absolute; left: 22px;}
.product_title_image>img{ width:100%; height:100%; object-fit: cover;}
.product_detail_image>img{width: 100%; object-fit: cover;}
#productOption option{ font-size:15px;}

.menu_bar input[type=radio] {
	display: none;
}
.tab {
  overflow: hidden;
}
.tab label {
    font-size: 18px;
    cursor: pointer;
    float: left;
    width: 20%;
    height:100%;
    text-align: center;
    padding: 10px 0;
    text-transform: uppercase;
    font-weight: bold;
    letter-spacing: 2px;
    user-select: none;
    -webkit-user-select: none;
}
#tab-1:checked ~ .tab label:nth-child(1),
#tab-2:checked ~ .tab label:nth-child(2),
#tab-3:checked ~ .tab label:nth-child(3),
#tab-4:checked ~ .tab label:nth-child(4) {
	background-color: #4b81c8d8;
	color:white;
    box-shadow: none;
}
.content > div {
	display: none;
}
#tab-1:checked ~ .content div:nth-child(1),
#tab-2:checked ~ .content div:nth-child(2),
#tab-3:checked ~ .content div:nth-child(3),
#tab-4:checked ~ .content div:nth-child(4)  {
	display: block;
}

.content > div{
   padding: 30px;
   line-height: 1.5;
   font-size: 17px;
}
</style>
</head>
<body>
    	<jsp:include page="../common/header.jsp" />
    	
    <div class="innerOuter">
    	
    	<input type="hidden" id="memNo" value="${ loginUser.memNo }">
    	<input type="hidden" id="pno" value="${ p.productNo }">
        
        <br><br>
        <div class="product_info">
            <div class="product_title_image">
                <img src="${ p.productImg0 }">
                <form action="post" method="">
                <input type="hidden" name="productNo" value="${ p.productNo }">
                </form>
            </div>
            <br>
            <div class="menu_bar">
		          <input type="radio" id="tab-1" name="show" checked/>
				  <input type="radio" id="tab-2" name="show" />
				  <input type="radio" id="tab-3" name="show" />
				  <input type="radio" id="tab-4" name="show" />
				  <div class="tab">
					  <label for="tab-1">상품소개</label>
					  <label for="tab-2">상품리뷰</label>
					  <label for="tab-3">상품문의</label>
					  <label for="tab-4">배송일정</label>
					  <label for="tab-4">환불정책</label>
				  </div>
	            <hr>
	            <br>
	            <div class="content">
					<!-- 1 -->
					<div class="content-dis">
			            <div class="product_detail_image">
			                <img src="${ p.productImg1 }">
			                
			                <p>상품소개글 상품소개글</p>
			            </div>			
					</div>
					
					<!-- 2 -->
					<div class="content-dis">
						<jsp:include page="productDetailReview.jsp"/>
		            </div>
		            
		            <!-- 3 -->
		            
		            <div class="content-dis">
		            	<jsp:include page="productDetailQna.jsp"/>
		            </div>
				</div>
            
            </div>
            
        </div>
    </div>
    
        <div class="quick_menu">
            <div class="product_discription">
                <span class="product_merchant_name">${ p.nickname }</span> <br>
                <span style="display:block; width:300px" class="product_name">${ p.title }</span> <br>
                <span class="delivery_fee">무료배송</span>
            </div>
            <div class="price_area">
                <s>${ p.price } 원</s> <br>
                <span class="discount_persent">30% </span>
                <span class="price">${ p.price } 원</span>
            </div>
            <br><br>
            <select name="productOption" id="productOption" style="width: 305px; height: 40px; margin-left:22px;">
                <option value="0" selected>옵션선택</option>
            	<c:forEach var="o" items="${ list }">
					<option value="${ o.optionNo }" >${ o.optionName }
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
													 ${ o.price }</option>                
                </c:forEach>
            </select>
            <br><br>
            <div class="button_area" align="center">
                <button type="button" class="in_cart" onclick="inCart(${p.productNo});">장바구니</button>
                <button type="button" class="heart" onclick="likeCk(${p.productNo});">
                	<div id="likeArea">
		                <c:choose>
                        	<c:when test="${ p.likeCk == 1 }">
                        		<img src="resources/images/heart2.png" width="20" height="20" id="likeImg">
							</c:when>
							<c:otherwise>
                        		<img src="resources/images/heart1.png" width="20" height="20" id="likeImg">
							</c:otherwise>
						</c:choose>   
		                <span id="likeCount">${ p.like }</span>
	                </div>
                </button> <br>
                <button type="button" class="buy_now">바로구매</button>
            </div>
        </div>
    
    <script>
    
	function likeCk(pno){
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
	                        	document.getElementById("likeImg").src = "resources/images/heart2.png";
	                        	document.getElementById("likeCount").innerHTML = likeResult.likeCount;
	                            alert("찜 목록에 추가 되었습니다!");
	                        } else if(likeResult.message == 'dd'){
	                        	document.getElementById("likeImg").src = "resources/images/heart1.png";
	                        	document.getElementById("likeCount").innerHTML = likeResult.likeCount;
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
	
	
	function inCart(pno){
		 
		 if(document.getElementById("memNo").value == ""){
             alert("로그인 후 이용 가능한 서비스 입니다.");
         } else{
        	 $.ajax({
        		 url:"inCart.st",
        		 data:{
        			 memberNo:document.getElementById("memNo").value,
        			 productNo:pno,
        			 optionNo:$("#productOption option:selected").val()
        		 }, success:function(result){
        			 if(result == "ss"){
        				 confirm("장바구니에 추가 되었습니다! 장바구니로 이동하시겠습니까?");
        				 location.replace('cart.st');
        			 }else if(result == "dd"){
        				 alert("수량이 추가되었습니다!");
        			 }
        		 },error: function(){
        			 console.log("통신실패!");
        		 }
        	 })
         }
	}
	
	
	
	
    </script>


</body>
</html>