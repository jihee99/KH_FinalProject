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
.content{
    width: 100%;
    height: 100%;
    float: right;
}
.searchBar{
    background-color:rgba(107, 171, 213, 0.38);
    height: 5%;
}
.searchBar>p, .searchBar>button{float: left;}
.searchBar *{margin-top: 9px; }
.searchBar>p{margin-right: 50px; margin-left: 50px;}
#search{width:400px; margin-left: 400px;}
.list{
    width: 80%;
    margin: 30px;
}
#list1{
    width:100%;
}
#explain{border: 1px solid; width: 80%; float: left;}
#explain>h3{width: 500px; color:rgb(107, 171, 213); }
#explain>p{width: 500px;margin-top: -10px; font-weight: bolder; }
#list1>button{height: 40px; margin-top: 40px;}
</style>
</head>
<body>
	<div class="content">
	    <h2>주문 조회</h2>
	    <div class="searchBar">
	        <p>기간검색</p>
	        <button>1주일</button>
	        <button>15일</button>
	        <button>1개월</button>
	        <div id="search">
	            <input type="date"> ~ <input type="date">
	            <button>검색</button>
	        </div>
	    </div>
	    <div class="list">
	        <div id="list1">
	            <a href=""><img src="" alt=""></a>
	            <div id="explain">
	                <h3>잔슨빌 육즙 가득한 스모크 소세지</h3>
	                <p>주문날짜 : 2021-01-02</p>
	                <h3 id="state">배송완료</h3>
	            </div>
	            <button>주문 상세보기</button>
	        </div>
	    </div>
	</div>
</body>
</html>