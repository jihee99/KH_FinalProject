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

                <tbody>
                    <tr class="table_row">
                        <td class="table_cell"></td>
                        <td class="table_cell">
                            <div class="product_desc_wrap">
                                <div class="product_description">
                                    <span class="product_thumb">
                                        <img src="${ p.productImg0 }"  class="product_img">
                                    </span>
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
                                    <div class="product_item">선택1 : 빨간색 /  선택2 : XL / 1개</div>
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
                        <td rowspan="2" class="table_cell">
                            <div class="delivery_fee">
                                <div class="delivery_fee_area">
                                    <span class="delivery_fee_price">
                                        3000
                                        <span class="unit">원</span>
                                    </span>
                                    <button type="button" class="image_button button_tooltip">
                                        <span class="blind">배송비 안내 자세히 보기</span>
                                    </button>
                                    <div class="tooltip_box">
                                        <div class="tooltip">
                                            <button type="button" class="button_close">
                                                <span class="blind">레이어 닫기</span>
                                            </button>
                                            <strong class="tooltip_tit">구매금액별 배송비</strong>
                                            <div class="tooltip_desc">
                                                <p>
                                                    30,000원 미만 구매 시
                                                    <em>3,000원</em>
                                                    <br>
                                                    30,000원 이상 구매 시 무료
                                                    <em></em>
                                                    <br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="delivery_fee_text">(3만원 이상 구매 시 배송비 무료)</div>
                                </div>
                            </div>
                        </td>
                        <td class="table_cell">
                            <div class="product_price">
                                <em class="product_detail_price">
                                    (-)1000
                                    <span class="unit">원</span>
                                </em>
                            </div>
                        </td>
                        <td class="table_cell">
                            <div class="product_price">
                                <s>50,000</s>
                                <span>원</span>
                                <em class="product_detail_price">
                                    ${ p.price }
                                    <span class="unit">원</span>
                                </em>
                            </div>
                        </td>
                    </tr>

                    <tr class="table_row">
                        <td class="table_cell"></td>
                        <td class="table_cell">
                            <div class="product_desc_wrap">
                                <div class="product_description">
                                    <span class="product_thumb">
                                        <img src=""  class="product_img">
                                    </span>
                                    <a href="#" class="product_merchant_name" target="_blank">판매처이름</a> <br>
                                    <span class="product_name">상품명 상품명 상품명</span>
                                    <span class="product_price_area">
                                        <span class="product_price_sale">
                                            9,500
                                            <span class="unit">원</span>
                                        </span>
                                    </span>
                                </div>
                            </div>
                        </td>
                        <td class="table_cell valign_top">
                            <div class="product_item_wrap">
                                <div class="product_options">
                                    <div class="product_item">선택1 : 빨간색 /  선택2 : XL / 1개</div>
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
                            <div class="product_price">
                                <em class="product_detail_price">
                                    (-)1000
                                    <span class="unit">원</span>
                                </em>
                            </div>
                        </td>
                        <td class="table_cell">
                            <div class="product_price">
                                <s>5,000</s>
                                <span>원</span>
                                <em class="product_detail_price">
                                    4,000
                                    <span class="unit">원</span>
                                </em>
                            </div>
                        </td>
                    </tr>
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
                        <input type="text" id="address_kakao" placeholder="주소">
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
                        <span>${ m.phone }</span> <button>수정</button> <br>
                        <hr>
                    </div>
                </div>
            </div>

            <h3>결제 금액</h3>
            <span>도서 산간지역은 추가 배송료가 적용될 수 있습니다.</span>

            <table class="total">
                <tr>
                    <th>총 상품 금액</th>
                    <th>배송비</th>
                    <th>할인 금액</th>
                    <th>최종 가격</th>
                </tr>
                <tr>
                    <th>5,000원</th>
                    <th>2,500원</th>
                    <th>1,000원 할인 쿠폰 적용</th>
                    <th>6,500원</th>
                </tr>
            </table>
            <br><br>
            
            <h3>결제 방식</h3> <!-- table  -->
            <table class="total">
                <tr>
                    <th><button type="button" class="payBtn">카드결제</button></th>
                    <th><button type="button" class="payBtn">무통장입금</button></th>
                    <th><button type="button" class="payBtn" onclick="naver();">네이버페이</button></th>
                </tr>
                <tr>
                    <th><button type="button" class="payBtn" onclick="toss();">토스</button></th>
                    
                    <th>
                    	<form action="post" action="/kakaoPay">
                    	<img src="./resources/images/store/kakaoPay.png" onclick="kakaoPay();">
                    	</form>
                    </th>
                    <th><button type="button" class="payBtn">휴대폰결제</button></th>
                </tr>
            </table>

            <br><br>
            <button type="button" class="submit">결제하기</button>
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
	 
	 function uncomma(str) {
	     str = String(str);
	     return str.replace(/[^\d]+/g, '');
	 }
	</script>
	
	<script>
	
	
	var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
	var tossPayments = TossPayments(clientKey)
	
	function toss(){
	  tossPayments.requestPayment('카드', {
		  amount: '15000',
		  orderId: 'UprQtrHrBCwVBIutU40bD',
		  orderName: '토마토',
		  customerName: '도지현',
		  successUrl: 'http://localhost:8080/success',
		  failUrl: 'http://localhost:8080/fail',
		})
		
		
	}
	
	    var oPay = Naver.Pay.create({
	        "mode" : "production", // development or production
	        "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
	    });

	function naver(){
	  //직접 만든 네이버페이 결제 버튼에 click 이벤트를 할당하세요.
	  var elNaverPayBtn = document.getElementById("naverPayBtn");
	  elNaverPayBtn.addEventListener("click", function() {
	
	  oPay.open({
	        "merchantUserKey": "가맹점 사용자 식별키",
	        "merchantPayKey": "가맹점 주문 번호",
	        "productName": "상품명을 입력하세요",
	        "totalPayAmount": "1000",
	        "taxScopeAmount": "1000",
	        "taxExScopeAmount": "0",
	        "returnUrl": "사용자 결제 완료 후 결제 결과를 받을 URL"
	      });
	 });
		
	}
	
	function kakaoPay(){
		location.href = "https://kapi.kakao.com";
	}


	</script>
</body>
</html>