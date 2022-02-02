<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        width: 1000px;
        height: auto;
        margin: auto;
        margin-top: 50px;
    }
    /* 게시판이름 영역*/
    #top-area{
        height: 100px;
        margin-top: 50px;
        display: flex;
        justify-content: space-between;
    }
    /* 게시판이름 */
    #bord-name{
        color: rgb(107, 171, 213);
        font-weight:bolder;
        font-size: 30px;
    }
    /* 프로필 area */
    #content-wrap{
        margin: 0 auto;
        width: 400px;
    }
    /* 버튼들 */
    #findIdBtn {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 400px;
        height: 50px;
        margin-bottom: 10px;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div style="width: 1600px; height: auto; margin: auto;">
        <jsp:include page="../common/teacher/tcMypageSidebar.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">강사정보 / 수정</span>
            </div>
            <div id="content-wrap">
                <form action="" method="post">
                    
                    <span id="top-text">변경할 비밀번호</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="pwd" placeholder="비밀번호(영문,숫자 포함 6자리 이상)" name="userId" required> 
                    </div>

                    <span id="top-text">비밀번호 확인</span>
                    <div class="form-group">
                      <input type="text" class="form-control" id="pwd" placeholder="비밀번호 확인" name="userId" required> 
                    </div>

                    <button type="submit" id="findIdBtn" class="btn" style="background-color: lightgray;">비밀번호 변경하기</button>
                    <button type="submit" id="findIdBtn" class="btn" style="background-color: rgb(228, 240, 250);">수정하기</button>
                    <button type="submit" id="findIdBtn" class="btn" style="background-color: lightgray;">탈퇴하기</button>

                </form>
            </div>
        </div>
    </div>
</body>
</html>