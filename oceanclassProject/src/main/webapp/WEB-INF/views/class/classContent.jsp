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
        width: 200px;
        margin-top: 20px;
        display: inline-block;
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
</style>
</head>
<body>

	<c:if test="${ !empty alertMsg }">
		<script>
			alertify.alert("안내", "${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
    <div id="outer">
        <div id="silde">나중에 silde들어갈자리</div>
        
        <div class="items">
            <div class="items_title"><b>· HOT CLASS</b></div>

            <div class="item" style="margin-right: 62px;" onclick="classPage(1);">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>
        </div>

        <div class="items">
            <div class="items_title"><b>· NEW CLASS</b></div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item" style="margin-right: 62px;">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>

            <div class="item">
                <img src="" class="thumbnail">
                <div style="font-size: 13px;"><b>강사명</b></div>
                <div>클래스 제목이 들어가는 자리 줄바뀌는거 확인하려고 길게 씀</div>
                <img src="resources/images/heart1.png" style="width: 15px; height: 15px;">
                <span>12345</span>
                <img src="resources/images/like.png" style="width: 15px; height: 15px; margin-left: 5px; margin-bottom: 2px;">
                <span>
                    <span>99</span>%
                </span>
                <div>
                    <b>
                        월
                        <span>99,000</span>
                        원 
                    </b>
                </div>
            </div>
        </div>

        <div style="height: 150px;"></div>

    </div>

    <script>

        function classPage(clNo){
            location.href = 'classDetail.me?clNo=' + clNo;
        }

    </script>

</body>
</html>