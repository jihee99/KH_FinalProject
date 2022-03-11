<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="./resources/css/store/instructorStoreStockList.css">
</head>
<body>
<div style="width: 1600px; height: auto; margin: auto;">
	<!-- 강사용 메뉴바 연결하기 -->
	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <br><br>
            <b>상품 재고 관리</b>
        </div>
        <c:choose>
		<c:when test="${loginUser ne null }">
			

        <div class="head_2">
            <div class="head_2_left">
                <form id="searchForm">
                    <input type="text" id="searchKey" placeholder="상품명을 입력하세요"> 
                    <button type="submit">검색</button>
                </form>
            </div>
            <div class="head_2_center"></div>
            <div class="head_2_right" align="right">
                <button onclick="location.href='porder.in'">발주요청서 작성하기</button>
            </div>
        </div>
        <div class="content">
            <table id="stockList" class="table table-sm table-light stockTable">
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
                	<c:forEach var="st" items="${stlist }">
                		<input type="hidden" name="soldValue" class="soldValue" value="${st.soldout }">
                    	<tr>
                            <td>
                            	<input type="hidden" name="productNo" class="productNo" value="${st.productNo }">
                            	${st.productNo }
                            </td>
                            <td>${st.productName }</td>
                            <td>${st.orderCount }</td>
                            <td>${st.stockCount }</td>
                            <td>${st.availCount }</td>
                            <td><input type="number" name="inValue" class="inValue"></td>
                     		<c:choose>
                            		<c:when test="${st.soldout eq 'Y'}">
                            		    <td><input type="checkbox" name="soldYN" class="soldYN" id="soldY" value="1"></td>
                   						<td><input type="checkbox" name="soldYN" class="soldYN" id="soldN" value="0" checked></td> 
                            		</c:when>
                            		<c:when test="${st.soldout eq 'N'}">
                            		    <td><input type="checkbox" name="soldYN" class="soldYN" id="soldY" value="1" checked></td>
                   						<td><input type="checkbox" name="soldYN" class="soldYN" id="soldN" value="0"></td> 
                            		</c:when>
                            </c:choose>
                            <td><button class="btn stockBtn" style="height:35px;">저장</button></td>
                        </tr>
                	</c:forEach>
                </tbody>
            </table>
       	</div>
       	<div class="btn_group" align="center">
        	<c:choose>
        		<c:when test="${pi.currentPage eq 1 }">
        			<button class="btn btn-light" disabled>&lt;</button>
        		</c:when>
        		<c:otherwise>
        			<button class="btn btn-light" onclick="location.href='ststock.in?cpage=${pi.currentPage - 1}'">&lt;</button>
        		</c:otherwise>
        	</c:choose>
                
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<button class="btn btn-light" onclick="location.href='ststock.in?cpage=${p}'">${p }</button>
			</c:forEach>

			<c:choose>
               	<c:when test="${pi.currentPage eq pi.maxPage }">
           			<button class="btn btn-light" disabled>&gt;</button>
               	</c:when>
               	<c:otherwise>
               		<button class="btn btn-light" onclick="location.href='ststock.in?cpage=${pi.currentPage + 1}'">&gt;</button>
               	</c:otherwise>
            </c:choose>
        </div>
        
        <script>
        /*
        	$(function(){
        		var soldValue = $("input[name=soldValue]").val();
		        //console.log(soldValue)
				if(soldValue == "N "){
					$("input[value=1]").attr('checked', true);
				}else{
					$("input[value=0]").attr('checked', true);
				}
        	})
        */
        	$(".stockBtn").on('click' , function(){
        		var thisRow = $(this).closest('tr'); 
        		var productNo = thisRow.find('td:eq(0)').find('input').val();
        		// inputStock
        		var inValue = thisRow.find('td:eq(5)').find('input').val();
        		if(inValue==""){
        			inValue = 0;
        		}
        		var soldY = thisRow.find('td:eq(6)').find('input:checked').val();
        		var soldN = thisRow.find('td:eq(7)').find('input:checked').val();
        		var soldYN = "";
        		if(soldY == 1 && soldN == null){   
        			soldYN = "N";
        		} else if(soldN == 0 && soldY == null) {
        			soldYN = "Y";
        		} else{
        			alert("판매여부는 중복 선택이 불가능합니다.");
        		}
        		
        		if(soldYN != ""){
            		$.ajax({
            			url:"stockUp.in",
            			data:{
            				productNo:productNo,
            				inValue:inValue,
    						soldout:soldYN
            			},success:function(result){
            				alert("상품 재고 수정이 완료되었습니다.");
            				
            			},error:function(){
            				alert("상품 재고 수정에 실패했습니다.");
            			}
            		});
    				location.reload();	
        		}
        	});
        </script>
        </c:when>
		<c:otherwise>
			<script>
				alert("접근권한이 없습니다.");
				location.href='/oceanclass';
			</script>
		</c:otherwise>
		</c:choose>	
    </div>
</div>
</body>
</html>