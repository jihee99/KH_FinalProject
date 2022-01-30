<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/stuMypage.css">
<style>
	 .content>p{
         width: 420px;
         margin: 120px;
         text-align: left;
         font-weight: bolder;
     }
     h3{margin-left: 200px; margin-top: -50px;}
     button{margin-top: 30px; width: 100px; margin-left: 40px;}
</style>
</head>
<body>
	<div class="content">
	    <h2>회원 탈퇴</h2>
	    <p>
		        회원 탈퇴시 수강중인 강의와 진행중인 주문에 대한 조회가 불가능하며
		        모든 작성글은 탈퇴 후 삭제할 수 없습니다.
		        탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니
		        신중하게 선택하시기 바랍니다.
	    </p>
	    <h3>비밀번호 확인</p>
	    <input type="text" placeholder="비밀번호">
	    <button>회원탈퇴</button>
	</div>
</body>
</html>