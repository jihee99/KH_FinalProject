<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="./resources/css/store/storeEnrollPage.css">
<title>Insert title here</title>
</head>
<body>

	<!-- 강사용 메뉴바 연결하기 	-->
	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
	 	
	 <div class="innerOuter">
        <div class="content">
            <div class="headMenu">
            	<br>
                <b>상품등록하기</b>
            </div>
            <br>
            <form action="">
                <table id="pInfo">
                    <thead>
                        <tr>
                            <th colspan="2" style="float:left;">상품기본정보</th>
                        </tr>
                        <tr>
                            <td style="line-height: 10px;">&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th style="width: 140px;">카테고리</th>
                            <td style="width: 750px;">
                                <select>
                                    <option value="클래스상품">클래스상품</option>
                                    <option value="클래스상품">OC 에디션</option>
                                    <option value="클래스상품">DIY 키트</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>상품명</th>
                            <td><input type=""></td>
                        </tr>
                        <tr>
                            <td style="line-height: 5px;">&nbsp;</td>
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
                            <td><input type="file"></td>
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
                            <td><input type="file"></td>
                        </tr>
                        <tr class="atLine">
                            <td></td>
                            <td><input type="file"></td>
                        </tr>
                        <tr class="atLine">
                            <td></td>
                            <td><input type="file"></td>
                        </tr>
                        <tr>
                            <td style="line-height: 5px;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th>상품가격</th>
                            <td><input type="number" placeholder="숫자만 입력하세요(원)"></td>
                        </tr>
                        <tr>
                            <td style="line-height: 5px;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th>배송정보</th>
                            <td>
                                <select>
                                    <option>우체국택배</option>
                                    <option>CJ대한통운</option>
                                    <option>롯데택배</option>
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