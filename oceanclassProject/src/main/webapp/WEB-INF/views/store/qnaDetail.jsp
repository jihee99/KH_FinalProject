<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/font-awesome.min.css" type="text/css">

<style>
    .review_detail{width: 800px; height: auto;}
    .mini_header>img{ margin: auto; display: block;}
    .mini_header>p{margin:auto; height: 45px; background:rgb(88, 159, 230); color: white; font-weight: bold; font-size: 25px;}
    
    .product_info{width: 300px; height: 150px; display: block; margin: auto; margin-bottom: 60px; margin-top: 20px;}
    .product_title_img{float: left; width:120px; height: 130px; margin-right:15px;}
    .merchant_name, .product_option{font-size: 13px; color: rgb(112, 112, 112);}
    .product_name{font-size: 15px;}

    .star_rating{font-weight: bold; font-size: 20px;}
    .total{color:rgb(139, 137, 137); font-weight: bold;}
    .star_rating_area{margin-bottom: 80px;}

    .review_list{margin-bottom: 60px; height: auto; margin-left: 30px;}
    .user_detail>button{background:none; border: none; font-weight: bold; font-size: 13px; cursor: pointer;}
    .user_detail{width: 400px; height: 60px;}
    .user_detail>span{ display:inline-block; margin-top: 12px;}
    .user_image{position:inline-block; float:left; margin-right: 10px;}
    .product_name_small{font-size: small; color: rgb(88, 88, 88);}
    .content{font-family: 본고딕; font-size: 15px; display:inline-block; width:650px; height: auto; margin-bottom: 10px;}
    .recommend{width: 200px; height: 30px; margin-right: 10px; cursor: pointer; background:rgb(211, 212, 212); border: none; border-radius: 5px;}
    .thumbnail_image{width:150px; height:120px; margin-bottom: 10px;}
    .answer_area{margin-buttom:50px;}
        #pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 50px;
	}
