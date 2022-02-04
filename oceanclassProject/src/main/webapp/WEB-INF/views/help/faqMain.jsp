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
	<link rel="stylesheet" href="./resources/css/helpMain.css?3">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <div class="innerOuter my-3">
        <div class="head py-3">
            <p>HELP</p>
        </div>
        <div class="button my-3">
            <button type="button" class="btn btn-outline-primary">공지사항</button>
            <button type="button" class="btn btn-outline-primary">FAQ</button>
            <button type="button" class="btn btn-outline-primary">1:1문의</button>
        </div>
        <div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
			  	<h2 class="accordion-header" id="flush-headingOne">
			    	<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			      	클래스 수강은 어떻게 하나요?
			    	</button>
			  	</h2>
			  <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
			    <div class="accordion-body">
			    	잘 해보라노~~~!!!
			    </div>
			  </div>
			</div>
		</div>
    </div>
</body>
</html>