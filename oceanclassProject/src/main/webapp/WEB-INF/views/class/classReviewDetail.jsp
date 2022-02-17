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
    .outer{
        width: 600px;
        /*height: 1100px;*/
        margin:auto;
    }
    .outer>div{
        margin: 30px;
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

	<c:if test="${ !empty alertMsg }">
		<script>
			alert('${ alertMsg }');
		</script>
		<c:remove var="alertMsg" />
	</c:if>
	
	<input type="hidden" id="grade" value="${ loginUser.grade }">

    <div class="outer">
        <div>
            <div style="font-weight: bold; font-size: 17px; color: #6babd5;">실제 수강생 후기 전체 보기</div>
            <hr>
            <img src="resources/images/back.png" width="20" height="20" onclick="location.href='classReviewList.me?cpage=${ returnPage }&clNo=${ reviewClNo }'" style="cursor:pointer;">
			<br><br>
			
            <div class="reviewContent">
                <div class="profile">
                    <div style="float:left; margin-right: 10px;">
                        <img src="" width="50px" height="50px">
                    </div>
                    <div>
                        <div style="font-weight: bold;">${ cr.memNo }</div>
                        <div style="display: flex;">
                            <div style="margin-right: 5px;">
                                <img src="resources/images/star.png" width="12px" height="12px">
                                <c:choose>
                                	<c:when test="${ 1.0 <= cr.star && cr.star < 1.5 }">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 1.5 <= cr.star && cr.star < 2.0  }">
										<img src="resources/images/star3.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 2.0 <= cr.star && cr.star < 2.5 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 2.5 <= cr.star && cr.star < 3.0 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star3.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 3.0 <= cr.star && cr.star < 3.5 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 3.5 <= cr.star && cr.star < 4.0 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star3.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 4.0 <= cr.star && cr.star < 4.5 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star2.png" width="12px" height="12px">
									</c:when>
									<c:when test="${ 4.5 <= cr.star && cr.star < 5.0 }">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star3.png" width="12px" height="12px">
									</c:when>
									<c:otherwise>
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
										<img src="resources/images/star.png" width="12px" height="12px">
									</c:otherwise>
                                </c:choose>
                            </div>
                            <div style="font-size: 13px; color: gray; line-height: 27px;">${ cr.createDate }</div>
                        </div>
                    </div>
                </div>

                <div class="reviewContent" style="margin-top: 10px;">
                    <pre style="width:100%; white-space: pre-wrap;">
                    <c:if test="${ !empty cr.filePath }">
<img src="${ cr.filePath }" width="400">
					</c:if>
${ cr.content }
                    </pre>
                </div>

                <div class="reivewFooter" style="font-size: 13px;">
                <c:choose>
                	<c:when test="${ recoCk == 'Y' && !empty loginUser}">
        			    <button type="button" id="recommendBtn" onclick="recommendCk();" class="btn" style="background-color: #6babd5; margin-bottom: 5px; height:30px; line-height: 15px; color: white;">
	                        <img src="resources/images/like.png" width="20" height="20">
	                        <span style="font-size: 13px;">도움이 됐어요</span>
	                    </button>
                	</c:when>
                	<c:otherwise>
	                    <button type="button" id="recommendBtn" onclick="recommendCk();" class="btn" style="background-color: lightgray; margin-bottom: 5px; height:30px; line-height: 15px;">
	                        <img src="resources/images/like.png" width="20" height="20">
	                        <span style="font-size: 13px;">도움이 됐어요</span>
	                    </button>
                	</c:otherwise>
                </c:choose>
                    <span style="margin-left:5px;">${ cr.recommend }명에게 도움이 되었어요!</span>
                    <br><br>
                    <span>
                    	댓글 ${ cr.replyNum }
                    </span>
                    <span style="float:right">신고하기</span>
                </div>
            </div>
            <br>

            <div class="reply">
            	<div id="replyInsertArea">
	            	<form id="replyArea" action="enrollClassReviewReply.me" onsubmit="return replyCheck();">
		                <div class="inputArea">
		                    <img src="resources/images/reply2.png" width="40px" height="40px" style="margin-bottom: 5px;">
		                    <input type="text" id="insertReplyContent" class="form-control" name="replyContent" style="width: 400px; display: inline-block;" placeholder="댓글 내용을 입력해주세요.">
		                    <input type="hidden" id="crNo" name="contentNo" value="${ cr.crNo }">
		                    <input type="hidden" id="memNo" name="memNo" value="${ loginUser.memNo }">
		                    <input type="hidden" id="clNo" name="clNo" value="${ reviewClNo }">
		                    <input type="hidden" id="returnPage" name="returnPage" value="${ returnPage }">
		                    <button type="submit" class="btn" style="background-color: #6babd5; width: 80px; color: white; margin-bottom: 5px;">등록</button>
		                </div><br>
	                </form>
                </div>
                
				<c:choose>
					<c:when test="${ empty replyList }">
						아직 댓글이 없습니다. 댓글을 달아보세요!
						<br><br><br>
					</c:when>
					<c:otherwise>
						<c:forEach var="r" items="${ replyList }">
			                <div class="viewArea" style="margin-top: 10px;">
			                    <div class="profile">
			                        <div style="float:left; margin-right: 10px;">
			                            <img src="" width="30px" height="30px">
			                        </div>
			                        <div style="line-height: 30px;">
			                            <span style="font-size: 15px;">${ r.nickName }</span>
			                            <span style="font-size: 12px; color: gray;">${ r.replyDate }</span>
		                            	<span style="float:right; cursor:pointer; font-size: 12px;">
			                            <c:if test="${ loginUser.nickName == r.nickName }">
		                            		<span id="${ r.replyNo }update1" style="margin-right:5px;" onclick="updateReply1(${r.replyNo})">수정</span>
		                            		<span id="${ r.replyNo }update2" style="margin-right:5px; display:none;" onclick="updateReply2(${r.replyNo})">수정취소</span>
		                            		<span style="margin-right:5px;" onclick="deleteReply('${r.replyNo}');">삭제</span>
	    	                        	</c:if>
   	                        			<span>신고하기</span>
		                            	</span>
			                        </div>
			                    </div>
			
			                    <div class="replyContent" style="margin-top: 10px;">
			                        <pre style="width:100%; white-space: pre-wrap;">
