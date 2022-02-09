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
                    <tr class="table_row">
                        <td class="table_cell">
                            <div class="checkbox">
                                <input type="checkbox" id="bundle_checkbox" checked class="input">
                                <label for="bundle_checkbox" class="blind">상품선택</label>
                            </div>
                        </td>
                        <td class="table_cell">
                            <div class="product_desc_wrap">
                                <div class="product_description">
                                    <span class="product_thumb">
                                        <img src=""  class="product_img">
                                    </span>
                                    <a href="#" class="product_merchant_name" target="_blank">판매처이름</a>
                                    <span class="product_name">상품명 상품명 상품명</span>
                                    <span class="product_price_area">
                                        <span class="product_price_sale">
                                            9,500
                                            <span class="unit">원</span>
                                        </span>
                                        <s class="product_price_total">
                                            <span class="blind">할인 미적용 가격</span>
                                            12,800
                                        </s>
                                    </span>
                                </div>
                            </div>
                            <div class="product_button_area">
                                <button type="button" class="image_button button_delete">
                                    <span class="blind">상품삭제</span>
                                </button>
                            </div>
                        </td>
                        <td class="table_cell valign_top">
                            <div class="product_item_wrap">
                                <div class="product_options">
                                    <div class="product_item">선택1 : 빨간색 /  선택2 : XL / 1개</div>
                                    <div class="product_option_box">
                                        <button type="button" class="button button_small button_basic">주문조건 추가/변경</button>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="table_cell">
                            <div class="product_price">
                                <em class="product_detail_price">
                                    9,500
                                    <span class="unit">원</span>
                                </em>
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
                    </tr>
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
                            <span class="price">25,600</span>
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
                    <dl class="product_price">
                        <dt>할인예상금액</dt>
                        <dd class="discount">
                            <span class="price">5,300</span>
                            원
                        </dd>
                    </dl>
                </div>
                <div class="product_price_total">
                    <span class="text_mart">총 주문금액</span>
                    <span class="text_point">
                        <span class="price">23,300</span>
                        원
                    </span>
                </div>
            </div>
            <div class="cart_button_box">
                <a href="#" class="link_home">쇼핑 계속하기</a>
                <button type="button" class="button button_large button_blue">주문하기</button>
            </div>

        </main>
    </div>
</body>
</body>
</html>