<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
    #classCategory{
        margin: auto;
        width: 700px;
    }
    #classCategory select{
        margin: auto;
        width: 700px;
        height: 45px;
        margin-bottom: 80px;
    }
    /* 게시판이름 영역*/
    #top-area{
        height: 100px;
        margin-top: 50px;
        margin-bottom: 50px;
        /* display: flex; */
    }
    /* 게시판이름 */
    #bord-name{
        color: rgb(107, 171, 213);
        font-weight:bolder;
        font-size: 30px;
        margin-bottom: 150px;
    }
    #content-wrap{
        margin: auto;
    }
    .content{
		width: 100%; 
		height: 1000px;
        margin-top: 20px;
	}
    #cl-img{
        margin-left: 15px;
    }
    #cl-wrap{
        /* box-sizing: border-box; border:1px solid black; */
        display: flex;
        margin-bottom: 10px;
        margin-top: 10px;
    }
    #cl-box{
        margin-left: 15px;
        margin-top: 5px;
    }
    #cl-category{
        font-weight: bolder;
        font-size: 20px;
        margin-top: 5px;
    }
    #cl-content{
        padding-top: 10px;
    }
    #cl-content textarea{
        width: 450px;
        height: 100px;
        resize: none;
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
    #eventBox{
        margin-bottom: 40px;
    }
    /* 버튼 박스 */
    #btnBox{
        text-align: right;
        margin-bottom: 30px;
    }
    #btnBox .btn{
        width: 70px;
        height: 30px;
        line-height: 1;
    }
    #blueBtn{
        background-color: rgb(107, 171, 213);
        color: white;
    }
    #statusBox{
        display: flex;
        justify-content:space-between;
        margin-bottom: 50px;
    }
    #statusBox button{
        width: 250px;
        background-color: lightgray;
    }
    .img{
    	float:left; 
    	padding: 20px; 
    	margin-bottom: 20px;
    	}
    #imgBox{
    	height: 900px;
    }
    .img>p{
    	text-align: center; 
    	font-size: 20px; 
    	font-weight: 600;
    	}
    #paging{
		padding-top: 80px;
	}
	.pagination {
	    justify-content: center;
	}
        
</style>  
</head>
<body>
    
    <div style="width: 1600px; height: auto; margin: auto;">
    	<jsp:include page="../../common/admin/adminSidebar.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">이벤트 관리</span>
            </div>
            <!-- 회원 조회 -->
            <div id="content-wrap">

                <div id="btnBox">
                    <button class="btn" id="blueBtn" onclick="location.href='evEnrollForm.ad';">등록</button>
                </div>

                <div id="statusBox">
                    <button onclick="location.href='eList.ad';" class="btn">전체</button>
                    <button onclick="location.href='eYList.ad';" class="btn" name="status" value="Y">진행중</button>
                    <button onclick="location.href='eNList.ad';" class="btn" name="status" value="N">종료</button>
                </div>

                <div class="content" id="result">
                    <div id="imgBox">
                        <c:forEach var="e" items="${list}">
				            <div class="img">
				            	<input type="hidden" id="eno" value="${e.eventNo}">
				                <img src="${e.img}" style="width: 460px; height: 210px;" id="img">
				                <p>${e.eventTitle}</p>   
				            </div>
				        </c:forEach>
                	</div>
                	
                	<script>
			        	$(function(){
			        		$(".img>#img").click(function(){
			        			let eventNo = $(this).prev().val();
			        			location.href = 'evDetail.ad?eno=' + eventNo;
			        		});
			        	})
			        </script>
                	
	               <div id="paging" align="center">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled">
									<a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="eNList.ad?cpage=${ pi.currentPage-1 }">&laquo;&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="eNList.ad?cpage=${ p }">${ p }</a></li>
						</c:forEach>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled">
									<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="eNList.ad?cpage=${ pi.currentPage+1 }">&raquo;&raquo;</a></li>
							</c:otherwise>
						</c:choose>
		            </ul>
		        </div> 
            </div>
          </div>
          <br><br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>

</html>