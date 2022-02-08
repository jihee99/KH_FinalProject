<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/css/cartStyle.css"rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="https://img-shop.pstatic.net/cart/static/pc/20220119/136/css/global.css?1642573329292">
<link rel="shortcut icon" href="https://ssl.pstatic.net/imgshopping/search/m/static/20191226163224/favicon.ico">
<link type="text/css" rel="stylesheet" href="https://img-shop.pstatic.net/cart/static/pc/20220119/136/css/app.css?1642573329292">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    .total{width: 1000px; font-size: 15px;}
    .total>th{background-color: lightgrey;}
    .total>td{background-color: rgba(236, 236, 236, 0.863);}
    .submit{background: rgb(147, 186, 230); color: white; width: 500px; display:block; margin: auto;}

    .shipment_info>input{width:500px; height: 30px;}

    .flex_area{display: flex;}
    .left_area{flex:3.5;}
    .right_area{flex: 1;}
    .user_info{background: lightgrey; width: 300px; height: 300px;}
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
                                <s>5,000</s>
                                <span>원</span>
                                <em class="product_detail_price">
                                    4,000
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
                        <input type="text" placeholder="도지현"><br><br>
                        <span>휴대폰 번호</span> <br>
                        <input type="text" placeholder="01075183618"><br><br>
                        <span>배송주소</span><br>
                        <input type="text" id="sample6_postcode" placeholder="우편번호">
                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 100px;"><br>
                        <input type="text" id="sample6_address" placeholder="주소"><br>
                        <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                        <br>
                        <span>베송 요청사항</span><br>
                        <select name="" id="">
                            <option value="">요청사항을 직접 입력합니다.</option>
                            <option value="">집앞에 놔주세요.</option>
                            <option value="">배전함에 넣어주세요.</option>
                            <option value="">경비실에 맡겨주세요.</option>
                        </select>
                    </div> 
                    
                    <hr>
                    <br><br>
                    <h3>쿠폰/포인트</h3>
                    <br><br>
        
                    <div class="coupon">
                        <span>쿠폰</span>
                        <input type="text" placeholder="0원"><button type="button">쿠폰변경</button>
                        <span>사용 가능한 쿠폰 0개</span>                
                    </div>
        
                    <div class="point">
                        <span>포인트</span>
                        <input type="text" placeholder="0원"><button type="button">전액사용</button>
                        <span>사용 가능한 포인트 0원</span>                
                    </div>
    
                </div>
    
                <div class="right_area">
                    <div class="user_info">
                        <h3>주문자 정보</h3> <br>
                        <span>도지현</span><br>
                        <span>010-7**8-3**8</span> <button>수정</button> <br>
                        <span>wl***@naver.com</span> <button>수정</button>
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
                    <td>5,000원</td>
                    <td>2,500원</td>
                    <td>1,000원 할인 쿠폰 적용</td>
                    <td>6,500원</td>
                </tr>
            </table>
            <br><br>
            
            <h3>결제 방식</h3>
            <button type="button">카드결제</button>
            <button type="button">무통장입금</button>
            <button type="button">네이버페이</button> <br>
            <button type="button">토스</button>
            <button type="button">카카오페이</button>
            <button type="button">휴대폰결제</button>

            <br><br>
            <button type="button" class="submit">결제하기</button>
        </main>
    </div>


    <script>
        function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    </script>
</body>
</html>