${ r.replyContent }	                        
									</pre>
			                    </div>
			                    
			                    <div id="${ r.replyNo }replyUpdateArea" style="display:none">
				                   	<form action="updateClassReviewReply" onsubmit="return replyUpdateCheck(${r.replyNo});">
				                   		<input type="text" id="${ r.replyNo }updateReplyContent" class="form-control" name="replyContent" style="width: 450px; display: inline-block;" placeholder="수정할 댓글 내용을 입력해주세요.">
				             			<input type="hidden" name="replyNo" value="${ r.replyNo }">
					                    <input type="hidden" name="memNo" value="${ loginUser.memNo }">
				             			<input type="hidden" name="contentNo" value="${ cr.crNo }">
					                    <input type="hidden" name="clNo" value="${ reviewClNo }">
					                    <input type="hidden" name="returnPage" value="${ returnPage }">
				                   		<button type="submit" class="btn" style="background-color: #6babd5; width: 80px; color: white; margin-bottom: 5px;">수정</button>
				                   	</form>
				                </div>
			                </div>
		                </c:forEach>
					</c:otherwise>
				</c:choose>
                
                <c:if test="${ !empty replyList }">
		            <div id="pagingArea">
		                <ul class="pagination">
			                <c:if test="${ pi.currentPage > 1 }">
									<li class="page-item"><a class="page-link" href="classReviewDetail.me?crNo=${ cr.crNo }&cpage=${ pi.currentPage - 1 }&clNo=${ reviewClNo }&rpage=${returnPage}">Previous</a></li>
							</c:if>
							
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<li class="page-item"><a class="page-link" href="classReviewDetail.me?crNo=${ cr.crNo }&cpage=${ p }&clNo=${ reviewClNo }&rpage=${returnPage}">${ p }</a></li>
							</c:forEach>
							
							<c:if test="${ pi.currentPage != pi.maxPage }">
									<li class="page-item"><a class="page-link" href="classReviewDetail.me?crNo=${ cr.crNo }&cpage=${ pi.currentPage + 1 }&clNo=${ reviewClNo }&rpage=${returnPage}">Next</a></li>
							</c:if>
		                </ul>
		            </div>
	            </c:if>
                
            </div>

        </div>

    </div>
    
    <script>

    	function replyCheck(){
    		var loginCk = document.getElementById("memNo").value;
			var iReplyContent = document.getElementById("insertReplyContent").value;
			
            if(loginCk == ""){
				alert("로그인 한 회원만 댓글 등록이 가능합니다.");
				return false;
			} else if(iReplyContent.replace(/ /gi, "").length < 2){
				alert("댓글 내용은 두 글자 이상 입력해야 합니다.");
				return false;
			} else{
				return true;
			}
    	}
    
    	function recommendCk(){
    		if(document.getElementById("memNo").value == ""){
                alert("로그인 후 이용 가능한 서비스 입니다.");
            } else if('${loginUser.nickName}' == '${ cr.memNo }'){
            	alert("본인의 후기는 추천할 수 없습니다.");
            } else {
				location.href = 
					'recommendClass.me?grade=' + document.getElementById("grade").value 
					+ "&crNo=" + document.getElementById("crNo").value
					+ "&clNo=" + document.getElementById("clNo").value
					+ "&returnPage=" + document.getElementById("returnPage").value
					+ "&memNo=" + document.getElementById("memNo").value;
            }
    	}
    	
    	function deleteReply(replyNo){
    		if(confirm("정말로 댓글을 삭제하시겠습니까?") == true){
    			location.href = 'deleteReply.me?replyNo=' + replyNo
				+ "&crNo=" + document.getElementById("crNo").value
				+ "&clNo=" + document.getElementById("clNo").value
				+ "&returnPage=" + document.getElementById("returnPage").value;
    		}
    	}
    	
    	function updateReply1(replyNo){
    		var update1 = document.getElementById(replyNo + "update1");
    		var update2 = document.getElementById(replyNo + "update2");
    		var rUpdate = document.getElementById(replyNo + "replyUpdateArea");
    		
   			update1.style.display = "none";
   			update2.style.display = "inline";
   			rUpdate.style.display = "block";
    	}
    	
    	function updateReply2(replyNo){
    		var update1 = document.getElementById(replyNo + "update1");
    		var update2 = document.getElementById(replyNo + "update2");
    		var rUpdate = document.getElementById(replyNo + "replyUpdateArea");
    		
   			update1.style.display = "inline";
   			update2.style.display = "none";
   			rUpdate.style.display = "none";
    	}
    	
    	function replyUpdateCheck(replyNo){
    		var updateReplyContent = document.getElementById(replyNo + "updateReplyContent").value;
    		
    		if(updateReplyContent.replace(/ /gi, "").length >= 2){
    			return true;
    		} else {
				alert("댓글 내용은 두 글자 이상 입력해야 합니다.");
				return false;
    		}
    	}
    
    </script>

</body>
</html>