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
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 전체 감싸는 div */
    .wrap{
        width: 1050px;
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
    }
    /* 게시판이름 */
    #bord-name{
        color: rgb(107, 171, 213);
        font-weight:bolder;
        font-size: 30px;
    }
    #content-wrap{
        margin: auto;
        margin-left: 30px;
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
    #tableBox{
        height: 600px;
    }
    /* 셀렉트 박스 */
    .search-box{
        display: flex;
        margin-bottom: 80px;
        margin-left: 30px;
    }
    /* 검색 박스 */
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
    .dateBtn{
        display: flex;
        margin-bottom: 50px;
        justify-content: space-between;
    }
    #btnGroup{
        width: 70px;
        height: 30px;
        line-height: 0px;
        margin-right:30px;
    }
    #blueBtn{
        background-color: rgb(107, 171, 213);
        color: white;
    }
    #paging{
		padding-top: 10px;
	}
	.pagination {
	    justify-content: center;
    }
    #dateBtn{
        width: 50px;
        height: 38px;
        border: 1px solid #ddd;
        border-radius: 4px;
        line-height: 38px;
        background-color: white;
    }
</style>  
</head>
<body>
    
    <div style="width: 1600px; height: auto; margin: auto;">
    	<jsp:include page="../../common/admin/adminSidebar.jsp" />
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">1:1 문의 관리</span>
            </div>
            <!-- 회원 조회 -->
            <input type="hidden" id="memNo" name="mno" value="${loginUser.memNo}">
            <input type="hidden" id="qnaNo" name="qno" value="${q.qnaNo}">
            <form class="form-inline" action="qnaSearch.ad" method="get">
            	<input type="hidden" name="cpage" value="1">
	            <div class="search-box pb-5" id="search-area">
	                <select name="category" class="selectpicker show-tick p-2" style="width: 120px;">
	                    <option value="A">전체</option>
	                    <option value="C">클래스</option>
	                    <option value="S">스토어</option>
	                    <option value="E">기타</option>
	                </select>
	                <div class="search">
	                      <input class="form-control p-4" name="keyword" type="text" placeholder="제목을 입력해주세요." style="width: 350px;">
	                      <button class="btn" type="submit">
	                        <span class="material-icons">search</span>                                    
	                      </button>
	                </div>
	            </div>
            </form>
            
            <c:if test="${ not empty category }">
				<script>
					$(function(){
						$("#search-area option[value=${category}]").attr("selected", true);
					})
				</script>
			</c:if>
            
            <div id="content-wrap" >
                <div class="dateBtn">
                    <div class="d-flex" style="width: 160px;">
                        <input class="form-control mr-2" type="date" name="toDate"> ~ <input class="form-control ml-2" id="fromDate" type="date">
                        <button class="material-icons" id="dateBtn" type="submit">search</button>
                    </div>
                    <div id="btnBox" style="float: right;">
                        <button class="btn btn-danger" id="btnGroup">삭제</button>
                    </div>
                </div>
                <div id="tableBox">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th width="50px"><input type="checkbox" name="" value=""></th>
                                <th width="80px">글번호</th>
                                <th width="130px">카테고리</th>
                                <th width="420px">제목</th>
                                <th width="150px">작성자</th>
                                <th width="140px">작성일</th>
                                <th width="100px">처리상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="q" items="${ list }">
                                <tr id="tb" data-tr_value="1">
                                    <td class="ck"><input type="checkbox" name="selectCheck" value=""></td>
                                    <td class="td qno">${ q.qnaNo }</td>
                                    <td class="td category">${ q.category }</td>
                                    <td class="td">${ q.qnaTitle }</td>
                                    <td class="td">${ q.nickName }</td>
                                    <td class="td">${ q.createDate }</td>
                                    <c:choose>
				                        <c:when test="${not empty q.ansContent}">
				                        	<td class="td">답변완료<td>
				                        </c:when>
				                        <c:otherwise>
				                        	<td class="td">미답변<td>
				                        </c:otherwise>
			                        </c:choose>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <script>
	                $('#all_select').click(function(){
	            		if($("input:checkbox[id='all_select']").prop("checked")) {
	            			$("input[type=checkbox]").prop("checked",true);
	            		}else{
	            			$("input[type=checkbox]").prop("checked",false);
	            		}
	            	});
	                
		        	$(function(){
		        		$(".td").click(function(){
		        			location.href = 'qnaDetail.ad?qno=' + $(this).siblings(".qno").text();
		        		});
		        	})
		        	
		        	var cknArr = [];
	            	$(function(){
	            		$(".ck").click(function(){
	            			var ckn = $(this).siblings(".qno").text();
	            			console.log(ckn);
	            			
	            			cknArr.push(ckn);
	            			console.log(cknArr);
	            			
	            			$("#delbtn").click(function(){
	            				for(let i in cknArr){
	                          	  console.log(cknArr[i]);
	                          	  let ckn = cknArr[i];
				            	  
	                          	  location.href = 'qnaDelete.ad?qno=' + cknArr[i];
	                          	  
	            				}
				            });
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
								<li class="page-item"><a class="page-link" href="qnaList.ad?cpage=${ pi.currentPage-1 }">&laquo;&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ empty category }">
									<li class="page-item"><a class="page-link" href="qnaList.ad?cpage=${ p }">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="qnaSearch.ad?cpage=${ p }&category=${ category }&keyword=${keyword}">${ p }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled">
									<a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="qnaList.ad?cpage=${ pi.currentPage+1 }">&raquo;&raquo;</a></li>
							</c:otherwise>
						</c:choose>
		            </ul>
		        </div>
            </div>
            <br><br><br>
        </div>
        <jsp:include page="../../common/footerBar.jsp" />
    </div>
</body>

</html>