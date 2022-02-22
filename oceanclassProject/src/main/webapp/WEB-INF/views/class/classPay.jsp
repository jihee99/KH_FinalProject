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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    
    <div class="outer">
        <div class="top" align="center">주문/결제</div>

        <div class="cate">주문 정보</div>

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
                <input type="text" class="form-control" style="width: 300px; float: left;" placeholder="0원" readonly>
                <button type="button" class="btn" style="background-color: #6babd5;color: white; width:120px;">쿠폰 사용</button>
                <button type="button" class="btn" style="background-color: lightgray; color: white; width:120px; margin-left:-4px;">사용 해제</button>
                <div style="font-size: 14px; color:grey; margin-top: 5px;">사용가능한 쿠폰: ${ couponList.size() }개</div>
            </div>

            <div style="margin-top: 20px;">
                <div>포인트</div>
                <input type="text" class="form-control" style="width: 300px; float: left;" placeholder="0원">
                <button type="button" class="btn" style="background-color: #6babd5;color: white; width:120px;">포인트 사용</button>
                <div style="font-size: 14px; color:grey; margin-top: 5px;">사용가능한 포인트: <fmt:formatNumber value="${ loginUser.point }" type="number" />원</div>
            </div>
        </div>

        <div class="amount">
            <div class="cate">결제 금액</div>
            
            <div>
                <table class="amountTable">
                    <tr style="background-color: lightgray; color: gray;">
                        <td>총 상품 금액</td>
                        <td>총 할인 금액</td>
                    </tr>
                    <tr style="color: gray;">
                        <td><fmt:formatNumber value="${ c.clPrice }" type="number" />원</td>
                        <td>-10,000원</td>
                    </tr>
                    <tr style="background-color: lightgray;">
                        <td></td>
                        <td>최종 결제 금액</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><b>89,000원</b></td>
                    </tr>
                </table>
            </div>
            
            <div class="pay">
                <div class="cate">결제 방식</div>
                
                <div>
                    <button type="button" class="btn" style="border:1px solid #6babd5; width:200px;">카드 결제</button>
                    <button type="button" class="btn" style="border:1px solid #6babd5; width:200px;">무통장 입금</button>
                    <button type="button" class="btn" style="border:1px solid #6babd5; width:200px;">카카오 페이</button>
                </div>
                
                <div align="center">
                    <button type="submit" class="btn" style="background-color: #6babd5; width:600px; color: white; margin-top: 100px; font-weight: bold; font-size: 20px;">결제 하기</button>
                </div>
            </div>


        </div>


    </div>

   	<jsp:include page="../common/footerBar.jsp" />
</body>
</html>