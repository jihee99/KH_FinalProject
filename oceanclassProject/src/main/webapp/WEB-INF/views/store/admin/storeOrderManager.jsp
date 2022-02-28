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
<link rel="stylesheet" href="./resources/css/adminOrderList.css">
</head>
<body>
	<!-- 관리자 사이드바 연결하기 -->
    <jsp:include page="../../common/admin/adminSidebar.jsp" />
	
	
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>스토어 발주 관리</b>
        </div>
        <div class="content_1">
            
            <form action="">
                <table>
                    <tr>
                        <th width="100">진행상태</th>
                        <td width="300">
                            <input type="radio" class="orderType" name="orderrType" id="class">
                            <label for="class">대기</label>
                            &nbsp;&nbsp;&nbsp;
                            <input type="radio" class="orderType" name="orderrType" id="store">
                            <label for="store">완료</label>
                        </td>
                        <td width="80" rowspan="5">
                            <button type="submit" id="searchBtn">검색</button>
                        </td>
                    </tr>
                    <tr>
                        <th>기간검색</th>
                        <td>
                            <input type="date" name="startDate" id="">
                             -
                            <input type="date" name="endDate" id="">
                        </td>
                    </tr>
                    <tr>
                        <th>검색조건</th>
                        <td>
                            <select name="" id="">
                                <option value="">상품번호</option>
                                <option value="">상품명</option>
                                <option value="">품명</option>
                                <option value="">판매자</option>
                            </select>
                            <input type="text" name="" id="">
                        </td>
                    </tr>
                </table>
            </form>
        </div>


        <div class="content_2">
            <b>통합발주요청서목록(123)</b>
            <button id="deleteBtn" class="btn">목록삭제</button>
            <button id="printBtn" class="btn" style="background: steelblue;">출력</button>
            <br><br>
            <table id="orderTable">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="checkAll"></th>
                        <th width="100">상품번호</th>
                        <th width="200">상품명</th>
                        <th width="200">발주품목</th>
                        <th width="100">현재재고</th>
                        <th width="200">주문요청수량</th>
                        <th width="200">단가</th>
                        <th width="100">최종금액</th>
                        <th width="100">진행상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td class="orderNo">SO432</td>
                        <td>와플팬</td>
                        <td>와플팬 세척솔</td>
                        <td>2</td>
                        <td>20</td>
                        <td>2,000 <span>원</span> </td>
                        <td>40,000 <span>원</span> </td>
                        <td>
                            <button type="button" style="border: none; border-radius: 5px;">대기</button>
                        </td>
                    </tr>
                    
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td class="orderNo">SO432</td>
                        <td>와플팬</td>
                        <td>와플팬 세척솔</td>
                        <td>2</td>
                        <td>20</td>
                        <td>2,000 <span>원</span> </td>
                        <td>40,000 <span>원</span> </td>
                        <td>
                            <button type="button" style="background: steelblue; color: white; border: none; border-radius: 5px;">완료</button>
                        </td>
                    </tr> 
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td class="orderNo">SO432</td>
                        <td>와플팬</td>
                        <td>와플팬 세척솔</td>
                        <td>2</td>
                        <td>20</td>
                        <td>2,000 <span>원</span> </td>
                        <td>40,000 <span>원</span> </td>
                        <td>
                            <button type="button" style="background: steelblue; color: white; border: none; border-radius: 5px;">완료</button>
                        </td>
                    </tr>
                    


                </tbody>
            </table>
            <script>
                var memArr = new Array();

                $(document).ready(function() {

                    $("#checkAll").click(function() {
                        if($("#checkAll").is(":checked")) $("input[name=memChBxRow]").prop("checked", true);
                        else $("input[name=memChBxRow]").prop("checked", false);

                        putCheckList();
                    });
					
                    $("input[name=memChBxRow]").click(function() {
                        var total = $("input[name=memChBxRow]").length;
                        var checked = $("input[name=memChBxRow]:checked").length;
                        
                        if(total != checked) $("#checkAll").prop("checked", false);
                        else $("#checkAll").prop("checked", true);
                        
                        putCheckList();
                    });

                    /*삭제버튼 눌렀을 때*/
                    $("#deleteBtn").click(function() {
                        if(memArr.length == 0) {
                            console.log("체크항목없음");
                            return;
                        }

                        var str = "";
                        console.log(memArr);
                        for (var i = 0; i < memArr.length; i++) {
                            str += "번호"+ memArr[i].memNo + "\n";
                        }
                        console.log(str);

                    });

                    /*배열에 선택된 행 넣는 함수*/
                    function putCheckList(){
                        memArr = new Array();
                        var idxArr = new Array();

                        $("input[name=memChBxRow]:checked").each(function(){
                            idxArr.push($("input[name=memChBxRow]:checked").index(this));
                        });

                        for(var i=0; i<idxArr.length; i++){
                            var obj = new Object();
                            /*데이터값에 맞춰서 수정하기*/
                            obj.memNo = $("#orderTable tbody").children().eq(idxArr[i]).children().eq(1).text();
                            memArr.push(obj);
                        }
                    }
                    
                    /*검색버튼 눌렀을 때, 검색기간 무결성 검사*/
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
                        console.log(endDate);
                        
                });
                    
				/*상세페이지로 이동*/
				$(function(){
				    $("#orderTable tbody tr").click(function(){
				
				        /* 맞춰서 나중에 수정하기
				        location.href='detail.bo?bno=' + $(this).children(".bno").text();
				        */
				       console.log($(this).children(".orderNo").text());
				    })
				})

		});
        </script>
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

</body>
</html>