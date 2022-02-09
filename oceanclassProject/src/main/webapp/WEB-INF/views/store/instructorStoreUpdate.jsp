<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<link rel="stylesheet" href="./resources/css/store/storeEnrollPage.css">
<title>Insert title here</title>
</head>
<body>

	<script>
		$(function(){
			var max = 5;	// 옵션 추가 가능한 최댓값
			var index = ${opIndex}; 	// length 구하기	
			var wrapper1 = $("#append1")
			var wrapper2 = $("#append2");	// 옵션 추가될 영역
			
			$('#insBtn').click(function(){
				if(index<=max){
					var fieldHTML = '<div><input name="optionNo" type="hidden"><input class="opStyle1" name="optionName" type="text" placeholder="옵션명" style="width:70%; margin-left:70px; line-height:29px; margin-right:2px;"><a href="#" class="delBtn2">삭제</a></div>';
					$('#append2').append(fieldHTML);		//add field
					index++;	// 카운트 증가
				}else{
					alert("더이상 옵션을 추가할 수 없습니다!");
				}
			});
			
			$(wrapper1).on("click", ".delBtn1", function(e){
				e.preventDefault();
				$(this).parent('div').remove();
				index--;	
			});
			
			$(wrapper2).on("click", ".delBtn2", function(e){
				e.preventDefault();
				$(this).parent('div').remove();
				index--;	
			});
			
		})
	</script>
	
	<!-- 강사용 메뉴바 연결하기 	-->
	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
	 	
	 <div class="innerOuter">
        <div class="content">
            <div class="headMenu">
            	<br>
                <b>상품수정하기</b>
            </div>
            <br>
            <form method="post" action="stupdate.in" enctype="multipart/form-data">
                <table id="pInfo">
                    <thead>
                        <tr>
                            <th colspan="2" style="float:left; font-size:15px;">상품기본정보</th>
                        </tr>
                        <tr>
                            <td style="line-height: 10px;">
                            	&nbsp;
                            	<input type="hidden" name="productNo" value="${p.productNo }">
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th style="width: 140px;">카테고리</th>
                            <td style="width: 750px;">
                                <select name="category" required>
                                    <option value="1">클래스상품</option>
                                    <option value="2">OC 에디션</option>
                                    <option value="3">DIY 키트</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>상품명</th>
                            <td><input name="title" type="text" value="${p.title }" required></td>
                        </tr>
                        <tr>
                            <th>상품가격</th>
                            <td><input name="price" type="number" value="${p.price }" required></td>
                        </tr>
                        <tr>
                        	<th>옵션여부</th>
                        	<td>
                        		<input type="button" class="btn btn-light" id="insBtn" value="+" style="width:40px;">
							<td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        		<div id="append1" style="margin-left:50px; width:700px;">
								<c:forEach var="op" items="${oplist }">
									<div>
										<input name="optionName" type="text" value="${op.optionName }" style="width:70%; margin-left:70px; line-height:29px; margin-right:2px;">
										<input name="optionNo" type="hidden" value="${op.optionNo }">
										<a href="#" class="delBtn1">삭제</a>
									</div>
								</c:forEach>
                        		</div>
                        		<div id="append2" style="margin-left:50px; width:700px;">
					
                        		</div>
                        	</td>
                        </tr>
                        <tr>
                            <th>대표이미지</th>
                            <td class="detail">
                                대표이미지는 홈페이지 메인화면에 보여질 이미지 입니다.
                                상품을 나타내는 대표 이미지를 선택해주세요.
                            </td>
                        </tr>
                        <tr class="atLine">
                            <th></th>
                            <td>
                            	<input type="file" id="upfiles" name="reupfile"><br>
								<c:if test="${ p.productImg0 ne null }">
	                         	현재 파일 : 
	                            <a href="${p.productImg0 }" download="${p.productImg0 }">${p.productImg0 }</a>
	                            <input type="hidden" name="originName" value="${p.productImg0 }">
                        		</c:if>
                            </td>
                        </tr>
                        <tr>
                            <td style="line-height: 5px;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th>상세이미지</th>
                            <td class="detail">상품의 상세정보를 포함한 이미지를 1개 이상 선택해주세요.(최대 5MB)</td>
                        </tr>
                        <tr class="atLine">
                            <td></td>
                            <td>
                            	<input type="file" name="reupfile"><br>
	                            <c:if test="${ p.productImg1 ne null }">
	                         	현재 파일 : 
	                            <a href="${p.productImg1 }" download="${p.productImg1 }">${p.productImg1 }</a>
	                            <input type="hidden" name="originName" value="${p.productImg1 }">
	                       		</c:if>
                       		</td>
                        </tr>
                        <tr class="atLine">
                            <td></td>
                            <td>
                            	<input type="file" name="reupfile"><br>
	                            <c:if test="${ p.productImg2 ne null }">
	                         	현재 파일 : 
	                            <a href="${p.productImg2 }" download="${p.productImg2 }">${p.productImg2 }</a>
	                            <input type="hidden" name="originName" value="${p.productImg2 }">
	                       		</c:if>
                       		</td>
                        </tr>
                        <tr class="atLine">
                            <td></td>
                            <td>
                            	<input type="file" name="reupfile"><br>
	                            <c:if test="${ p.productImg3 ne null }">
	                         	현재 파일 : 
	                            <a href="${p.productImg3 }" download="${p.productImg3 }">${p.productImg3 }</a>
	                            <input type="hidden" name="originName" value="${p.productImg3 }">
	                       		</c:if>
                       		</td>
                        </tr>
                        <tr>
                            <td style="line-height: 5px;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th>배송정보</th>
                            <td>
                                <select name="courier" required>
                                    <option value="우체국택배">우체국택배</option>
                                    <option value="CJ대한통운">CJ대한통운</option>
                                    <option value="롯데택배">롯데택배</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br><br>
                <div class="btnBox" align="center">
                    <button class="btn" type="submit">제출하기</button>
                    <button class="btn" type="reset">초기화</button>
                </div>
                <br><br>
            </form>
        </div>
    </div>
</body>
</html>