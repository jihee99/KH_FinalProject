<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
.qnaOuter {
	width: 700px;
}

.qna {
	margin-bottom: 40px;
}

.qna_list {
	height: auto;
}

.small_header {
	width: 100%;
	height: 90px;
}

.small_header>span {
	font-weight: bold;
	font-family: 본고딕;
	font-size: 20px;
}

.small_header>button {
	float: right;
	width: 100px;
	height: 30px;
	background: steelblue;
	color: white;
	border: none;
	border-radius: 5px;
}

.user_detail>button {
	background: none;
	border: none;
	font-weight: bold;
	font-size: 13px;
	cursor: pointer;
}

.user_detail {
	width: 400px;
	height: 80px;
}

.user_detail>span {
	display: inline-block;
	margin-top: 12px;
}

.user_image {
	width: 50px;
	height: 50px;
	border: 1px solid;
	position: inline-block;
	float: left;
	margin-right: 10px;
}

.qna_title {
	font-size: small;
	color: rgb(88, 88, 88);
}

.content {
	font-family: 본고딕;
	font-size: 15px;
	display: inline-block;
	width: 650px;
	height: auto;
	margin-bottom: 10px;
}

.more_qna {
	width: 600px;
	height: 50px;
	background: rgb(211, 229, 236);
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.answer_area {
	font-weight: bold;
	font-family: 본고딕;
}
.more_qna{width:700px; height: 50px; background:rgb(211, 229, 236); border: none; border-radius: 5px; cursor: pointer;}
</style>
</head>
<body>
	<div class="inner_outer">
		<div class="qnaOuter">
			<div class="small_header">
				<span>상품문의</span>
				<c:if test="${ loginUser != null }">
					<button type="button" class="input_qna" onclick="qnaEnrollForm(${p.productNo});">문의하기</button>
				</c:if>
			</div>
     		<c:choose>
	     	  <c:when test="${!empty sqList}">
				<div class="qna_list">
					<c:forEach var="q" items="${sqList}">
						<div class="qna">
							<div class="user_detail">
								<div class="user_image">
									<img src="" alt="">
								</div>
								<span class="user_name">${q.userId }</span> <span
									class="enroll_date">${q.createDate }</span>
								<button type="button">신고</button>
							</div>
							<div class="qna_content">
								<span class="qna_title">${q.title }</span> <br> <span
									class="content">${q.content }</span>
								<hr>
							</div>
							<div class="answer_area">
								<c:choose>
									<c:when test="${q.answerContent eq null}">
										<span>미답변</span>
									</c:when>
									<c:otherwise>
										<span>답변완료</span>								
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:forEach>
				</div>	
				
				<div class="bottom_area">
					<button type="button" class="more_qna" onclick="allQna(${p.productNo});">문의 더보기</button>
				</div>
					</c:when>
	        		<c:otherwise>
	        			<h4 align="center">문의가 없습니다. </h4>
	        			<br><br>
	        		</c:otherwise>
        	</c:choose>
			</div>
		</div>
	
	<script>
	
	function allQna(pno){
        window.open("qnaList.st?cpage=1&&pno=" + pno, "스토어문의목록", "width=816, height=800, resizeable=no, location=no");
    }
	
	function qnaEnrollForm(pno){
        window.open("qnaEnrollForm.st?pno=" + pno, "스토어문의작성", "width=650, height=800, resizeable=no, location=no");
    }
	
	
	
	</script>
</body>
</html>