<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>

.reviewOuter{width:700px;}
.review{margin-bottom: 50px; height: auto;}
.small_header{width: 100%; height: 90px;}
.small_header>span{font-weight: bold; font-family: 본고딕; font-size: 20px;}
.small_header>button{float: right; width: 100px; height: 30px; background:steelblue; color: white; border: none; border-radius: 5px;}
.user_detail>button{background:none; border: none; font-weight: bold; font-size: 13px; cursor: pointer;}
.user_detail{width: 400px; height: 80px;}
.user_image{width: 50px; height: 50px; border: 1px solid; position:inline-block; float:left; margin-right: 10px;}
.product_name_small{font-size: small; color: rgb(88, 88, 88);}
.content{font-family: 본고딕; font-size: 15px; display:inline-block; width:650px; margin-bottom: 10px;}
.recommend{width: 200px; height: 30px; margin-right: 10px; cursor: pointer; background:rgb(211, 212, 212); border: none; border-radius: 5px;}
.thumbnail_image{width:150px; height:120px; margin-bottom: 10px; }
.more_review{width:700px; height: 50px; background:rgb(211, 229, 236); border: none; border-radius: 5px; cursor: pointer;}
.star-ratings {
    color: #aaa9a9; 
    position: relative;
    unicode-bidi: bidi-override;
    width: max-content;
    -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
    -webkit-text-stroke-width: 1.3px;
    -webkit-text-stroke-color: #000000;
}
.star-ratings-fill {
    color: #fff58c;
    padding: 0;
    position: absolute;
    z-index: 1;
    display: flex;
    top: 0;
    left: 0;
    overflow: hidden;
    -webkit-text-fill-color: gold;
}
.star-ratings-base {
    z-index: 0;
    padding: 0;
}
.star-ratings>div>span {font-size:30px;}
</style>
</head>
<body>
		<div class="innerOuter">
				
			    <form action="reviewUpdate.st" method="post">
	                <input type="hidden" name="pno" value="${ p.productNo }">
	                <input type="hidden" name="memNo" value="${ loginUser.memNo }">
                </form>
                
            <div class="reviewOuter">
	            <div class="small_header">
	                <span>리뷰(${ c.totalCount }) </span>
	                	<!-- 구매내역있는 사용자만 조건 걸기 -->
	                	<c:if test="${ !empty loginUser }">
			                <button type="button" class="input_review" onclick="reviewEnrollForm(${p.productNo});">리뷰작성</button>
	                		<button type="button" class="update_review" onclick="reviewUpdateForm"></button>
	                	</c:if>
					<div class="star-ratings">
						<div class="star-ratings-fill space-x-2 text-lg" style="width:${c.starAvg*20}%">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>
						<div class="star-ratings-base space-x-2 text-lg">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>
					</div>
	            </div> <br><br>
				
	            <div class="review_list">
	            	<c:forEach var="srm" items="${srMainList}" end="4">
		                <div class="review">
		                    <div class="user_detail">
		                        <div class="user_image">
		                        	<c:choose>
		                        		<c:when test="${srm.profile eq null }">
		                        			<img src="">
		                        		</c:when>
		                        		<c:otherwise>
		                        			<img src="${srm.profile}">
		                        		</c:otherwise>
		                        	</c:choose>
		                        </div>
		                        <span>
		                            <i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i><i class="fas fa-star" style="color: rgb(255, 217, 0);"></i>
		                        </span><br>
		                        <span class="user_name">${srm.nickname}</span>
		                        <span class="enroll_date">${srm.reviewDate}</span>
		                        <button type="button" data-toggle="modal" data-target="#report">신고</button>
		                    </div>
		                    <div class="review_content">
		                        <span class="product_name_small">${p.title }</span> <br>
		                        <span class="content">${srm.content}</span>
		                        	<c:choose>
		                        		<c:when test="${srm.img eq null }">
		                        		</c:when>
		                        		<c:otherwise>
					                        <div class="thumbnail_image">
					                            <img src="${srm.img}" class="thumb" style="width:150px; height: 120px;">
					                        </div>
		                        		</c:otherwise>
		                        	</c:choose>
		                    </div>
		                    <div class="recommend_area">
		                     <c:choose>
		                    	<c:when test="${ srm.recoCk == 0 && !empty loginUser}">
		                        <button type="button" class="recommend" onclick="recommendCk(${srm.reviewNo});"><i class="far fa-thumbs-up"></i> 도움이 됐어요</button>
		                        </c:when>
		                        <c:otherwise>
		                        <button type="button" class="recommend" onclick="recommendCk();" disabled><i class="far fa-thumbs-up"></i> 도움이 됐어요</button>
		                        </c:otherwise>
		                     </c:choose>
		                        <span style="font-weight:bold;" id="dd">${srm.reconum}</span>명에게 도움이 되었어요.
		                    </div>
		                </div>
	                </c:forEach>
	            </div>
	            <div class="bottom_area">
	                <button type="button" class="more_review" onclick="allReview(${p.productNo});">더 많은 리뷰 보러가기</button>
	            </div>
            </div>
		</div>
		
		    	<!-- 신고 모달 -->
    	<div class="modal fade" id="report" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">리뷰 신고</h5>
		        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="sreviewReport.st" method="post">

		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">신고사유를 선택해주세요.</label><br>
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
		          </div>
		          <div class="mb-4" style="display:none;">
		            <label for="radio5" class="col-form-label">기타:</label>
		            <textarea class="form-control" id="reason" maxlength="100"></textarea>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary" onclick="rpdata();">신고하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<script>

		
		function allReview(pno){
            window.open("reviewList.st?cpage=1&&pno=" + pno, "스토어리뷰목록", "width=800, height=800, resizeable=no, location=no");
        }
		
		function reviewEnrollForm(pno){
            window.open("reviewEnrollForm.st?pno=" + pno, "스토어리뷰작성", "width=650, height=800, resizeable=no, location=no");
        }
		
		/*
		function enrollReviewCk(pno){
			var memNo = document.getElementById("memNo").value;
			
			if(memNo == ""){
				alert("로그인 한 회원만 리뷰를 작성할 수 있습니다.");
			} else {
				//ajax로 주문내역 있는지 확인
				$.ajax({
					url:"enrollStoreReviewCheck.me",
					data:{memNo:memNo,pno:pno},
					success:function(result){
						if(result == 'yyyyy'){
							 $("#reviewModal").modal();
						} else {
							alert("상품을 구매한 회원만 리뷰를 작성할 수 있습니다.");
						}
					}, error:function(){
						console.log("후기 작성용 ajax 통신 실패");
					}
				})
			}
		}
		*/
		
    	function recommendCk(rno){
    		if(document.getElementById("memNo").value == ""){
                alert("로그인 후 이용 가능한 서비스 입니다.");
            } else if('${loginUser.memNo}' == '${ srm.memberNo }'){
            	alert("본인의 후기는 추천할 수 없습니다.");
            } else {
            	$.ajax({
            		url:"recommendStore.st",
            		data:{reviewNo:rno,
            		     memberNo:document.getElementById("memNo").value},
            		success:function(result){
            			if(result == "dd"){
            				alert("해당 리뷰의 추천을 제거하였습니다.");
            			}else if(result == "ss"){
            				alert("추천 제거 실패되었습니다.")
            			}else if(result == "gg"){
            				alert("추천완!");
            			}else{
            				alert("추천실패");
            			}
            			
            		}
            	})
            }
    	}
		
	    function rpdata(){
	        var rpValue = $('input[name=radio]:checked').val();
	        if(rpValue == 25){
	            rpValue = $("#input-area2").val();
	        }
	        
	        $.ajax({
	            url:"sreviewReport.st",
	            type:"post",
	            data:{
	                reportMemNo:$("#reportMemNo").val(),
	                refBNo:$("#refBNo").val(),
	                content:rpValue
	            },success:function(result){
	            	if(result == "gg"){
	            		alert("해당 글의 신고가 완료되었습니다.");
		                opener.parent.location.reload();
		                window.close();
	            	}else{
		                alert("해당 글의 신고가 실패했습니다.");
		                opener.parent.location.reload();
		                window.close();
	            	}
	                
	            },error:function(){
	            	alert("통신실패!");
	            }
	        })
	        
	    }
		
		
	    $("input:radio[name=radio]").click(function(){
	        if($("input[name=radio]:checked").val() == "25"){
	            $("#input-area2").attr("disabled",false);
	        } else{
	            $("#input-area2").attr("disabled",true);
	        }

	    })
		</script>

</body>
</html>