<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<link rel="stylesheet" href="./resources/css/header.css">
<style>
div{box-sizing: border-box;}

/*검색영역 관련 스타일*/
#header_search{
    margin:auto; align-items: center;
    margin-bottom: 30px;
}
#header_search select {
	display:flex;
    width: 100px;
    height:35px;
    padding-left:10px;
    border: 1px solid #999;
    font-family: inherit;
    background: url('resources/images/arrow.jpg') no-repeat 95% 50%;
    border-radius: 0px;
    appearance: none;
    display:inline-block;
}

#header_search input{height: 35px; width: 350px;}
#header_search button {
    font-size: 15px;
    border: none;
    background-color: rgb(107, 171, 213);
    width: 50px;
    height: 35px;
    border-radius: 15px;
    color: #fff;
    cursor: pointer;
}

</style>
</head>
<body>

	<c:if test="${not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg"/>
	</c:if>
	
	 <div id="header">
        <div id="header_1">
            <div id="header_1_left"></div>
            <div id="header_1_center">
                 <img src="resources/images/logo.png" style="cursor: pointer" onclick="location.href='${pageContext.request.contextPath}'">
            </div>
            <div id="header_1_right">

			<c:choose>
				<c:when test="${ empty loginUser }">
                <!-- 로그인 전 -->
                <a href="loginForm.me">로그인</a>
                <a href="joinUsForm.me">회원가입</a>
                </c:when>
                <c:otherwise> 
                <!-- 로그인 후 -->
                <label style="font-size: 16px;"><span id="userName" style="font-weight: bolder;">${ loginUser.userName }</span> 님 반가워요!</label> &nbsp;&nbsp;
                <a href="logout.me" style="font-size: 16px;">로그아웃</a>&nbsp;
                <img src="resources/images/smallCart.png" style="width: 32px;" value="장바구니">&nbsp;&nbsp;&nbsp;
                <a href="myPage.me"><img src="resources/images/user.png" style="width: 32px;"></a>
                </c:otherwise>
               </c:choose>
            </div>
        </div>

		<div id="header_search" align="center">
            <form id="search_form">
                <select id="header_category">
                    <option value="class" selected>클래스</option>
                    <option value="store">스토어</option>
                </select>
                
                <input type="hidden" name="cpage" value="1">
                <input type="hidden" name="category" value="0">
                <input type="hidden" name="array" value="like">
                <input type="text" name="keyword" id="search_keyword">
                <button type="button" onclick="smCk();">검색</button>
            </form>
		</div>
		
		<!--각 페이지 넘어가서 해당 메뉴에 글자 색 효과 넣기 rgb(107, 171, 213) -->
        <div id="header_2">

            <ul class="header_2_box">
                <li class="header_2_menu">
                    <a href="">CLASS</a>
                    <ul class="header_2_detail">
                        <li><a href="">개발&데이터</a></li>
                        <li><a href="">드로잉</a></li>
                        <li><a href="">사진&영상</a></li>
                        <li><a href="">요리</a></li>
                        <li><a href="">음악</a></li>
                        <li><a href="">운동</a></li>
                        <li><a href="">자기계발</a></li>
                        <li><a href="">재태크</a></li>
                    </ul>
                </li>

                <li class="header_2_menu">
                    <a href="storeList.st">STORE</a>
                    <ul class="header_2_detail">
                        <li><a href="">클래스 상품</a></li>
                        <li><a href="">OC 에디션</a></li>
                        <li><a href="">DIY Kit</a></li>
                    </ul>
                </li>
                

                <li class="header_2_menu"><a href="eventMain.ev">EVENT</a></li>

                
                <li class="header_2_menu"><a href="helpList.he">HELP</a></li>
            </ul>
        </div>

        <hr>
        
    </div>

    <script>
        function smCk(){

            var searchForm = document.getElementById("search_form");
            var searchKeyword = document.getElementById("search_keyword").value;
            var category = document.getElementById("header_category").value;

            if(searchKeyword.replace(/ /gi, "").length >= 2){
                if(category == 'class'){
                    searchForm.action = 'classSearchList.me';
                    searchForm.submit();
                } else{
                    // 지현이 여기 action 링크에다가 store 링크 넣으세용
                    // 스토어 고르고 검색하면 링크로 submit 되는 구조
                    searchForm.action = '${pageContext.request.contextPath}';
                    searchForm.submit();
                }
            } else {
                alert("검색어는 두 글자 이상이여야 합니다.");
            }

        }
    </script>

</body>
</html>