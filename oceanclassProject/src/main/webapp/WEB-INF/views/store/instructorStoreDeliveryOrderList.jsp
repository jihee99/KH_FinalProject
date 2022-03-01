<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="./resources/css/store/instructorStoreDeliveryOrderList.css">

<style>
    
	.content_1_left>b{font-size: 17px;}
	.content_1_center{width: 20%;}
	.content_1_right{width: 60%; float: right;}
	
	.content_1_right select, option{height: 32px; margin-top: 5px;}
	.content_1_right input{height: 32px; margin-top: 5px; width: 250px;}
	.content_1_right button{height: 32px; margin-top: 5px; border-radius: 5px; border: none;}
</style>
</head>
<body>
	<div style="width: 1600px; height: auto; margin: auto;">

	<!-- 강사용 사이드바 연결 -->
	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
	
	<div class="innerOuter">
        <div class="headMenu">
        	<br><br>
            <b>주문 배송 관리</b>
        </div>
        <div id="dStatus">
            <table>
                <tr align="center"> 
                    <td onclick="typeValue(1);">
                        <div class="imgbox" id="type1">
                            <img src="resources/images/delivery1.png">
                        </div>
                        <p>결제완료</p>
                    </td>
                    <td onclick="typeValue(2);">
                        <div class="imgbox" id="type2">
                            <img src="resources/images/delivery2.png">
                        </div>
                        <p>상품준비중</p>
                    </td>
                    <td onclick="typeValue(3);">
                        <div class="imgbox" id="type3">
                            <img src="resources/images/delivery3.png">
                        </div>
                        <p>배송시작</p>
                    </td>
                    <td onclick="typeValue(4);">
                        <div class="imgbox" id="type4">
                            <img src="resources/images/delivery4.png">
                        </div>
                        <p>배송중</p>
                    </td>
                    <td onclick="typeValue(5);">
                        <div class="imgbox" id="type5">
                            <img src="resources/images/delivery5.png">
                        </div>
                        <p>배송완료</p>
                    </td>
                    <td onclick="typeValue(6);">
                        <div class="imgbox" id="type6">
                            <img src="resources/images/delivery6.png">
                        </div>
                        <p>결제취소</p>
                    </td>
                </tr>
            </table>
        </div>
        <div class="content">
            <div class="content_1">
                <div class="content_1_left"><b>전체 주문</b>(${pi.listCount })</div>
                <div class="content_1_center"></div>
                <div class="content_1_right">
                    <form id="searchForm" align="right" action="sosearch.in">
                    	<select name="type">
                    		<option value="1">회원아이디</option>
                    		<option value="2">주문번호</option>
                    	</select>
                        <input type="text" name="key" placeholder="검색어를 입력하세요" required> 
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>
            <div class="content_2">
                <table class="orderList">
                    <thead>
                        <tr>
                            <th width="40"><input type="checkbox" id="checkAll"></th>
                            <th width="150">주문번호</th>
                            <th width="150">주문회원</th>
                            <th width="220">주문일</th>
                            <th width="110">주문방법</th>
                            <th width="110">주문금액</th>
                            <th width="130">주문상태</th>
                            <th width="150">기능</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="s" items="${list }">
                        <tr>
                            <!-- <td><input type="checkbox" class="deleteNum" name="deleteNum" value="${b.boardNo }"></td> -->
                            <td><input type="checkbox" class="deleteNum" name="chBxRow" value="${s.orderNo }"></td>
                            <td>${s.orderNo }</td>
                            <td>${s.userId }</td>
                            <td>${s.payDate }</td> 
                            <td>${s.payMethod }</td>
                            <td>${s.payAmount }</td>
                            <td>
                                <select name="status" class="orderNo${s.orderNo }">
                                	<option class="op1" value="1">결제완료</option>
                                    <option class="op2" value="2">상품준비</option>
                                    <option class="op3" value="3">배송시작</option>
                                    <option class="op4" value="4">배송중</option>
                                    <option class="op5" value="5" style="color: green;">배송완료</option>
                                    <option class="op6" value="6">주문취소</option>
                                    <option class="op7" value="7" style="color: red;">취소완료</option>
                                </select>

                            </td>
                            <td align="center">
                                <button id="updateBtn" type="submit" onclick="statusUp('${s.orderNo}');">변경</button>
                                <button id="detailBtn" onclick="location.href='sodetail.in?ono=${s.orderNo}'">상세</button>
                            </td>
                            	<script>
                                	$(".orderNo${ s.orderNo } option").each(function(){
                                		if($(this).val() == ${s.orderStatus }){
                                			$(this).attr("selected", true);
                                		}
                                	})
                                </script>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <input type="hidden" name="hiddenList" id="hiddenList">
        <div align="left">
            <button id="deleteBtn" onclick="deleteOrder();">선택삭제</button>
        </div>
        <div class="btn_group" align="center">
			<c:choose>
           		<c:when test="${pi.currentPage eq 1 }">
           			<button class="btn btn-light" disabled>&lt;</button>
           		</c:when>
           		<c:otherwise>
           			<button class="btn btn-light" onclick="location.href='solist.in?cpage=${pi.currentPage - 1}'">&lt;</button>
           		</c:otherwise>
           	</c:choose>
                   
   			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
   				<button class="btn btn-light" onclick="location.href='solist.in?cpage=${p}'">${p }</button>
   			</c:forEach>
   
   			<c:choose>
               	<c:when test="${pi.currentPage eq pi.maxPage }">
           			<button class="btn btn-light" disabled>&gt;</button>
               	</c:when>
               	<c:otherwise>
               		<button class="btn btn-light" onclick="location.href='solist.in?cpage=${pi.currentPage + 1}'">&gt;</button>
               	</c:otherwise>
            </c:choose>
		</div>
		
		<script>	

			function detailView(orderNo){
				console.log(orderNo);
				//location.href='sodetail.in?ono=${s.orderNo}'"
				location.href="sodetail.in?ono="+orderNo;
			}	
		
			function statusUp(orderNo){
				console.log(orderNo);
				status = $(".orderNo"+orderNo+" option:selected").val();
				console.log($(".orderNo"+orderNo+" option:selected").val());
				location.href="sostatusUp.in?ono="+orderNo+"&status="+status;
			}
			function typeValue(num){
				console.log(num)
				var box1 = $("#type1");
				var box2 = $("#type2");
				var box3 = $("#type3");
				var box4 = $("#type4");
				var box5 = $("#type5");
				var box6 = $("#type6");

				if(num ==1){
					box1.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box2.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box3.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box4.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box5.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box6.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}else if(num==2){
					box2.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box1.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box3.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box4.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box5.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box6.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}else if(num==3){
					box3.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box1.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box2.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box4.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box5.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box6.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}else if(num==4){
					box4.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box1.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box2.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box3.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box5.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box6.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}else if(num==5){
					box5.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box1.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box2.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box3.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box4.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box6.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}else if(num==6){
					box6.css("background-color","rgb(107, 171, 213, 0.7)");
					
					box1.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box2.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box3.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box4.css("background-color", "rgb(150, 150, 150, 0.6)");  
					box5.css("background-color", "rgb(150, 150, 150, 0.6)");  
				}
				
				$.ajax({
					url:"sosearchF.in",
					data:{orderStatus:num},
					success:function(result){
						//console.log(list);
						console.log(result);
						
						let value ="";
						let pageVal = "";
						
						for(let i in result.list){
							/*
							if(list[i].orderStatus == 1){
								selectVal = 
							}*/
							value += "<tr>"
								+ "<td><input type='checkbox' class='deleteNum' name='chBxRow' value='"+result.list[i].orderNo+"'></td>"
								+ "<td>"+ result.list[i].orderNo + "</td>"
								+ "<td>"+ result.list[i].userId + "</td>"
								+ "<td>"+ result.list[i].payDate + "</td>"
								+ "<td>"+ result.list[i].payMethod +"</td>"
								+ "<td>"+ result.list[i].payAmount +"</td>"
								+ "<td>"
                            	+ "<input type='hidden' name='orderStatus' value='"+result.list[i].orderStatus+"'>"
									+"<select name='status' id='' value='"+result.list[i].orderStatus+"'>"
										+"<option class='op1' value='1'>결제완료</option>"
                                    	+"<option class='op2' value='2'>상품준비</option>"
                                    	+"<option class='op3' value='3'>배송시작</option>"
	                                    +"<option class='op4' value='4'>배송중</option>"
	                                    +"<option class='op5'value='5 style='color: green;'>배송완료</option>"
	                                   	+"<option class='op6' value='6'>주문취소</option>"
		                                +"<option class='op7' value='7' style='color: red;'>취소완료</option>"
	                                +"</select> </td>"
	                            +"<td align='center'>"
	                            +"<button id='updateBtn' onclick='statusUp(\""+ result.list[i].orderNo+"\");'>변경</button>"
                                +"<button id='detailBtn' onclick='detailView(\""+ result.list[i].orderNo+ "\");'>상세</button>"
                               + "</td>"
                               + "</tr>"	  	
						}

						//console.log(value);
						$(".orderList tbody").empty();
						$(".orderList tbody").html(value);
						$(".btn_group").empty();
						
					}, error:function(){
						alert("주문내역 조회에 실패했습니다.");
					}
				});
			}
			
			function deleteOrder(){
				var chkArr = new Array();
				var hiddenList 
				$('input:checkbox[name=chBxRow]:checked').each(function(){
	            	chkArr.push(this.value);
	            });
				$('#hiddenList').val(chkArr);
				
				console.log(chkArr);
				
				$.ajax({
					url:"sodelete.in",
					data:{hiddenList:$('#hiddenList').val()},
					success:function(){
						alert("주문내역 삭제가 완료되었습니다.");
						location.reload();
					},error:function(){
						alert("주문내역 삭제에 실패했습니다.");
					}
				});
			}
			
			$(document).ready(function() {
                $("#checkAll").click(function() {
                    if($("#checkAll").is(":checked")) $("input[name=chBxRow]").prop("checked", true);
                    else $("input[name=chBxRow]").prop("checked", false);
                });
			
			})
            
		</script>
    </div>
</div>
</body>
</html>