<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .innerOuter{width:1000px; margin:auto;}

    .headMenu{text-align: left;} 
    .headMenu>b{font-size: 28px; font-weight: 800; margin-left: 10px; color: rgb(107, 171, 213);}

    .content{width:1000px; margin: auto; padding: 10px;}

    .content table{margin: 10px 0px; text-align: center; font-size: 13px; width: 90%;}
    .content table{border-collapse: separate; border-spacing: 0px 6px; line-height: 35px;}
    .content table th{background: lightgray;}    
    .content table td{text-align: left; padding-left: 15px;}    
    .content table textarea{resize: none; padding: 20px; width:90%;}

    .btnBox button{background-color: rgb(107, 171, 213); color: white;}
    
</style>
</head>
<body>
    
	<!-- 강사용 메뉴바 연결하기 	-->
	<jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
	 	
	<div class="innerOuter">
        <div class="headMenu">
        	<br><br>
            <b>상품 문의 답변</b>
        </div>
        <div class="content">
            <table border="1">
                <tr>
                    <th width="200">게시글 번호</th>
                    <td>202</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>user200</td>
                </tr>
                <tr>
                    <th>[번호]상품명</th>
                    <td>[22] 콘플라워 수제 허브 하트 비누</td>
                </tr>
                <tr>
                    <th>문의제목</th>
                    <td>배송전인데 상품 옵션 변경이 가능한가요</td>
                </tr>
                <tr>
                    <th style="height: 150px;">문의내용</th>
                    <td>
                        확인해보니 상품 배송전이라고 뜨긴 하는데 혹시 옵션 변경도 가능할까요 <br>
                        하트로 시켰는데 베이직으로 변경하고 싶어서요
                    </td>
                </tr>
                <tr>
                    <th style="height: 150px;">답변내용</th>
                    <td>
                        <textarea name="" id="" rows="5"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <div class="btnBox" align="center">
            <button class="btn">답변등록</button>
        </div>
    </div>
    
</body>
</html>