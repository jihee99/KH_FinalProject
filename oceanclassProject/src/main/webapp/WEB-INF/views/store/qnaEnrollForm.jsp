<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<title>Document</title>
<style>
.review_detail {
	width: 600px;
	height: auto;
}

.mini_header>img {
	margin: auto;
	display: block;
}

.mini_header>p {
	margin: auto;
	height: 45px;
	background: rgb(88, 159, 230);
	color: white;
	font-weight: bold;
	font-size: 25px;
}

.product_info {
	width: 300px;
	height: 150px;
	display: block;
	margin: auto;
	margin-bottom: 10px;
	margin-top: 20px;
}

.product_title_img {
	float: left;
	width: 120px;
	height: 130px;
	margin-right: 15px;
}

.merchant_name, .product_option {
	font-size: 13px;
	color: rgb(112, 112, 112);
}

.product_name {
	font-size: 15px;
}

tr {
	display: block;
	float: left;
}

th, td {
	display: block;
	text-align: center;
	padding: 10px;
}

th {
	background: lightgray;
	padding: 12px;
}

table {
	border: 1px solid;
	border-collapse: collapse;
	table-layout: fixed;
}

.content_area {
	height: 250px;
}

.button_area>button {
	width: 150px;
	height: 40px;
	border: none;
	font-weight: bold;
	font-family: 본고딕;
}

.registration {
	background: rgb(88, 159, 230);
	color: white;
}

.cancel {
	color: rgb(83, 83, 83);
}

#counter {
	display: block;
	margin-left: 340px;
}
</style>
</head>
<body>
	<div class="review_detail">


		<div class="mini_header">
			<img src="./resources/images/logo.png" width="150px"><br>
			<p align="center">문의하기</p>
		</div>

		<div class="product_info">
			<img src="${p.productImg0 }" class="product_title_img"> <span
				class="merchant_name">${p.nickname }</span> <br> <span
				class="product_name">${p.title }</span><br>
		</div>

		<form action="qna.pr" class="form-area" id="form-area" method="post">
			<input type="hidden" id="memNo" name="memNo" value="${loginUser.memNo}"> 
			<input type="hidden" name="referNo" value="${pno}">
			<table class="qna" align="center">
				<tr class="title">
					<th>문의유형</th>
					<th>제목</th>
					<th class="content_area">내용</th>
				</tr>
				<tr class="content">
					<td><select name="category" id="category" style="width: 390px;">
							<option value="0" selected>문의유형 선택</option>
							<option value="상품">상품</option>
							<option value="배송">배송</option>
							<option value="반품">반품</option>
							<option value="교환">교환</option>
							<option value="환불">환불</option>
							<option value="기타">기타</option>
					</select></td>
					<td><input type="text" style="width: 330px;" id="title" name="title">
						<span id="counter1">0/35</span> <span>자</span></td>
					<td colspan="3"><textarea name="content" id="content" cols="49" rows="8" maxlength="500"></textarea> <br> 
					<span id="counter2">0/1000</span></td>
				</tr>
			</table>

			<br>
			<div class="secret" align="center">
				<input type="checkbox" id="pwdCk" name="pwdCk" value="1">
				비밀글로 문의하기 <input type="password" maxlength="4" id="pwd" name="pwd" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" disabled>
				<br><span style="font-size:12px;">비밀번호는 숫자만 입력가능합니다.(4자리)</span>
			</div>
			<br>
		</form>
		<div class="button_area" align="center">
			<button type="button" class="cancel" onclick="window.close();">취소</button>
			<button type="submit" class="registration" onclick="formCheck();">등록</button>
		</div>

	</div>

	<script>
		function formCheck() {

			var o = document.getElementById("category");
			var category = o.options[o.selectedIndex].text;
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			var pwd = document.getElementById("pwd").value;

			if (category.length > 2) {
				alert("문의유형을 다시 선택해주세요.");
			} else if (!title) {
				alert("문의 제목을 입력해주세요.");
			} else if (content.length < 5) {
				alert("내용을 5글자 이상 입력해주세요.");
			} else {
				document.getElementById("form-area").submit();
				alert("문의 작성 완료!");
			}
		}
		
		$("input:checkbox[name=pwdCk]").click(function(){
	        if($("input[name=pwdCk]:checked").val() == "1"){
	            $("#pwd").prop("disabled",false);
	        } else{
	            $("#pwd").prop("disabled",true);
	        }

	    })
	</script>
</body>
</html>