<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/css/store/instructorStoreOrderForm.css">
</head>
<body>

	<!-- 
	강사용메뉴페이지 연결하기
	 -->
 	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
 	
    <div class="innerOuter" align="center">
        <div class="headMenu">
        	<br><br>
            <b>상품 발주 요청서</b>
        </div>
        <div class="content">

            <form action="porderE.in" method="post">
                <table class="table">
                	<input type="hidden" name="productNo" value="" id="productNo">
                    <tr>
                        <th width="200">상품번호</th>
                        <td width="600">
                            <select id="selectList">
                            	<c:forEach var="p" items="${plist }">
	                                <option value="${p.productNo }">[${p.productNo }] ${p.title }</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>발주상품명</th>
                        <td><input type="text" name="title" placeholder="주문할 사이트의 상품명울 똑같이 작성하세요" required></td>
                    </tr>
                    <tr>
                        <th>재고</th>
                        <td><input type="number" name="stock" id="stock" required></td>
                    </tr>
                    <tr>
                        <th>주문수량</th>
                        <td><input type="number" name="quantity" min="10" placeholder="최소주문수량 10" required></td>
                    </tr>
                    <tr>
                        <th>단가</th>
                        <td><input type="number" name="unitPrice" placeholder="원" required></td>
                    </tr>
                    <tr>
                        <th>최종금액</th>
                        <td><input type="number" name="total" placeholder="VAT포함된 금액(원)을 입력하세요" required></td>
                    </tr>
                    <tr>
                        <th>주문사이트</th>
                        <td><input type="text" name="orderSite" placeholder="주문사이트 url을 입력하세요" required></td>
                    </tr>
                </table>
                <div class="btnBox" align="center">
                    <button class="btn btn-lg" type="submit">제출하기</button>
                </div>
            </form>
			<script>
				$(function(){
					$('#selectList').change(function(){
						//var value = $("#selectList option:selected").val();
						//console.log(value);
						var index = $("#selectList option").index($("#selectList option:selected"));
						//console.log(index);		
						var obj = new Object();
						var plist = new Array();
						<c:forEach var="p" items="${plist}">
							obj = {productNo : "${p.productNo}", title : "${p.title}", stock:"${p.stock}"}
							plist.push(obj);
						</c:forEach>
						//console.log(plist);
						$('#productNo').attr('value',plist[index].productNo);
						$('#stock').attr('value',plist[index].stock);
						$('#stock').attr('disabled',true);
						//console.log(plist[index].stock);
						
					});
					
					
				})

			</script>
        
        </div>
    </div>

</body>
</html>