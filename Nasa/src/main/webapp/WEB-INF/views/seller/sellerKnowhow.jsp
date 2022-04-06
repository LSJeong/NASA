<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.hr{
 	background-color : #d5c9ea !important;
   	margin: 10px !important;
}
.genric-btn:hover {
	background-color: white;
	color:#9e68ff !important;
	border: 1px solid #9e68ff !important;
}
.genric-btn.danger{
	margin-top: 15px;
	float: right;
	background: #e0d6f2;
}
</style>
</head>
<body>
	<div
		class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>판매자의 노하우</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="blog_area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-3">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">MYPAGE MENU</h4>
							<ul class="list cat-list">
								<li><a href="sellerService.do" class="d-flex">
									<p >서비스 관리</p>
								</a></li>
								<li><a href="sellerPromotion.do" class="d-flex">
										<p>프로모션 관리</p>
								</a></li>
								<li><a href="powerservice.do" class="d-flex">
										<p>파워서비스 내역</p>
								</a></li>
								<li><a href="sellerCalendar.do" class="d-flex">
										<p>일정 관리</p>
								</a></li>
								<li><a href="sellerReview.do?scode=0" class="d-flex">
										<p>리뷰 관리</p>
								</a></li>
								<li><a href="sellerPayment.do" class="d-flex">
										<p>결제 조회</p>
								</a></li>
								<li><a href="sellerSales.do" class="d-flex">
										<p>매출 확인</p>
								</a></li>
								<li><a href="sellerReport.do" class="d-flex">
										<p>신고 관리</p>
								</a></li>
								<li><a href="sellerKnowhow.do" class="d-flex">
										<p style="font-weight: bold;">판매자 노하우</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-9">
					<div class="blog_left_sidebar">
						<article class="blog_item">
							<div class="justify-content-center">
								<div class="d-inline-block" style="margin-top:20px;">
									<h3>판매자 노하우</h3>
								</div>
								<button class="genric-btn danger circle" onclick="location.href='knowhowInsertForm.do'">글 등록</button>
								<hr class="hr"/>
								<div class="blog_details">
									<div class="home-blog-area section">
										<div class="container">
											
											<div class="row">
												<c:if test="${empty knowhows}">
													<img src="resources/user/assets/img/nodata.jpg" style="width: 100%">
												</c:if>
												<c:forEach items="${knowhows }" var="knowhow">
												<c:if test="${knowhow.no_id eq id }">
													<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
														<div class="single-team mb-30">
															<div class="team-img">
																<img src="${knowhow.no_img }" alt="" style="width: 238px; height: 238px;">
															</div>
															<div class="team-caption">
																<span>${knowhow.s_nickname }</span>
																<h3>
																	<a href="knowhowDetail.do?no_code=${knowhow.no_code } ">${knowhow.no_title }</a>
																</h3>
																<p>${knowhow.no_date }</p>
															</div>
														</div>
													</div>
												</c:if>
												</c:forEach>
											</div>
											<div class="row justify-content-center mt-10">
												<nav aria-label="Page navigation example">
												  <ul class="pagination">
													  <c:if test="${paging.prev }">
														  <li class="page-item"><a class="page-link" href="sellerKnowhow.do?pageNum=${paging.startPage - 1 }&amount=${paging.amount}">&lt;</a></li>
													  </c:if>
													  <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
														  <c:choose>
															  <c:when test="${p == paging.pageNum }">
																  <li class="page-item"><b class="page-link">${p }</b></li>
															  </c:when>
															  <c:when test="${p != paging.pageNum }">
																  <li class="page-item"><a class="page-link" href="sellerKnowhow.do?pageNum=${p }&amount=${paging.amount}">${p }</a></li>
															  </c:when>
														  </c:choose>
													  </c:forEach>
													  <c:if test="${paging.next }">
														  <li class="page-item"><a class="page-link" href="sellerKnowhow.do?pageNum=${paging.endPage+1 }&amount=${paging.amount}">&gt;</a></li>
													  </c:if>
												  </ul>
												</nav>
											</div>
										</div>
										
									</div>
									
								</div>
								
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>