<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/css/store/instructorStoreList.css">
</head>
<body>
	<div style="width: 1600px; height: auto; margin: auto;">
	<!-- 강사용 메뉴바 연결하기 -->
	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>

    <div class="innerOuter" align="center">
        <div class="content">
            <div class="menutitle">
            	<br><br>
                <b>내상품</b>
            </div>
            <br>
            
            <!-- loginUser가 teacher일때만 보여지게 하기 -->
			<c:choose>
			<c:when test="${loginUser ne null and loginUser.grade eq 'T'}">
				


            <div class="btn_area_1" align="right">
                <button class="btn btn-lg" onclick="location.href='stenrollF.in'">+상품추가하기</button>
            </div>
            
            <!-- 개별 상품 정보 보여지는 폼 -->
            <c:forEach var="p" items="${list }">
            <div class="contentBox">
            <input type="hidden" id="pno" value="${p.productNo }">
                <table>
                    <tr>
                        <td class="img_area">
                            <img src="${p.productImg0 }" style= "height:100%; background-color:none;">
                        </td>
                        <td width="700">
                            <table class="info_area">
                                <tr>
                                    <td><h3> ${p.title }</h3></td>
                                </tr>
                                <tr>
                                    <td>
                                    <c:choose>
                                    	<c:when test="${p.category eq 1}"> 클래스상품</c:when>
                                    	<c:when test="${p.category eq 2}"> OC 에디션</c:when>
                                    	<c:otherwise> DIY Kit</c:otherwise>
                                    </c:choose>
                                
                                    </td>
                                </tr>
                                <tr>
                                    <td>상품가격 : ${p.price }</td>
                                </tr>
                                <tr>
                                	<td><!-- 게시상태 : ${p.status} -->
                                	<c:choose>
                                    	<c:when test="${p.status eq 'Y'}">
                                    		게시중
                                    	</c:when>
                                    	<c:when test="${p.status eq 'N'}">
                                    		승인대기중
                                    	</c:when>
                                    </c:choose>
                                    </td>
                                </tr>   
                                <tr>
                                    <td class="btn_area_2">
                                        <button id="updateBtn" class="btn" onclick="location.href='stdetail.in?pno=${p.productNo}'">수정하기</button>
                                        <button id="deleteBtn" class="btn" onclick="location.href='stdelete.in?pno=${p.productNo}'">상품삭제하기</button>
                                    </td>
                                </tr>
                            </table>
    
                        </td>
                    </tr>	
                </table>
                <br>
            </div>
    		</c:forEach>

            <div class="btn_group" align="center">
            	<c:choose>
            		<c:when test="${pi.currentPage eq 1 }">
            			<button class="btn btn-light" disabled>&lt;</button>
            		</c:when>
            		<c:otherwise>
            			<button class="btn btn-light" onclick="location.href='stlist.in?cpage=${pi.currentPage - 1}'">&lt;</button>
            		</c:otherwise>
            	</c:choose>
                    
    			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
    				<button class="btn btn-light" onclick="location.href='stlist.in?cpage=${p}'">${p }</button>
    			</c:forEach>
    
    			<c:choose>
                   	<c:when test="${pi.currentPage eq pi.maxPage }">
               			<button class="btn btn-light" disabled>&gt;</button>
                   	</c:when>
                   	<c:otherwise>
                   		<button class="btn btn-light" onclick="location.href='stlist.in?cpage=${pi.currentPage + 1}'">&gt;</button>
                   	</c:otherwise>
                </c:choose>
            </div>
			</c:when>
			<c:otherwise>
				<script>
				alert("접근권한이 없습니다.");
				location.href='/oceanclass';
				</script>
			</c:otherwise>
			</c:choose>
        </div>
    </div>   
    </div>
</body>
</html>