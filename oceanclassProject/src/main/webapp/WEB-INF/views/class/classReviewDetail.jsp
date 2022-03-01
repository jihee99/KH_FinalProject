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
            <div style="font-weight: bold; font-size: 17px; color: #6babd5;">실제 수강생 리뷰 전체 보기</div>
            <hr>
            <img src="resources/images/back.png" width="20" height="20" onclick="location.href='classReviewList.me?cpage=${ returnPage }&clNo=${ reviewClNo }'" style="cursor:pointer;">
			<br><br>
			
            <div class="reviewContent">
                <div class="profile">
                    <div style="float:left; margin-right: 10px;">
                		<c:choose>
                      		<c:when test="${ !empty cr.profile }">
                           		<img src="${ cr.profile }" width="40px" height="40px">
                      		</c:when>
                      		<c:otherwise>
                           		<img src="resources/images/user.png" width="40px" height="40px">
                      		</c:otherwise>
                      	</c:choose>
                    </div>
                    <div>
                    	<c:if test="${ loginUser.nickName == cr.memNo }">
	               	    	<div style="float:right;">
		                    	<button type="button" onclick="updateReview();" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">수정</button>
		                    	<button type="button" onclick="deleteReview(${cr.crNo}, ${reviewClNo}, ${returnPage});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
	                    	</div>
                    	</c:if>
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

                <div class="reviewContent" style="margin-top: 10px; margin-bottom:50px;">
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
                    <span style="float:right; cursor:pointer;" onclick="reportReviewForm(${cr.crNo});">신고하기</span>
                </div>
                
                <!-- 리뷰 신고하기시 보여질 modal -->
			    <div id="reportReviewModal" class="modal fade" role="dialog">
			    	<div class="modal-dialog">

		                <!-- Modal content-->
		                <div class="modal-content">
		                    <div class="modal-header">
		                        <h4 class="modal-title">신고하기</h4>
		                        <button type="button" class="close" data-dismiss="modal">&times;</button>
		                    </div>
		                    <div class="modal-body">
		                    	<div style="font-size:17px; font-weight:bold; margin-bottom:15px;"><b>·</b> 신고 사유</div>
								<input type="radio" id="reportReviewR1" name="reportReviewReason" value="1"> <label for="reportReviewR1"> 욕설 또는 음란성 내용</label><br>
								<input type="radio" id="reportReviewR2" name="reportReviewReason" value="2"> <label for="reportReviewR2"> 부적절한 홍보성 댓글</label><br>
								<input type="radio" id="reportReviewR3" name="reportReviewReason" value="3"> <label for="reportReviewR3"> 사생활 침해 및 불법 촬영물</label><br>
								<input type="radio" id="reportReviewR4" name="reportReviewReason" value="4"> <label for="reportReviewR4"> 명예훼손 및 저작권침해</label><br>
								<input type="radio" id="reportReviewR5" name="reportReviewReason" value="5"> <label for="reportReviewR5"> 기타</label>
	                        	<textarea name="reportReviewContent" id="reportReviewContent" style="width: 100%; height: 150px; resize: none; margin-top: 10px;" placeholder="내용을 작성해주세요."></textarea>
		                    </div>
		                    <div class="modal-footer">
		                        <button type="button" class="btn" style="background-color: #6babd5; margin-right:190px;" onclick="reportReview(${cr.crNo});">신고하기</button>
		                        <!--  <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>-->
		                    </div>
		                </div>
			        </div>
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
			                        	<c:choose>
				                      		<c:when test="${ !empty r.profile }">
				                           		<img src="${ r.profile }" width="30px" height="30px">
				                      		</c:when>
				                      		<c:otherwise>
				                           		<img src="resources/images/user.png" width="30px" height="30px">
				                      		</c:otherwise>
				                      	</c:choose>
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
   	                        			<span onclick="reportReviewReplyForm(${r.replyNo});">신고하기</span>
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
				                   		<input type="text" id="${ r.replyNo }updateReplyContent" class="form-control" name="replyContent" style="width: 450px; display: inline-block;" placeholder="수정할 댓글 내용을 입력해주세요." value="${ r.replyContent }">
				             			<input type="hidden" name="replyNo" value="${ r.replyNo }">
					                    <input type="hidden" name="memNo" value="${ loginUser.memNo }">
				             			<input type="hidden" name="contentNo" value="${ cr.crNo }">
					                    <input type="hidden" name="clNo" value="${ reviewClNo }">
					                    <input type="hidden" name="returnPage" value="${ returnPage }">
				                   		<button type="submit" class="btn" style="background-color: #6babd5; width: 80px; color: white; margin-bottom: 5px;">수정</button>
				                   	</form>
				                </div>
			                </div>
			                
			                <!-- 댓글 신고하기시 보여질 modal -->
						    <div id="reportReviewReplyModal${ r.replyNo }" class="modal fade" role="dialog">
						    	<div class="modal-dialog">
			
					                <!-- Modal content-->
					                <div class="modal-content">
					                    <div class="modal-header">
					                        <h4 class="modal-title">신고하기</h4>
					                        <button type="button" class="close" data-dismiss="modal">&times;</button>
					                    </div>
					                    <div class="modal-body">
					                    	<div style="font-size:17px; font-weight:bold; margin-bottom:15px;"><b>·</b> 신고 사유</div>
											<input type="radio" id="reportReviewR1${ r.replyNo }" name="reportReviewReason" value="1"> <label for="reportReviewR1${ r.replyNo }"> 욕설 또는 음란성 내용</label><br>
											<input type="radio" id="reportReviewR2${ r.replyNo }" name="reportReviewReason" value="2"> <label for="reportReviewR2${ r.replyNo }"> 부적절한 홍보성 댓글</label><br>
											<input type="radio" id="reportReviewR3${ r.replyNo }" name="reportReviewReason" value="3"> <label for="reportReviewR3${ r.replyNo }"> 사생활 침해 및 불법 촬영물</label><br>
											<input type="radio" id="reportReviewR4${ r.replyNo }" name="reportReviewReason" value="4"> <label for="reportReviewR4${ r.replyNo }"> 명예훼손 및 저작권침해</label><br>
											<input type="radio" id="reportReviewR5${ r.replyNo }" name="reportReviewReason" value="5"> <label for="reportReviewR5${ r.replyNo }"> 기타</label>
				                        	<textarea name="reportReviewContent" id="reportReviewContent${ r.replyNo }" style="width: 100%; height: 150px; resize: none; margin-top: 10px;" placeholder="내용을 작성해주세요."></textarea>
					                    </div>
					                    <div class="modal-footer">
					                        <button type="submit" class="btn" style="background-color: #6babd5; margin-right:190px;" onclick="reportReviewReply(${ r.replyNo });">신고하기</button>
					                        <!--  <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>-->
					                    </div>
					                </div>
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

			<!-- 글 수정하기시 보여질 modal -->
		    <div id="updateReviewModal" class="modal fade" role="dialog">
		    	<div class="modal-dialog">
		        	<form action="updateClassReview.me" method="post" enctype="multipart/form-data" onsubmit="return updateReviewFormCheck();">
		        		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
		        		<input type="hidden" name="clNo" value="${ reviewClNo }">
		        		<input type="hidden" name="crNo" value="${ cr.crNo }">
		        		<input type="hidden" name="rpage" value="${ returnPage }">
                    	<input type="hidden" id="changeCk" name="changeCk" value="nochange">
		                <!-- Modal content-->
		                <div class="modal-content">
		                    <div class="modal-header">
		                        <h4 class="modal-title">리뷰 수정하기</h4>
		                        <!--  
		                        <button type="button" class="close" data-dismiss="modal">&times;</button>
		                    	-->
		                    </div>
		                    <div class="modal-body">
		                    	<c:choose>
		                    		<c:when test="${ !empty cr.filePath }">
				                    	<img src="${ cr.filePath }" id="updateThumbnailArea" style="width:30%; display:block;"><br>
				                        <div id="originFileName">
				                       		기존 파일: ${ cr.filePath.substring(cr.filePath.lastIndexOf('/') + 1, cr.filePath.length()).toLowerCase() }
				                        	<button type="button" onclick="deleteFile();" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
				                        </div>
				                        <input type="file" id="updateFile" name="upfile" style="width:70%;" onchange="updateThumbnail(this);">
		                    		</c:when>
		                    		<c:otherwise>
				                    	<img id="updateThumbnailArea" style="width:30%; display:none;"><br>
				                        <input type="file" id="updateFile" name="upfile" style="width:70%;" onchange="updateThumbnail(this);">
		                    		</c:otherwise>
		                    	</c:choose>
		                    	<div style="float:right;">
		                    		<span><img src="resources/images/star.png" width="12" height="12">별점</span>
		                    		<span>
		                    			<select name="star">
		                    				<option value="${ cr.star }" style="display:none;" selected>${ cr.star }점</option>
		                    				<option value="1">1점</option>
		                    				<option value="1.5">1.5점</option>
		                    				<option value="2">2점</option>
		                    				<option value="2.5">2.5점</option>
		                    				<option value="3">3점</option>
		                    				<option value="3.5">3.5점</option>
		                    				<option value="4">4점</option>
		                    				<option value="4.5">4.5점</option>
		                    				<option value="5">5점</option>
		                    			</select>
		                    		</span>
		                    	</div>
		                        <textarea name="content" id="updateContent" style="width: 100%; height: 500px; resize: none; margin-top: 10px;" placeholder="내용을 작성해주세요.">${ cr.content }</textarea>
		                    </div>
		                    <div class="modal-footer">
		                        <button type="submit" class="btn" style="background-color: #6babd5;">수정</button>
		                        <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>
		                    </div>
		                </div>
		       		</form>
		        </div>
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
            	alert("본인의 리뷰는 추천할 수 없습니다.");
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
    	
    	function deleteReview(crNo, clNo, returnPage){
    		if(confirm("정말로 삭제하시겠습니까?\n삭제 후 복구는 불가능합니다.") == true){
    			//console.log(crNo, clNo, returnPage);
    			location.href = 'deleteClassReview.me?crNo=' + crNo + "&clNo=" + clNo + "&rpage=" + returnPage;
    		}
    	}
    
    	function updateReview(){
    		$("#updateReviewModal").modal();
    	}
    	
    	function updateThumbnail(inputFile){
			if(inputFile.files.length == 1){
				// 파일을 읽어들일 객체
				const reader = new FileReader();
				// 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url 부여
				reader.readAsDataURL(inputFile.files[0]);
				// 파일 읽어들이기가 완료되었을때 실행할 함수 정의
				reader.onload = function(e) {
					// e.target.result -> 읽어들인 파일의 고유한 url 정의되어있음
					document.getElementById("updateThumbnailArea").src = e.target.result;
					document.getElementById("updateThumbnailArea").style.display = 'block';
					document.getElementById("originFileName").style.display = 'none';
				}
			} else { // 선택되었던 파일 취소
				document.getElementById("updateThumbnailArea").src = null;
				document.getElementById("updateThumbnailArea").style.display = 'none';
				document.getElementById("originFileName").style.display = 'none';
				
				/*
				if(${ cr.filePath } == ''){
					document.getElementById("updateThumbnailArea").src = null;
					document.getElementById("updateThumbnailArea").style.display = 'none';
					document.getElementById("originFileName").style.display = 'none';
				} else {
					document.getElementById("updateThumbnailArea").src = '${ cr.filePath }';
					document.getElementById("updateThumbnailArea").style.display = 'block';
					document.getElementById("originFileName").style.display = 'block';
				}
				*/
			}
		}
    	
    	function deleteFile(){
    		document.getElementById("changeCk").value = 'change';
			document.getElementById("originFileName").style.display = 'none';
			document.getElementById("updateThumbnailArea").src = null;
			document.getElementById("updateThumbnailArea").style.display = 'none';
    	}
    	
    	function updateReviewFormCheck(){
    		var file = document.getElementById("updateFile").value;
			var content = document.getElementById("updateContent").value;
			
			var pathpoint = file.lastIndexOf('.');
			var filepoint = file.substring(pathpoint+1, file.length);
			var filetype = filepoint.toLowerCase();
			
			if(content.replace(/ /gi, "").length < 5){
				alert("리뷰 내용은 5글자 이상 입력해야 합니다.");
				return false;
			} else if(file == ""){
				return true;
			} else if(filetype != 'jpg' && filetype != 'gif' && filetype != 'png' && filetype != 'jpeg' && filetype != 'bmp'){
				alert("리뷰 내용에는 사진 파일만 첨부할 수 있습니다.");
				return false;
			} else {
				return true;
			}
    	}
    	
    	function reportReviewForm(crNo){
    		//window.open("reportReviewForm.me?crNo=" + crNo, "리뷰신고페이지", "width=600, height=600");
    		$("#reportReviewModal").modal();
    	}
    	
    	function reportReview(crNo){
    		// 신고 사유
    		var reportReviewR1 = document.getElementById("reportReviewR1");
    		var reportReviewR2 = document.getElementById("reportReviewR2");
    		var reportReviewR3 = document.getElementById("reportReviewR3");
    		var reportReviewR4 = document.getElementById("reportReviewR4");
    		var reportReviewR5 = document.getElementById("reportReviewR5");
    		// 신고 사유 '기타'일 시 이유
    		var reportReviewContent = document.getElementById("reportReviewContent").value;
    		
    		if(reportReviewR1.checked == true){
    			$.ajax({
					url:"reportReview.me",
					data:{refBNo:crNo, content:reportReviewR1.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportReviewModal").modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportReviewR2.checked == true){
    			$.ajax({
					url:"reportReview.me",
					data:{refBNo:crNo, content:reportReviewR2.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportReviewModal").modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportReviewR3.checked == true){
    			$.ajax({
					url:"reportReview.me",
					data:{refBNo:crNo, content:reportReviewR3.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportReviewModal").modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportReviewR4.checked == true){
    			$.ajax({
					url:"reportReview.me",
					data:{refBNo:crNo, content:reportReviewR4.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportReviewModal").modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportReviewR5.checked == true){
    			
    			if(reportReviewContent == null || reportReviewContent == ""){
    				alert("신고 이유를 입력해주세요.");
    			} else{
	    			$.ajax({
						url:"reportReview.me",
						data:{refBNo:crNo, content:reportReviewR5.value, reason:reportReviewContent},
						success:function(result){
							if(result == 'yyyyy'){
								alert("신고가 접수되었습니다.");
								$("#reportReviewModal").modal('hide');
							} else{
								alert("신고처리에 실패했습니다.");
							}
						}, error:function(){
							console.log("리뷰 신고용 ajax 통신 실패");
						}
	    			})
    			}
    			
    		}
    		
    	}
    	
    	function reportReviewReplyForm(replyNo){
    		$("#reportReviewReplyModal" + replyNo).modal();
    	}
    	
    	function reportReviewReply(replyNo){
    		// 신고 사유
    		var reportReviewR1 = document.getElementById("reportReviewR1" + replyNo);
    		var reportReviewR2 = document.getElementById("reportReviewR2" + replyNo);
    		var reportReviewR3 = document.getElementById("reportReviewR3" + replyNo);
    		var reportReviewR4 = document.getElementById("reportReviewR4" + replyNo);
    		var reportReviewR5 = document.getElementById("reportReviewR5" + replyNo);
    		// 신고 사유 '기타'일 시 이유
    		var reportReviewContent = document.getElementById("reportReviewContent" + replyNo).value;
    		
    		if(reportReviewR1.checked == true){
    			$.ajax({
					url:"reportReviewReply.me",
					data:{refBNo:replyNo, content:reportReviewR1.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportReviewReplyModal" + replyNo).modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 댓글 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportReviewR2.checked == true){
    			$.ajax({
					url:"reportReviewReply.me",
					data:{refBNo:replyNo, content:reportReviewR2.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportReviewReplyModal" + replyNo).modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 댓글 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportReviewR3.checked == true){
      			$.ajax({
					url:"reportReviewReply.me",
					data:{refBNo:replyNo, content:reportReviewR3.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportReviewReplyModal" + replyNo).modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 댓글 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportReviewR4.checked == true){
      			$.ajax({
					url:"reportReviewReply.me",
					data:{refBNo:replyNo, content:reportReviewR4.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportReviewReplyModal" + replyNo).modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 댓글 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportReviewR5.checked == true){
    			
    			if(reportReviewContent == null || reportReviewContent == ""){
    				alert("신고 이유를 입력해주세요.");
    			} else{
	      			$.ajax({
						url:"reportReviewReply.me",
						data:{refBNo:replyNo, content:reportReviewR5.value, reason:reportReviewContent},
						success:function(result){
							if(result == 'yyyyy'){
								alert("신고가 접수되었습니다.");
								$("#reportReviewReplyModal" + replyNo).modal('hide');
							} else{
								alert("신고처리에 실패했습니다.");
							}
						}, error:function(){
							console.log("리뷰 댓글 신고용 ajax 통신 실패");
						}
	    			})
    			}
    			
    		}
    	}
    	
    </script>

</body>
</html>