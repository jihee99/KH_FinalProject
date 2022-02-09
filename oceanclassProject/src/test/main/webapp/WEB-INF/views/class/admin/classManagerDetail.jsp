<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .info{
        width: 1000px;
        margin: auto;
    }
    .info th, .info td{
        text-align: center;
    }
    #pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}
</style>
</head>
<body>
    <div>
        <button type="button" class="btn" style="background-color: #6babd5; width: 130px; color: white;">클래스 노출</button>
        <button type="button" class="btn" style="background-color: lightgray; width: 130px;">클래스 미노출</button>
        <br><br>
        
        <div>
            <table class="table info">
                <thead>
                    <tr style="background-color: #6babd5;">
                        <th width="130">클래스번호</th>
                        <th width="120">카테고리</th>
                        <th width="250">클래스명</thw>
                        <th width="200">강사명</th>
                        <th width="100">가격</th>
                        <th width="100">등록일</th>
                        <th width="100">노출여부</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>3333</td>
                        <td>개발&데이터</td>
                        <td>클래스명한번좀길게써보겠습니</td>
                        <td>강사명도길게한번</td>
                        <td>9,999,999</td>
                        <td>22-01-05</td>
                        <td>Y</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <br><br><br>

    <div>
        <p style="font-size:20px;"><b>클래스 후기</b></p>

        <div>
            <jsp:include page="classManagerTableReview.jsp" />
        </div>
    </div>
    <br><br><br>

    <div>
        <p style="font-size:20px;"><b>클래스 문의</b></p>

        <div>
            <jsp:include page="classManagerTableQna.jsp" />
        </div>
    </div>
    <br><br>
    <hr>

    <div id="pagingArea">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="">Previous</a></li>
            <li class="page-item"><a class="page-link" href="">목록</a></li>
            <li class="page-item"><a class="page-link" href="">Next</a></li>
        </ul>
    </div>

</body>
</html>