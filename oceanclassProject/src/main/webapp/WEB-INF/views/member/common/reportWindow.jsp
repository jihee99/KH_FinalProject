<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style>
.outer{padding: 5px; text-align: center; width: 500px; height: 400px; margin: auto; box-sizing: border-box;}
    
.reportTable{margin-left: 10px; text-align: left; width: 100%; margin-top: 30px; font-size: 14px; border-collapse: separate; line-height: 30px;}
.reportTable h4{font-weight: 550; color: rgb(90, 90, 90);}
.reportTable tbody th{text-align: left; padding-left: 20px;}
#cName, #deadDate{width: 80%;}
button[type="submit"]{
    width: 120px; height: 40px; 
    border-radius: 10px; border: none; 
    background: rgb(107, 171, 213); color: white;
    font-size: 16px; font-weight: 550;    
}

</style>
</head>
<body>

    <div class="outer">
        <table class="reportTable">
            <thead>
                <tr>
                    <td colspan="2">
                        <h4>신고하기</h4>
                        <hr>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>신고사유 선택하기</th>
                    <td>
                        // 신고한회원번호
                        <input type="hidden" name="memNo" value="${loginUser.memNo}">
                        
                        <input type="hidden" id="refCategory" name="refCategory" value="신고당한게시글 카테고리">
                        <input type="hidden" id="refBNo" neme="refBNo" value="신고당한게시글번호">
                        <input type="hidden" id="reportMemNo" name="reportMemNo" value="신고당한회원번호">
                    </td>
                </tr>
                
                <tr>
                    <!-- 버튼 아이디 및 라벨 연결 임의 설정 !! 나중에 내용에 맞게 수정하기 -->
                    <!-- 스타일도 나중에 헤더로 옮기기 -->
                    <td colspan="2" style="padding-left:10px;">
                        <input name="radio" id="radio1" value="욕설 또는 음란성 내용" type="radio">
                        <label for="radio1">욕설 또는 음란성 내용</label> <br>
                        
                        <input name="radio" id="radio2" value="부적절한 홍보성 댓글" type="radio">
                        <label for="radio2">부적절한 홍보성 댓글</label> <br>
                        
                        <input name="radio" id="radio3" value="사생활 침해 및 불법 촬영물" type="radio">
                        <label for="radio3">사생활 침해 및 불법 촬영물</label> <br>
                        
                        <input name="radio" id="radio4" value="명예훼손 및 저작권침해" type="radio">
                        <label for="radio4">명예훼손 및 저작권침해</label> <br>
                        
                        <input name="radio" id="radio5" value="25" type="radio">
                        <label for="radio5">기타</label><br>
                        
                        <textarea name="" cols="60" rows="" id="input-area2" disabled></textarea>
                        
                    </td>
                </tr>   
            </tbody>
        </table>
        <br>
        <button class="btn" align="center" type="submit" onclick="rpdata();">신고하기</button>

        <script>
            function rpdata(){
                var rpValue = $('input[name=radio]:checked').val();
                //console.log(rpValue);
                if(rpValue == 25){
                    rpValue = $("#input-area2").val();
                    console.log(rpValue);
                }
                
                $.ajax({
                    url:"reportF.me",
                    data:{
                        reportMemNo:$("#reportMemNo").val(),
                        refCategory:$("#refCategory").val(),
                        refBNo:$("#refBNo").val(),
                        content:rpValue
                    },success:function(result){
                        alert("해당 글의 신고가 완료되었습니다.");
                        //console.log(result);
                        opener.parent.location.reload();
                        window.close();
                    },error:function(){
                        alert("해당 글의 신고가 실패했습니다.");
                        opener.parent.location.reload();
                        window.close();
                    }
                })
                
            }
            
            $("input:radio[name=radio]").click(function(){
                // value값이 5인 라디오버튼 체크시에만 text-area 활성화
                if($("input[name=radio]:checked").val() == "25"){
                    $("#input-area2").attr("disabled",false);
                } else{
                    $("#input-area2").attr("disabled",true);
                }

            })
        </script>
	</div>
</body>
</html>