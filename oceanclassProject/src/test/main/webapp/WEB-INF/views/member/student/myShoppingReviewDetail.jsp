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
    <link rel="stylesheet" href="./resources/css/stuMypage.css?second">
<style>
	.list{
	    width: 90%;
	    height: 22%;
	    margin: 0 auto;
	    margin-top: 50px;
	    background: rgba(107, 171, 213, 0.28);
	    padding: 10px;
	}
	#img{
		width: 30%; 
		height: 100%;
		float: left;
	}
	#img img{
		width: 100%;
		height: 80%;
	}
	.explain{
		width: 70%; 
		height: 100%; 
		float: left; 
		margin-top: 10px;
		padding: 10px;
	}
	.explain>h3{color:rgb(107, 171, 213); font-weight: 600;}
	.explain>p{margin-top: -10px; font-weight: bolder; }
	h4{font-weight: 600; margin-bottom: 20px;}
	#stitle{font-size: 18px; font-weight: 800p; margin-bottom: 20px;}
</style>
</head>
<body>
	<div class="content">
	    <div class="conhead">
	        <h2>상품 후기</h2>
	    </div>
		<div class="list">
        	<div id="img">
        		<a href=""><img src="resources/images/logo.png" alt=""></a>
            	<p>별점~~~~~</p>
        	</div>
        	<div class="explain">
                <h4>갤럭시Z FLIP 라벤더 색상 자급제 당일출고</h4>
                <p id="stitle">역시 다른건 다 필요없고 이쁜게 진리인걸 증명하는!!</p>
                <p>배터리 모자라도 괜찮아ㅠ 내 6s보단 배터리 많아ㅠ 카메라 후져도..</p>		<!-- 35자 내외로 표시하면 될듯? -->
            </div>
	    </div>
		<div class="list">
        	<div id="img">
        		<a href=""><img src="resources/images/logo.png" alt=""></a>
            	<p>별점~~~~~</p>
        	</div>
        	<div class="explain">
                <h4>잔슨빌 육즙 가득한 스모크 소세지 2300g</h4>
                <p id="stitle">맛있어요</p>
                <p>크루원들이랑 배터지게 먹었네요. 존맛탱</p>
            </div>
	    </div>
	    <div class="list">
        	<div id="img">
        		<a href=""><img src="resources/images/logo.png" alt=""></a>
            	<p>별점~~~~~</p>
        	</div>
        	<div class="explain">
                <h4>홈트레이닝 필수품! </h4>
                <p id="stitle">저도 이제 홈트고수가 되겠습니다</p>
                <p>에휴 망할 코로나~~ 집에서라도 열운동 하려고 샀습니다. 이제 근..</p>
            </div>
	    </div>
	    
	    <div class="paging" align="center">
			<button class="btn btn-light">&lt;</button>
			
			<button class="btn btn-light">1</button>
			<button class="btn btn-light">2</button>
			<button class="btn btn-light">3</button>
			<button class="btn btn-light">4</button>
			<button class="btn btn-light">5</button>
			
			<button class="btn btn-light">&gt;</button>
		</div>
	    
	</div>
	
</body>
</html>