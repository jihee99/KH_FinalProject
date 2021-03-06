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
        /*height: 1000px;*/
        margin:auto;
    }
    .outer>div{
        margin: 30px;
    }
    #pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 50px;
	}
    .qna{
        margin-bottom: 20px;
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

    <div class="outer">
        <div>
            <div style="font-weight: bold; font-size: 17px; color: #6babd5;">문의 전체 보기</div>
            <hr><br>

            <div id="qnaZone">
	        	<c:forEach var="q" items="${ cqList }">
		            <div class="qna">
		            
		                <div class="profile">
		                    <div style="float:left; margin-right: 10px;">
	                    		<c:choose>
		                      		<c:when test="${ !empty q.profile }">
		                           		<img src="${ q.profile }" width="40px" height="40px">
		                      		</c:when>
		                      		<c:otherwise>
		                           		<img src="resources/images/user.png" width="40px" height="40px">
		                      		</c:otherwise>
		                      	</c:choose>
		                    </div>
	                    	<span style="float:right; font-size:13px; cursor:pointer; margin-top:3px;" onclick="reportQnaForm(${q.csQnaNo});">신고하기</span>
		                    
		                    <div>
		                        <div style="font-weight: bold;">${ q.memNo }</div>
		                        <div style="font-size: 13px; color: gray; line-height: 27px;">${ q.createDate }</div>
		                    </div>
		                    
		                </div>
		                
		                <c:choose>
		                	<c:when test="${ !empty q.pwd && loginUser.nickName != q.memNo }">
				                <div id="pwdZone${ q.csQnaNo }" style="margin: 15px 0px;" align="center">
				                	<img src="resources/images/unlock.png" width="7%" style="margin-bottom:10px;"><br>
				                	해당 문의는 비밀글 입니다.<br>
				                	비밀번호 확인 후 내용 조회가 가능합니다.<br>
				                	<input type="password" id="pwdCk${ q.csQnaNo }" style="margin-top:10px;">
				                	<button type="button" onclick="pwdCheck(${q.csQnaNo});" class="btn" style="margin-bottom: 3px;background-color: #6babd5; height:30px; line-height: 11px; font-size:15px; color:white;">확인</button>
				                </div>
				                
				                <div id="noPwdZone${ q.csQnaNo }" style="display:none;">
					                <c:if test="${ loginUser.nickName == q.memNo }">
				               	    	<div style="float:right; margin-top:5px;">
					                    	<button type="button" onclick="updateQna(${q.csQnaNo});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">수정</button>
					                    	<button type="button" onclick="deleteQna(${q.referNo}, ${q.csQnaNo});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
				                    	</div>
	                    			</c:if>
				                
								    <div class="qnaTitle">
										<c:if test="${ !empty q.filePath }">
											<img src="${ q.filePath }" width="75%" style="margin-top:10px;">
										</c:if>
					                	<p style="width:100%; margin-top:10px; font-weight:bold;">${ q.title }</p>
					                </div>
		
					                <div class="qnaContent">
					                    <pre style="width:100%; white-space: pre-wrap;">${ q.content }</pre>
					                </div>
					                
									<c:if test="${ !empty q.answerContent }">
										<img src="resources/images/curvearrow.png" width="25" height="25" style="float:left;">
						                <div class="qnaAnswerArea" style="margin-left: 50px;">
											<div class="profile">
							                    <div style="float:left; margin-right: 10px;">
							                    	<c:choose>
							                      		<c:when test="${ !empty c.profile }">
							                           		<img src="${ c.profile }" width="40px" height="40px">
							                      		</c:when>
							                      		<c:otherwise>
							                           		<img src="resources/images/user.png" width="40px" height="40px">
							                      		</c:otherwise>
							                      	</c:choose>
							                    </div>
							                    <div>
							                        <div style="font-weight: bold;">${ q.teacherNick }</div>
							                        <div style="font-size: 13px; color: gray; line-height: 27px;">${ q.answerDate }</div>
							                    </div>
						                	</div>
						                	
						                	<div class="qnaAnswer" style="margin-top:20px;">
												<pre style="width:100%; white-space: pre-wrap;">${ q.answerContent }</pre>
						                	</div>
						                </div>
					                </c:if>
				                </div>
				                
				                <!-- 글 수정하기시 보여질 modal -->
							    <div id="updateQnaModal${ q.csQnaNo }" class="modal fade" role="dialog">
							        <form action="updateClassQnaList.me" method="post" enctype="multipart/form-data" onsubmit="return updateQnaFormCheck(${q.csQnaNo});">
							            <div class="modal-dialog">
							        		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
							        		<input type="hidden" name="referNo" value="${ q.referNo }">
							        		<input type="hidden" name="csQnaNo" value="${ q.csQnaNo }">
							        		<input type="hidden" name="cpage" value="${ pi.currentPage }">
							        		<input type="hidden" id="changeCk${ q.csQnaNo }" name="changeCk" value="nochange">
							        		
							                <!-- Modal content-->
							                <div class="modal-content">
							                    <div class="modal-header">
							                        <h4 class="modal-title">문의 수정하기</h4>
							                    </div>
							                    <div class="modal-body">
							                    	<c:choose>
							                    		<c:when test="${ !empty q.filePath }">
									                    	<img src="${ q.filePath }" id="updateThumbnailArea${ q.csQnaNo }" style="width:30%; display:block;"><br>
									                        <div id="originFileName${ q.csQnaNo }">
									                       		기존 파일: ${ q.filePath.substring(q.filePath.lastIndexOf('/') + 1, q.filePath.length()).toLowerCase() }
									                        	<button type="button" onclick="deleteFile(${q.csQnaNo});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
									                        </div>
									                        <input type="file" id="qnaUpdateFile${ q.csQnaNo }" name="upfile" style="width:70%;" onchange="updateThumbnail(this, ${ q.csQnaNo });">
							                    		</c:when>
							                    		<c:otherwise>
									                    	<img id="updateThumbnailArea${ q.csQnaNo }" style="width:30%; display:none;"><br>
									                        <input type="file" id="qnaUpdateFile${ q.csQnaNo }" name="upfile" style="width:70%;" onchange="updateThumbnail(this, ${ q.csQnaNo });">
							                    		</c:otherwise>
							                    	</c:choose>
							
							                        <div style="margin-top:10px;">
							                    		<span style="float:left; margin-top:4px; margin-right:10px;"><img src="resources/images/unlock.png" width="15" height="15">비밀번호(선택)</span>
							                    		<c:choose>
							                    			<c:when test="${ !empty q.pwd }">
																<input type="password" id="updateQnaPwd${ q.csQnaNo }" name="pwd" value="${ q.pwd }" class="form-control" placeholder="4자리 숫자" style="width:110px; height:30px;">
							                    			</c:when>
							                    			<c:otherwise>
																<input type="password" id="updateQnaPwd${ q.csQnaNo }" name="pwd" class="form-control" placeholder="4자리 숫자" style="width:110px; height:30px;">
							                    			</c:otherwise>
							                    		</c:choose>
							                    	</div>
							                    	<span style="width:100px;">제목</span>
							                    	<input type="text" id="updateQnaTitle${ q.csQnaNo }" name="title" value="${ q.title }" style="width:92%; margin-top:10px;">
							                        <textarea name="content" id="updateQnaContent${ q.csQnaNo }" style="width: 100%; height: 500px; resize: none; margin-top: 10px;" placeholder="내용을 작성해주세요.">${ q.content }</textarea>
							                    </div>
							                    <div class="modal-footer">
							                        <button type="submit" class="btn" style="background-color: #6babd5;">수정</button>
							                        <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>
							                    </div>
							                </div>
							        
							            </div>
							        </form>
							    </div>
				                
		                	</c:when>
		                	
		                	<c:otherwise>
				                <div id="noPwdZone${ q.csQnaNo }">
					                <c:if test="${ loginUser.nickName == q.memNo }">
				               	    	<div style="float:right; margin-top:5px;">
					                    	<button type="button" onclick="updateQna(${q.csQnaNo});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">수정</button>
					                    	<button type="button" onclick="deleteQna(${q.referNo}, ${q.csQnaNo});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
				                    	</div>
	                    			</c:if>
				                
								    <div class="qnaTitle">
										<c:if test="${ !empty q.filePath }">
											<img src="${ q.filePath }" width="75%" style="margin-top:10px;">
										</c:if>
					                	<p style="width:100%; margin-top:10px; font-weight:bold;">${ q.title }</p>
					                </div>
		
					                <div class="qnaContent">
					                    <pre style="width:100%; white-space: pre-wrap;">${ q.content }</pre>
					                </div>
					                
									<c:if test="${ !empty q.answerContent }">
										<img src="resources/images/curvearrow.png" width="25" height="25" style="float:left;">
						                <div class="qnaAnswerArea" style="margin-left: 50px;">
											<div class="profile">
							                    <div style="float:left; margin-right: 10px;">
							                    	<c:choose>
							                      		<c:when test="${ !empty c.profile }">
							                           		<img src="${ c.profile }" width="40px" height="40px">
							                      		</c:when>
							                      		<c:otherwise>
							                           		<img src="resources/images/user.png" width="40px" height="40px">
							                      		</c:otherwise>
							                      	</c:choose>
							                    </div>
							                    <div>
							                        <div style="font-weight: bold;">${ q.teacherNick }</div>
							                        <div style="font-size: 13px; color: gray; line-height: 27px;">${ q.answerDate }</div>
							                    </div>
						                	</div>
						                	
						                	<div class="qnaAnswer" style="margin-top:20px;">
												<pre style="width:100%; white-space: pre-wrap;">${ q.answerContent }</pre>
						                	</div>
						                </div>
					                </c:if>
				                </div>
				                
				                <!-- 글 수정하기시 보여질 modal -->
							    <div id="updateQnaModal${ q.csQnaNo }" class="modal fade" role="dialog">
							        <form action="updateClassQnaList.me" method="post" enctype="multipart/form-data" onsubmit="return updateQnaFormCheck(${q.csQnaNo});">
							            <div class="modal-dialog">
							        		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
							        		<input type="hidden" name="referNo" value="${ q.referNo }">
							        		<input type="hidden" name="csQnaNo" value="${ q.csQnaNo }">
					        				<input type="hidden" name="cpage" value="${ pi.currentPage }">
							        		<input type="hidden" id="changeCk${ q.csQnaNo }" name="changeCk" value="nochange">
							        		
							                <!-- Modal content-->
							                <div class="modal-content">
							                    <div class="modal-header">
							                        <h4 class="modal-title">문의 수정하기</h4>
							                    </div>
							                    <div class="modal-body">
							                    	<c:choose>
							                    		<c:when test="${ !empty q.filePath }">
									                    	<img src="${ q.filePath }" id="updateThumbnailArea${ q.csQnaNo }" style="width:30%; display:block;"><br>
									                        <div id="originFileName${ q.csQnaNo }">
									                       		기존 파일: ${ q.filePath.substring(q.filePath.lastIndexOf('/') + 1, q.filePath.length()).toLowerCase() }
									                        	<button type="button" onclick="deleteFile(${q.csQnaNo});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
									                        </div>
									                        <input type="file" id="qnaUpdateFile${ q.csQnaNo }" name="upfile" style="width:70%;" onchange="updateThumbnail(this, ${ q.csQnaNo });">
							                    		</c:when>
							                    		<c:otherwise>
									                    	<img id="updateThumbnailArea${ q.csQnaNo }" style="width:30%; display:none;"><br>
									                        <input type="file" id="qnaUpdateFile${ q.csQnaNo }" name="upfile" style="width:70%;" onchange="updateThumbnail(this, ${ q.csQnaNo });">
							                    		</c:otherwise>
							                    	</c:choose>
							
							                        <div style="margin-top:10px;">
							                    		<span style="float:left; margin-top:4px; margin-right:10px;"><img src="resources/images/unlock.png" width="15" height="15">비밀번호(선택)</span>
							                    		<c:choose>
							                    			<c:when test="${ !empty q.pwd }">
																<input type="password" id="updateQnaPwd${ q.csQnaNo }" name="pwd" value="${ q.pwd }" class="form-control" placeholder="4자리 숫자" style="width:110px; height:30px;">
							                    			</c:when>
							                    			<c:otherwise>
																<input type="password" id="updateQnaPwd${ q.csQnaNo }" name="pwd" class="form-control" placeholder="4자리 숫자" style="width:110px; height:30px;">
							                    			</c:otherwise>
							                    		</c:choose>
							                    	</div>
							                    	<span style="width:100px;">제목</span>
							                    	<input type="text" id="updateQnaTitle${ q.csQnaNo }" name="title" value="${ q.title }" style="width:92%; margin-top:10px;">
							                        <textarea name="content" id="updateQnaContent${ q.csQnaNo }" style="width: 100%; height: 500px; resize: none; margin-top: 10px;" placeholder="내용을 작성해주세요.">${ q.content }</textarea>
							                    </div>
							                    <div class="modal-footer">
							                        <button type="submit" class="btn" style="background-color: #6babd5;">수정</button>
							                        <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>
							                    </div>
							                </div>
							        
							            </div>
							        </form>
							    </div>
		                	</c:otherwise>
		                </c:choose>
		                
		                <hr>
	                </div>
	                
	                 <!-- 문의 신고하기시 보여질 modal -->
				    <div id="reportQnaModal${ q.csQnaNo }" class="modal fade" role="dialog">
				    	<div class="modal-dialog">
	
			                <!-- Modal content-->
			                <div class="modal-content">
			                    <div class="modal-header">
			                        <h4 class="modal-title">신고하기</h4>
			                        <button type="button" class="close" data-dismiss="modal">&times;</button>
			                    </div>
			                    <div class="modal-body">
			                    	<div style="font-size:17px; font-weight:bold; margin-bottom:15px;"><b>·</b> 신고 사유</div>
									<input type="radio" id="reportQnaR1${ q.csQnaNo }" name="reportQnaReason" value="1"> <label for="reportQnaR1${ q.csQnaNo }"> 욕설 또는 음란성 내용</label><br>
									<input type="radio" id="reportQnaR2${ q.csQnaNo }" name="reportQnaReason" value="2"> <label for="reportQnaR2${ q.csQnaNo }"> 부적절한 홍보성 댓글</label><br>
									<input type="radio" id="reportQnaR3${ q.csQnaNo }" name="reportQnaReason" value="3"> <label for="reportQnaR3${ q.csQnaNo }"> 사생활 침해 및 불법 촬영물</label><br>
									<input type="radio" id="reportQnaR4${ q.csQnaNo }" name="reportQnaReason" value="4"> <label for="reportQnaR4${ q.csQnaNo }"> 명예훼손 및 저작권침해</label><br>
									<input type="radio" id="reportQnaR5${ q.csQnaNo }" name="reportQnaReason" value="5"> <label for="reportQnaR5${ q.csQnaNo }"> 기타</label>
		                        	<textarea name="reportQnaContent" id="reportQnaContent${ q.csQnaNo }" style="width: 100%; height: 150px; resize: none; margin-top: 10px;" placeholder="내용을 작성해주세요."></textarea>
			                    </div>
			                    <div class="modal-footer">
			                        <button type="submit" class="btn" style="background-color: #6babd5; margin-right:190px;" onclick="reportQna(${ q.csQnaNo });">신고하기</button>
			                        <!--  <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>-->
			                    </div>
			                </div>
				        </div>
				    </div>
	            </c:forEach>
            </div>
	            
            <div id="pagingArea">
                <ul class="pagination">
                	<c:if test="${ pi.currentPage > 1 }">
							<li class="page-item"><a class="page-link" href="classQnaList.me?cpage=${ pi.currentPage - 1 }&referNo=${ referNo }">Previous</a></li>
					</c:if>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="classQnaList.me?cpage=${ p }&referNo=${ referNo }">${ p }</a></li>
					</c:forEach>
					<c:if test="${ pi.currentPage != pi.maxPage }">
							<li class="page-item"><a class="page-link" href="classQnaList.me?cpage=${ pi.currentPage + 1 }&referNo=${ referNo }">Next</a></li>
					</c:if>
                </ul>
            </div>
        </div>

    </div>
    
    <script>
	    function deleteQna(clNo, cqNo){
	    	if(confirm("정말로 삭제하시겠습니까?\n삭제 후 복구는 불가능합니다.") == true){
				location.href = 'deleteClassQnaList.me?referNo=' + clNo + '&csQnaNo=' + cqNo + "&cpage=" + ${ pi.currentPage };
			}
	    }
	    
		function updateQna(cqNo){
			$("#updateQnaModal" + cqNo).modal();
		}
		
		function deleteFile(cqNo){
			document.getElementById("changeCk" + cqNo).value = 'change';
			document.getElementById("originFileName" + cqNo).style.display = 'none';
			document.getElementById("updateThumbnailArea" + cqNo).src = null;
			document.getElementById("updateThumbnailArea" + cqNo).style.display = 'none';
		}
	    
		function updateThumbnail(inputFile, cqNo){
			
			if(inputFile.files.length == 1){
				// 파일을 읽어들일 객체
				const reader = new FileReader();
				// 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url 부여
				reader.readAsDataURL(inputFile.files[0]);
				// 파일 읽어들이기가 완료되었을때 실행할 함수 정의
				reader.onload = function(e) {
					// e.target.result -> 읽어들인 파일의 고유한 url 정의되어있음
					document.getElementById("updateThumbnailArea" + cqNo).src = e.target.result;
					document.getElementById("updateThumbnailArea" + cqNo).style.display = 'block';
					document.getElementById("originFileName" + cqNo).style.display = 'none';
				}
			} else { // 선택되었던 파일 취소
				document.getElementById("updateThumbnailArea" + cqNo).src = null;
				document.getElementById("updateThumbnailArea" + cqNo).style.display = 'none';
				document.getElementById("originFileName" + cqNo).style.display = 'none';
			}
		}
		
		function updateQnaFormCheck(cqNo){
			var file = document.getElementById("qnaUpdateFile" + cqNo).value;
			var title = document.getElementById("updateQnaTitle" + cqNo).value;
			var content = document.getElementById("updateQnaContent" + cqNo).value;
			var pwd = document.getElementById("updateQnaPwd" + cqNo).value;
			
			var regExp = /^[0-9]{4}$/;
			
			var pathpoint = file.lastIndexOf('.');
			var filepoint = file.substring(pathpoint+1, file.length);
			var filetype = filepoint.toLowerCase();
	
			if(title.replace(/ /gi, "").length < 5 || title.replace(/ /gi, "").length > 30){
				alert("문의 제목은 5글자 이상 30글자 이하로 작성해야 합니다.");
				return false;
			} else if(content.replace(/ /gi, "").length < 5){
				alert("문의 내용은 5글자 이상 입력해야 합니다.");
				return false;
			} else if(file != "" && filetype != 'jpg' && filetype != 'gif' && filetype != 'png' && filetype != 'jpeg' && filetype != 'bmp'){
				alert("문의 내용에는 사진 파일만 첨부할 수 있습니다.");
				return false;
			} else if(pwd != ""){
				if(regExp.test(pwd) == false){
					alert("비밀번호는 4자리 숫자로 설정해야합니다.");
					return false;
				} else if(pwd.length != 4){
					alert("비밀번호는 4자리 숫자로 설정해야합니다.");
					return false;
				}
			} else {
				return true;
			}
			
		}
		
		function pwdCheck(cqNo){
			var pwdCk = document.getElementById("pwdCk" + cqNo).value;
			var pwdZone = document.getElementById("pwdZone" + cqNo);
			var noPwdZone = document.getElementById("noPwdZone" + cqNo);
			
			$.ajax({
				url:"classQnaPwdCheck.me",
				data:{csQnaNo:cqNo,pwd:pwdCk},
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
					console.log("클래스 문의 비밀번호 확인용 ajax 통신 실패");    				
				}
			})
		}
		
		function reportQnaForm(cqNo){
			$("#reportQnaModal" + cqNo).modal();
		}
		
		function reportQna(cqNo){
    		// 신고 사유
    		var reportQnaR1 = document.getElementById("reportQnaR1" + cqNo);
    		var reportQnaR2 = document.getElementById("reportQnaR2" + cqNo);
    		var reportQnaR3 = document.getElementById("reportQnaR3" + cqNo);
    		var reportQnaR4 = document.getElementById("reportQnaR4" + cqNo);
    		var reportQnaR5 = document.getElementById("reportQnaR5" + cqNo);
    		// 신고 사유 '기타'일 시 이유
    		var reportQnaContent = document.getElementById("reportQnaContent" + cqNo).value;
    		
    		if(reportQnaR1.checked == true){
    			$.ajax({
					url:"reportQna.me",
					data:{refBNo:cqNo, content:reportQnaR1.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportQnaModal" + cqNo).modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportQnaR2.checked == true){
    			$.ajax({
					url:"reportQna.me",
					data:{refBNo:cqNo, content:reportQnaR2.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportQnaModal" + cqNo).modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportQnaR3.checked == true){
    			$.ajax({
					url:"reportQna.me",
					data:{refBNo:cqNo, content:reportQnaR3.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportQnaModal" + cqNo).modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportQnaR4.checked == true){
    			$.ajax({
					url:"reportQna.me",
					data:{refBNo:cqNo, content:reportQnaR4.value},
					success:function(result){
						if(result == 'yyyyy'){
							alert("신고가 접수되었습니다.");
							$("#reportQnaModal" + cqNo).modal('hide');
						} else{
							alert("신고처리에 실패했습니다.");
						}
					}, error:function(){
						console.log("리뷰 신고용 ajax 통신 실패");
					}
    			})
    		} else if(reportQnaR5.checked == true){
    			
    			if(reportQnaContent == null || reportQnaContent == ""){
    				alert("신고 이유를 입력해주세요.");
    			} else{
	    			$.ajax({
						url:"reportQna.me",
						data:{refBNo:cqNo, content:reportQnaR5.value, reason:reportQnaContent},
						success:function(result){
							if(result == 'yyyyy'){
								alert("신고가 접수되었습니다.");
								$("#reportQnaModal" + cqNo).modal('hide');
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
    </script>

</body>
</html>