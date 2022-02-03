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
	    height: 15%;
	    margin: 0 auto;
	    margin-top: 50px;
	    border: 1px solid lightgray;
	}
	.list img{
		width: 25%; 
		height: 100%;
		float: left;
	}
	#explain{
		width: 50%; 
		height: 100%; 
		float: left; 
		margin-top: 10px;
		margin-left: 15px;
	}
	#explain>h3{color:rgb(107, 171, 213); font-weight: 600;}
	#explain>p{margin-top: -10px; font-weight: bolder; }
	#state{float:left;}
	.list>button{
		width: 20%; 
		height: 50%; 
		margin-top: 30px;
		margin-left: 15px;
		font-weight: 600;
	}
	
</style>
</head>
<body>
	<div class="content">
	    <h2>주문 조회</h2>
	    <div class="searchBar">
	        <p>기간검색</p>
	        <button class="btn btn-info">1주일</button>
	        <button class="btn btn-info">15일</button>
	        <button class="btn btn-info">1개월</button>
	        <div id="search">
	            <input type="date"> ~ <input type="date">
	            <button>검색</button>
	        </div>
	    </div>
	    <div class="list">
	    	<a href=""><img src="resources/images/logo.png" alt=""></a>
            <div id="explain">
                <h4>잔슨빌 육즙 가득한 스모크 소세지</h4>
                <p>주문날짜 : 2021-01-02</p>
                <h3 id="state">배송완료</h3>
            </div>
            <button class="btn btn-info">주문 상세보기</button>
	    </div>
	    <div class="list">
	    	<a href=""><img src="resources/images/logo.png" alt=""></a>
            <div id="explain">
                <h4>잔슨빌 육즙 가득한 스모크 소세지</h4>
                <p>주문날짜 : 2021-01-02</p>
                <h3 id="state">배송완료</h3>
            </div>
            <button class="btn btn-info">주문 상세보기</button>
	    </div>
	    <div class="list">
	    	<a href=""><img src="resources/images/logo.png" alt=""></a>
            <div id="explain">
                <h4>잔슨빌 육즙 가득한 스모크 소세지</h4>
                <p>주문날짜 : 2021-01-02</p>
                <h3 id="state">배송완료</h3>
            </div>
            <button class="btn btn-info">주문 상세보기</button>
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