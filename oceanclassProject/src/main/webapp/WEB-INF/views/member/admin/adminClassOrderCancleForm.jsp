<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
    .outer{padding: 5px; text-align: center; width: 500px; height: 400px; margin: auto; box-sizing: border-box;}
    
    .orderTable{margin-left: 10px; text-align: left; width: 100%; margin-top: 30px; font-size: 14px; border-collapse: separate; line-height: 40px;}
    .outer h4{font-weight: 550; color: rgb(90, 90, 90);}
    .orderTable>tbody>th{text-align: left; padding-left: 20px;}
    .orderTable>tbody>tr>input{width: 100%;}
    button[type="submit"]{
        width: 120px; height: 40px; 
        border-radius: 10px; border: none; 
        background: rgb(107, 171, 213); color: white;
        font-size: 16px; font-weight: 550;    
    }
    .memTable{width: 100%; text-align: center; line-height: 20px;}
    .memTable>thead{background: lightgray;}
    
</style>
<meta charset="UTF-8">
<title>주문취소하기</title>
</head>
<body>
    <div class="outer">
            <table class="orderTable">
                <thead>
                    <tr>
                        <td colspan="2">
                            <h4>주문 취소 하기</h4>
                            <hr>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>주문번호</th>
                        <td>
                            <input type="text" value="${order.coNo }" name="coNo" style="width: 80%;" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>주문자명</th>
                        <td>
                            <input type="text" value="${order.userName }" name="" style="width: 80%;" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>취소사유</th>
                        <td>
                            <textarea name="reason" style="width: 80%; height: 100%;"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
            <button class="btn" align="center" type="submit" onclick="orderCancle();">취소접수</button>

        <script>
			function orderCancle(){
				console.log($("input[name=coNo]").val());
				console.log($("textarea[name=reason]").val());
				
				$.ajax({
	       			url:"corcancle.ad",
	       			data:{
	       				coNo:$("input[name=coNo]").val(),
	       				reason:$("textarea[name=reason]").val()
	       			},success:function(result){
	       				alert("결제 취소에 성공했습니다.");
	       				//console.log(result);
	       				opener.parent.location.reload();
	       				window.close();
	       			},error:function(){
	       				alert("결제 취소에 실패했습니다.");
	       				opener.parent.location.reload();
	       				window.close();
	       			}
	       		})
				
			}
			
        </script>
    </div>
</body>
</html>