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
    .outer{
        width: 1000px;
        margin:auto;
        margin-top: 20px;
        margin-bottom: 100px;
        box-sizing: border-box;
        position: relative;
    }
    .leftContent{
        width: 65%;
        display: inline-block;
        margin-right: 4%;
    }
    .rightContent{
        width: 300px;
        height: 300px;
        display: inline-block;
        background-color: lightgray;
        position: fixed;
    }
    .rightContent>div{
        margin: 20px;
    }
    #nevi td{
        font-size: 15px;
        width: 110px;
        text-align: center;
        font-weight: bold;
        color: gray;
        cursor: pointer;
    }
    .classBuy>button{
        font-size: 15px;
    }
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="outer">

        <input type="hidden" id="memNo" value="${ loginUser.memNo }">
        <input type="hidden" id="grade" value="${ loginUser.grade }">
        <input type="hidden" id="clNo" value="${ c.clNo }">
        <input type="hidden" id="likeCk" value="${ likeCk }">

        <div class="leftContent">
            <div id="titleImg">
                <img src="${ c.clImg }" width="100%" height="300px">
            </div>
            <br>

            <div id="nevi">
                <table>
                    <tr>
                        <td id="nevi1" style="color: #6babd5;" onclick="changeView('main');">클래스 소개</td>
                        <td id="nevi2" onclick="changeView('curriculum');">커리큘럼</td>
                        <td id="nevi3" onclick="changeView('kit');">키트 소개</td>
                        <td id="nevi4" onclick="changeView('review');">클래스 후기</td>
                        <td id="nevi5" onclick="changeView('qna');">문의</td>
                        <td id="nevi6" onclick="changeView('refund');">환불정책</td>
                    </tr>
                </table>
                <hr>
            </div>
            <br>

            <div id="classContent">
                <div id="mainImage">
                    <img src="${ c.clImg2 }" width="100%">
                </div>
                <div id="curriculum" style="display:none;">
                    <img src="${ c.clImg3 }" width="100%">
                </div>
                <div id="kit" style="display:none;">
                	<c:choose>
                		<c:when test="${ c.kit == 'Y' }">
		                    <img src="${ c.clKitImg }" width="100%">
                		</c:when>
                		<c:otherwise>
                			<br>
                			<div>해당 클래스는 키트가 제공되지 않는 클래스입니다.</div>
                		</c:otherwise>
                	</c:choose>
                </div>
                <div id="review" style="display:none;">
                    <jsp:include page="classReview.jsp" />
                </div>
                <div id="qna" style="display:none;">
                    <jsp:include page="classQna.jsp" />
                </div>
                <div id="refund" style="display:none;">
                    <p style="color: #6babd5; font-weight: bold;">환불정책</p>
                    <br>

                    <div>
                        환불 정책에 따라 구매 후 수강 이력이 없을 경우,
                        전액 환불이 가능합니다.
                    </div>
                </div>
            </div>
        </div>
        <!-- qna review 모달창 fade 조절 -->

        <div class="rightContent">
            <div>
                <div>${ c.memNo }</div>
                <div style="font-weight: bold; height: 110px;">${ c.clName }</div>
                <div id="classPrice" align="right" style="font-size:20px; font-weight:bold;">${ c.clPrice }</div>
                <!--<div align="right" style="font-size: 12px;">(5개월 할부)</div>-->
                <hr>
                <div style="font-size: 12px; margin-bottom: 10px; margin-right: 5px;" align="right">
                    <c:choose>
                    	<c:when test="${ c.kit == 'Y' }">
		                    <img src="resources/images/giftbox.png" width="16" height="16"> 
		                    <span>준비물 키트 있음</span> 
                    	</c:when>
                    	<c:otherwise>	
		                    <span>&nbsp;</span> 
                    	</c:otherwise>
                    </c:choose>
                    <!-- 
                    	강의만족도 기능...
                    	시간남으면 추가하는걸로... 
                    <span>강의만족도 99%</span>
                    -->
                </div>
                <div class="classBuy">
                    <button type="button" class="btn" style="background-color: #6babd5; width:160px; font-weight: bold; color: white;">클래스 구매하기</button>
                    <button type="button" class="btn" style="background-color: rgb(184, 184, 184); width:90px;" onclick="likeCk();">
                        <c:choose>
                        	<c:when test="${ likeCk == 'Y' }">
                        		<img src="resources/images/heart2.png" width="20" height="20" id="likeImg">
							</c:when>
							<c:otherwise>
                        		<img src="resources/images/heart1.png" width="20" height="20" id="likeImg">
							</c:otherwise>
						</c:choose>                        
                        <span id="likeCount">${ c.like }</span>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>

        window.onload = function(){

            var price = document.getElementById("classPrice").innerHTML;

            var price1 = price.substring(0, price.length - 3);
            var price2 = price.substring(price.length - 3);

            document.getElementById("classPrice").innerHTML = price1 + "," + price2 + "원";

        }

        function changeView(view){
            /* 네비 글씨 */
            let nevi1 = document.getElementById("nevi1");
            let nevi2 = document.getElementById("nevi2");
            let nevi3 = document.getElementById("nevi3");
            let nevi4 = document.getElementById("nevi4");
            let nevi5 = document.getElementById("nevi5");
            let nevi6 = document.getElementById("nevi6");

            /* 내용 */
            let main = document.getElementById("mainImage");
            let curriculum = document.getElementById("curriculum");
            let kit = document.getElementById("kit");
            let review = document.getElementById("review");
            let qna = document.getElementById("qna");
            let refund = document.getElementById("refund");

            switch(view){
                case 'main':
                    nevi1.style.color = '#6babd5';
                    nevi2.style.color = 'gray';
                    nevi3.style.color = 'gray';
                    nevi4.style.color = 'gray';
                    nevi5.style.color = 'gray';
                    nevi6.style.color = 'gray';
                    main.style.display = 'block';
                    curriculum.style.display = 'none';
                    kit.style.display = 'none';
                    review.style.display = 'none';
                    qna.style.display = 'none';
                    refund.style.display = 'none';
                    break;
                case 'curriculum':
                    nevi1.style.color = 'gray';
                    nevi2.style.color = '#6babd5';
                    nevi3.style.color = 'gray';
                    nevi4.style.color = 'gray';
                    nevi5.style.color = 'gray';
                    nevi6.style.color = 'gray';
                    main.style.display = 'none';
                    curriculum.style.display = 'block';
                    kit.style.display = 'none';
                    review.style.display = 'none';
                    qna.style.display = 'none';
                    refund.style.display = 'none';
                    break;
                case 'kit':
                    nevi1.style.color = 'gray';
                    nevi2.style.color = 'gray';
                    nevi3.style.color = '#6babd5';
                    nevi4.style.color = 'gray';
                    nevi5.style.color = 'gray';
                    nevi6.style.color = 'gray';
                    main.style.display = 'none';
                    curriculum.style.display = 'none';
                    kit.style.display = 'block';
                    review.style.display = 'none';
                    qna.style.display = 'none';
                    refund.style.display = 'none';
                    break;
                case 'review':
                    nevi1.style.color = 'gray';
                    nevi2.style.color = 'gray';
                    nevi3.style.color = 'gray';
                    nevi4.style.color = '#6babd5';
                    nevi5.style.color = 'gray';
                    nevi6.style.color = 'gray';
                    main.style.display = 'none';
                    curriculum.style.display = 'none';
                    kit.style.display = 'none';
                    review.style.display = 'block';
                    qna.style.display = 'none';
                    refund.style.display = 'none';
                    break;
                case 'qna':
                    nevi1.style.color = 'gray';
                    nevi2.style.color = 'gray';
                    nevi3.style.color = 'gray';
                    nevi4.style.color = 'gray';
                    nevi5.style.color = '#6babd5';
                    nevi6.style.color = 'gray';
                    main.style.display = 'none';
                    curriculum.style.display = 'none';
                    kit.style.display = 'none';
                    review.style.display = 'none';
                    qna.style.display = 'block';
                    refund.style.display = 'none';
                    break;
                case 'refund':
                    nevi1.style.color = 'gray';
                    nevi2.style.color = 'gray';
                    nevi3.style.color = 'gray';
                    nevi4.style.color = 'gray';
                    nevi5.style.color = 'gray';
                    nevi6.style.color = '#6babd5';
                    main.style.display = 'none';
                    curriculum.style.display = 'none';
                    kit.style.display = 'none';
                    review.style.display = 'none';
                    qna.style.display = 'none';
                    refund.style.display = 'block';
                    break;
            }
        }

        function likeCk(){

            if(document.getElementById("memNo").value == ""){
                alert("로그인 후 이용 가능한 서비스 입니다.");
            } else{
                $.ajax({
                    url:"classLikeCheck.me",
                    data:{
                        memNo:document.getElementById("memNo").value, 
                        grade:document.getElementById("grade").value,
                        referNo:document.getElementById("clNo").value
                    }, success:function(likeResult){
                        if(likeResult.message == 'gradeCkNo'){
                            alert("학생 회원만 가능한 서비스입니다.");
						} else if(likeResult.message == 'ss'){
                            document.getElementById("likeImg").src = "resources/images/heart2.png";
                            document.getElementById("likeCount").innerHTML = likeResult.likeCount;
                            alert("찜 목록에 추가 되었습니다!");
                        } else if(likeResult.message == 'dd'){
                            document.getElementById("likeImg").src = "resources/images/heart1.png";
                            document.getElementById("likeCount").innerHTML = likeResult.likeCount;
                            alert("찜 목록에서 삭제되었습니다.");
                        } else {
                            alert("비정상적인 요청입니다.");
                        }
                    }, error:function(){
                        console.log("찜하기 ajax 통신 실패");
                    }
           	    })
            }
              
        }
        
    </script>

    <jsp:include page="../common/footerBar.jsp" />
</body>
</html>