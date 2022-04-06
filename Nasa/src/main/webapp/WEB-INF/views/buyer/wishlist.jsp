<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #wishicon {
      color: pink;
   }
   
   #wishicon:hover {
      color: black;
   }
</style>
</head>
<body>
			<script src="resources/excel/html2canvas.js"></script>
			<script src="resources/excel/jspdf.min.js"></script>
			
<!-- Hero Start-->
<div class="hero-area2short  slider-height2 hero-overly2 d-flex align-items-center ">
</div>
<!--Hero End -->
<section class="blog_area section-padding">
   <div class="container">
      <div class="row">
      <!-- sidebar Start -->
         <div class="col-3">
            <div class="blog_right_sidebar">
               <aside class="single_sidebar_widget post_category_widget">
                  <h4 class="widget_title">Menu</h4>
                     <ul class="list cat-list">
                        <li>
                           <a href="buyHistory.do" class="d-flex">
                              <p>구매내역</p>
                           </a>
                        </li>
                        <li>
                           <a href="buyerCalendar.do" class="d-flex">
                              <p>일정관리</p>
                           </a>
                        </li>
                        <li>
                           <a href="wishlist.do" class="d-flex">
                              <p style="font-weight: bold;">위시리스트</p>
                           </a>
                        </li>
                        <li>
                           <a href="buyerReview.do" class="d-flex">
                              <p>리뷰확인</p>
                           </a>
                        </li>
                        <li>
                           <a href="reportHistory.do" class="d-flex">
                              <p>신고내역</p>
                           </a>
                        </li>                         
                     </ul>
               </aside>
            </div>
         </div>
      <!-- sidbar End -->      
      <!-- wishlist start -->
         <div class="col-9">
            <!-- <div style="margin-top: 40px;">
                      <p><a href="goBuyerMypage.do" style="color: black;">마이페이지</a> > 위시리스트</p>
                  </div> -->
            <div class="blog_left_sidebar">
               <div class="blog_details">
                  <a class="d-inline-block">
                     <h2>위시리스트</h2>
                  </a>
                  <section class="blog_area single-post-area section-padding" style="padding-top:0 !important;">
					<c:if test="${fn:length(wishlistList) == 0}">
						<p>위시리스트에 등록된 판매자가 없습니다.</p>
					</c:if>
                  	<c:forEach items="${wishlistList }" var="wishlist">
                  		<c:forEach items="${sellerList }" var="seller">
                  			<c:if test="${wishlist.s_id eq seller.s_email }">
	                  			<div id="${wishlist.s_id }${wishlist.b_id}" class="blog-author" style="margin: 0 auto; margin-top: 20px;">
	                  				<%-- <input id="buyerid" value="${wishlist.b_id }" style="display:none;">
	                  				<input id="sellerid" value="${wishlist.s_id }" style="display:none;"> --%>
			                        <div class="media align-items-center">
			                        	<c:choose>
			                        		<c:when test="${not empty seller.s_img }">
					                        	<img src="${seller.s_img }" alt="">
			                        		</c:when>
			                        		<c:otherwise>
			                        			<img src="resources/user/assets/img/profile/search-default-profile.jpg" alt="">
			                        		</c:otherwise>
			                        	</c:choose>
			                           <div class="media-body">
			                           	<div class="d-flex">
		                                 	<h4 class="col-4"><a href="sellerDetail.do?s_email=${seller.s_email}">${seller.s_nickname } </a>
			                              	<i id = "wishicon" class="fa fa-heart" aria-hidden="true" onclick="deleteWishlist(this)" data-sid="${wishlist.s_id }" data-bid = "${wishlist.b_id }" data-toggle="tooltip" data-placement="top" title="위시리스트 제거"></i></h4>
			                              	<h4 class="col-8">${seller.s_address }</h4>
			                           	</div>
			                              <div class="d-flex"  style="margin-top: 8px;">
			                                 <h4 class="col-4">SW개발 > 웹개발</h4>
			                                 <h4 class="col-4">평점 : 
												 <c:set var = "r" value="0"></c:set>
												 <c:forEach items="${rateList}" var="rate">
													<c:if test="${rate.s_email eq seller.s_email}">
														<c:set var = "r" value="1"></c:set>
														${rate.rate}
													</c:if>
												 </c:forEach>
												 <c:if test="${r eq '0'}">
												 	평가가 없습니다.
												 </c:if>
											 </h4>
			                                 <h4>
			                                 	<c:choose>
			                                 		<c:when test="${seller.s_rank eq '1' }">별 등급</c:when>
			                                 		<c:when test="${seller.s_rank eq '2' }">달 등급</c:when>
			                                 		<c:when test="${seller.s_rank eq '3' }">태양 등급</c:when>
			                                 		<c:when test="${seller.s_rank eq '4' }">지구 등급</c:when>
			                                 		<c:otherwise>등급 미설정</c:otherwise>
			                                 	</c:choose>
			                                 </h4>
			                              </div>
			                              <p class="col-12" style="margin-top: 20px;">${seller.s_me }</p>
			                           </div>
			                        </div>
			                     </div>   
                  			</c:if>
                  		</c:forEach>
                  	</c:forEach>
					<div class="row justify-content-center mt-10">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
							  <c:if test="${paging.prev }">
								  <li class="page-item"><a class="page-link" href="wishlist.do?pageNum=${paging.startPage - 1 }&amount=${paging.amount}">&lt;</a></li>
							  </c:if>
							  <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								  <c:choose>
									  <c:when test="${p == paging.pageNum }">
										  <li class="page-item"><b class="page-link">${p }</b></li>
									  </c:when>
									  <c:when test="${p != paging.pageNum }">
										  <li class="page-item"><a class="page-link" href="wishlist.do?pageNum=${p }&amount=${paging.amount}">${p }</a></li>
									  </c:when>
								  </c:choose>
							  </c:forEach>
							  <c:if test="${paging.next }">
								  <li class="page-item"><a class="page-link" href="wishlist.do?pageNum=${paging.endPage+1 }&amount=${paging.amount}">&gt;</a></li>
							  </c:if>
						  </ul>
						</nav>
					</div>

	                  	<!-- <nav aria-label="Page navigation example">
							<ul class="pagination"></ul>
						</nav>   -->    

                  </section>
                  <!-- <nav class="blog-pagination justify-content-center d-flex">
                     <ul class="pagination">
                        <li class="page-item">
                           <a href="#" class="page-link" aria-label="Previous">
                              <i class="ti-angle-left"></i>
                           </a>
                        </li>
                        <li class="page-item">
                           <a href="#" class="page-link">1</a>
                        </li>
                        <li class="page-item active">
                           <a href="#" class="page-link">2</a>
                        </li>
                        <li class="page-item">
                           <a href="#" class="page-link" aria-label="Next">
                              <i class="ti-angle-right"></i>
                           </a>
                        </li>
                     </ul>
                  </nav> -->
               </div>                              
            </div>
         </div>
      <!-- wishlist end -->
      </div>
   </div>
