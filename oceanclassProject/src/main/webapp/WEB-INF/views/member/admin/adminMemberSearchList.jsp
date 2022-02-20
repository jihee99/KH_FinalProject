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

<link rel="stylesheet" href="./resources/css/adminMemberList.css">

</head>
<body>

    <!-- 관리자 사이드바 연결하기 -->
    <jsp:include page="../../common/admin/adminSidebar.jsp" />

    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>전체 회원 관리</b>
        </div>
        <div class="head_2">
            <div class="head_2_left">
                <form id="searchForm" action="memsearch.ad">
                <input type="hidden" id="type" value="${type }">
                    <table>
                        <tr>
                            <th>회원분류</th>
                            <td>
                                <input type="radio" class="memberType" name="type" id="memT" value="T">
                                <label for="memT">강사</label>
                                <input type="radio" class="memberType" name="type" id="memS" value="S">
                                <label for="memS">일반회원</label>
                            </td>
                        </tr>
                        <tr>
                            <th>회원검색&nbsp;</th>
                            <td>
                                <input type="text" id="key" name="key" placeholder="회원명을 입력하세요" value="${key }"> 
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
                	<c:forEach var="m" items="${memlist }">
                    <tr>
                        <td><input type="checkbox" name="memChBxRow" id=""></td>
                        <td>${m.memNo }</td>
                        <td>${m.userId }</td>
                        <td>${m.userName }</td>
                        <td>${m.nickName }</td>
                        <td>${m.phone }</td>
                        <td>${m.enrollDate }</td>
                        <c:choose>
                        	<c:when test="${m.grade eq 'S'}">
	                        	<td style="color:rgb(90, 141, 236); font-weight: bolder;">
	                        		일반회원
	                        	</td>                        	
                        	</c:when>
                        	<c:otherwise>
                        		<td style="color:rgb(43, 133, 91); font-weight: bolder;">
	                        		강사회원
	                        	</td>
                        	</c:otherwise>
                        </c:choose>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button class="btn" onclick="location.href='blList.ad'">블랙리스트 조회</button>
            
        </div>
        <div class="btn_group" align="center">
        	
        	<c:choose>
           		<c:when test="${pi.currentPage eq 1 }">
           			<button class="btn btn-light" disabled>&lt;</button>
           		</c:when>
           		<c:otherwise>
           			<button class="btn btn-light" onclick="location.href='memlist.ad?cpage=${pi.currentPage - 1}&type=${type }&key=${key }'">&lt;</button>
           		</c:otherwise>
           	</c:choose>
                   
   			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
   				<button class="btn btn-light" onclick="location.href='memlist.ad?cpage=${p}&type=${type }&key=${key }'">${p }</button>
   			</c:forEach>
   
   			<c:choose>
               	<c:when test="${pi.currentPage eq pi.maxPage }">
           			<button class="btn btn-light" disabled>&gt;</button>
               	</c:when>
               	<c:otherwise>
               		<button class="btn btn-light" onclick="location.href='memlist.ad?cpage=${pi.currentPage + 1}&type=${type }&key=${key }'">&gt;</button>
               	</c:otherwise>
            </c:choose>
        </div>
        
		<script>
            var memArr = new Array();

            $(document).ready(function() {
				var type = $("#type").val();
				if(type == 'T'){
					$("#memT").prop("checked", true);
				}else if(type == 'S'){
					$("#memS").prop("checked", true);
				}
				
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
                /*
                $("#memS").click(function(){
                	location.href="sMemlist.ad?grade=S";
                })
				$("#memT").click(function(){
					location.href="tMemlist.ad?grade=T"
				})
				*/
			});
        </script>
        
    </div>

</body>
</html>