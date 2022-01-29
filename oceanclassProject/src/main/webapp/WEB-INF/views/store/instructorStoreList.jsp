<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.innerOuter>div{margin-top: 10px;}
    .menutitle{width:85%; margin-left:55px; text-align: left;} 
    .menutitle>b{font-size: 28px; font-weight: 800; margin-left: 10px; color: rgb(107, 171, 213);}

    .btn_area_1{width: 88%;}
    .btn_area_1>button{background-color: rgb(107, 171, 213); border: none; font-size: 16px; font-weight: bolder; color: white;}

    .contentBox{width: 90%; margin-left: auto; margin-right: auto;}
    .contentBox>table{width: 85%; margin-left: auto; margin-right: auto; padding: 10px; background-color: lightgray; border-radius: 2px;}
    .img_area{height: 210px; width: 250px; margin: 20px 25px; display:inline-block; background: white;}
    .info_area{width: 90%; margin:15px 10px; border-collapse: separate; border-spacing: 0 6px;}

    .info_area h3{font-size: 25px; font-weight: 900;}
    .info_area{font-size: 16px;}
    .btn_area_2 button{width: 47%; margin-left: 5px; font-size: 15px; font-weight: bold; border: none; color: white;}

    #updateBtn{background: grey;}
    #deleteBtn{background: rgb(167, 23, 23);}
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
	<div class="innerOuter">
        <div class="menutitle">
            <b>내상품</b>
        </div>
        <br>
        <div class="btn_area_1" align="right">
            <button class="btn btn-lg" onclick="">+상품추가하기</button>
        </div>
        
        <!-- 개별 상품 정보 보여지는 폼 -->
        <div class="contentBox">
            <table>
                <tr>
                    <td class="img_area">
                        <img src="">
                    </td>
                    <td width="700">
                        <table class="info_area">
                            <tr>
                                <td><h3>콘플라워 수제 허브 하트 비누</h3></td>
                            </tr>
                            <tr>
                                <td>[상품카테고리명]</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td><b>등록승인상태</b></td>
                            </tr>   
                            <tr>
                                <td class="btn_area_2">
                                    <button id="updateBtn" class="btn">수정하기</button>
                                    <button id="deleteBtn" class="btn">상품삭제하기</button>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
               
            </table>
        </div>

        <div class="contentBox">
            <table>
                <tr>
                    <td class="img_area">
                        <img src="">
                    </td>
                    <td width="700">
                        <table class="info_area">
                            <tr>
                                <td><h3>콘플라워 수제 허브 하트 비누</h3></td>
                            </tr>
                            <tr>
                                <td>[상품카테고리명]</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td><b>등록승인상태</b></td>
                            </tr>   
                            <tr>
                                <td class="btn_area_2">
                                    <button id="updateBtn" class="btn">수정하기</button>
                                    <button id="deleteBtn" class="btn">상품삭제하기</button>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
               
            </table>
        </div>


    </div>   
	
</body>
</html>