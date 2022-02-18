<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/helpMain.css">
    
    <style>
        #wrap{
            width: 1000px;
            height: auto;
            margin: auto;
        }
        /* 게시판이름 영역*/
        #top-area{
            height: 100px;
            margin-top: 50px;
            /* display: flex; */
            margin-bottom: 90px;
        }
        /* 게시판이름 */
        #bord-name{
            color: rgb(107, 171, 213);
            font-weight:bolder;
            font-size: 30px;
        }
    	.table{
    		width:80%; 
			margin:auto;
			margin-left: 100px;
			margin-bottom: 20px;
		}
		table th{ 
			width: 25%; 
			padding:15px; 
			padding-bottom: 10px;
		}
		table td{
			text-align: left;
		}
        /* 등록,취소  버튼 */
        #btnBox{
            margin-left: 100px;
            display: flex;
            justify-content: center;
        }
        #btnBox button{
            margin-top: 70px;
            width: 100px;
            margin-left: 30px;
        }
    </style>

</head>
<body>
    <div style="height: auto; margin: auto; width: 1600px;">
        <jsp:include page="../../common/admin/adminSidebar.jsp" />
        <div id="wrap">
            <div id="top-area">
                <span id="bord-name">1:1 문의 수정</span>
            </div>
            <div class="content my-5">
                <form action="qnaUpdate.ad" method="post" id="enrollForm">
	                <input type="hidden" id="memNo" name="memNo" value="${loginUser.memNo}">
	                <input type="hidden" id="qno" name="qnaNo" value="${q.qnaNo}">
	                	<table class="table table-bordered">
	                        <tr>
	                            <th>제목</th>
	                            <td name="qnaContent" colspan="3">${q.qnaContent}</td>
	                        </tr>
	                        <tr>
	                            <th>작성자</th>
	                            <td name="nickname">${q.nickName }</td>
	                            <th>작성날짜</th>
	                            <td name="createDate">${q.createDate }</td>
	                        </tr>
	                        <tr>
	                            <th>카테고리</th>
	                            <td colspan="3">${q.category }</td>
	                        </tr>
	                        <tr>
	                            <th >문의내용</th>
	                            <td colspan="3"><textarea name="qnaTitle" id="" cols="70" rows="8" style="resize: none; border-style: none; pointer-events: none; ">${q.qnaContent }</textarea></td>
	                        </tr>
	                        <tr>
	                            <th >답변</th>
	                            <td colspan="3"><textarea name="ansContent" id="" cols="70" rows="5" style="resize: none;" value="${q.ansContent }"></textarea></td>
	                        </tr>
	                	</table>
	                <div id="btnBox">
	                    <button type="submit" id="Enroll" class="btn" style="background-color: rgb(107, 171, 213); color: white;">등록</button>
	                    <button type="button" id="cancel" onclick="history.back()" class="btn" style="background-color:gray; color: white;" >목록</button>
	                </div>
                </form>
            </div>
          <br><br><br>
        </div>
    </div>
</body>
</html>