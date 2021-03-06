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
        width: 1070px;
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
        height: 700px;
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
    }
    #delbtn{
    	width: 70px;
        height: 30px;
        line-height: 0px;
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
                <span id="bord-name">공지사항 관리</span>
            </div>
            <!-- 회원 조회 -->
            <input type="hidden" id="memNo" name="mno" value="${loginUser.memNo}">
            <input type="hidden" id="eventNo" name="nno" value="${n.noNo}">
            <form class="form-inline" action="noticeSearch.ad" method="get">
            	<input type="hidden" name="cpage" value="1">
            	<div class="search-box pb-5" id="search-area">
	                <select name="category" class="selectpicker show-tick p-2" style="width: 120px;">
	                    <option value="A">전체</option>
	                    <option value="C">클래스</option>
	                    <option value="S">스토어</option>
	                    <option value="T">강사</option>
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
	          		<form action="noticeDateSearch.ad" method="get">
	           		<input type="hidden" name="cpage" value="1">
	                   <div class="d-flex" style="width: 160px;">
	                       <input class="form-control mr-2" type="date" name="toDate"> ~ <input name="fromDate" class="form-control ml-2" type="date">
	                       <button class="material-icons" id="dateBtn" type="submit">search</button>
	                   </div>
	              	</form>
	              	
                    <div id="btnBox" style="float: right;">
                        <button onclick="location.href='noticeEnrollForm.ad';" class="btn" id="btnGroup" style="background-color: rgb(107, 171, 213); color: white;">등록</button>
                        <button class="btn btn-danger" type="submit" id="delbtn">삭제</button>
                    </div>
                </div>
                <div id="tableBox">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th width="80px"><input type="checkbox" id="all_select"></th>
                                <th width="80px">글번호</th>
                                <th width="130px">카테고리</th>
                                <th width="430px">제목</th>
                                <th width="150px">작성자</th>
                                <th width="100px">작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="n" items="${ list }">
                                <tr id="tb" data-tr_value="1">
                                    <td class="ck"><input type="checkbox" name="selectCheck" value=""></td>
                                    <td class="td nno">${ n.noNo }</td>
                                    <td class="td category">${ n.category }</td>
                                    <td class="td">${ n.noTitle }</td>
                                    <td class="td">${ n.nickname }</td>
                                    <td class="td">${ n.createDate }</td>
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
		        			location.href = 'noticeDetail.ad?nno=' + $(this).siblings(".nno").text();
		        		});
		        	})
		        	
		        	var cknArr = [];
	            	$(function(){
	            		$(".ck").click(function(){
	            			var ckn = $(this).siblings(".nno").text();
	            			console.log(ckn);
	            			
	            			cknArr.push(ckn);
	            			console.log(cknArr);
	            			
	            			$("#delbtn").click(function(){
	            				for(let i in cknArr){
	                          	  console.log(cknArr[i]);
	                          	  let ckn = cknArr[i];
				            	  
	                          	  location.href = 'noticeDelete.ad?nno=' + cknArr[i];
	                          	  
	            				}
				            });
	            		});
	            	})
	            	
	            	$("#dateBtn").click(function(){
	 
	                var startDate = $( "input[name='toDate']" ).val();
	                var startDateArr = startDate.split('-');
	
	                var endDate = $( "input[name='fromDate']" ).val();
	                var endDateArr = endDate.split('-');
	                        
	                var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
	                var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
	                
	                if(startDateCompare.getTime() > endDateCompare.getTime()) {
	                    
	                    alert("시작날짜와 종료날짜를 확인해 주세요.");
	                    
	                    return;
	                }
	                
	                //console.log(startDate);
	                //console.log(endDate);
                        
                });
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
								<li class="page-item"><a class="page-link" href="noticeList.ad?cpage=${ pi.currentPage-1 }">&laquo;&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ empty category }">
									<li class="page-item"><a class="page-link" href="noticeList.ad?cpage=${ p }">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="noticeSearch.ad?cpage=${ p }&category=${ category }&keyword=${keyword}">${ p }</a></li>
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
								<li class="page-item"><a class="page-link" href="noticeList.ad?cpage=${ pi.currentPage+1 }">&raquo;&raquo;</a></li>
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