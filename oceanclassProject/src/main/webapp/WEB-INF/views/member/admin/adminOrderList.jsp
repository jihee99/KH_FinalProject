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
    <jsp:include page="../../common/admin/adminMain.jsp" />
	
	
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>주문 내역 관리</b>
        </div>
        <div class="content_1">
            <b>통합주문 검색</b>
            <form action="">
                <table>
                    <tr>
                        <th width="100">주문분류</th>
                        <td width="300">
                            <input type="radio" class="orderType" name="orderrType" id="class">
                            <label for="class">클래스</label>
                            &nbsp;&nbsp;&nbsp;
                            <input type="radio" class="orderType" name="orderrType" id="store">
                            <label for="store">일반회원</label>
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
                        <th>주문상태</th>
                        <td>
                            <label><input type="checkbox" name="" id="">주문접수</label>&nbsp;&nbsp;
                            <label><input type="checkbox" name="" id="">결제완료</label>&nbsp;&nbsp;
                            <label><input type="checkbox" name="" id="">상품준비</label>&nbsp;&nbsp;
                            <label><input type="checkbox" name="" id="">배송시작</label>&nbsp;&nbsp;
                            <br>
                            <label><input type="checkbox" name="" id="">배송중</label>&nbsp;&nbsp;
                            <label style="color: green;"><input type="checkbox" name="" id="">배송완료</label>&nbsp;&nbsp;
                            <label style="color: red;"><input type="checkbox" name="" id="">취소접수</label>&nbsp;&nbsp;
                            <label><input type="checkbox" name="" id="">취소완료</label>&nbsp;&nbsp;
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
            <b>통합주문목록(123)</b>
            <button id="deleteBtn" class="btn">삭제</button>
            <table id="orderTable">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="checkAll"></th>
                        <th width="100">주문번호</th>
                        <th width="100">주문분류</th>
                        <th width="100">주문자명</th>
                        <th width="!00">총금액</th>
                        <th width="100">주문상태</th>
                        <th width="200">주문일자</th>
                        <th width="200">취소일자</th>
                        <th width="100">결제방법</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td class="orderNo">CO432</td>
                        <td>클래스</td>
                        <td>김땡땡</td>
                        <td>75,000</td>
                        <td>주문접수</td>
                        <td>2022-02-03 12:24:32</td>
                        <td>--</td>
                        <td>카드</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td class="orderNo">CO431</td>
                        <td>클래스</td>
                        <td>김땡땡</td>
                        <td>75,000</td>
                        <td style="color: blue;">취소완료</td>
                        <td>2022-02-02 12:24:32</td>
                        <td>2022-02-02 14:24:32</td>
                        <td>카드</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td class="orderNo">CO430</td>
                        <td>클래스</td>
                        <td>김땡땡</td>
                        <td>75,000</td>
                        <td style="color: red;">취소접수</td>
                        <td>2022-02-02 12:24:32</td>
                        <td>2022-02-02 14:24:32</td>
                        <td>무통장</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td class="orderNo">PO431</td>
                        <td>스토어</td>
                        <td>김땡땡</td>
                        <td>75,000</td>
                        <td style="color: green;">배송완료</td>
                        <td>2022-02-02 12:24:32</td>
                        <td>--</td>
                        <td>카드</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td class="orderNo">PO431</td>
                        <td>스토어</td>
                        <td>김땡땡</td>
                        <td>75,000</td>
                        <td style="color: blue;">취소완료</td>
                        <td>2022-02-02 12:24:32</td>
                        <td>2022-02-02 14:24:32</td>
                        <td>무통장</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>PO431</td>
                        <td>스토어</td>
                        <td>김땡땡</td>
                        <td>75,000</td>
                        <td style="color: green;">배송완료</td>
                        <td>2022-02-02 12:24:32</td>
                        <td>--</td>
                        <td>카드</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>PO431</td>
                        <td>스토어</td>
                        <td>김땡땡</td>
                        <td>75,000</td>
                        <td style="color: green;">배송완료</td>
                        <td>2022-02-02 12:24:32</td>
                        <td>--</td>
                        <td>카드</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>PO431</td>
                        <td>스토어</td>
                        <td>김땡땡</td>
                        <td>75,000</td>
                        <td>배송중</td>
                        <td>2022-02-02 12:24:32</td>
                        <td>--</td>
                        <td>카드</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>PO431</td>
                        <td>스토어</td>
                        <td>김땡땡</td>
                        <td>75,000</td>
                        <td>배송중</td>
                        <td>2022-02-02 12:24:32</td>
                        <td>--</td>
                        <td>카드</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>PO431</td>
                        <td>스토어</td>
                        <td>김땡땡</td>
                        <td>75,000</td>
                        <td>배송중</td>
                        <td>2022-02-02 12:24:32</td>
                        <td>--</td>
                        <td>카드</td>
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