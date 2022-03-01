<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/css/store/cartStyle.css"rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="https://img-shop.pstatic.net/cart/static/pc/20220119/136/css/global.css?1642573329292">
<link type="text/css" rel="stylesheet" href="https://img-shop.pstatic.net/cart/static/pc/20220119/136/css/app.css?1642573329292">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://js.tosspayments.com/v1"></script>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- 아임포트 -->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<style>
.total{width: 1000px; font-size: 15px;}
.total>th{background-color: lightgrey;}
.total>td{background-color: rgba(236, 236, 236, 0.863);}
.submit{background: rgb(107, 171, 213); color: white; width: 500px; display:block; margin: auto; height:50px; font-size:20px; border-radius:5px;}

.shipment_info>input{width:500px; height: 30px;}

.flex_area{display: flex;}
.left_area{flex:3.5;font-size:15px;}
.right_area{flex: 1;}
.user_info{background: lightgrey; width: 300px; height: 300px;}

.payBtn{width:300px; height:40px; font-size:15px; border:3px solid #6babd5; border-radius:10px; margin:10px; mouse:cursor; }
</style>
</head>
<body>
    <div class="cart">
        <main class="page_cart">
            <div class="cart_header">
                <h2 class="title on">
                    <a href="" class="link">주문/결제</a>
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

            <br><br><br>
            
            <h3 class="blind">장바구니 목록</h3>

            <table class="table">

                <colgroup>
                    <col class="col_1">
                    <col class="col_2">
                    <col class="col_3">
                    <col class="col_4">
                    <col class="col_5">
                    <col class="col_5">
                    <col class="col_5">
                </colgroup>

                <thead>
                    <tr>
                        <th scope="col" class="th"></th>
                        <th scope="col" class="th">상품정보</th>
                        <th scope="col" class="th">선택옵션</th>
                        <th scope="col" class="th">수량</th>
                        <th scope="col" class="th">배송비</th>
                        <th scope="col" class="th">할인</th>
                        <th scope="col" class="th">상품금액</th>
                    </tr>
                </thead>

                <c:set var="pName" value="${list.get(0).title}"/>
                <input type="hidden" value="${pName}" id="pName">
                
                <tbody>
     <form action="insertPay.st">
	                 <c:forEach var="p" items="${list}">
	                 <c:set var="total" value="${p.price }"/>
	                    <tr class="table_row">
	                        <td class="table_cell"></td>
	                        <td class="table_cell">
	                            <div class="product_desc_wrap">
	                                <div class="product_description">
	                                    <span class="product_thumb">
	                                        <img src="${ p.productImg0 }"  class="product_img">
	                                    </span>
	                                    <input type="hidden" value="${p.productNo}" name="productNo">
	                                    <a href="#" class="product_merchant_name" target="_blank">${ p.nickname }</a> <br>
	                                    <span class="product_name" id="productName">${p.title }</span>
	                                    
	                                    <span class="product_price_area">
	                                        <span class="product_price_sale" id="price">
	                                            ${ p.price }
	                                            <span class="unit">원</span>
	                                        </span>
	                                    </span>
	                                </div>
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
	                                    1
	                                    <span class="unit">개</span>
	                                </em>
	                            </div>
	                        </td>
	                        <td class="table_cell">
	                            <div class="delivery_fee">
	                                <div class="delivery_fee_area">
	                                    <span class="delivery_fee_price">
	                                        3000
	                                        <span class="unit">원</span>
	                                    </span>
	                                </div>
	                            </div>
	                        </td>
	                        <td class="table_cell">
	                            <div class="product_price">
	                                <em class="product_detail_price">
	                                    0
	                                    <span class="unit">원</span>
	                                </em>
	                            </div>
	                        </td>
	                        <td class="table_cell">
	                            <div class="product_price">
	                                <em class="product_detail_price">
	                                    ${ total }
	                                    <span class="unit">원</span>
	                                </em>
	                               	<input type="hidden" class="pdp" value="${ total }" >
	                            </div>
	                        </td>
	                    </tr>
	                 </c:forEach>
	                </tbody>
	            </table>
	
	            <br>
	            <div class="flex_area">
	
	                <div class="left_area">
	                    <h3>배송정보</h3>
	                    <br>
	                    <div class="shipment_info">
	                        <span>받으시는 분</span> <br>
	                        <input type="text" placeholder="${m.userName }"><br><br>
	                        <span>휴대폰 번호</span> <br>
	                        <input type="text" placeholder="${m.phone }"><br><br>
	                        <span>배송주소</span><br>
	                        <input type="text" id="address_kakao" placeholder="주소" name="address">
	                        <input type="button" id="address" value="주소 찾기" style="width: 100px;"><br>
	                        <input type="text" id="detail" name="address_detail" placeholder="상세주소">
	                        <br>
	                        <span>베송 요청사항</span><br>
	                        <select name="" id="">
	                            <option value="">집앞에 놔주세요.</option>
	                            <option value="">배전함에 넣어주세요.</option>
	                            <option value="">경비실에 맡겨주세요.</option>
	                            <option value="">요청사항을 직접 입력합니다.</option>
	                        </select>
	                    </div> 
	                    
	                    <hr>
	                    <br><br>
	                    <h3>쿠폰/포인트</h3>
	                    <br><br>
	        
	                    <div class="coupon">
	                        <span>쿠폰</span>
	                        <select>
	                        	<option></option>
	                        	<option></option>
	                        </select>
	                        <button type="button">쿠폰사용</button>
	                        <span>사용 가능한 쿠폰 0개</span>                
	                    </div>
	        
	                    <div class="point">
	                        <span>포인트</span>
	                        <input type="text" placeholder="0" step="1000" onkeyup="inputNumberFormat(this)">원<button type="button">전액사용</button>
	                        <span>사용 가능한 포인트 0원</span>                
	                    </div>
	    
	                </div>
	    
	                <div class="right_area">
	                    <div class="user_info">
	                        <h3>주문자 정보</h3> <br>
	                        <span id="customerName">${ m.userName }</span><br>
	                        <span id="phoneNo">${ m.phone }</span> <button>수정</button> <br>
	                        <hr>
	                    </div>
	                </div>
	            </div>
	
	            <h3>결제 금액</h3>
	            <span>도서 산간지역은 추가 배송료가 적용될 수 있습니다.</span>
	
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
	                        <span class="price" id="ttt" name="payAmount"></span>
	                        원
	                    </span>
	                </div>
	            </div>
	            <br><br>
            <button type="button" class="submit" onclick="iamport(); click();" >결제하기</button>
            <br><br>
      </form>
        </main>
    </div>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	window.onload = function(){
	    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
	                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	
	// 1000단위마다 콤마 찍기
	 function inputNumberFormat(obj) {
	     obj.value = comma(uncomma(obj.value));
	 }
	 
	 function comma(str) {
	     str = String(str);
	     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	 }
	 
	 function iamport(){
		 
		 var title = document.getElementById("pName").value;
		 var amount = ${total+3000};
		 var name = document.getElementById("customerName").value;
		 var phone = document.getElementById("phoneNo").value;
		 var address = document.getElementById("address_kakao").value;
		 
			//가맹점 식별코드
			IMP.init('iamport');
			IMP.request_pay({
			    pg : 'kakao',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : title , //결제창에서 보여질 이름
			    amount : 100, //실제 결제되는 가격
			    buyer_email : '',
			    buyer_name : name,
			    buyer_tel : phone,
			    buyer_addr : address,
			    buyer_postcode : ''
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        location.href="payCompletePage.st";
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}

	 function uncomma(str) {
	     str = String(str);
	     return str.replace(/[^\d]+/g, '');
	 }
	 
 	$(function(){
		let totalPrice = 0;
		$(".pdp").each(function(){
			totalPrice += Number($(this).val());
		})
		
		console.log(totalPrice);
		$("#totalPrice").html(totalPrice);
		$("#ttt").html(totalPrice + 3000);
		
	})
	
	function click(){

        document.getElementById("insertPay").submit();
 	}
	</script>
</body>
</html>