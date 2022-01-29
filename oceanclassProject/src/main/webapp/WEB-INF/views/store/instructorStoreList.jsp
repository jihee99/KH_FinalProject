<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/store/instructorStoreList.css">
</head>
<body>
	
    <div class="innerOuter">
        <div class="content">
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
                <br>
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
                <br>
            </div>

            <div class="btn_group" align="center">
                    <button class="btn btn-light">&lt;</button>
    
                    <button class="btn btn-light">1</button>
                    <button class="btn btn-light">2</button>
                    <button class="btn btn-light">3</button>
                    <button class="btn btn-light">4</button>
                    <button class="btn btn-light">5</button>
    
                    <button class="btn btn-light">&gt;</button>
            </div>
        </div>
    </div>    
</body>
</html>