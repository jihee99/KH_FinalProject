<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
.inner_outer{
    margin: auto;
    font-family:tahoma, 나눔고딕, "Nanum Gothic", 맑은고딕, "Malgun Gothic", 돋움, dotum, helvetica, "Apple SD Gothic Neo", sans-serif;
}
.small_header{width: 100%; height: 50px;}
.small_header>span{font-weight: bold; font-family: 본고딕; font-size: 20px;}
.delivery, .refund{
    background:rgb(224, 226, 226);
    padding:20px;
    margin-bottom: 70px;
}
.messege_1, .messege_2{display: inline-block; margin-left: 20px;}
.confirm, .confirm2{margin-left: 20px;}
.fa-exclamation-circle, .fa-hand-holding-usd{float:left;}
</style>
</head>
<body>
	<div class="inner_outer">
        

            <div class="small_header">
                <span>배송일정</span>
            </div>
            <div class="delivery">
                <i class="fas fa-exclamation-circle fa-3x"></i>
                <span class="messege_1">배송 업체의 사정에 따라 2~7 영업일이 소요됩니다.</span>
                <br>
                <a href="" class="confirm" data-toggle="modal" data-target="#curier">택배사 확인</a>
            </div>

            
            <div class="small_header">
                <span>환불정책</span>
            </div>
            <div class="refund">
                <i class="fas fa-hand-holding-usd fa-3x"></i>
                <span class="messege_2">상품 개봉 및 훼손 없이, 배송 완료 후 7일 이내인 경우에만 <br>
                						환불이 가능합니다.</span>
                <br>
                &emsp;&emsp;&emsp;<a href="" class="confirm2" data-toggle="modal" data-target="#refund">환불정책 확인</a>
            </div>
    </div>
    
    <!-- 택배사 확인모달 -->
	  <div class="modal fade" id="curier">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">택배사 확인</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          	해당 상품의 택배사는  <b>${ p.courier }</b> 입니다.
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	  
	  <!-- 환불정책 모달 -->
  <div class="modal" id="refund">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h1 class="modal-title">환불정책</h1>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <h5>오션클래스 환불정책 안내</h5>
         <p> 하지만, 다음 어느 하나에 해당하는 경우에는 인터넷쇼핑몰 사업자의 의사에 반(反)해서 주문 취소 및 반품을 할 수 없습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제2항 본문 및 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조).
1. 소비자의 잘못으로 물건이 멸실(물건의 기능을 할 수 없을 정도로 전부 파괴된 상태)되거나 훼손된 경우(다만, 내용물을 확인하기 위해 포장을 훼손한 경우에는 취소나 반품이 가능)
2. 소비자가 사용해서 물건의 가치가 뚜렷하게 떨어진 경우
3. 시간이 지나 다시 판매하기 곤란할 정도로 물건의 가치가 뚜렷하게 떨어진 경우
4. 복제가 가능한 물건의 포장을 훼손한 경우
5. 용역 또는 「문화산업진흥 기본법」 제2조제5호의 디지털콘텐츠의 제공이 개시된 경우. 다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우에는 제공이 개시되지 않은 부분은 제외
6. 소비자의 주문에 따라 개별적으로 생산되는 상품 또는 이와 유사한 상품 등의 청약철회 및 계약해제를 인정하는 경우 인터넷쇼핑몰 사업자에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 주문 취소 및 반품이 되지 않는다는 사실을 별도로 알리고 소비자의 서면(전자문서 포함)에 의한 동의를 받은 경우
 인터넷쇼핑몰 사업자는 위 2.부터 5.까지의 사유에 해당하여 청약철회 등이 불가능한 상품에 대해 그 사실을 상품의 포장이나 그 밖에 소비자가 쉽게 알 수 있는 곳에 명확하게 적거나 시험 사용 상품을 제공하는 등의 방법으로 청약철회 등의 권리 행사가 방해받지 않도록 조치해야 합니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제6항 본문). 만약 사업자가 이와 같은 조치를 안했다면, 소비자는 청약철회 등의 제한사유에도 불구하고 청약철회 등을 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제2항 단서).
 다만, 위의 5. 중 디지털콘텐츠에 대하여 소비자가 청약철회 등을 할 수 없는 경우에는 청약철회 등이 불가능하다는 사실의 표시와 함께 다음의 어느 하나의 방법에 따라 시험 사용 상품을 제공하는 등의 방법으로 청약철회 등의 권리 행사가 방해받지 않도록 해야 합니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제6항 단서 및 규제「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의2).
√ 일부 이용의 허용: 디지털콘텐츠의 일부를 미리보기, 미리듣기 등으로 제공
√ 한시적 이용의 허용: 일정 사용기간을 설정하여 디지털콘텐츠 제공
√ 체험용 디지털콘텐츠 제공: 일부 제한된 기능만을 사용할 수 있는 디지털콘텐츠 제공
√ 위의 방법으로 시험 사용 상품 등을 제공하기 곤란한 경우: 디지털콘텐츠에 관한 정보 제공</p>

        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>