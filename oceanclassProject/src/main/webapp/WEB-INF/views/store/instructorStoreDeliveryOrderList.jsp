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

<link rel="stylesheet" href="./resources/css/store/instructorStoreDeliveryOrderList.css">
</head>
<body>

	<!-- 강사용 사이드바 연결 -->
	
	<div class="innerOuter" align="center">
        <div class="headMenu">
            <b>주문 배송 관리</b>
        </div>
        <div id="dStatus">
            <table>
                <tr align="center"> 
                    <td>
                        <div class="imgbox" style="background: rgb(107, 171, 213, 0.7);">
                            <img src="resources/images/delivery1.png">
                        </div>
                        <p>결제완료(00)</p>
                    </td>
                    <td>
                        <div class="imgbox">
                            <img src="resources/images/delivery2.png">
                        </div>
                        <p>상품준비중(00)</p>
                    </td>
                    <td>
                        <div class="imgbox">
                            <img src="resources/images/delivery3.png">
                        </div>
                        <p>배송시작(00)</p>
                    </td>
                    <td>
                        <div class="imgbox">
                            <img src="resources/images/delivery4.png">
                        </div>
                        <p>배송중(00)</p>
                    </td>
                    <td>
                        <div class="imgbox">
                            <img src="resources/images/delivery5.png">
                        </div>
                        <p>배송완료(00)</p>
                    </td>
                    <td>
                        <div class="imgbox">
                            <img src="resources/images/delivery6.png">
                        </div>
                        <p>결제취소(00)</p>
                    </td>
                </tr>
            </table>
            <script>
                /* 선택된 버튼 색상 변경 rgb(107, 171, 213, 0.7) */
                /* 버튼 클릭시 해당 상태인 주문내역 불러오기 */
            </script>
        </div>
        <div class="content">
            <div class="content_1">
                <div class="content_1_left"><b>결제완료</b><br>00건</div>
                <div class="content_1_center"></div>
                <div class="content_1_right">
                    <form id="searchForm" align="right">
                        <input type="text" id="searchKey" placeholder="주문자명을 입력하세요"> 
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>
            <div class="content_2">
                <table class="orderList"    >
                    <thead>
                        <tr>
                            <th width="40"><input type="checkbox" id="checkAll"></th>
                            <th width="150">주문번호</th>
                            <th width="150">주문자명</th>
                            <th width="220">주문일</th>
                            <th width="110">주문방법</th>
                            <th width="110">주문금액</th>
                            <th width="130">주문상태</th>
                            <th width="150">기능</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <form>
                            <!-- <td><input type="checkbox" class="deleteNum" name="deleteNum" value="${b.boardNo }"></td> -->
                                <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                                <td>SO1230223</td>
                                <td>손지희</td>
                                <td>2022-01-31 17:22:37</td>
                                <td>카드</td>
                                <td>45000</td>
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
                                <td align="center">
                                    <button id="updateBtn" type="submit">변경</button>
                                    <button id="detailBtn" onclick="">상세</button>
                                </td>
                            </form>
                        </tr>
                        <tr>
                            <form>
                                <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                                <td>SO1230223</td>
                                <td>손지희</td>
                                <td>2022-01-31 17:22:37</td>
                                <td>카드</td>
                                <td>45000</td>
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
                                <td align="center">
                                    <button id="updateBtn" type="submit">변경</button>
                                    <button id="detailBtn" onclick="">상세</button>
                                </td>
                            </form>
                        </tr>
                        <tr>
                            <form>
                                <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                                <td>SO1230223</td>
                                <td>손지희</td>
                                <td>2022-01-31 17:22:37</td>
                                <td>카드</td>
                                <td>45000</td>
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
                                <td align="center">
                                    <button id="updateBtn" type="submit">변경</button>
                                    <button id="detailBtn" onclick="">상세</button>
                                </td>
                            </form>
                        </tr>
                        <tr>
                            <form>
                                <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                                <td>SO1230223</td>
                                <td>손지희</td>
                                <td>2022-01-31 17:22:37</td>
                                <td>카드</td>
                                <td>45000</td>
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
                                <td align="center">
                                    <button id="updateBtn" type="submit">변경</button>
                                    <button id="detailBtn" onclick="">상세</button>
                                </td>
                            </form>
                        </tr>
                        <tr>
                            <form>
                                <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                                <td>SO1230223</td>
                                <td>손지희</td>
                                <td>2022-01-31 17:22:37</td>
                                <td>카드</td>
                                <td>45000</td>
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
                                <td align="center">
                                    <button id="updateBtn" type="submit">변경</button>
                                    <button id="detailBtn" onclick="">상세</button>
                                </td>
                            </form>
                        </tr>
                        <tr>
                            <form>
                                <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                                <td>SO1230223</td>
                                <td>손지희</td>
                                <td>2022-01-31 17:22:37</td>
                                <td>카드</td>
                                <td>45000</td>
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
                                <td align="center">
                                    <button id="updateBtn" type="submit">변경</button>
                                    <button id="detailBtn" onclick="">상세</button>
                                </td>
                            </form>
                        </tr>
                        <tr>
                            <form>
                                <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                                <td>SO1230223</td>
                                <td>손지희</td>
                                <td>2022-01-31 17:22:37</td>
                                <td>카드</td>
                                <td>45000</td>
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
                                <td align="center">
                                    <button id="updateBtn" type="submit">변경</button>
                                    <button id="detailBtn" onclick="">상세</button>
                                </td>
                            </form>
                        </tr>
                        <tr>
                            <form>
                                <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                                <td>SO1230223</td>
                                <td>손지희</td>
                                <td>2022-01-31 17:22:37</td>
                                <td>카드</td>
                                <td>45000</td>
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
                                <td align="center">
                                    <button id="updateBtn" type="submit">변경</button>
                                    <button id="detailBtn" onclick="">상세</button>
                                </td>
                            </form>
                        </tr>
                        <tr>
                            <form>
                                <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                                <td>SO1230223</td>
                                <td>손지희</td>
                                <td>2022-01-31 17:22:37</td>
                                <td>카드</td>
                                <td>45000</td>
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
                                <td align="center">
                                    <button id="updateBtn" type="submit">변경</button>
                                    <button id="detailBtn" onclick="">상세</button>
                                </td>
                            </form>
                        </tr>
                        <tr>
                            <form>
                                <td><input type="checkbox" class="deleteNum" name="" value=""></td>
                                <td>SO1230223</td>
                                <td>손지희</td>
                                <td>2022-01-31 17:22:37</td>
                                <td>카드</td>
                                <td>45000</td>
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
                                <td align="center">
                                    <button id="updateBtn" type="submit">변경</button>
                                    <button id="detailBtn" onclick="">상세</button>
                                </td>
                            </form>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div align="left">
            <button id="deleteBtn">선택삭제</button>
        </div>
        <div class="btn_group" align="center">
            <button class="btn btn-light">&lt;</button>

            <button class="btn btn-light">1</button>
            <button class="btn btn-light">2</button>
            <button class="btn btn-light">3</button>
            <button class="btn btn-light">4</button>
            <button class="btn btn-light">5</button>

            <button class="btn btn-light">&gt;</button>
        </div>
    </div>

</body>
</html>