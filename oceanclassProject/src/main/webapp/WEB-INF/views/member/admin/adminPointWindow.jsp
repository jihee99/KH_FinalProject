<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 지급 페이지</title>
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
    button[id="submit"]{
        width: 120px; height: 40px; 
        border-radius: 10px; border: none; 
        background: rgb(107, 171, 213); color: white;
        font-size: 16px; font-weight: 550;    
    }
    
</style>

</head>
<body>

	<div class="outer">

	   <table >
	       <thead>
	           <tr>
	               <td colspan="2">
	                   <h4>개별 포인트 관리</h4>
	                   <hr>
	               </td>
	           </tr>
	       </thead>
	       <tbody>
	           <tr>
	               <th>회원아이디</th>
	               <td>
	                   <select class="ui search dropdown" id="memlist">
		                   <c:forEach var="m" items="${mlist }">
		                   		<option value="${m.memNo }">${m.userId } ${m.userName }</option>
		                   </c:forEach>
	                   </select>
	               </td>
	           </tr>
	           <tr>
	               <th>포인트내용</th>
	               <td>
	                   <input type="text" maxlength="20" name="reason" placeholder="최대 20글자">
	               </td>
	           </tr>
	           <tr>
	               <th>지급포인트</th>
	               <td>
	                   <input type="number" name="pointPrice">
	               </td>
	           </tr>
	           <tr>
	               <th>유효기간</th>
	               <td>
	                   <input type="date" name="deadLine">
	               </td>
	           </tr>
	       </tbody>
	   </table>
	   <br>
	   <button class="btn" align="center" id="submit" onclick="pointEnroll();">등록하기</button>
    </div>
    
    <script>
    	function pointEnroll(){
    		
    		var mno = $("#memlist option:selected").val();
    		var deadLine = $("input[name=deadLine]").val();
    		var pointPrice = $("input[name=pointPrice]").val();
    		var reason = $("input[name=reason]").val();
    		console.log(deadLine);
    		console.log(reason);
    		console.log(pointPrice);
    		console.log(mno);
    		
    		$.ajax({
    			url:"pgive.ad",
       			data:{
       				memNo:$("#memlist option:selected").val(),
       				deadLine:$("input[name=deadLine]").val(),
       				pointPrice:$("input[name=pointPrice]").val(),
       				reason:$("input[name=reason]").val()
       			},success:function(result){
       				alert("포인트 지급에 성공했습니다.");
       				//console.log(result);
       				opener.parent.location.reload();
       				window.close();
       			},error:function(){
       				alert("포인트 지급에 실패했습니다.");
       				opener.parent.location.reload();
       				window.close();
       			}
    			
    		});
    		
    		
    	}
    </script>

</body>
</html>