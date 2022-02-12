<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <select name="" id="">
                                <option value="">주문번호</option>
                                <option value="">아이디</option>
                                <option value="">주문자명</option>
                            </select>
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
                        <th width="100">게시분류</th>
                        <th width="100">신고글번호</th>
                        <th width="300">신고글내용</th>
                        <th width="200">신고내용</th>
                        <th width="100">처리상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>123</td>
                        <td>댓글</td>
                        <td>12</td>
                        <td>어쩌라구요; JONNA 노잼인데요</td>
                        <td>욕설 및 비방</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>123</td>
                        <td>스토어리뷰</td>
                        <td>22</td>
                        <td>가나다라마바사아자차카타파하</td>
                        <td>욕설 및 비방</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>123</td>
                        <td>클래스리뷰</td>
                        <td>22</td>
                        <td>재미없는데 환불도안해줌;;</td>
                        <td>욕설 및 비방</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>123</td>
                        <td>클래스리뷰</td>
                        <td>22</td>
                        <td>재미없는데 환불도안해줌;;</td>
                        <td>욕설 및 비방</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>123</td>
                        <td>클래스리뷰</td>
                        <td>22</td>
                        <td>재미없는데 환불도안해줌;;</td>
                        <td>욕설 및 비방</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>123</td>
                        <td>클래스리뷰</td>
                        <td>22</td>
                        <td>재미없는데 환불도안해줌;;</td>
                        <td>욕설 및 비방</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>123</td>
                        <td>클래스리뷰</td>
                        <td>22</td>
                        <td>재미없는데 환불도안해줌;;</td>
                        <td>욕설 및 비방</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>123</td>
                        <td>클래스리뷰</td>
                        <td>22</td>
                        <td>재미없는데 환불도안해줌;;</td>
                        <td>욕설 및 비방</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>123</td>
                        <td>클래스리뷰</td>
                        <td>22</td>
                        <td>재미없는데 환불도안해줌;;</td>
                        <td>욕설 및 비방</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>123</td>
                        <td>클래스리뷰</td>
                        <td>22</td>
                        <td>재미없는데 환불도안해줌;;</td>
                        <td>욕설 및 비방</td>
                        <td>Y</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div style="float:left; margin-top:10px;">
    		<button id="bBtn" class="btn btn-sm" style="background: rgb(172, 1, 1); font-size: 16px; color: white;">블랙리스트 목록 보기</button>
        </div>
        <div class="btn_group" align="center">
            <button class="btn btn-light">&lt;</button>

            <button class="btn btn-light">1</button>
            <button class="btn btn-light">2</button>
            <button class="btn btn-light">3</button>
            <button class="btn btn-light">4</button>
            <button class="btn btn-light">5</button>

            <button class="btn btn-light">&gt;</button>
        </div>
	</div>
	
	<script>	    	
		var reportArr = new Array();
		
		$(document).ready(function() {
			$("#checkAll").click(function() {
				if($("#checkAll").is(":checked")) $("input[name=chBxRow]").prop("checked", true);
				else $("input[name=chBxRow]").prop("checked", false);
				putCheckList();
			});
		});
		      
		$("input[name=chBxRow]").click(function() {
			var total = $("input[name=chBxRow]").length;
			var checked = $("input[name=chBxRow]:checked").length;
		  
			if(total != checked) $("#checkAll").prop("checked", false);
			else $("#checkAll").prop("checked", true);
			putCheckList();
		});
		
		/*쿠폰버튼 눌렀을 때*/
		$("#deleteBtn").click(function() {
			if(reportArr.length == 0) {
				console.log("체크항목없음");
				return;
			}
			var str = "";
			console.log(reportArr);
			for (var i = 0; i < reportArr.length; i++) {
				str += "번호"+ reportArr[i]/*.파라미터명*/ + "\n";
			}
			console.log(str);
		});
		
		function putCheckList(){
			reportArr = new Array();
			var idxArr = new Array();
		
			$("input[name=memChBxRow]:checked").each(function(){
			idxArr.push($("input[name=memChBxRow]:checked").index(this));
			});
		
			for(var i=0; i<idxArr.length; i++){
				var obj = new Object();
				obj/*.파라미터명*/ = $("#reportTable tbody").children().eq(idxArr[i]).children().eq(1).text();
				reportArr.push(obj);
			}
		}
		
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
		
		     
	</script>
</body>
</html>