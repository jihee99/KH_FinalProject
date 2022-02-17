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

<link rel="stylesheet" href="./resources/css/adminReportList.css">
</head>
<body>

    <!-- 관리자 사이드바 연결하기 -->
    <jsp:include page="../../common/admin/adminSidebar.jsp" />
    
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>신고 내역 조회</b>
        </div>
        <br>
        <div class="content_1">
            <b>통합신고검색</b>
            <form action="">
                <table>
                    <tr>
                        <th>기간 검색</th>
                        <td>
                            <input type="date" name="startDate" id="">
                             -
                            <input type="date" name="endDate" id="">
                        </td>
                        <td width="80" rowspan="5">
                            <button type="submit" id="searchBtn">검색</button>
                        </td>
                    </tr>
                    <tr>
                        <th width="100">게시 상태</th>
                        <td width="300">
                            <input type="radio" class="orderType" name="orderrType" id="class">
                            <label for="class">정상게시</label>
                            &nbsp;&nbsp;&nbsp;
                            <input type="radio" class="orderType" name="orderrType" id="store">
                            <label for="store">삭제</label>
                        </td>
                    </tr>
                    <tr>
                        <th>검색조건</th>
                        <td>
                            <input type="text" name="" id="">
                        </td>
                    </tr>
                </table>
            </form>
        </div>


        <div class="content_2">
            <button id="reBtn" class="btn btn-sm">복구하기</button>
            <button id="deBtn" class="btn btn-sm">선택삭제</button>
            <table id="reportTable">
                <thead>
                    <tr>
                        <th width="30"><input type="checkbox" id="checkAll"></th>
                        <th width="100">신고번호</th>
                        <th width="20"></th>
                        <th width="100">게시분류</th>
                        <th width="100">신고글번호</th>
                        <th width="250">신고내용</th>
                        <th width="100">처리상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="report" items="${rpList }">
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td class="rpNo">${report.reportNo }</td>
                        <td class="category">${report.refCategory }</td>
						<td>
                        	<c:choose>
                        		<c:when test="${report.refCategory eq 'SR'}">
                        			스토어 리뷰
                        		</c:when>
                        		<c:when test="${report.refCategory eq 'CR'}">클래스 리뷰</c:when>
                        		<c:otherwise>댓글</c:otherwise>
                        	</c:choose>
                        </td>
                        <td>${report.refBNo }</td>
                        <td>${report.content }</td>
                        <td>${report.status }</td>
                    </tr>              
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div style="float:left; margin-top:10px;">
    		<button id="bBtn" class="btn btn-sm" style="background: rgb(172, 1, 1); font-size: 16px; color: white;" onclick="location.href='blList.ad'">블랙리스트 목록 보기</button>
        </div>
        <div class="btn_group" align="center">
			<c:choose>
           		<c:when test="${pi.currentPage eq 1 }">
           			<button class="btn btn-light" disabled>&lt;</button>
           		</c:when>
           		<c:otherwise>
           			<button class="btn btn-light" onclick="location.href='rplist.ad?cpage=${pi.currentPage - 1}'">&lt;</button>
           		</c:otherwise>
           	</c:choose>
                   
   			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
   				<button class="btn btn-light" onclick="location.href='rplist.ad?cpage=${p}'">${p }</button>
   			</c:forEach>
   
   			<c:choose>
               	<c:when test="${pi.currentPage eq sPi.maxPage }">
           			<button class="btn btn-light" disabled>&gt;</button>
               	</c:when>
               	<c:otherwise>
               		<button class="btn btn-light" onclick="location.href='rplist.ad?cpage=${pi.currentPage + 1}'">&gt;</button>
               	</c:otherwise>
            </c:choose>
        </div>
	</div>
	
	<script>
	
		function classDelete(){
			var chkArr = new Array();
			
			$('input:checkbox[name=classChkRow]:checked').each(function(){
	        	chkArr.push(this.value);
	        });
			
			$('#hiddenList1').val(chkClassArr);
		}
		
		$(document).ready(function() {
			$("#checkAll").click(function() {
				if($("#checkAll").is(":checked")) $("input[name=chBxRow]").prop("checked", true);
				else $("input[name=chBxRow]").prop("checked", false);
			});
		});
		  
		
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
			console.log(endDate)      
		});
		
		$("#reportTable tbody tr").click(function(){
			var cat = $(this).children(".category").text();
			console.log(cat);

			location.href='rpdetail.ad?rpno=' + $(this).children(".rpNo").text() + '&category=' + $(this).children(".category").text();
		});

		
		
		     
	</script>
</body>
</html>