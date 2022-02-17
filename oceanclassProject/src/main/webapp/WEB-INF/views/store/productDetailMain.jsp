<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
.innerOuter{
    margin: auto;
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
    position: fixed;
    top: 53px;
    right: 350px;
    background:rgba(212, 212, 212, 0.493);
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
</style>
</head>
<body>
    <div class="innerOuter">
    	<jsp:include page="../common/header.jsp" />
        
        <hr>
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
                <ul> <!--클릭하면 색 바뀌게-->
                    <li class="menu_1"><a href="">상품소개</a></li>
                    <li><a href="">상품리뷰(30)</a></li>
                    <li><a href="">상품문의</a></li>
                    <li><a href="">배송일정</a></li>
                    <li><a href="">환불정책</a></li>
                </ul>
            </div>
            <hr>
            <br><br>

            <div class="product_detail_image">
                <img src="${ p.productImg1 }">
                
                <p>상품소개글 상품소개글</p>
            </div>
            
        </div>
    

        <div class="quick_menu">
            <div class="product_discription">
                <span class="product_merchant_name">${ p.memberNo }</span> <br>
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
                <option value="" selected>옵션선택</option>
            	<c:forEach var="o" items="${ list }">
					<option value="${ o.optionNo }" >${ o.optionName }
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
													 ${ o.price }</option>                
                </c:forEach>
            </select>
            <br><br>
            <div class="button_area" align="center">
                <button type="button" class="in_cart">장바구니</button>
                <button type="button" class="heart"><i></i>찜</button> <br>
                <button type="button" class="buy_now">바로구매</button>
            </div>
        </div>

    </div>
    
    <script>
    function scroll_follow( id )
    {
      $(window).scroll(function( )  //스크롤이 움직일때마다 이벤트 발생
      { 
          var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
          $( id ).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
       });
    }
     scroll_follow( ".quick_menu" );
    </script>


</body>
</html>