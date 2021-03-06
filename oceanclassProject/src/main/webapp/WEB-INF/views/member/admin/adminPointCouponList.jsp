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

<link rel="stylesheet" href="./resources/css/adminPointCouponList.css">
<style>
#pointBtn{
    float:right; margin-right: 20px;
    color: white; background: rgb(107, 171, 213); 
    font-weight: 600;
}
#pointBtn:hover{border: 1.5px solid rgb(107, 171, 213); color: rgb(107, 171, 213); background: none;}
</style>
</head>
<body>
    
    <!-- 관리자 사이드바 연결하기 -->
    <jsp:include page="../../common/admin/adminSidebar.jsp" />
    

    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>포인트 / 쿠폰 관리</b>
        </div>
        <div class="head_2">
            <div class="head_2_left">
                <form id="searchForm" action="pcsearch.ad">
                    <table>
                        <tr>
                            <th>분 &nbsp; &nbsp; &nbsp; 류</th>
                            <td>
                                <input type="radio" class="searchType" name="type" id="point" value="p">
                                <label for="point">포인트</label>
                                <input type="radio" class="searchType" name="type" id="coupon" value="c">
                                <label for="coupon">쿠폰</label>
                            </td>
                        </tr>
                        <tr>
                            <th>회원검색</th>
                            <td>
                                <input type="text" id="searchKey" placeholder="아이디를 입력하세요" name="key"> 
                                <button type="submit">검색</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="head_2_center"></div>
            <div class="head_2_right"></div>
        </div>
        <div class="content_point" style="display: none;">
        	<button class="btn" id="pointBtn" onclick="window.open('pgiveF.ad','포인트지급페이지','width=550, height=420, menubar=no, status=no, toolbar=no, resizable=no')">개별포인트관리</button>
            <br><br>
            <table id="contentTable">
                <thead>
                    <tr>
                        <th width="120">아이디</th>
                        <th width="120">회원명</th>
                        <th width="200">포인트내용</th>
                        <th width="100">지급포인트</th>
                        <th>지급일</th>
                        <th>만료일</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="p" items="${plist }">
                    <tr>
                        <td>${p.userId }</td>
                        <td>${p.userName }</td>
                        <td>${p.reason }</td>
                        <td>${p.pointPrice }</td>
                        <td>${p.pointDate }</td>
                        <td>${p.deadLine }</td>
                    </tr>
				</c:forEach>
                </tbody>
            </table>
            <br>
            <button class="btn" id="deleteBtn">선택목록삭제</button>
            <br>
            
			<div class="btn_group" align="center">
				<c:choose>
	           		<c:when test="${pPi.currentPage eq 1 }">
	           			<button class="btn btn-light" disabled>&lt;</button>
	           		</c:when>
	           		<c:otherwise>
	           			<button class="btn btn-light" onclick="location.href='pclist.ad?cpage=${pPi.currentPage - 1}'">&lt;</button>
	           		</c:otherwise>
	           	</c:choose>
	                   
	   			<c:forEach var="p" begin="${pPi.startPage }" end="${pPi.endPage }">
	   				<button class="btn btn-light" onclick="location.href='pclist.ad?cpage=${p}'">${p }</button>
	   			</c:forEach>
	   
	   			<c:choose>
	               	<c:when test="${pPi.currentPage eq pPi.maxPage }">
	           			<button class="btn btn-light" disabled>&gt;</button>
	               	</c:when>
	               	<c:otherwise>
	               		<button class="btn btn-light" onclick="location.href='pclist.ad?cpage=${pPi.currentPage + 1}'">&gt;</button>
	               	</c:otherwise>
	            </c:choose>
	        </div>
            
        </div>
   
<!-- 쿠폰영역 -->        
        <div class="content_coupon">
        	<button class="btn" id="couponBtn" onclick="window.open('cenrollF.ad','회원쿠폰지급페이지','width=550, height=380, menubar=no, status=no, toolbar=no, resizable=no')">쿠폰등록하기</button>
            <br><br>
            <table id="contentTable" style="table-layout:fixed;">
                <thead>
                    <tr>
                        <th width="110">쿠폰번호</th>
                        <th width="350">쿠폰명</th>
                        <th width="100">할인율(%)</th>
                         <th width="100">발행 수</th>
                         <th width="100">유효기간</th>
                        <th width="150"></th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="c" items="${clist }">
                    <tr>
                        <td>${c.couponNo }</td>
                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${c.couponName }</td>
                        <td>${c.discount }</td>
                        <td>${c.count }</td>
                        <td>${c.dedate }</td>
                        <td>
                            <button class="crow" onclick="window.open('cgiveF.ad?cno=${c.couponNo}','쿠폰등록페이지','width=550, height=500, menubar=no, status=no, toolbar=no, resizable=no')">발급</button>
                        	<button onclick="window.open('cupdateF.ad?cno=${c.couponNo}','쿠폰등록페이지','width=550, height=450, menubar=no, status=no, toolbar=no, resizable=no')">수정</button>
                        	<button onclick="location.href='cdelete.ad?cno=${c.couponNo}'">삭제</button>
                        </td>
                    </tr>
                    </c:forEach>                    
                </tbody>
            </table>
            <br>

	        <div class="btn_group" align="center">
				<c:choose>
	           		<c:when test="${cPi.currentPage eq 1 }">
	           			<button class="btn btn-light" disabled>&lt;</button>
	           		</c:when>
	           		<c:otherwise>
	           			<button class="btn btn-light" onclick="location.href='pclist.ad?cpage=${cPi.currentPage - 1}'">&lt;</button>
	           		</c:otherwise>
	           	</c:choose>
	                   
	   			<c:forEach var="p" begin="${cPi.startPage }" end="${cPi.endPage }">
	   				<button class="btn btn-light" onclick="location.href='pclist.ad?cpage=${p}'">${p }</button>
	   			</c:forEach>
	   
	   			<c:choose>
	               	<c:when test="${cPi.currentPage eq cPi.maxPage }">
	           			<button class="btn btn-light" disabled>&gt;</button>
	               	</c:when>
	               	<c:otherwise>
	               		<button class="btn btn-light" onclick="location.href='pclist.ad?cpage=${cPi.currentPage + 1}'">&gt;</button>
	               	</c:otherwise>
	            </c:choose>
	        </div>
		</div>


        <script>
            /*라디오 버튼에 따른 동적 화면 구현            */
            $("input[type=radio][class=searchType]").on('click',function(){
                var chkValue = $('input[type=radio][name=type]:checked').val();
				location.href="pcsearch.ad?key=&type="+$('input[type=radio][name=type]:checked').val();
                //console.log(chkValue);
				/*
                if(chkValue == "p"){
                    $('.content_point').css('display','block');
                    $('.content_coupon').css('display','none');
                } else if(chkValue == "c"){
                    $('.content_point').css('display','none');
                    $('.content_coupon').css('display','block');
                }
				*/
            });

        </script>
    </div>
    
    
</body>
</html>