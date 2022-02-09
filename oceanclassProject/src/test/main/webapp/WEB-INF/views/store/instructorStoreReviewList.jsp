<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="./resources/css/store/instructorStoreReviewList.css">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 강사용 메뉴바 연결하기 -->
 	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
	
	<div class="innerOuter">
        <div class="headMenu">
        	<br><br>
            <b>상품 리뷰 관리</b>
        </div>
        <div class="content">
            <div class="selectStore">
                <select id="">
                    <option value="">강사가등록한상품명1</option>
                    <option value="">강사가등록한상품명2</option>
                    <option value="">강사가등록한상품명3</option>
                </select>
            </div>
            <div class="content_table">
                <table class="table table-sm" align="center">
                    <thead>
                        <tr>
                            <th width="120">리뷰번호</th>
                            <th width="120">별점</th>
                            <th width="300">내용</th>
                            <th width="120">작성자</th>
                            <th width="120">작성일</th>
                            <th width="80">추천수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>SR213</td>
                            <td>4.5</td>
                            <td>향 선택하는데 고민이 많았는데 다 사길 ...</td>
                            <td>user213</td>
                            <td>YYYY-MM-DD</td>
                            <td>12</td>
                        </tr>

                        <!--여기는 나중에 지우기-->
                        <tr>
                            <td>SR212</td>
                            <td>4.5</td>
                            <td>향 선택하는데 고민이 많았는데 다 사길 ...</td>
                            <td>user213</td>
                            <td>YYYY-MM-DD</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>SR211</td>
                            <td>4.5</td>
                            <td>향 선택하는데 고민이 많았는데 다 사길 ...</td>
                            <td>user213</td>
                            <td>YYYY-MM-DD</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>SR210</td>
                            <td>4.5</td>
                            <td>향 선택하는데 고민이 많았는데 다 사길 ...</td>
                            <td>user213</td>
                            <td>YYYY-MM-DD</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>SR209</td>
                            <td>4.5</td>
                            <td>향 선택하는데 고민이 많았는데 다 사길 ...</td>
                            <td>user213</td>
                            <td>YYYY-MM-DD</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>SR208</td>
                            <td>4.5</td>
                            <td>향 선택하는데 고민이 많았는데 다 사길 ...</td>
                            <td>user213</td>
                            <td>YYYY-MM-DD</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>SR207</td>
                            <td>4.5</td>
                            <td>향 선택하는데 고민이 많았는데 다 사길 ...</td>
                            <td>user213</td>
                            <td>YYYY-MM-DD</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>SR206</td>
                            <td>4.5</td>
                            <td>향 선택하는데 고민이 많았는데 다 사길 ...</td>
                            <td>user213</td>
                            <td>YYYY-MM-DD</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>SR205</td>
                            <td>4.5</td>
                            <td>향 선택하는데 고민이 많았는데 다 사길 ...</td>
                            <td>user213</td>
                            <td>YYYY-MM-DD</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>SR204</td>
                            <td>4.5</td>
                            <td>향 선택하는데 고민이 많았는데 다 사길 ...</td>
                            <td>user213</td>
                            <td>YYYY-MM-DD</td>
                            <td>12</td>
                        </tr>
                    </tbody>
                </table>
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
    </div>
</body>
</html>