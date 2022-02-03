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

<link rel="stylesheet" href="./resources/css/adminMemberList.css">

</head>
<body>

    <!-- 관리자 사이드바 연결하기 -->
    <jsp:include page="../../common/admin/adminMain.jsp" />

    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>전체 회원 관리</b>
        </div>
        <div class="head_2">
            <div class="head_2_left">
                <form id="searchForm">
                    <table>
                        <tr>
                            <th>회원분류</th>
                            <td>
                                <input type="radio" class="memberType" name="memberType" id="memT">
                                <label for="memT">강사</label>
                                <input type="radio" class="memberType" name="memberType" id="memS">
                                <label for="memS">일반회원</label>
                            </td>
                        </tr>
                        <tr>
                            <th>회원검색</th>
                            <td>
                                <input type="text" id="searchKey" placeholder="회원명을 입력하세요"> 
                                <button type="submit">검색</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="head_2_center"></div>
            <div class="head_2_right" align="right">
                <button id="couponBtn" class="btn">쿠폰 일괄 지급</button>
            </div>
        </div>
        <div class="content">
            <table id="memTable">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="checkAll"></th>
                        <th width="100">회원번호</th>
                        <th width="150">아이디</th>
                        <th width="120">이름</th>
                        <th width="130">닉네임</th>
                        <th>휴대폰번호</th>
                        <th>가입일</th>
                        <th>회원분류</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>22205</td>
                        <td>user01</td>
                        <td>김땡땡</td>
                        <td>동그랑땡</td>
                        <td>010-1234-1234</td>
                        <td>2022-02-03</td>
                        <td style="color:rgb(90, 141, 236); font-weight: bolder;">일반회원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>22205</td>
                        <td>user01</td>
                        <td>김땡땡</td>
                        <td>동그랑땡</td>
                        <td>010-1234-1234</td>
                        <td>2022-02-03</td>
                        <td style="color:rgb(43, 133, 91); font-weight: bolder;">강사</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>22205</td>
                        <td>user01</td>
                        <td>김땡땡</td>
                        <td>동그랑땡</td>
                        <td>010-1234-1234</td>
                        <td>2022-02-03</td>
                        <td style="color:rgb(90, 141, 236); font-weight: bolder;">일반회원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>22205</td>
                        <td>user01</td>
                        <td>김땡땡</td>
                        <td>동그랑땡</td>
                        <td>010-1234-1234</td>
                        <td>2022-02-03</td>
                        <td style="color:rgb(90, 141, 236); font-weight: bolder;">일반회원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>22205</td>
                        <td>user01</td>
                        <td>김땡땡</td>
                        <td>동그랑땡</td>
                        <td>010-1234-1234</td>
                        <td>2022-02-03</td>
                        <td style="color:rgb(90, 141, 236); font-weight: bolder;">일반회원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>22205</td>
                        <td>user01</td>
                        <td>김땡땡</td>
                        <td>동그랑땡</td>
                        <td>010-1234-1234</td>
                        <td>2022-02-03</td>
                        <td style="color:rgb(90, 141, 236); font-weight: bolder;">일반회원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>22205</td>
                        <td>user01</td>
                        <td>김땡땡</td>
                        <td>동그랑땡</td>
                        <td>010-1234-1234</td>
                        <td>2022-02-03</td>
                        <td style="color:rgb(90, 141, 236); font-weight: bolder;">일반회원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>22205</td>
                        <td>user01</td>
                        <td>김땡땡</td>
                        <td>동그랑땡</td>
                        <td>010-1234-1234</td>
                        <td>2022-02-03</td>
                        <td style="color:rgb(90, 141, 236); font-weight: bolder;">일반회원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>22205</td>
                        <td>user01</td>
                        <td>김땡땡</td>
                        <td>동그랑땡</td>
                        <td>010-1234-1234</td>
                        <td>2022-02-03</td>
                        <td style="color:rgb(90, 141, 236); font-weight: bolder;">일반회원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>22205</td>
                        <td>user01</td>
                        <td>김땡땡</td>
                        <td>동그랑땡</td>
                        <td>010-1234-1234</td>
                        <td>2022-02-03</td>
                        <td style="color:rgb(90, 141, 236); font-weight: bolder;">일반회원</td>
                    </tr>
                </tbody>
            </table>
            <button class="btn">블랙리스트 조회</button>
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

                    /*쿠폰버튼 눌렀을 때*/
                    $("#couponBtn").click(function() {
                        if(memArr.length == 0) {
                        	/*나중에 alert로 수정하기*/
                            console.log("체크항목없음");
                            return;
                        }

                        var str = "";
                        console.log(memArr);
                        /*입력데이터에 맞춰서 수정하기*/
                        for (var i = 0; i < memArr.length; i++) {
                            str += "번호"+ memArr[i].memNo + "\n";
                        }
                        console.log(str);

                    });

                    function putCheckList(){
                        memArr = new Array();
                        var idxArr = new Array();

                        $("input[name=memChBxRow]:checked").each(function(){
                            idxArr.push($("input[name=memChBxRow]:checked").index(this));
                        });

                        for(var i=0; i<idxArr.length; i++){
                            var obj = new Object();
                            obj.memNo = $("#memTable tbody").children().eq(idxArr[i]).children().eq(1).text();
                            memArr.push(obj);
                        }
                    }

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