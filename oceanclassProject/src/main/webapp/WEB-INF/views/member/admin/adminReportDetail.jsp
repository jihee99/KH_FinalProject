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

<link rel="stylesheet" href="./resources/css/adminReportDetail.css">
</head>
<body>

    <!-- 관리자 사이드바 연결하기 -->
    <jsp:include page="../../common/admin/adminMain.jsp" />
    
    <div class="innerOuter" align="center">
        <div class="headMenu">
            <b>신고내역 상세보기</b>
        </div>
        <div class="content_1">
            <br>
            <b>신고정보</b>
            <hr>
            <button id="reBtn" class="btn btn-sm">복구하기</button>
            <button id="deBtn" class="btn btn-sm">선택삭제</button>
            <table>
                <tr>
                    <th width="180">신고번호</th>
                    <td width="300">3942</td>
                    <th width="180">게시글분류</th>
                    <td width="300">댓글</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>user01</td>
                    <th>처리상태</th>
                    <td>Y</td>
                </tr>
                <tr>
                    <th>신고사유</th>
                    <td colspan="3">무분별한 욕설 및 비방</td>
                </tr>
            </table>
            <br>
            <b>신고글 내용</b>
            <div>

                여기에 글씨 보여지게 할건데 

            </div>
        </div>
        <div align="center">
            <br>
            <button class="btn" style="background: lightgray;">목록보기</button>
        </div>
    </div>

</body>
</html>