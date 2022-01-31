<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="./resources/css/store/instructorStoreOrderDetail.css">
</head>
<body>

    <!-- 강사 사이드 네비바 연결하기 -->

    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>주문 내역서</b>
        </div>
        <div class="head_2">
            <b>주문 상세 정보</b>
            <hr>
        </div>
        <div class="content">
            <form action="">
                <div class="content_1">
                    <b>주문 정보</b>
                    <table class="table table-light table-sm">
                        <tr>
                            <th width="200">주문번호</th>
                            <td width="250">SO2312892</td>
                            <th width="200" rowspan="2">주소</th>
                            <td width="250" rowspan="2">서울특별시 강남구 테헤란로14길 6</td>
                        </tr>
                        <tr>
                            <th>주문일자</th>
                            <td>2022-01-31 13:22:42</td>
                        </tr>
                        <tr>
                            <th>주문자</th>
                            <td>손지희</td>
                            <th>전화번호</th>
                            <td>010-7286-3153</td>
                        </tr>
                        <tr>
                            <th>결제방법</th>
                            <td>[무통장 | 카드]</td>
                            <th>주문상태</th>
                            <td>
                                <select name="" id="">
                                    <option value="">결제완료</option>
                                    <option value="">상품준비</option>
                                    <option value="">배송시작</option>
                                    <option value="">배송중</option>
                                    <option value="" style="color: green;">배송완료</option>
                                    <option value="">주문취소</option>
                                    <option value="" style="color: red;">취소완료</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="content_2">
                    <b>결제 정보</b>
                    <table class="table table-light table-sm">
                        <tr>
                            <th width="200">포인트/쿠폰 사용금액</th>
                            <td width="250">0</td>
                            <th width="200">총 결제금액</th>
                            <td width="250">50000</td>
                        </tr>
                    </table>
                </div>

                <div class="content_3">
                    <b>상품 정보</b>
                    <table class="table table-light table-sm">
                        <thead>
                            <tr>
                                <th width="130">상품번호</th>
                                <th width="80">카테고리</th>
                                <th width="230">상품명</th>
                                <th width="100">상품가격</th>
                                <th width="80">수량</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>S1239</td>
                                <td>DIY Kit</td>
                                <td>펀치 니들 자수 패키지 DIY 취미세트</td>
                                <td>32000</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>S1611</td>
                                <td>OC 에디션</td>
                                <td>OC 2022 하루일기 다이어리</td>
                                <td>18000</td>
                                <td>1</td>
                            </tr>
                        </tbody>
                    </table>
                </div> 
                <div align="center">
                    <button id="submitBtn" class="btn btn-lg" type="submit">저장하기</button>
                    <button id="listBtn" class="btn btn-lg" type="">목록보기</button>
                </div>   
            </form>
        </div>

    </div>

</body>
</html>