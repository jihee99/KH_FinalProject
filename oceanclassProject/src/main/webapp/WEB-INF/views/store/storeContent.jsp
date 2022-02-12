<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #outer{
        width: 1000px;
        margin:auto;
        margin-top: 20px;
    }
    #silde{
        background-color: skyblue;
        width: 100%;
        height: 250px;
    }
    .items{
        width: 100%;
        margin-top: 50px;
    }
    .items_title{
        font-size: 20px;
    }
    .item{
        width: 199px;
        margin-top: 20px;
        display: inline-block;
        box-sizing: border-box;
    }
    .item>span{
        font-size: 12px;
    }
    .item *{
        cursor:pointer;
    }
    .thumbnail{
        width: 100%;
        height: 200px;
    }
    .more_btn{text-decoration: none; color: rgb(172, 171, 171);}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

    <div id="outer">
        <div id="silde">나중에 silde들어갈자리</div>
        
        <div class="items">
            <div class="items_title"><b>· HOT ITEM</b> <!--띄어쓰기-->
                <a href="" class="more_btn">+more</a>
            </div>
            
			<c:forEach var="p" items="${ list }">
	            <div class="item" style="margin-right: 62px;">
	                <img src="" class="thumbnail">
	                <div style="font-size: 13px;"><b>${ p.memberNo }</b></div>
	                <div>${ p.title }</div>
	                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
	                <span>찜수11</span>
	                <div>
	                    <b>
	                        <span>${ p.price }</span>
	                        원 
	                    </b>
	                </div>
	            </div>
			</c:forEach>
			
            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>브랜드명</b></div>
                <div>상품명이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>찜수11</span>
                <div>
                    <b>
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>브랜드명</b></div>
                <div>상품명이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>찜수11</span>
                <div>
                    <b>
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>브랜드명</b></div>
                <div>상품명이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <div>
                    <b>
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>
        </div>

        <div class="items">
            <div class="items_title"><b>· NEW ITEM</b> <!--띄어쓰기-->
                <a href="" class="more_btn">+more</a>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>브랜드명</b></div>
                <div>상품명이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <div>
                    <b>
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>브랜드명</b></div>
                <div>상품명이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <div>
                    <b>
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>
            
            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>브랜드명</b></div>
                <div>상품명이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <div>
                    <b>
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>브랜드명</b></div>
                <div>상품명이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <div>
                    <b>
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>
        </div>

        <div style="height: 150px;"></div>

    </div>
    
    <jsp:include page="../common/footerBar.jsp" />
    
</body>
</html>