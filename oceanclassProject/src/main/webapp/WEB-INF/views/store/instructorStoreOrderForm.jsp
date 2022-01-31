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

<link rel="stylesheet" href="./resources/css/store/instructorStoreOrderForm.css">
</head>
<body>

	<!-- 
	강사용메뉴페이지 연결하기
	 -->
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>상품 발주 요청서</b>
        </div>
        <div class="content">

            <form>
                <table class="table">
                    <tr>
                        <th width="200">상품번호</th>
                        <td width="600">
                            <select>
                                <option value="">[판매중인상품번호1] 판매중인 상품명 1</option>
                                <option value="">[판매중인상품번호2] 판매중인 상품명 2</option>
                                <option value="">[판매중인상품번호3] 판매중인 상품명 3</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>발주상품명</th>
                        <td><input type="text" name="" id="" placeholder="주문할 사이트의 상품명울 똑같이 작성하세요" required></td>
                    </tr>
                    <tr>
                        <th>재고</th>
                        <td><input type="number" name="" id="" required></td>
                    </tr>
                    <tr>
                        <th>주문수량</th>
                        <td><input type="number" name="" id="" min="10" placeholder="최소주문수량 10" required></td>
                    </tr>
                    <tr>
                        <th>단가</th>
                        <td><input type="number" name="" id="" placeholder="원" required></td>
                    </tr>
                    <tr>
                        <th>최종금액</th>
                        <td><input type="number" name="" id="" placeholder="VAT포함된 금액(원)을 입력하세요" required></td>
                    </tr>
                    <tr>
                        <th>주문사이트</th>
                        <td><input type="text" name="" id="" placeholder="주문사이트 url을 입력하세요" required></td>
                    </tr>
                </table>
                <div class="btnBox" align="center">
                    <button class="btn btn-lg" type="submit">제출하기</button>
                </div>
            </form>

        
        </div>
    </div>

</body>
</html>