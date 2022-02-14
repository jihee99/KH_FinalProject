<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수정 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
.outer{padding: 5px; text-align: center; width: 500px; height: 400px; margin: auto; box-sizing: border-box;}

.outer table{margin-left: 10px; text-align: left; width: 100%; margin-top: 30px; font-size: 14px; border-collapse: separate; line-height: 40px;}
.outer h4{font-weight: 550; font-size:23px; color: rgb(90, 90, 90);}
.outer th{text-align: left; padding-left: 20px;}
.outer tbody td *{height: 40px; width: 80%;}
.outer input[type="date"]{width: 80%;}
#addBtn{
    width: 120px; height: 40px; 
    border-radius: 10px; border: none; 
    background: rgb(107, 171, 213); color: white;
    font-size: 16px; font-weight: 550;    
}

</style>

</head>
<body>

	<div class="outer">
       
    	<table>
        	<thead>
               <tr>
                   <td colspan="2">
                       <h4>쿠폰 수정 하기</h4>
                       <hr>
                   </td>
               </tr>
           	</thead>
            <tbody>
                <tr>
                    <th>쿠폰명</th>
                    <td>
                    	<input id="couponNo" type="hidden" name="couponNo" value="${c.couponNo }">
                        <input id="couponName" name="couponName" type="text" maxlength="20" value="${c.couponName }" required>
                    </td>
                </tr>
                <tr>
                    <th>할인율(%)</th>
                    <td>
                        <input id="discount" type="number" name="discount" value="${c.discount }" required>
                    </td>
                </tr>
                <tr>
                    <th>최대발급수량</th>
                    <td>
                        <input id="maxCount" type="number" name="maxCount" value="${c.maxCount }" required>
                    </td>
                </tr>
                <tr>
                    <th>유효기간</th>
                    <td>
                        <input id="dedate" type="date" name="dedate" value="${c.dedate }">
                    </td>
                </tr>
            </tbody>
        </table>
		<br>
		<button id="addBtn" class="btn" align="center" onclick="upCoupon();">저장하기</button>
		<script>

	       	
	       	function upCoupon(){
	       		$.ajax({
	       			url:"cupdate.ad",
	       			data:{
	       				couponNo:$("#couponNo").val(),
	       				couponName:$("#couponName").val(),
	       				discount:$("#discount").val(),
	       				dedate:$("#dedate").val()
	       			},success:function(result){
	       				alert("쿠폰 정보 수정에 성공했습니다.");
	       				opener.parent.location.reload();
	       				window.close();
	       			},error:function(){
	       				alert("쿠폰 정보 수정에 실패했습니다.");
	       				opener.parent.location.reload();
	       				window.close();
	       			}
	       		})
	       	}
	       	
       </script>
    </div>
</body>
</html>