</section>

<script>
	 $(document).ready(function(){
	          $('[data-toggle="tooltip"]').tooltip();   
	      });
// pagination
	/* $(document).ready(function() {
		var allwish = $(".blog-author").length;
		console.log(allwish);
		var pagesize = 0;
	 	var onepagesize = 10;
	 	
	 	if(allwish % onepagesize == 0) {
	 		pagesize = allwish / onepagesize;
	 	} else if (allwish % onepagesize > 0) {
	 		pagesize = allwish / onepagesize;
			pagesize++;
			pagesize = Math.floor(pagesize++);	
	 	}
	 	
	 	//$(".pagination").append("<li class='page-item'><a class='page-link'>Prev</a></li>");
		 
		for(var i = 1; i<= pagesize; i++) {
			 $(".pagination").append("<li class='page-item'><a class='page-link' onclick='movepage(this)'>" + i + "</a></li>")
		}
		 
		//$(".pagination").append("<li class='page-item'><a class='page-link'>Next</a></li>");
		 
		$(".blog-author").hide();
		 
		for(var i = 0; i < onepagesize; i++) {
			 $($(".blog-author")[i]).show();
		}
	});
	
	function movepage(event) {
		$(".blog-author").hide();
		console.log($(event).text());
		var pagingnum = $(event).text();
		var pagenumber = $(event).text() * 10;
		console.log(pagenumber);
		
		for(var i = pagenumber - 10; i < pagenumber; i++) {
			 $($(".blog-author")[i]).show();
		}
	} */
// pagination
	function deleteWishlist(event) {
		var sid = $(event).data("sid");
		var bid = $(event).data("bid");
		var wid = sid + bid;
		console.log(wid);
		// var target = document.getElementById(wid);
		// target.remove();
		
		$.ajax({
			url:"wishlistDelete.do",
			type:"post",
			data:
				{
					s_id:sid,
					b_id:bid
				},
			dataType : "text",
			success: function(d) {
				if(d = "d"){
					console.log("삭제");
					location.reload();
				}
			}
		})
	}
</script>
</body>
</html>