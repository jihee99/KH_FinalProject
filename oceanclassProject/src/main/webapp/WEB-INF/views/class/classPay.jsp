<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .outer{
        width: 1000px;
        margin:auto;
        margin-top: 20px;
        margin-bottom: 100px;
        box-sizing: border-box;
    }
    .top{
        width: 100%; 
        height: 50px; 
        font-weight: bold;
        color: white;
        font-size: 20px;
        line-height: 45px;
        background-color: #6babd5;
    }
    .cate{
        width: 100%; 
        height: 40px; 
        font-weight: bold;
        color: black;
        font-size: 17px;
        line-height: 40px;
        margin-top: 50px;
        margin-bottom: 20px;
    }
    .info{
        height: 100px;        
        margin-top: 20px;
        margin-bottom: 80px;
    }
    .amountTable{
        text-align: center;
        
    }
    .amountTable *{
        width: 210px;
        height: 40px;
    }
    
    /*
    input::-webkit-inner-spin-button { 
	    appearance: none; 
	    -moz-appearance: none; 
	    -webkit-appearance: none; 
    }
    */
    
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    
    <div class="outer">
    	<input type="hidden" id="couponList" value="${couponList}">
    	
        <!--  <div class="top" align="center">주문/결제</div>-->
		<div align="center" style="font-size:23px; font-weight: bold; color:#6babd5; margin-top:40px;">
			<img src="resources/images/order.png" width="30" height="30" style="margin-bottom:7px;"> 주문/결제 <img src="resources/images/order.png" width="30" height="30" style="margin-bottom:7px;">
		</div>

        <div class="cate">주문 정보</div>
		
		<form action="classPay.me" method="post" onsubmit="return paySubmitCheck();">
			<!-- 주문을 위한 정보  -->
	    	<input type="hidden" id="memNo" name="memNo" value="${loginUser.memNo}">
	    	<input type="hidden" id="clNo" name="clNo" value="${c.clNo}">
	    	<input type="hidden" name="price" value="${c.clPrice}">
	    	<input type="hidden" id="pointUse" name="pointUse">
	    	<input type="hidden" id="amount" name="amount">
	    	
	        <div class="info">
	            <div style="float:left; margin-right: 10px;">
	                <img src="${ c.clImg }" width="280px" height="150px">
	            </div>
	            <div style="line-height: 10px;">
	                <div style="font-size: 15px; color: gray; line-height: 27px;">${ c.memNo }</div>
	                <div style="margin-top:10px; font-weight: bold;">${ c.clName }</div>
	            </div>
	        </div>
	        <hr>
	        
	        <div class="discount">
	            <div class="cate">쿠폰/포인트</div>
	
	            <div>
	                <div>쿠폰</div>
	                <input type="text" id="couponDiscountPrice" class="form-control" style="width: 300px; float: left;" placeholder="0원" readonly>
	                <button type="button" onclick="useCouponList();" class="btn" style="background-color: #6babd5;color: white; width:140px;">쿠폰 사용/해제</button>
	                <!-- <button type="button" class="btn" style="background-color: lightgray; color: white; width:120px; margin-left:-4px;">사용 해제</button> -->
	                <div style="font-size: 14px; color:grey; margin-top: 5px;">사용가능한 쿠폰: ${ couponList.size() }개</div>
	                <input type="hidden" id="useMemCouponNo" name="pcNo">
	            </div>
	
	            <div style="margin-top: 20px;">
	                <div>포인트</div>
	                <input type="text" id="usePoint" onkeyup="changePointMessage();" class="form-control" style="width: 300px; float: left;" placeholder="0원">
	                <button type="button" onclick="usePointSubmit();" class="btn" style="background-color: #6babd5;color: white; width:140px;">포인트 사용</button>
	                <div style="font-size: 14px; color:grey; margin-top: 5px;">사용가능한 포인트: <fmt:formatNumber value="${ loginUser.point }" type="number" />원 (1,000원 이상 사용 가능)</div>
	            </div>
	        </div>
	
	        <div class="amount">
	            <div class="cate">결제 금액</div>
	            
	            <div>
	                <table class="amountTable">
	                    <tr style="background-color: lightgray; color: gray;">
	                        <td>총 상품 금액</td>
	                        <td>쿠폰 할인 금액</td>
	                        <td>포인트 할인 금액</td>
	                    </tr>
	                    <tr style="color: gray;">
	                        <td><fmt:formatNumber value="${ c.clPrice }" type="number" />원</td>
	                        <td id="couponPrice">-0원</td>
	                        <td id="pointPrice">-0원</td>
	                    </tr>
	                    <tr style="background-color: lightgray;">
	                        <td></td>
	                        <td></td>
	                        <td>최종 결제 금액</td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td><b id="amountPrice"><fmt:formatNumber value="${ c.clPrice }" type="number" />원</b></td>
	                    </tr>
	                </table>
	            </div>
	            
	            <div class="pay">
	                <div class="cate">결제 방법</div>
	                
	                <div>
	                	<input type="radio" id="payment1" name="paymentOption" onclick="btnStyle(1);" value="1" style="display:none;">
	                	<label id="payment1_btn" class="btn" for="payment1" style="border:2px solid #6babd5; width:200px;">무통장 입금</label>
	                	<input type="radio" id="payment2" name="paymentOption" onclick="btnStyle(2);" value="2" style="display:none;">
	                	<label id="payment2_btn" class="btn" for="payment2" style="border:2px solid #6babd5; width:200px; display:none;">네이버 페이</label>
	                	<input type="radio" id="payment3" name="paymentOption" onclick="btnStyle(3);" value="3" style="display:none;">
	                	<label id="payment3_btn" class="btn" for="payment3" style="border:2px solid #6babd5; width:200px;">카카오 페이</label>
	                </div>
	                
	                <div align="center">
	                    <button type="submit" class="btn" style="background-color: #6babd5; width:100%; color: white; margin-top: 100px; font-weight: bold; font-size: 20px;">결제 하기</button>
	                </div>
	            </div>
	
	        </div>
        </form>

	        <!-- 쿠폰 사용시 보여질 modal -->
		    <div id="couponModal" class="modal fade" role="dialog">
		    	<div class="modal-dialog">
	                <!-- Modal content-->
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <h4 class="modal-title">쿠폰 사용/해제</h4>
	                    </div>
	                    <div class="modal-body">
	                    	<div class="form-group">
	                    		<select id="useCouponList" class="form-control" style="width: 100%; margin-right: 10px;">
										<option value="0" selected>사용 안함</option>
	                    			<c:forEach var="cp" items="${ couponList }">
										<option value="${ cp.memCouponNo }">${ cp.couponName } (할인율: ${ cp.discount }%)</option>
									</c:forEach>
								</select>
	                    	</div>
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn" onclick="couponModalSubmit();" style="background-color: #6babd5;">확인</button>
	                        <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>
	                    </div>
	                </div>
		        </div>
		    </div>
    </div>
    
    <script>
    
    	function useCouponList(){
			if(couponList == "[]"){
				alert("사용 가능한 쿠폰이 없습니다.");
			} else{
				$("#couponModal").modal();
			}
    	}
    
    	function couponModalSubmit(){
    		var useCouponNo = document.getElementById("useCouponList").value; //사용하려는 쿠폰 정보
			var price = ${ c.clPrice }; //원래 금액
    		var useMemCouponNo = document.getElementById("useMemCouponNo"); //사용한 쿠폰 번호 저장할 input 객체

			if(useCouponNo == 0){
				$('#couponModal').modal('hide');
				document.getElementById("couponPrice").innerHTML = "-0원";
				document.getElementById("couponDiscountPrice").value = "0원";
				
				var cPrice = document.getElementById("couponPrice").innerHTML.replace(",", "").substring(1, document.getElementById("couponPrice").innerHTML.length - 2);
				var pPrice = document.getElementById("pointPrice").innerHTML.replace(",", "").substring(1, document.getElementById("pointPrice").innerHTML.length - 2);
				
				document.getElementById("amountPrice").innerHTML = (price - cPrice - pPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
				useMemCouponNo.value = null;
			} else{
				
				$.ajax({
					url:"useCoupon.me",
					data:{useCouponNo:useCouponNo},
					success:function(data){
			    		alert("쿠폰이 적용되었습니다.");
						$('#couponModal').modal('hide');
						var discountPrice1 = price * (data.discount * 0.01);	//원래 가격에서 디스카운트 친 가격에
						var discountPrice2 = Math.floor(discountPrice1);		//혹시 모르니 소숫점 버리고
						var discountPrice3 = discountPrice2 * 0.01; 			//0.01 곱해서 xx.xx 로 만든 뒤
						var discountPrice4 = Math.floor(discountPrice3);		//다시 소숫점 버리고
						var discountPrice = discountPrice4 * 100;				//원상복귀 (100원 이하 버림 된 숫자로 만듬)
						
						document.getElementById("couponPrice").innerHTML = "-" + discountPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
						document.getElementById("couponDiscountPrice").value = discountPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
						useMemCouponNo.value = data.memCouponNo;
						
						var cPrice = document.getElementById("couponPrice").innerHTML.replace(",", "").substring(1, document.getElementById("couponPrice").innerHTML.length - 2);
						var pPrice = document.getElementById("pointPrice").innerHTML.replace(",", "").substring(1, document.getElementById("pointPrice").innerHTML.length - 2);;
						
						document.getElementById("amountPrice").innerHTML = (price - cPrice - pPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
					}, error:function(){
						console.log("쿠폰 사용 ajax 통신 실패");
					}
				})
			}
			
    	}
    	
    	
    	var pointMessage = "nochange";
    	
    	function usePointSubmit(){
    		var usePoint = document.getElementById("usePoint").value; //사용하려는 포인트 금액
    		var regExp = /^[0-9]+$/g;
    		var pointPrice = document.getElementById("pointPrice");
    		var price = ${ c.clPrice }; //원래 금액
    		
    		var point = "${loginUser.point}";
    		
    		if(usePoint == ""){
    			alert("사용할 포인트 금액을 입력해주세요.");
    		} else if(regExp.test(usePoint) == true){
    			if(usePoint.toString().substring(0,1) == "0" && usePoint != 0){
    				alert("포인트 사용 금액의 첫 자리는 0이 될 수 없습니다.");
    			} else if(point < usePoint){
    				alert("사용 가능한 포인트 금액을 확인해주세요.");
    			} else if(usePoint < 1000 && usePoint > 0){
    				alert("포인트는 1,000원 이상부터 사용 가능합니다.");
    			} else if(usePoint.toString().substring(usePoint.length - 2) != '00' && usePoint != 0){
    				alert("포인트는 100원 단위로 사용이 가능합니다.");
    			} else{
    				pointPrice.innerHTML = "-" + usePoint.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
    				pointMessage = "nochange";
    				
					var cPrice = document.getElementById("couponPrice").innerHTML.replace(",", "").substring(1, document.getElementById("couponPrice").innerHTML.length - 2);
					var pPrice = document.getElementById("pointPrice").innerHTML.replace(",", "").substring(1, document.getElementById("pointPrice").innerHTML.length - 2);;
					
					document.getElementById("amountPrice").innerHTML = (price - cPrice - pPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
					
					document.getElementById("pointUse").value = usePoint;
    			}
    		} else{
    			alert("포인트 사용금액은 숫자만 입력할 수 있습니다.");
    		}
    		
    	}
    	
    	function changePointMessage(){
    		pointMessage = "change";
    	}
    	
    	function btnStyle(num){
    		var btn1 = document.getElementById("payment1_btn");
    		var btn2 = document.getElementById("payment2_btn");
    		var btn3 = document.getElementById("payment3_btn");
    		
    		switch(num){
	    		case 1 : btn1.style.background = "#6babd5";
						 btn1.style.color = "white";
						 btn2.style.background = "white";
						 btn2.style.color = "black";
						 btn3.style.background = "white";
						 btn3.style.color = "black"; break;
	    		case 2 : btn2.style.background = "#6babd5";
						 btn2.style.color = "white";
						 btn1.style.background = "white";
						 btn1.style.color = "black";
						 btn3.style.background = "white";
						 btn3.style.color = "black"; break;
	    		case 3 : btn3.style.background = "#6babd5";
						 btn3.style.color = "white";
						 btn1.style.background = "white";
						 btn1.style.color = "black";
						 btn2.style.background = "white";
						 btn2.style.color = "black"; break;
    		}
    		
    	}
    	
    	function paySubmitCheck(){
    		var pay1 = document.getElementById("payment1");
    		var pay2 = document.getElementById("payment2");
    		var pay3 = document.getElementById("payment3");
    		
    		var price = ${ c.clPrice };
			var cPrice = document.getElementById("couponPrice").innerHTML.replace(",", "").substring(1, document.getElementById("couponPrice").innerHTML.length - 2);
			var pPrice = document.getElementById("pointPrice").innerHTML.replace(",", "").substring(1, document.getElementById("pointPrice").innerHTML.length - 2);;
    		document.getElementById("amount").value = price - cPrice - pPrice;
    		
    		if(pay1.checked == false && pay2.checked == false && pay3.checked == false){
    			alert("결제 방법을 선택해주세요.");
    			return false;
    		} else if(pointMessage == "change"){
    			alert("사용할 포인트 금액 변경 후에는 포인트 사용 버튼을 눌러주세요!");
    			return false;
    		} 
    		
    		return true;
    	}
    	
    </script>
    

   	<jsp:include page="../common/footerBar.jsp" />
</body>
</html>