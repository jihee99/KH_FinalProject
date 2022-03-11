<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    <link rel="stylesheet" href="./resources/css/eventMain.css?5">
<style>
	.reply>input{
		margin: 0 auto;
		margin-bottom: 30px;
	}
	.innerOuter>button{
		display: block;
		width: 250px;
		margin: 0 auto;
		margin-top: 80px;
		margin-bottom: 50px;
		background: rgb(224, 224, 224)
	}
	.tags{margin-bottom: 80px;}
	.tags button{
		border: 0;
		outline: 0;
		background: white;
		font-weight: 600;
		font-size: 24px;
		float: left;
		margin-bottom: 30px;
		margin-left: 30px;
	}
	.tags button:hover{color: rgb(107, 171, 213, 0.7)}
	.img{width: 50%; height: 35%; margin: 0 auto;  overflow: hidden;}
	.content p{font-size: 20px; font-weight: 600; text-align: center;}
	.content button{display: block; width: 50%; margin: 0 auto; margin-top: 50px;}
	.img:hover{cursor: pointer;}
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
    <div class="innerOuter my-3" id="outer">
        <!-- 
        <div class="head py-5">
            <p>${e.eventTitle}</p>
        </div>

        <div class="tags">
        	<c:if test="${not empty e.tag}">
	        	<c:set var="tagArr" value="${fn:split(e.tag, ' ')}"></c:set>
	        	<c:forEach var="t" items="${tagArr}">
	        		<form id="tagSelect" method="post" action="tagSelect.ev">
       					<input type="hidden" id="hashtag" name="hashtag" value="${t}">
	        			<button type="submit" >${t}</button>
	        		</form>
	        	</c:forEach>
        	</c:if>
        </div>
         -->
        <div class="content">
        	<c:choose>
        		<c:when  test="${e.nowCount ne e.maxCount}">
        			<div class="img"><img class="img" src="${e.img}"></div>
        			<button class="btn" onclick="getCoupon();">쿠폰 발급받기</button>
        		</c:when>
        		<c:otherwise>
        			<img class="img" src="${e.img}" style="display:block; margin-left:250px;">
        			<button class="btn" disabled>해당 쿠폰은 소진 완료 되었습니다.</button>
        		</c:otherwise>
        	</c:choose>
        	<input type="hidden" id="couponNo" name="couponNo" value="${e.couponNo}">
        </div>
        
        <script>
        	function getCoupon(){
        		let couponNo = document.getElementById("couponNo").value;
        		let memNo = '<c:out value="${loginUser.memNo}"/>';
        		let noLogin = "";

        		if(memNo == noLogin){
        			alert("로그인 후 이용 가능합니다");
        		}else{
        			$.ajax({
        				url: "getCoupon.ev",
        				data:{memNo: memNo,
        					  couponNo: couponNo},
        				success:function(result){
        					if(result>0){
        						alert("쿠폰이 발급되었습니다! 내 쿠폰함에서 확인하세요.");
        					}else if(result == 0){
        						alert("이미 발급된 쿠폰입니다!");
        					}else if(result == -1){
        						alert("쿠폰이 모두 소진되었습니다.");
        					}else{
        						alert("쿠폰 발급에 실패하였습니다. 다시 시도해주세요.");
        					}
        				},error:function(){
        					console.log("쿠폰발급실패");
        				}
        			});
        		}
        	}
        </script>
        
       	<div class="modal modalSuccess" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<p style="text-align:center;">쿠폰이 발급되었습니다!</p>
					</div>
				<div class="modal-footer">
			        <button id="modalClose" type="button" class="btn" data-dismiss="modal">닫기</button>
			    </div>
				</div>
			</div>
		</div>
		
		<div class="modal modalAlready" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<p style="text-align:center;">이미 발급받은 쿠폰입니다.</p>
					</div>
				<div class="modal-footer">
			        <button id="modalClose" type="button" class="btn" data-dismiss="modal">닫기</button>
			    </div>
				</div>
			</div>
		</div>
		
		<div class="modal modalEnd" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<p style="text-align:center;">쿠폰이 모두 소진되었습니다.</p>
					</div>
				<div class="modal-footer">
			        <button id="modalClose" type="button" class="btn" data-dismiss="modal">닫기</button>
			    </div>
				</div>
			</div>
		</div>
		
		<div class="modal modalFail" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<p style="text-align:center;">쿠폰 발급에 실패하였습니다. 다시 시도해주세요.</p>
					</div>
				<div class="modal-footer">
			        <button id="modalClose" type="button" class="btn" data-dismiss="modal">닫기</button>
			    </div>
				</div>
			</div>
		</div>
		
		<c:if test="${e.category eq 'R'}">
	        <table class="table" id="replyTable">
	        	<thead>
	        		<tr></tr>
		        	<c:choose>
		        		<c:when test="${not empty loginUser}">
		        			<th style="vertical-align: middle; text-align: middle;">${loginUser.nickName}</th>
		        			<th>
		        				<input id="reply" class="form-control" style="width:100%">
		        			</th>
		        			<th style="vertical-align: middle"><button class="btn btn-light" onclick="addReply();">등록</button></th>
		        		</c:when>
		        		<c:otherwise>
		        			<th></th>
		        			<th>
		        				<textarea class="form-control" cols="30" rows="1" style="resize:none; width:100%" readonly>로그인 후 이용바랍니다.</textarea>
		        			</th>
		        			<th style="vertical-align: middle"><button class="btn btn-light" disabled>등록</button></th>
		        		</c:otherwise>
		        	</c:choose>
	        	</thead>
	       		<tbody style="text-align:center;">
	       		</tbody>
	        </table>
        </c:if>
       	<button type="button" class="btn" onclick="history.back()">목록으로</button>
       	
       	<script>
    
			$(function(){
				replyList();
			})    
			
			function replyList(){
				$.ajax({
					url:"replyList.ev",
					data:{contentNo: ${e.eventNo}},
					success:function(list){
						//console.log(list);
						
						let value = "";
	    				for(let i in list){
	    					value += "<tr>"
			                       +    "<th>" + list[i].nickName + "</th>"
			                       +    "<td>" + list[i].replyContent + "</td>"
			                       +    "<td>" + list[i].replyDate + "</td>"
			                       + "</tr>";
	    				}
	    				
	    				$("#replyTable tbody").html(value);
	    				
					},error:function(){
						console.log("댓글조회실패여기오지마ㅠㅠ");
					}
				})
			}
	    
	    	function addReply(){
	    		reply = $("#reply").val();
	    		console.log(reply);
	    		if(reply.trim().length != 0){
	    			$.ajax({
	    				url: "replyInsert.ev",
	    				data:{
	    					memNo: '${loginUser.memNo}',
	    					contentNo: ${e.eventNo},
	    					replyContent: reply
	    				},success:function(result){
	    					if(result == "1"){
	    						replyList();
	    						$("#reply").val("");
	    					}
	    				},error:function(){
	    					console.log("댓글추가실패오지마ㅠㅠ");
	    				}
	    			})
	    		}else{
	    			alert("댓글 작성 후 등록해주세요!");
	    		}
	    	}
	    </script>
       	
    </div>    
    
    
	
	 <jsp:include page="../common/footerBar.jsp" />
	
</body>
</html>