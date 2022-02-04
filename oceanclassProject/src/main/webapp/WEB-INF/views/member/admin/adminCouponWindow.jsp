<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                            <input id="cName" type="text" maxlength="20" placeholder="★설맞이 깜짝 10%할인쿠폰★" readonly>
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
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" id=""></th>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>김땡땡</td>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" id=""></th>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>김땡땡</td>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" id=""></th>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>김땡땡</td>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" id=""></th>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>김땡땡</td>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" id=""></th>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>김땡땡</td>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" id=""></th>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>김땡땡</td>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" id=""></th>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>김땡땡</td>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" id=""></th>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>김땡땡</td>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" id=""></th>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>김땡땡</td>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="chBxRow" id=""></th>
                                        <td>001</td>
                                        <td>user01</td>
                                        <td>김땡땡</td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>유효기간</th>
                        <td>
                            <input id="deadDate" type="date" name="" id="">
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
            <button class="btn" align="center" type="submit">지급하기</button>

        <script>

            var chkArr = new Array();

            $(document).ready(function() {

                $("#Allcheck").click(function() {
                    if($("#Allcheck").is(":checked")) $("input[name=chBxRow]").prop("checked", true);
                    else $("input[name=chBxRow]").prop("checked", false);

                    putCheckList();
                });
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

                /* 지급하기 눌렀을 때*/
                $(".btn").click(function() {
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
                        obj.memNo = $(".memTable tbody").children().eq(idxArr[i]).children().eq(1).text();
                        chkArr.push(obj);
                    }

                    /*회원 잘 담기는지 확인!!*/
                    console.log("idxArr:"+idxArr);
                    console.log("chkArr"+chkArr);
                }

            });
        </script>
    </div>
</body>
</html>