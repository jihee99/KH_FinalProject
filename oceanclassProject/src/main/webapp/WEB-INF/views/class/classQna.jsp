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
    .qnaOuter{
        width: 650px;
        margin:auto;
        /*margin-top: 20px;*/
        margin-bottom: 100px;
        box-sizing: border-box;
    }
    .qna{
        margin-bottom: 20px;
    }
</style>
</head>
<body>
    <div class="qnaOuter">
        <p style="color: #6babd5; font-weight: bold;">문의하기</p>
        
        <div align="right">
            <button type="button" id="qnaEnrollBtn" onclick="enrollQnaCk(${c.clNo});" class="btn" style="background-color: lightgray; width: 120px; font-size: 13px; height: 30px; line-height: 10px; font-weight: bold;">문의 작성하기</button>
        </div>
        <br><br>
        
		<c:choose>
			<c:when test="${ !empty cqList }">
		        <div id="qnaZone">
		        	<c:forEach var="q" items="${ cqMainList }">
			            <div class="qna">
			            
			                <div class="profile">
			                    <div style="float:left; margin-right: 10px;">
			                        <img src="" width="50px" height="50px">
			                    </div>
			                    
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
						                    	<button type="button" onclick="deleteQna(${c.clNo}, ${q.csQnaNo});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
					                    	</div>
		                    			</c:if>
					                
									    <div class="qnaTitle">
											<c:if test="${ !empty q.filePath }">
												<img src="${ q.filePath }" width="80%" style="margin-top:10px;">
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
								                        <img src="" width="50px" height="50px">
								                    </div>
								                    <div>
								                        <div style="font-weight: bold;">${ c.memNo }</div>
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
								        <form action="updateClassQna.me" method="post" enctype="multipart/form-data" onsubmit="return updateQnaFormCheck(${q.csQnaNo});">
								            <div class="modal-dialog">
								        		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
								        		<input type="hidden" name="referNo" value="${ c.clNo }">
								        		<input type="hidden" name="csQnaNo" value="${ q.csQnaNo }">
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
						                    	<button type="button" onclick="deleteQna(${c.clNo}, ${q.csQnaNo});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
					                    	</div>
		                    			</c:if>
					                
									    <div class="qnaTitle">
											<c:if test="${ !empty q.filePath }">
												<img src="${ q.filePath }" width="80%" style="margin-top:10px;">
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
								                        <img src="" width="50px" height="50px">
								                    </div>
								                    <div>
								                        <div style="font-weight: bold;">${ c.memNo }</div>
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
								        <form action="updateClassQna.me" method="post" enctype="multipart/form-data" onsubmit="return updateQnaFormCheck(${q.csQnaNo});">
								            <div class="modal-dialog">
								        		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
								        		<input type="hidden" name="referNo" value="${ c.clNo }">
								        		<input type="hidden" name="csQnaNo" value="${ q.csQnaNo }">
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
		            </c:forEach>
	            </div>
		        
		        <div class="allQna">
		            <button type="button" class="btn" style="background-color: #6babd5; width: 100%; color: white; margin-top:30px;" onclick="allQna(${c.clNo});">모든 문의 보기</button>
		            <!-- 버튼 누르면 새창 띄워지게 -->
		        </div>
	        </c:when>
	        
	        <c:otherwise>
	        	<div>아직 해당 클래스에 등록된 문의가 없습니다.</div>
	        </c:otherwise>
        </c:choose>
        <br><br>
        
    </div>

    <!-- 글 작성하기시 보여질 modal -->
    <div id="qnaModal" class="modal fade" role="dialog">
        <form action="enrollClassQna.me" method="post" enctype="multipart/form-data" onsubmit="return enrollQnaFormCheck();">
            <div class="modal-dialog">
        		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
        		<input type="hidden" name="referNo" value="${ c.clNo }">
        		
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">문의 작성하기</h4>
                        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                    <div class="modal-body">
                    	<img id="qnaThumbnailArea" style="width:30%; display:none;"><br>
                    	<input type="file" id="enrollQnaFile" name="upfile" style="width:50%;" onchange="insertQnaThumbnail(this);">
                        <div style="margin-top:10px;">
                    		<span style="float:left; margin-top:4px; margin-right:10px;"><img src="resources/images/unlock.png" width="15" height="15">비밀번호(선택)</span>
							<input type="password" id="qnaPwd" name="pwd" class="form-control" placeholder="4자리 숫자" style="width:110px; height:30px;">
                    	</div>
                    	<span style="width:100px;">제목</span>
                    	<input type="text" id="enrollQnaTitle" name="title" style="width:92%; margin-top:10px;">
                        <textarea name="content" id="enrollQnaContent" style="width: 100%; height: 500px; resize: none; margin-top: 10px;" placeholder="내용을 작성해주세요."></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn" style="background-color: #6babd5;">작성</button>
                        <button type="button" class="btn" data-dismiss="modal" style="background-color: lightgray;">취소</button>
                    </div>
                </div>
        
            </div>
        </form>
    </div>
    
    <script>
	    function enrollQnaCk(classNo){
	    	var memNo = document.getElementById("memNo").value;
	    	var grade = document.getElementById("grade").value;
	    	
			if(memNo == ""){
				alert("로그인 한 회원만 문의를 작성할 수 있습니다.");
			} else if(grade != 'S') {
				alert("학생 회원만 문의를 작성할 수 있습니다.");
			} else{
				$("#qnaModal").modal();
			}
		}
	    
	    function insertQnaThumbnail(inputFile){
			if(inputFile.files.length == 1){
				// 파일을 읽어들일 객체
				const reader = new FileReader();
				// 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url 부여
				reader.readAsDataURL(inputFile.files[0]);
				// 파일 읽어들이기가 완료되었을때 실행할 함수 정의
				reader.onload = function(e) {
					// e.target.result -> 읽어들인 파일의 고유한 url 정의되어있음
					document.getElementById("qnaThumbnailArea").src = e.target.result;
					document.getElementById("qnaThumbnailArea").style.display = 'block';
				}
			} else { // 선택되었던 파일 취소
				document.getElementById("qnaThumbnailArea").src = null;
				document.getElementById("qnaThumbnailArea").style.display = 'none';
			}
		}
	    
	    function enrollQnaFormCheck(){
			var file = document.getElementById("enrollQnaFile").value;
			var title = document.getElementById("enrollQnaTitle").value;
			var content = document.getElementById("enrollQnaContent").value;
			var pwd = document.getElementById("qnaPwd").value;
			
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
	    
	    function deleteQna(clNo, cqNo){
	    	if(confirm("정말로 삭제하시겠습니까?\n삭제 후 복구는 불가능합니다.") == true){
    			location.href = 'deleteClassQna.me?referNo=' + clNo + '&csQnaNo=' + cqNo;
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
    	
    	function allQna(clNo){
            window.open("classQnaList.me?cpage=1&&referNo=" + clNo, "클래스문의목록", "width=650, height=800, resizeable=no, location=no");
    	}
    </script>

</body>
</html>