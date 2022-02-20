<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="./resources/css/adminOrderList.css">
<style>
	#classTable tbody tr:hover{cursor:pointer;}
	#storeTable tbody tr:hover{cursor:pointer;}
</style>
</head>
<body>

    <!-- 관리자 사이드바 연결하기 -->
    <jsp:include page="../../common/admin/adminSidebar.jsp" />
	
	
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>주문 내역 관리</b>
        </div>
        <div class="content_1">
            <b>통합주문 검색</b>
            <form action="orsearch.ad">
                <table>
                    <tr>
                        <th width="100">주문분류</th>
                        <td width="300">
                            <input type="radio" class="orderType" name="category" id="class" value="c" checked>
                            <label for="class">클래스</label>
                            &nbsp;&nbsp;&nbsp;
                            <input type="radio" class="orderType" name="category" id="store" value="s">
                            <label for="store">스토어</label>
                        </td>
                        <td width="80" rowspan="5">
                            <button type="submit" id="searchBtn">검색</button>
                        </td>
                    </tr>
                    <tr>
                        <th>기간검색</th>
                        <td>
                            <input type="date" name="sDate" id="" required>
                             -
                            <input type="date" name="eDate" id="" required>
                        </td>
                    </tr>
                    <tr>
                        <th>주문상태</th>
                        <td>
                            <label><input type="checkbox" name="lev" id="" value="0">주문접수</label>&nbsp;&nbsp;
                            <label><input type="checkbox" name="lev" id="" value="1">결제완료</label>&nbsp;&nbsp;
                            <label><input type="checkbox" name="lev" id="" value="2">상품준비</label>&nbsp;&nbsp;
                            <label><input type="checkbox" name="lev" id="" value="3">배송시작</label>&nbsp;&nbsp;
                            <br>
                            <label><input type="checkbox" name="lev" id="" value="4">배송중</label>&nbsp;&nbsp;
                            <label style="color: green;"><input type="checkbox" name="lev" id="" value="5">배송완료</label>&nbsp;&nbsp;
                            <label style="color: red;"><input type="checkbox" name="lev" id="" value="6">취소접수</label>&nbsp;&nbsp;
                            <label><input type="checkbox" name="lev" id="" value="7">취소완료</label>&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <th>검색조건</th>
                        <td>
                            <input type="text" name="key" id="keyword" placeholder="주문번호를 입력하세요" required>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <div id="classArea">
            <b style="float:left; margin-left: 10px; font-size: 16px; line-height: 33px;">통합주문목록(${cPi.listCount })</b>
            <button onclick="classDelete();" class="btn" style="float: right; margin-right: 10px; margin-bottom: 5px; font-weight: bold; color: white; background: rgb(172, 11, 11);">삭제</button>
            <table id="classTable">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="cCheckAll"></th>
                        <th width="100">주문번호</th>
                        <th width="110">주문자아이디</th>
                        <th width="100">주문자명</th>
                        <th width="100">총금액</th>
                        <th width="100">열람여부</th>
                        <th width="200">주문일자</th>
                        <th width="200">취소일자</th>
                        <th width="100">결제방법</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="c" items="${clist }">
                    <tr>
                        <td><input type="checkbox" name="classChkRow" value="클래스번호넣기"></td>
                        <td class="orderNo">${c.coNo }</td>
                        <td>${c.userId }</td>
                        <td>${c.userName }</td>
                        <td>${c.price }</td>
                        <td>${c.readingCheck }</td>
                        <td>${c.paymentDate }</td>
                        <td>
                        	<c:choose>
                        		<c:when test="${c.requestDate ne null }">${c.requestDate }</c:when>
                        		<c:otherwise>--</c:otherwise>
                        	</c:choose>
                        </td>
                        <td>
                        	<c:choose>
                        		<c:when test="${c.paymentOption eq 2 }">--</c:when>
                        		<c:otherwise>카드?무통장</c:otherwise>
                        	</c:choose>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <input type="hidden" name="hiddenList1" id="hiddenList1" value="">
            <div class="btn_group" align="center">
				<c:choose>
	           		<c:when test="${cPi.currentPage eq 1 }">
	           			<button class="btn btn-light" disabled>&lt;</button>
	           		</c:when>
	           		<c:otherwise>
	           			<button class="btn btn-light" onclick="location.href='orlist.ad?cpage=${cPi.currentPage - 1}'">&lt;</button>
	           		</c:otherwise>
	           	</c:choose>
	                   
	   			<c:forEach var="p" begin="${cPi.startPage }" end="${cPi.endPage }">
	   				<button class="btn btn-light" onclick="location.href='orlist.ad?cpage=${p}'">${p }</button>
	   			</c:forEach>
	   
	   			<c:choose>
	               	<c:when test="${cPi.currentPage eq cPi.maxPage }">
	           			<button class="btn btn-light" disabled>&gt;</button>
	               	</c:when>
	               	<c:otherwise>
	               		<button class="btn btn-light" onclick="location.href='orlist.ad?cpage=${cPi.currentPage + 1}'">&gt;</button>
	               	</c:otherwise>
	            </c:choose>
        	</div>

        </div>
        
        <div id="storeArea" style="width: 100%; font-size: 14px; margin-top:20px;">
            <b style="float:left; margin-left: 10px; font-size: 16px; line-height: 33px;">통합주문목록(${sPi.listCount })</b>
            <button onclick="storeDelete();" class="btn" style="float: right; margin-right: 10px; margin-bottom: 5px; font-weight: bold; color: white; background: rgb(172, 11, 11);">삭제</button>
            <table id="storeTable" style="margin: 5px 8px; text-align: center; width: 98%; line-height: 24px;">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="sCheckAll"></th>
                        <th width="100">주문번호</th>
                        <th width="110">주문자아이디</th>
                        <th width="110">주문자명</th>
                        <th width="100">총금액</th>
                        <th width="100">주문상태</th>
                        <th width="200">주문일자</th>
                        <th width="200">취소일자</th>
                        <th width="100">결제방법</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="store" items="${slist }">
                    <tr>
                        <td><input type="checkbox" name="storeChkRow" value="${store.orderNo }"></td>
                        <td class="orderNo">${store.orderNo }</td>
                        <td>${store.userId }</td>
                        <td>${store.userName }</td>
                        <td>${store.payAmount }</td>
                        <td>
						<c:choose>
							<c:when test="${store.orderStatus eq 1 }">주문접수</c:when>
							<c:when test="${store.orderStatus eq 2 }">상품준비중</c:when>
							<c:when test="${store.orderStatus eq 3 }">배송시작</c:when>
							<c:when test="${store.orderStatus eq 4 }">배송중</c:when>
							<c:when test="${store.orderStatus eq 5 }">배송완료</c:when>
							<c:when test="${store.orderStatus eq 6 }">주문취소</c:when>
							<c:when test="${store.orderStatus eq 7 }">취소완료</c:when>
						</c:choose>
						</td>
                        <td>${store.payDate }</td>
                        <td>
                        	<c:choose>
                        		<c:when test="${store.refundDate eq null}"> -- </c:when>
                        		<c:otherwise>${store.refundDate }</c:otherwise>
                        	</c:choose>
                        </td>
                        <td>${store.payMethod }</td>
                    </tr>
				</c:forEach>
                </tbody>
            </table>
            
            <input type="hidden" name="hiddenList2" id="hiddenList2" value="">
            
            <div class="btn_group" align="center">
				<c:choose>
	           		<c:when test="${sPi.currentPage eq 1 }">
	           			<button class="btn btn-light" disabled>&lt;</button>
	           		</c:when>
	           		<c:otherwise>
	           			<button class="btn btn-light" onclick="location.href='orlist.ad?cpage=${sPi.currentPage - 1}'">&lt;</button>
	           		</c:otherwise>
	           	</c:choose>
	                   
	   			<c:forEach var="p" begin="${sPi.startPage }" end="${sPi.endPage }">
	   				<button class="btn btn-light" onclick="location.href='orlist.ad?cpage=${p}'">${p }</button>
	   			</c:forEach>
	   
	   			<c:choose>
	               	<c:when test="${sPi.currentPage eq sPi.maxPage }">
	           			<button class="btn btn-light" disabled>&gt;</button>
	               	</c:when>
	               	<c:otherwise>
	               		<button class="btn btn-light" onclick="location.href='orlist.ad?cpage=${sPi.currentPage + 1}'">&gt;</button>
	               	</c:otherwise>
	            </c:choose>
        	</div>
        </div>
        
		<script>
			/* 클래스 area 선택 주문 삭제하기 */
			function classDelete(){
				var chkArr = new Array();
				
				$('input:checkbox[name=classChkRow]:checked').each(function(){
	            	chkArr.push(this.value);
	            });
				
				$('#hiddenList1').val(chkClassArr);
			}
			
			
			/* 스토어 area 선택 주문 삭제하기 */
			function storeDelete(){

				var chkArr = new Array();
				
				
				$('input:checkbox[name=storeChkRow]:checked').each(function(){
	            	chkArr.push(this.value);
	            });
				$('#hiddenList2').val(chkArr);
				console.log($('#hiddenList2').val());

				$.ajax({
					url:"sodelete.ad",
					data:{
						hiddenList:$("#hiddenList2").val()
					},success:function(result){
						
					},error:function(){
						
					}
				})
				
			}
	        
			$(document).ready(function() {
				var type = $("input[type=radio][name=category]").val();
	        	console.log($("input[type=radio][name=category]").val());
	        	console.log(type);
				/*라디오 버튼에 따른 동적 화면 구현*/
				if($("input[type=radio][name=category]").val() == 'c'){
					 $('#classArea').css('display','block');
	                 $('#storeArea').css('display','none');
				}else{
                    $('#classArea').css('display','none');
                    $('#storeArea').css('display','block');
				}
				
				$("input[type=radio][name=category]").on('click',function(){
	                var chkValue = $('input[type=radio][name=category]:checked').val();
	               
	                console.log(chkValue);

	                if(chkValue == "c"){
	                    $('#classArea').css('display','block');
	                    $('#storeArea').css('display','none');
	                } else if(chkValue == "s"){
	                    $('#classArea').css('display','none');
	                    $('#storeArea').css('display','block');
	                }
	                $('input[name=sDate]').prop("checked", false);
	                $('input[name=eDate]').prop("checked", false);
	                $('input[name=lev]').prop("checked", false);
	                $('input[name=key]').val("");
	            });
				
	        	/* 클래스 테이블 전체선택 */
	            $("#cCheckAll").click(function() {
	                if($("#cCheckAll").is(":checked")) $("input[name=classChkRow]").prop("checked", true);
	                else $("input[name=classChkRow]").prop("checked", false);
	
	            });
	            
	            /* 스토어 테이블 전체선택  */
	            $("#sCheckAll").click(function() {
	                if($("#sCheckAll").is(":checked")) $("input[name=storeChkRow]").prop("checked", true);
	                else $("input[name=storeChkRow]").prop("checked", false);
	
	            });
	
	            
	            /*검색버튼 눌렀을 때, 검색기간 무결성 검사*/
	            $("#searchBtn").click(function(){
	 
	                var startDate = $( "input[name='startDate']" ).val();
	                var startDateArr = startDate.split('-');
	
	                var endDate = $( "input[name='endDate']" ).val();
	                var endDateArr = endDate.split('-');
	                        
	                var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
	                var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
	                
	                if(startDateCompare.getTime() > endDateCompare.getTime()) {
	                    
	                    alert("시작날짜와 종료날짜를 확인해 주세요.");
	                    
	                    return;
	                }
	                
	                console.log(startDate);
	                console.log(endDate);
                        
                });

				
				/* 스토어테이블 tr 주문내역 상세보기 */
				$("#storeTable tbody tr td[class='orderNo']").click(function(){
					console.log($(this).text());
					location.href='sodetail.ad?ono=' + $(this).text();
				});
				
				/* 클래스테이블 tr 주문내역 상세보기 */
				$("#classTable tbody tr td[class='orderNo']").click(function(){
					console.log($(this).text());
					location.href='codetail.ad?ono=' + $(this).text();
				});

			});
        </script>
    </div>
            
</body>
</html>