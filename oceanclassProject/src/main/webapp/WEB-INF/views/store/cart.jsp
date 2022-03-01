<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/css/store/cartStyle.css" rel="stylesheet">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="https://img-shop.pstatic.net/cart/static/pc/20220119/136/css/global.css?1642573329292">
<link rel="shortcut icon" href="https://ssl.pstatic.net/imgshopping/search/m/static/20191226163224/favicon.ico">
<link type="text/css" rel="stylesheet" href="https://img-shop.pstatic.net/cart/static/pc/20220119/136/css/app.css?1642573329292">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>

    <div class="cart">

        <main class="page_cart">
            <div class="cart_header">
                <h2 class="title on">
                    <a href="" class="link">장바구니</a>
                </h2>
                <ol class="step">
                    <li>
                        <em>장바구니</em>
                    </li>
                    <li>
                        주문/결제
                    </li>
                    <li>
                        완료
                    </li>
                </ol>
            </div>

            <ul class="cart_notice_list"> 
                <li class="txt_point">
                    <em>장바구니 상품은 최대 30일간 저장됩니다.</em>
                </li>
                <li>
                    가격, 옵션 증 정보가 변경된 경우 주문이 불가할 수 있습니다.
                </li>
            </ul>
            
            <h3 class="blind">장바구니 목록</h3>
			<form action="cartEnrollForm.st" id="cartEnroll">
			
            <table class="table">
                <caption>
                    <span class="blind"> 장바구니 내역</span>
                </caption>

                <colgroup>
                    <col class="col_1">
                    <col class="col_2">
                    <col class="col_3">
                    <col class="col_4">
                    <col class="col_5">
                </colgroup>

                <thead>
                    <tr>
                        <th scope="col" class="th">
                            <div class="checkbox">
                                <input type="checkbox" id="check_all" checked class="input">
                                <label for="check_all" class="blind">전체 상품 선택</label>
                            </div>
                        </th>
                        <th scope="col" class="th">상품정보</th>
                        <th scope="col" class="th">옵션</th>
                        <th scope="col" class="th">상품금액</th>
                        <th scope="col" class="th">배송비</th>
                    </tr>
                </thead>
				
                <tbody>
                
                <c:forEach var="p" items="${ list }">
                	<c:set var="total" value="${p.price }"/>
                    <tr class="table_row">
                        <td class="table_cell">
                            <div class="checkbox">
                                <input type="checkbox" id="bundle_checkbox" name="pno" value="${ p.productNo }" class="input">
                                <label for="bundle_checkbox" class="blind">상품선택</label>
                            </div>
                        </td>
                        <td class="table_cell">
                            <div class="product_desc_wrap">
                                <div class="product_description">
                                
                                    <span class="product_thumb">
                                        <img src="${ p.productImg0 }"  class="product_img">
                                    </span>
                                    <a href="#" class="product_merchant_name" target="_blank">${p.nickname }</a>
                                    <span class="product_name">${p.title }</span>
                                    <span class="product_price_area">
                                        <span class="product_price_sale">
                                            ${p.price }
                                            <span class="unit">원</span>
                                        </span>
                                    </span>
                                </div>
                            </div>
                            <div class="product_button_area">
                                <button type="button" class="image_button button_delete" onclick="deleteCart(${p.productNo});">
                                    <span class="blind">상품삭제</span>
                                </button>
                            </div>
                        </td>
                        <td class="table_cell valign_top">
                            <div class="product_item_wrap">
                                <div class="product_options">
	                                <c:if test="${p.optionList.get(0).getOptionNo() != 0 }">
                                  		<c:forEach var="o" items="${p.optionList}">
                                    		<div class="product_item">옵션명:${o.optionName}/가격:${o.price}/수량:${o.quantity}</div>
                                  		
                                  			<c:set var="total" value="${ total + o.price * o.quantity }"/>
                                  		</c:forEach>  
	                                    <div class="product_option_box">
	                                        <button type="button" class="button button_small button_basic">주문조건 추가/변경</button>
	                                    </div>
                                   	</c:if>
                                </div>
                            </div>
                        </td>
                        <td class="table_cell">
                            <div class="product_price">
                                <em class="product_detail_price">
                                    ${ total }
                                    <span class="unit">원</span>
                                </em>
                               	<input type="hidden" class="pdp" value="${ total }" >
                               
                                <span class="product_delivery_fee">
                                    (
                                    <!-- -->
                                    배송비 3,000원
                                    <!-- -->
                                    )
                                </span>
                                <div class="product_buttom_box">
                                    <button type="button" class="button button_blue button_small">주문하기</button>
                                </div>
                            </div>
                        </td>
                        <td class="table_cell">
                            <div class="delivery_fee">
                                    <span class="delivery_fee_price">
                                        3000
                                        <span class="unit">원</span>
                                    </span>
                            </div>
                        </td>
                    </tr>
                  </c:forEach>
                </tbody>
            </table>

            <div class="product_button_box">
                <button type="button" class="button button_basic button_small">선택상품 삭제</button>
                <button type="button" class="button button_basic button_small">선택상품 찜</button> 
            </div>
            <h3 class="blind">주문금액 정보</h3>
            <div class="order_calculator">
                <div class="product_price_detail">
                    <dl class="product_price">
                        <dt>총 상품금액</dt>
                        <dd>
                            <span class="price" id="totalPrice">
                            	
                            </span>
                            원
                        </dd>
                    </dl>
                    <dl class="product_price">
                        <dt>배송비</dt>
                        <dd>
                            <span class="price">3,000</span>
                            원
                        </dd>
                    </dl>
                </div>
                <div class="product_price_total">
                    <span class="text_mart">총 주문금액</span>
                    <span class="text_point">
                        <span class="price" id="ttt"></span>
                        원
                    </span>
                </div>
            </div>
            <div class="cart_button_box">
                <a href="#" class="link_home">쇼핑 계속하기</a>
                <button type="submit" class="button button_large button_blue" onclick="check();">주문하기</button>
            </div>
			</form>
        </main>
    </div>
    
    <script>
    
    	$(function(){
    		let totalPrice = 0;
    		$(".pdp").each(function(){
    			totalPrice += Number($(this).val());
    		})
    		
    		$("#totalPrice").html(totalPrice);
    		$("#ttt").html(totalPrice + 3000);
    		
    	})
    	
    	function deleteCart(pno){
    		
    		if(confirm("장바구니에서 삭제하시겠습니까? 옵션정보도 함께 삭제됩니다.")){
    			$.ajax({
    				url:"deleteCart.st",
    				data:{pno:pno},
    				success:function(result){
    					if(result == "ss"){
    						location.reload();
    					}else{
    						alert("장바구니 삭제에 실패했습니다.");
    					}
    				}, error:function(){
    					alert("ajax통신실패!");
    				}
    			})
    		}
    		
    	}
    	
    	
    	
    </script>
</body>
</body>
</html>