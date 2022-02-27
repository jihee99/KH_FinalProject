<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
    .review_detail{width: 800px; height: auto;}
    .mini_header>img{ margin: auto; display: block;}
    .mini_header>p{margin:auto; height: 45px; background:rgb(88, 159, 230); color: white; font-weight: bold; font-size: 25px;}
    .product_info{width: 300px; height: 150px; display: block; margin: auto; margin-top: 20px;}
    .product_title_img{float: left; width:120px; height: 130px; margin-right:15px;}
    .merchant_name, .product_option{font-size: 13px; color: rgb(112, 112, 112);}
    .product_name{font-size: 15px;}
    .star_rating{font-weight: bold; font-size: 20px;}
    .total{color:rgb(139, 137, 137); font-weight: bold;}
    .star_rating_area{margin-bottom: 80px;}

    .review_list{margin-bottom: 60px; height: auto; margin-left: 30px;}
    .user_detail>button{background:none; border: none; font-weight: bold; font-size: 13px; cursor: pointer;}
    .user_detail{width: 400px; height: 80px;}
    .user_image{width: 50px; height: 50px;position:inline-block; float:left; margin-right: 10px;}
    .product_name_small{font-size: small; color: rgb(88, 88, 88);}
    .content{font-family: 본고딕; font-size: 15px; display:inline-block; width:650px; height: auto; margin-bottom: 10px;}
    .recommend{width: 200px; height: 30px; margin-right: 10px; cursor: pointer; background:rgb(211, 212, 212); border: none; border-radius: 5px;}
    .thumbnail_image{width:150px; height:120px; border: 1px solid; margin-bottom: 10px;}
    #pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 50px;
	}
	    .star-ratings {
        color: #aaa9a9; 
        position: relative;
        unicode-bidi: bidi-override;
        width: max-content;
        -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
        -webkit-text-stroke-width: 1.3px;
        -webkit-text-stroke-color: #000000;
        display:inline-block;
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
<div class="review_detail">


        <div class="mini_header">
            <img src="./resources/images/logo.png" width="150px"><br>
            <p align="center">리뷰상세</p>
        </div>

        <div class="product_info">
            <img src="${ p.productImg0 }" class="product_title_img">
            <span class="merchant_name">${ p.nickname }</span> <br>
            <span class="product_name">${ p.title }</span><br>
            <c:choose>
            	<c:when test="${!empty olist}">
            		<c:forEach var="o" items="${olist}">
            			<span class="product_option">${o.optionName}</span>
            		</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<span class="product_option"></span>
            	</c:otherwise>
            </c:choose>
            <br>
        </div>
        <div class="star_rating_area" align="center">
			<div class="star-ratings">
				<div class="star-ratings-fill space-x-2 text-lg" style="width:${c.starAvg*20}%">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
				<div class="star-ratings-base space-x-2 text-lg">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
			</div>
            <span class="star_rating">(${c.starAvg})</span>
            <span class="total">총 ${c.totalCount}개</span>     
        </div>
        	<c:choose>
        		<c:when test="${!empty rlist}">
        			<c:forEach var="r" items="${rlist}">
	        			<div class="review_list">
			                <div class="review">
			                    <div class="user_detail">
			                        <div class="user_image">
				                        <c:choose>
			                        		<c:when test="${r.profile eq null }">
			                        			<img src="">
			                        		</c:when>
			                        		<c:otherwise>
			                        			<img src="${r.profile}" width="50px" height="50px">
			                        		</c:otherwise>
			                        	</c:choose>
			                        </div>
									<div class="star-ratings" style="display:inline-block;">
										<div class="star-ratings-fill space-x-2 text-sm" style="width:${r.rating*20}%; font-size:20px;">
											<span style="font-size:20px;">★</span><span style="font-size:20px;">★</span><span style="font-size:20px;">★</span><span style="font-size:20px;">★</span><span style="font-size:20px;">★</span>
										</div>
										<div class="star-ratings-base space-x-2 text-sm">
											<span style="font-size:20px;">★</span><span style="font-size:20px;">★</span><span style="font-size:20px;">★</span><span style="font-size:20px;">★</span><span style="font-size:20px;">★</span>
										</div>
									</div>
			                        <br>
			                        <span class="user_name">${r.nickname }</span>
			                        <span class="enroll_date">${r.reviewDate }</span>
			            			<input type="hidden" id="refBNo" neme="refBNo" value="${r.reviewNo}">
                        			<input type="hidden" id="reportMemNo" name="reportMemNo" value="${r.memberNo}">
                        			<input type="hidden" id="memNo" value="${r.memberNo}">
			                        <button type="button" data-toggle="modal" data-target="#report">신고</button>
			                    </div>
			                    <c:if test="${ loginUser.memNo == r.memberNo }">
			               	    	<div style="float:right; margin-top:5px;">
				                    	<button type="button" onclick="reviewUpdate(${r.reviewNo});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">수정</button>
				                    	<button type="button" onclick="reviewDelete(${r.reviewNo});" class="btn" style="background-color: lightgray; height:25px; line-height: 10px; font-size:13px;">삭제</button>
			                    	</div>
                    			</c:if>
			                    <div class="review_content">
			                        <span class="product_name_small">${p.title }</span> <br>
			                        <span class="content">${ r.content }</span>
			                        
			                        <c:choose>
		                        		<c:when test="${r.img eq null }">
		                        		</c:when>
		                        		<c:otherwise>
					                        <div class="thumbnail_image">
					                            <img src="${r.img}" class="thumb" style="width:150px; height: 120px;">
					                        </div>
		                        		</c:otherwise>
		                        	</c:choose>
			                    </div>
			                    <div class="recommend_area">
			                    	<button type="button" class="recommend" onclick="recommendCk(${r.reviewNo});"><i class="far fa-thumbs-up"></i> 도움이 됐어요</button>
				                        
			                        <span style="font-weight:bold;">${r.reconum }</span>명에게 도움이 되었어요.
			                    </div>
			                </div>
	           			</div>
           			</c:forEach>

		  <div id="pagingArea">
			<ul class="pagination">

				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="reviewList.st?cpage=${ pi.currentPage - 1 }&pno=${ reviewPno }">Previous</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link" href="reviewList.st?cpage=${ p }&pno=${ reviewPno }">${ p }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="reviewList.st?cpage=${ pi.currentPage + 1 }&pno=${ reviewPno }">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
        		</c:when>
        		<c:otherwise>
        			<h4 align="center">아직 리뷰가 없어요... <br>
        			   첫번째 리뷰를 작성해주세요! </h4>
        		</c:otherwise>
        	</c:choose>

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
	
	// 신고 ajax
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
        // value값이 5인 라디오버튼 체크시에만 text-area 활성화
        if($("input[name=radio]:checked").val() == "25"){
            $("#input-area2").attr("disabled",false);
        } else{
            $("#input-area2").attr("disabled",true);
        }

    })
    
    // 추천 ajax
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
    
	function reviewUpdate(reviewNo){
       window.open("reviewUpdateForm.st?rno=" + reviewNo, "스토어리뷰수정", "width=650, height=800, resizeable=no, location=no");
    }
	
	function reviewDelete(reviewNo){
        confirm("정말로 삭제하시겠습니까?");
        
        $.ajax({
        	
        })
    }
	
		
	</script>
</body>
</html>