</style>
</head>
<body>
<div class="review_detail">


        <div class="mini_header">
            <img src="./resources/images/logo.png" width="150px"><br>
            <p align="center">문의상세</p>
        </div>

        <div class="product_info">
            <img src="${p.productImg0 }" class="product_title_img">
            <span class="merchant_name">${p.nickname }</span> <br>
            <span class="product_name">${p.title }</span><br>
            <br>
        </div>
        
     <c:choose>
        <c:when test="${!empty qlist}">
            <div class="review_list">
            	<c:forEach var="q" items="${qlist}">
	                <div class="review" style="margin-bottom:50px;">
	                    <div class="user_detail">
	                        <div class="user_image">
	                            <img src="${q.profile }" width="50px" height="50px">
	                        </div>
	                        <span class="user_name">${q.userId }</span>
	                        <span class="enroll_date">${q.createDate }</span>
	            			<input type="hidden" id="refBNo" neme="refBNo" value="${q.csQno}">
	                   		<input type="hidden" id="reportMemNo" name="reportMemNo" value="${q.memNo}">
	                   		<button type="button" data-toggle="modal" data-target="#report">신고</button>
	                    </div>
	            		<c:choose>
	            			<c:when test="${!empty q.pwd && loginUser.userId != q.userId}">
	            					<div id="pwdZone${ q.csQno }" style="margin: auto" align="center">
					                	<img src="resources/images/unlock.png" width="6%" style="margin-bottom:10px;"><br>
					                	해당 문의는 비밀글 입니다.<br>
					                	비밀번호 확인 후 내용 조회가 가능합니다.<br>
					                	<input type="password" id="pwdCk${ q.csQno }" style="margin-top:10px;">
					                	<button type="button" onclick="pwdCheck(${q.csQno});" class="btn" style="margin-bottom: 3px;background-color: #6babd5; height:30px; line-height: 11px; font-size:15px; color:white;">확인</button>
					                </div>
					                
					                <div id="noPwdZone${ q.csQno }" style="display:none;">
						                <c:if test="${ loginUser.userId == q.userId }">
					               	    	<div style="float:right; margin-top:5px;">
						                    	<button type="button" onclick="updateQna(${q.csQno});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">수정</button>
						                    	<button type="button" onclick="deleteQna(${q.referNo}, ${q.csQno});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
					                    	</div>
		                    			</c:if>
		                    			
					                    <div class="review_content">
					                        <span class="product_name_small">${q.title }</span> <br>
					                        <span class="content">${q.content }</span>
					                        <c:if test="${q.filePath != null}">
						                    	<div class="thumbnail_image">
						                            <img src="${q.filePath}" class="thumb" style="width:150px; height: 120px;">
						                        </div>
					                        </c:if>
					                    </div>
				                    	<hr>
				                    	<div class="answer_area">
				                    		<c:if test="${!empty q.answerContent}">
					                    		<div class="user_detail">
							                        <span class="user_name">${q.userId }</span>
							                        <span class="enroll_date">${q.answerDate }</span>
							                    </div>
												<span style="font-weight:bold">답변:</span>		
								                <span>${q.answerContent}</span>
											</c:if>
				                    	</div>
	            					</div>
	            			</c:when>
				            
				            <c:otherwise>
				                    
		                    	<div id="noPwdZone${ q.csQno }">
					                <c:if test="${ loginUser.userId == q.userId }">
				               	    	<div style="float:right; margin-top:5px;">
					                    	<button type="button" onclick="updateQna(${q.csQno});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">수정</button>
					                    	<button type="button" onclick="deleteQna(${q.referNo}, ${q.csQno});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
				                    	</div>
	                    			</c:if>
				                    <div class="review_content">
				                        <span class="product_name_small">${q.title }</span> <br>
				                        <span class="content">${q.content }</span>
				                        <c:if test="${q.filePath != null}">
					                    	<div class="thumbnail_image">
					                            <img src="${q.filePath}" class="thumb" style="width:150px; height: 120px;">
					                        </div>
				                        </c:if>
				                    </div>
				                    <div class="answer_area" >
					                    <c:choose>
					                    	<c:when test="${ !empty q.answerContent }">
												<img src="resources/images/curvearrow.png" width="25" height="25" style="float:left; margin-right:5px;">		
								                <span>${q.answerContent}</span>
								            </c:when>
								            <c:otherwise>
												<b>미답변</b>
											</c:otherwise>
										</c:choose>
				                    </div>
	            				</div>
	            			</c:otherwise>
	            		</c:choose>
	            	</div>
                </c:forEach>
            </div>
         </c:when>
         <c:otherwise>
         	    <h4 align="center"> 문의가 없습니다. </h4>
         </c:otherwise>
      </c:choose>
            
        <div id="pagingArea">
			<ul class="pagination">

				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="qnaList.st?cpage=${ pi.currentPage - 1 }&pno=${ qnaPno }">Previous</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link" href="qnaList.st?cpage=${ p }&pno=${ qnaPno }">${ p }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="qnaList.st?cpage=${ pi.currentPage + 1 }&pno=${ qnaPno }">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
    </div>
    
        <!-- 신고 모달 -->
    	<div class="modal fade" id="report" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">문의 신고</h5>
		        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="sreviewReport.st" method="post">

		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">신고사유를 선택해주세요.</label><br>
                        <input name="radio" id="radio1" value="욕설 또는 음란성 내용" type="radio">
                        <label for="radio1">욕설 또는 음란성 내용</label> <br>
                        
                        <input name="radio" id="radio2" value="부적절한 홍보성 댓글" type="radio">
                        <label for="radio2">부적절한 홍보성 댓글</label> <br>
                        
                        <input name="radio" id="radio3" value="사생활 침해 및 불법 촬영물" type="radio">
                        <label for="radio3">사생활 침해 및 불법 촬영물</label> <br>
                        
                        <input name="radio" id="radio4" value="명예훼손 및 저작권침해" type="radio">
                        <label for="radio4">명예훼손 및 저작권침해</label> <br>
                        
                        <input name="radio" id="radio5" value="25" type="radio">
                        <label for="radio5">기타</label><br>
                        
                        <textarea name="" cols="60" rows="" id="input-area2" disabled></textarea>
		          </div>
		          <div class="mb-4" style="display:none;">
		            <label for="radio5" class="col-form-label">기타:</label>
		            <textarea class="form-control" id="reason" maxlength="100"></textarea>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary" onclick="rpdata();">신고하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
			<script>
	
    function rpdata(){
        var rpValue = $('input[name=radio]:checked').val();
        if(rpValue == 25){
            rpValue = $("#input-area2").val();
        }
        
        $.ajax({
            url:"sreviewReport.st",
            type:"post",
            data:{
                reportMemNo:$("#reportMemNo").val(),
                refBNo:$("#refBNo").val(),
                content:rpValue
            },success:function(result){
            	if(result == "gg"){
            		alert("해당 글의 신고가 완료되었습니다.");
	                opener.parent.location.reload();
	                window.close();
            	}else{
	                alert("해당 글의 신고가 실패했습니다.");
	                opener.parent.location.reload();
	                window.close();
            	}
                
            },error:function(){
            	alert("통신실패!");
            }
        })
        
    }
    
	  	function pwdCheck(cqNo){
			var pwdCk = document.getElementById("pwdCk" + cqNo).value;
			var pwdZone = document.getElementById("pwdZone" + cqNo);
			var noPwdZone = document.getElementById("noPwdZone" + cqNo);
			
			$.ajax({
				url:"storeQnaPwdCheck.me",
				data:{csQno:cqNo,pwd:pwdCk},
				success:function(result){
					if(result == 'yyyyy'){
						pwdZone.style.display = 'none';
						noPwdZone.style.display = 'block';
					} else if(result == 'nnnnn'){
						alert("비밀번호가 틀립니다. 다시 입력해주세요.");
					} else {
						console.log("잘못된 접근입니다.");
					}
				}, error:function(){
					console.log("스토어 문의 비밀번호 확인용 ajax 통신 실패");    				
				}
			})
		}
		
	</script>
</body>
</html>