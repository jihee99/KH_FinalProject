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

<link rel="stylesheet" href="./resources/css/store/instructorStoreStockList.css">
</head>
<body>

	<!-- 
	강사용 메뉴바 연결하기
	 -->
	
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>상품 재고 관리</b>
        </div>
        <div class="head_2">
            <div class="head_2_left">
                <form id="searchForm">
                    <input type="text" id="searchKey" placeholder="상품명을 입력하세요"> 
                    <button type="submit">검색</button>
                </form>
            </div>
            <div class="head_2_center"></div>
            <div class="head_2_right" align="right">
                <button>발주요청서 작성하기</button>
            </div>
        </div>
        <div class="content">
            <table class="table table-sm table-light stockTable">
                <thead class="thead-light">
                    <tr>
                        <th width="130">상품번호</th>
                        <th width="300">상품명</th>
                        <th width="80">주문대기</th>
                        <th width="80">창고재고</th>
                        <th width="80">가용재고</th>
                        <th width="80">재고수정</th>
                        <th width="60">판매</th>
                        <th width="60">품절</th>
                        <th width="60">비고</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <form>
                            <td>P1233</td>
                            <td>펀치 니들 자수 패키지 DIY 취미세트 ...</td>
                            <td>5</td>
                            <td>2</td>
                            <td>-3</td>
                            <td><input type="number"></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><button class="btn" type="submit">저장</button></td>
                        </form>
                    </tr>
                    <tr>
                        <form>
                            <td>P1233</td>
                            <td>펀치 니들 자수 패키지 DIY 취미세트 ...</td>
                            <td>5</td>
                            <td>2</td>
                            <td>-3</td>
                            <td><input type="number"></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><button class="btn" type="submit">저장</button></td>
                        </form>
                    </tr>
                    <tr>
                        <form>
                            <td>P1233</td>
                            <td>펀치 니들 자수 패키지 DIY 취미세트 ...</td>
                            <td>5</td>
                            <td>2</td>
                            <td>-3</td>
                            <td><input type="number"></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><button class="btn" type="submit">저장</button></td>
                        </form>
                    </tr>
                    <tr>
                        <form>
                            <td>P1233</td>
                            <td>펀치 니들 자수 패키지 DIY 취미세트 ...</td>
                            <td>5</td>
                            <td>2</td>
                            <td>-3</td>
                            <td><input type="number"></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><button class="btn" type="submit">저장</button></td>
                        </form>
                    </tr>
                    <tr>
                        <form>
                            <td>P1233</td>
                            <td>펀치 니들 자수 패키지 DIY 취미세트 ...</td>
                            <td>5</td>
                            <td>2</td>
                            <td>-3</td>
                            <td><input type="number"></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><button class="btn" type="submit">저장</button></td>
                        </form>
                    </tr>
                    <tr>
                        <form>
                            <td>P1233</td>
                            <td>펀치 니들 자수 패키지 DIY 취미세트 ...</td>
                            <td>5</td>
                            <td>2</td>
                            <td>-3</td>
                            <td><input type="number"></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><input type="checkbox" name="" id=""></td>
                           	<td><button class="btn" type="submit">저장</button></td>
                        </form>
                    </tr>
                    <tr>
                        <form>
                            <td>P1233</td>
                            <td>펀치 니들 자수 패키지 DIY 취미세트 ...</td>
                            <td>5</td>
                            <td>2</td>
                            <td>-3</td>
                            <td><input type="number"></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><button class="btn" type="submit">저장</button></td>
                        </form>
                    </tr>
                    <tr>
                        <form>
                            <td>P1233</td>
                            <td>펀치 니들 자수 패키지 DIY 취미세트 ...</td>
                            <td>5</td>
                            <td>2</td>
                            <td>-3</td>
                            <td><input type="number"></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><button class="btn" type="submit">저장</button></td>
                        </form>
                    </tr>
                    <tr>
                        <form>
                            <td>P1233</td>
                            <td>펀치 니들 자수 패키지 DIY 취미세트 ...</td>
                            <td>5</td>
                            <td>2</td>
                            <td>-3</td>
                            <td><input type="number"></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><button class="btn" type="submit">저장</button></td>
                        </form>
                    </tr>
                    <tr>
                        <form>
                            <td>P1233</td>
                            <td>펀치 니들 자수 패키지 DIY 취미세트 ...</td>
                            <td>5</td>
                            <td>2</td>
                            <td>-3</td>
                            <td><input type="number"></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><input type="checkbox" name="" id=""></td>
                            <td><button class="btn" type="submit">저장</button></td>
                        </form>
                    </tr>
                </tbody>
            </table>
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