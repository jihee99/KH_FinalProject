<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 전체 감싸는 div */
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
    #content-wrap{
        margin: auto;
    }
    .answerRadio{
        display: flex;
        font-size: 20px;
        font-weight: bolder;
        float: right;
        margin-bottom: 10px;
    }
    #noanswer{
        margin-left: 25px;
    }
    .table{
        text-align: center;
        margin-bottom: 100px;
    }
    #tableBox{
        height: 700px;
    }
    /* 검색 박스 */
    .search{
        float: right;
        margin-bottom: 30px;
    }
    .search .form-control{
        width: 300px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .search button{
        width: 50px;
        height: 50px;
        border: 1px solid #ddd;
        border-radius: 4px;
        line-height: 50px;
    }
    /* 버튼 박스 */
    .btn-box{
        display: flex;
        justify-content: flex-end;
    }
    #btnBox{
        float: right;
    }
    .btn{
        width: 50px;
    }
</style>  
</head>
<body>
    
    <div style="width: 1600px; height: auto; margin: auto;">
    	<jsp:include page="../../common/teacher/tcMypageSidebar.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">강사 공지사항</span>
            </div>
            <div id="content-wrap" >
                <div class="search-box pb-5">
                    <div class="search">
                        <form class="form-inline" action="">
                          <input class="form-control p-4" type="text" placeholder="검색어를 입력해주세요." style="width: 250px;">
                          <button class="btn" type="submit">
                            <span class="material-icons">search</span>                                    
                          </button>
                        </form>
                    </div>
                </div>
                <div id="tableBox">
                    <table class="table table-hover">
                        <thead>
                            <tr class="table-light">
                                <th width="100px">No</th>
                                <th width="450px">제목</th>
                                <th width="150px">작성일</th>
                                <th width="100px">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>강사 마이페이지 서버점검 안내</td>
                                <td>2022-01-02</td>
                                <td>15</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>강사님들 필독 사항</td>
                                <td>2022-01-02</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>학생 돈 떼먹는 강사 필독</td>
                                <td>2022-01-02</td>
                                <td>17</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>입금내역 확인 관련 공지사항</td>
                                <td>2022-01-02</td>
                                <td>35</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>수수료 관련해서 따지지 마세요 저희도 먹고살아야죠.</td>
                                <td>2022-01-02</td>
                                <td>24</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="paging" align="center">
                    <button class="btn btn-light">&lt;</button>
                    
                    <button class="btn btn-light">1</button>
                    <button class="btn btn-light">2</button>
                    <button class="btn btn-light">3</button>
                    <button class="btn btn-light">4</button>
                    <button class="btn btn-light">5</button>
                    
                    <button class="btn btn-light">&gt;</button>
                </div>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>

</html>