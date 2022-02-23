<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 전체 감싸는 div */
    .wrap{
        width: 1000px;
        height: auto;
        margin: auto;
        margin-top: 50px;
    }
    #review{
        margin: auto;
        width: 700px;
        margin-bottom: 10px;
    }
    #classCategory{
        margin: auto;
        width: 700px;
    }
    #classCategory select{
        margin: auto;
        width: 700px;
        height: 45px;
        margin-bottom: 80px;
    }
    /* 게시판이름 영역*/
    #top-area{
        height: 100px;
        margin-top: 50px;
        display: flex;
        justify-content: space-between;
    }
    /* 게시판이름 */
    #bord-name{
        color: rgb(107, 171, 213);
        font-weight:bolder;
        font-size: 30px;
    }
    #content-wrap{
        margin: auto;
        width: 700px;
        height: 480px;
        border: 1px solid gray;
    }
    #cl-img{
        margin-left: 15px;
    }
    #cl-wrap{
        /* box-sizing: border-box; border:1px solid black; */
        display: flex;
        margin-bottom: 10px;
        margin-top: 10px;
    }
    #cl-box{
        margin-left: 15px;
        margin-top: 5px;
    }
    #cl-category{
        font-weight: bolder;
        font-size: 15px;
        margin-top: 5px;
    }
    #cl-content{
        padding-top: 10px;
    }
    #cl-content textarea{
        width: 450px;
        height: 100px;
        resize: none;
    }
    /* 클래스 등록버튼 */
    #enrollBtn {
        display: block;
        font-size: 20px;
        font-weight: bolder;
        width: 400px;
        height: 50px;
        margin-bottom: 10px;
        margin-top: 80px;
    }
    .star{
        font-size: 28px;
        margin-top: -5px;
    }
    #allReview{
        font-size: 28px;
    }
    #starAverage{
        font-size: 17px;
    }
    #number{
        color: rgb(107, 171, 223);
        font-weight: bolder;
    }
</style>  
</head>
<body>

	<div style="width: 1600px; height: auto; margin: auto;">
	    <jsp:include page="../common/teacher/tcMypageSidebar.jsp"/>
        <div class="wrap">
            <div id="top-area">
                <span id="bord-name">스토어 리뷰 관리</span>
            </div>
            <div id="classCategory">
                <select class="productList" name="" id="">
                    <option value="0"></option>
                    <c:forEach var="p" items="${plist }">
	                    <option value="${p.productNo }">${p.title }</option>
                    </c:forEach>
                </select>
            </div>
            <div id="review">
                <span id="allReview">총 후기 <span id="number">${pi.listCount }</span>건 /</span>
                <span id="starAverage">별점평균 <span id="number">4.8</span>점</span>
            </div>
            <div id="content-wrap" style="overflow-y: scroll;">
	            <c:forEach var="r" items="${slist }">
	                <div id="cl-wrap" class="cl-wrap">
	                	<input type="hidden" class="reviewNo" value="${r.reviewNo }">
	                    <div id="cl-img">
	                    	<c:choose>
	                    		<c:when test="${r.img ne null }">
                			    	<img src="${r.img  }" style="width: 140px;">
	                    		</c:when>
	                    		<c:otherwise>
	                    			<img src="" style="width: 140px; height:120px;">
	                    		</c:otherwise>
	                    	</c:choose>
	                        <div class="star" align="center">
	                            <c:choose>
	                            	<c:when test="${r.starRating eq '0.5'}">☆☆☆☆☆</c:when>
	                            	<c:when test="${r.starRating eq '1' or r.starRating eq '1.5'}">★☆☆☆☆</c:when>
	                           		<c:when test="${r.starRating eq '2' or r.starRating eq '2.5'}">★★☆☆☆</c:when>
	                            	<c:when test="${r.starRating eq '3' or r.starRating eq '3.5'}">★★★☆☆</c:when>
	                            	<c:when test="${r.starRating eq '4' or r.starRating eq '4.5'}">★★★★☆</c:when>
	                            	<c:when test="${r.starRating eq '5'}">★★★★★</c:when>
	                            </c:choose>
	                        </div>
	                    </div>
	                    <div id="cl-box">
	                        <div id="cl-category">
	                            <span>
	                               <input type="hidden" value="${r.memberNo}"> ${r.nickname }
	                            </span>
	                        </div>
	                        <div id="cl-content">
	                            <textarea style="border: none;" readonly>${r.content }</textarea>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>	
                
            </div>
            <br><br><br>
        </div>
		<script type="text/javascript">
			$(".cl-wrap").click(function(){
				console.log($(this).children(".reviewNo").val());
				//location.href
			})
			
			$(".productList").change(function(){
				console.log($(this).val());

				$.ajax({
					url:"pReviewCountAjax.in",
					data:{pno:$(this).val()},
					success:function(sr){
						console.log(sr);
						let value =" <span id='allReview'>총 후기 <span id='number'>"+ sr.totalCount +"</span>건 /</span>"
						         	+ "<span id='starAverage'>별점평균 <span id='number'>"+ sr.starAvg + "</span>점</span>";
						console.log(value);
						$("#review").empty();
						$("#review").html(value);
					},error:function(){
						alert("리뷰 조회에 실패했습니다.");
					}
					
				});
				
				$.ajax({
					url:'pReviewAjax.in',
					data:{pno:$(this).val()},
					success:function(list){
						
						console.log(list);
						
						let value = "";
						
						for(let i in list){

							var star = "";
							var letStar = list[i].starRating

							if(letStar == '0.5'){
								star="☆☆☆☆☆";
							}else if(letStar == '1' || letStar == '1.5'){
								star="★☆☆☆☆";
							}else if(letStar == '2' || letStar == '2.5'){
								star="★★☆☆☆";
							}else if(letStar == '3' || letStar == '3.5'){
								star="★★★☆☆";
							}else if(letStar == '4' || letStar == '4.5'){
								star="★★★★☆";
							}else if(letStar == '5'){
								star="★★★★★";
							}
						
							console.log(letStar);
							console.log(star);
							
							value += "<div id='cl-wrap' class='cl-wrap'>"
										+"<input type='hidden' class='reviewNo' value='"+ list[i].reviewNo +"'>"
										+"<div id='cl-img'><img src='" + list[i].img + "' style='width: 140px; height:120px;'>"
											+"<div class='star' align='center'>"+star+"</div>"
				                        +"</div>" 
				                        +"<div id='cl-box'>"
					                        +"<div id='cl-category'>"
				                            	+"<span> <input type='hidden' value='" + list[i].memberNo + "'>"+ list[i].nickname +"</span>"
				                            +"</div>"
											+"<div id='cl-content'>"
				                        		+"<textarea style='border: none;' readonly>"+ list[i].content +"</textarea>"
				                        	+"</div>"
				                    	+"</div>"
				                    +"</div>" ;             
						}
		
						console.log(value);
						
						$("#content-wrap").empty();
						$("#content-wrap").html(value);
						
					},error:function(){
						alert("리뷰 조회에 실패했습니다.");
					}
				})
			
			})
		</script>
    </div>
</body>

</html>