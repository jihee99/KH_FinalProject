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
                <table class="table table-bordered">
                        <tr>
                            <th>제목</th>
                            <td colspan="3">환불되나욤</td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>모니카</td>
                            <th>작성날짜</th>
                            <td>2022-01-01</td>
                        </tr>
                        <tr>
                            <th>카테고리</th>
                            <td colspan="3">클래스</td>
                        </tr>
                        <tr>
                            <th >문의내용</th>
                            <td colspan="3"><textarea name="" id="" cols="70" rows="8" style="resize: none; border-style: none;">강의 3개 들었는데 환불 되나요?</textarea></td>
                        </tr>
                        <tr>
                            <th >답변</th>
                            <td colspan="3"><textarea name="" id="" cols="70" rows="5" style="resize: none;">안녕하세요. 관리자입니다. 말이 되는 소릴 하세요  </textarea></td>
                        </tr>
                </table>
                <div id="btnBox">
                    <button type="submit" id="Enroll" class="btn" style="background-color: rgb(107, 171, 213); color: white;">수정</button>
                    <button type="submit" id="cancel" class="btn" style="background-color:gray; color: white;" >목록</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>