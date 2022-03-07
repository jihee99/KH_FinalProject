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
                        <!-- 
                        	신고당한 게시글 카테고리
                        	CQ:클래스QNA / CR:클래스리뷰 / SQ:스토어QNA / SR:스토어리뷰 / R:댓글
                         -->
                        <input type="hidden" id="refCategory" name="refCategory" value="${rp.refCategory }">
                        <!-- 신고당한 게시글 번호 -->
                        <input type="hidden" id="refBNo" neme="refBNo" value="${rp.refBNo }">
                        <input type="hidden" id="reportMemNo" name="reportMemNo" value="${rp.reportMemNo }">
                    </td>
                </tr>
                
                <tr>
                    <!-- 버튼 아이디 및 라벨 연결 임의 설정 !! 나중에 내용에 맞게 수정하기 -->
                    <!-- 스타일도 나중에 헤더로 옮기기 -->
                    <td colspan="2" style="padding-left:10px;">
                        <input name="rpcategory" id="radio1" value="욕설 또는 음란성 내용" type="radio">
                        <label for="radio1">욕설 또는 음란성 내용</label> <br>
                        
                        <input name="rpcategory" id="radio2" value="부적절한 홍보성 댓글" type="radio">
                        <label for="radio2">부적절한 홍보성 댓글</label> <br>
                        
                        <input name="rpcategory" id="radio3" value="사생활 침해 및 불법 촬영물" type="radio">
                        <label for="radio3">사생활 침해 및 불법 촬영물</label> <br>
                        
                        <input name="rpcategory" id="radio4" value="명예훼손 및 저작권침해" type="radio">
                        <label for="radio4">명예훼손 및 저작권침해</label> <br>
                        
                        <input name="rpcategory" id="radio5" value="25" type="radio">
                        <label for="radio5">기타</label><br>
                        
                        <textarea name="content" cols="60" rows="" id="input-area2" disabled></textarea>
                        <br><span style="color:#aaa;" id="counter">(0 / 최대 100자)</span>
                    </td>
                </tr>   
            </tbody>
        </table>
        <br>
        <button class="btn" align="center" type="submit" onclick="rpdata();">신고하기</button>

        <script>
        	var content;
        	
            $("input:radio[name=rpcategory]").click(function(){
                // value값이 5인 라디오버튼 체크시에만 text-area 활성화
                if($("input:radio[name=rpcategory]:checked").val() == "25"){
                    $("#input-area2").attr("disabled",false);
                } else{
                    $("#input-area2").attr("disabled",true);
                }

            });
            
        	$("#input-area2").keyup(function(e){
        		 content = $(this).val();
        		 $('#counter').html("("+content.length+" / 최대 100자)");
				
        		 if (content.length > 100){
        		        alert("최대 100자까지 입력 가능합니다.");
        		        $(this).val(content.substring(0, 100));
        		        $('#counter').html("(100 / 최대 100자)");	    
        		}
        	});
        	
            function rpdata(){
            	
            	content = $("#input-area2").val();
            	var rpCategory = $('input[name=rpcategory]:checked').val();
                var rpValue;

                if(rpCategory == '25'){
                	if(content.length > 5){
                        rpValue = $("#input-area2").val();
                        console.log(rpValue);	
                	}else{
                		alert("최소 5글자 이상 입력해주세요");
                	}
                }else{
                	rpValue= $('input[name=rpcategory]:checked').val();
                	console.log(rpValue);
                }
            	if(rpValue != null){
            		
                    $.ajax({
                    	url:"report.me",
                        data:{
                            reportMemNo:$("#reportMemNo").val(),
                            refCategory:$("#refCategory").val(),
                            refBNo:$("#refBNo").val(),
                            content:rpValue
                        },success:function(result){
                            alert("해당 글의 신고가 완료되었습니다.");
                            console.log(result);
    	       				opener.parent.location.reload();
                            window.close();
                        },error:function(){
                            alert("해당 글의 신고가 실패했습니다.");
    	       				opener.parent.location.reload();
                            window.close();
                        }
                    });
            		
            	}else{
            		console.log("글자수부족");
            	}
                
            	
            }
            
            
        </script>
	</div>
</body>
</html>