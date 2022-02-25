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
    
    .cTable{margin-left: 10px; text-align: left; width: 100%; margin-top: 30px; font-size: 14px; border-collapse: separate; line-height: 40px;}
    .outer h4{font-weight: 550; color: rgb(90, 90, 90);}
    .cTable>tbody>th{text-align: left; padding-left: 20px;}
    #cName, #deadDate{width: 80%;}
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
<title>쿠폰 지급용 화면</title>
</head>
<body>
    <div class="outer">

            <table class="cTable">
                <thead>
                    <tr>
                        <td colspan="2">
                            <h4>쿠폰 지급하기</h4>
                            <hr>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>쿠폰명</th>
                        <td>
                        	<input id="memNo" name="memNo" type="hidden" value=" ${loginUser.memNo }"> 
                        	<input id="couponNo" name="couponNo" type="hidden" value="${c.couponNo }">
                            <input id="discount" name="discount" type="hidden" value="${c.discount }">
                            <input id="dedate" name ="dedate" type="hidden" value="${c.dedate}">
                            <input id="couponName" name="couponName" type="text" value="${c.couponName }" readonly style="width:80%;">
                        </td>
                    </tr>
                    <tr>
                        <th>회원선택</th>
                        <td>
                            <div style="width: 80%; height: 150px; overflow:auto;">
                            <table class="memTable" border="1">
                                <thead>
                                    <tr>
                                        <th width="20"><input type="checkbox" id="checkAll"></th>
                                        <th width="80">회원번호</th>
                                        <th>아이디</th>
                                        <th>회원명</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="m" items="${mlist }">
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" value="${m.memNo }"></th>
                                        <td>
                                        	${m.memNo }
                                        	<input type="hidden" class="memNo" value="${m.memNo }">
                                        </td>
                                        <td>${m.userId }</td>
                                        <td>${m.userName }</td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <input type="hidden" name="hiddenList" id="hiddenList" value="">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>유효기간</th>
                        <td>
                            <input id="deadDate" type="date" value="${c.dedate }">
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
            <button class="btn" align="center" type="submit" onclick="fnGetData();">지급하기</button>

        <script>
			function fnGetData(){
	            var chkArr = new Array();
				var hiddenList 
	            $('input:checkbox[name=chBxRow]:checked').each(function(){
	            	chkArr.push(this.value);
	            });
				$('#hiddenList').val(chkArr);
				//alert($('#hiddenList').val());	

				$.ajax({
	       			url:"cgive.ad",
	       			data:{
	       				couponNo:$("#couponNo").val(),
	       				deDate:$("#deadDate").val(),
	       				hiddenList:$('#hiddenList').val()
	       			},success:function(result){
	       				alert("쿠폰 발행에 성공했습니다.");
	       				//console.log(result);
	       				opener.parent.location.reload();
	       				window.close();
	       			},error:function(){
	       				alert("쿠폰 발행에 실패했습니다.");
	       				opener.parent.location.reload();
	       				window.close();
	       			}
	       		})
				
			}
			

            $(document).ready(function() {
			
                $("#checkAll").click(function() {
                    if($("#checkAll").is(":checked")) $("input[name=chBxRow]").prop("checked", true);
                    else $("input[name=chBxRow]").prop("checked", false);
                });
            });
        </script>
    </div>
</body>
</html>