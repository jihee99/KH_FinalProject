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

<link rel="stylesheet" href="./resources/css/adminPointCouponList.css">

</head>
<body>

    <!-- 관리자 사이드바 연결하기 -->
    <jsp:include page="../../common/admin/adminMain.jsp" />

    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>포인트 / 쿠폰 관리</b>
        </div>
        <div class="head_2">
            <div class="head_2_left">
                <form id="searchForm">
                    <table>
                        <tr>
                            <th>분 &nbsp;&nbsp;&nbsp; 류</th>
                            <td>
                                <input type="radio" class="searchType" name="searchType" id="point">
                                <label for="point">포인트</label>
                                <input type="radio" class="searchType" name="searchType" id="coupon">
                                <label for="coupon">쿠폰</label>
                            </td>
                        </tr>
                        <tr>
                            <th>회원검색</th>
                            <td>
                                <input type="text" id="searchKey" placeholder="아이디를 입력하세요"> 
                                <button type="submit">검색</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="head_2_center"></div>
            <div class="head_2_right"></div>
        </div>
        <div class="content">
            <table id="couponTable">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="checkAll"></th>
                        <th width="120">아이디</th>
                        <th width="120">회원명</th>
                        <th width="200">쿠폰명</th>
                        <th width="100">할인율(%)</th>
                        <th width="80">사용여부</th>
                        <th>지급일</th>
                        <th>만료일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>user01</td>
                        <td>손지희</td>
                        <td>설날맞이 특별할인 ★☆10% 깜짝쿠폰☆★</td>
                        <td>10</td>
                        <td>N</td>
                        <td>2022-02-01 12:00:00</td>
                        <td>2022-02-08 12:00:00</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>user01</td>
                        <td>손지희</td>
                        <td>설날맞이 특별할인 ★☆10% 깜짝쿠폰☆★</td>
                        <td>10</td>
                        <td>N</td>
                        <td>2022-02-01 12:00:00</td>
                        <td>2022-02-08 12:00:00</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>user01</td>
                        <td>손지희</td>
                        <td>설날맞이 특별할인 ★☆10% 깜짝쿠폰☆★</td>
                        <td>10</td>
                        <td>N</td>
                        <td>2022-02-01 12:00:00</td>
                        <td>2022-02-08 12:00:00</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>user01</td>
                        <td>손지희</td>
                        <td>설날맞이 특별할인 ★☆10% 깜짝쿠폰☆★</td>
                        <td>10</td>
                        <td>N</td>
                        <td>2022-02-01 12:00:00</td>
                        <td>2022-02-08 12:00:00</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>user01</td>
                        <td>손지희</td>
                        <td>설날맞이 특별할인 ★☆10% 깜짝쿠폰☆★</td>
                        <td>10</td>
                        <td>N</td>
                        <td>2022-02-01 12:00:00</td>
                        <td>2022-02-08 12:00:00</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>user01</td>
                        <td>손지희</td>
                        <td>설날맞이 특별할인 ★☆10% 깜짝쿠폰☆★</td>
                        <td>10</td>
                        <td>N</td>
                        <td>2022-02-01 12:00:00</td>
                        <td>2022-02-08 12:00:00</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>user01</td>
                        <td>손지희</td>
                        <td>설날맞이 특별할인 ★☆10% 깜짝쿠폰☆★</td>
                        <td>10</td>
                        <td>N</td>
                        <td>2022-02-01 12:00:00</td>
                        <td>2022-02-08 12:00:00</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>user01</td>
                        <td>손지희</td>
                        <td>설날맞이 특별할인 ★☆10% 깜짝쿠폰☆★</td>
                        <td>10</td>
                        <td>N</td>
                        <td>2022-02-01 12:00:00</td>
                        <td>2022-02-08 12:00:00</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>user01</td>
                        <td>손지희</td>
                        <td>설날맞이 특별할인 ★☆10% 깜짝쿠폰☆★</td>
                        <td>10</td>
                        <td>N</td>
                        <td>2022-02-01 12:00:00</td>
                        <td>2022-02-08 12:00:00</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBxRow" id=""></td>
                        <td>user01</td>
                        <td>손지희</td>
                        <td>설날맞이 특별할인 ★☆10% 깜짝쿠폰☆★</td>
                        <td>10</td>
                        <td>N</td>
                        <td>2022-02-01 12:00:00</td>
                        <td>2022-02-08 12:00:00</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <br>
        <button class="btn" id="deleteBtn">선택목록삭제</button>
        <button class="btn" id="couponBtn">개별쿠폰관리</button>
        <br>

        <div class="btn_group" align="center">
            <button class="btn btn-light">&lt;</button>

            <button class="btn btn-light">1</button>
            <button class="btn btn-light">2</button>
            <button class="btn btn-light">3</button>
            <button class="btn btn-light">4</button>
            <button class="btn btn-light">5</button>

            <button class="btn btn-light">&gt;</button>
        </div>
        <script>
            var chkArr = new Array();

            $(document).ready(function() {

                $("#checkAll").click(function() {
                    if($("#checkAll").is(":checked")) $("input[name=chBxRow]").prop("checked", true);
                    else $("input[name=chBxRow]").prop("checked", false);

                    putCheckList();
                });
                
                $("input[name=chBxRow]").click(function() {
                    var total = $("input[name=chBxRow]").length;
                    var checked = $("input[name=chBxRow]:checked").length;
                    
                    if(total != checked) $("#checkAll").prop("checked", false);
                    else $("#checkAll").prop("checked", true);
                    
                    putCheckList();
                });

                /* 선택삭제 눌렀을 때*/
                $("#deleteBtn").click(function() {
                    if(chkArr.length == 0) {
                        console.log("체크항목없음");
                        return;
                    }

                    var str = "";
                    console.log(chkArr);
                    for (var i = 0; i < chkArr.length; i++) {
                        str += "번호"+ chkArr[i].memNo + "\n";
                    }
                    console.log(str);

                });

                function putCheckList(){
                    chkArr = new Array();
                    var idxArr = new Array();

                    $("input[name=chBxRow]:checked").each(function(){
                        idxArr.push($("input[name=chBxRow]:checked").index(this));
                    });

                    for(var i=0; i<idxArr.length; i++){
                        var obj = new Object();
                        /*나중에 쿠폰 번호 맞춰서 수정하기*/
                        obj.memNo = $("#couponTable tbody").children().eq(idxArr[i]).children().eq(1).text();
                        chkArr.push(obj);
                    }
                }

            });
        </script>
    </div>

</body>
</html>