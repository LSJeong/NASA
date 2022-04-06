<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.servnav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	border: 1px solid #e7e7e7;
	background-color: #f3f3f3;
}

.nav-item {
	float: left;
}

.nav-item a {
	display: block;
	color: #666;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.nav-item a:hover:not(.active) {
	background-color: #ddd;
}

.genric-btn.danger-border {
	color: #9e68ff;
	border: 1px solid #8a2fdb;
}

.powertb td {
	width: 120px;
	height: 50px;
	font-size: 12px;
}

.endservtb td {
	width: 180px;
	height: 50px;
	font-size: 12px;
}

.powerbtn, .modal-header {
	background-color: #d5c9ea !important;
}

.modal-footer {
	display: block !important;
	text-align: center;
}

.powerp {
	color: red;
	font-size: 8px;
	border-bottom: 1px solid #999294;
}

.endp {
	padding: 30px 0px 20px 0px;
}

.br {
	border-top: 1px solid #999294;
	margin-top: 20px;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #999294;
}

.paytb td {
	width: 120px;
	height: 50px;
	font-size: 12px;
}

.paytb td:nth-child(2) {
	width: 200px;
}

.category-listing {
	height: 350px !important;
}

.fables-single-item {
	color: rgb(64, 64, 64);
}

.fables-single-item:hover {
	background-color: #d5c9ea;
}

.nav-link.active {
	background-color: #d5c9ea !important;
	color: white !important;
}

input[type=date] {
	border: 1px solid lightgray;
	color: lightgray;
	margin-right: 10px;
}

.paybtn {
	margin-right: 10px;
}

.hr {
	background-color: #d5c9ea !important;
	margin: 10px !important;
}

.pt-70 {
	padding-top: 0px;
}

.blog_details img {
	width: 354px;
	height: 256px;
}

.genric-btn.danger-border:hover {
	background-color: #d5c9ea !important;
	color: white;
}

.pl-md-5, .px-md-5 {
	padding-left: 2rem !important;
	padding-right: 2rem !important;
}

/* .listing-details-area .single-listing .list-footer ul{
	justify-content: right;
} */

.price{
	text-align: right;
	font-size: 25px !important;
	font-weight: bold;
}
.category{
	font-size: 13px;
	color: gray;
}
.line{
	text-align: right;
	color: gray;
	font-size: 13px;
}
.price img{
	width: 100px;
	height: 28px;
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
	<!-- 헤더 -->
	<div
		class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>서비스 관리</h2>
					</div>
				</div>
			</div>
		</div>
	</div>



	<section class="blog_area section-padding">
		<div class="container">
			<div class="row">
				<!-- Left content -->
				<div class="col-3">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">MYPAGE MENU</h4>
							<ul class="list cat-list">
								<li><a href="sellerService.do" class="d-flex">
									<p style="font-weight: bold;">서비스 관리</p>
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
										<p>판매자 노하우</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				
				
				<!-- Right content -->
				<div class="col-9">
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
					<div class="blog_left_sidebar">
						<article class="blog_item">
							<div class="justify-content-center">
								<a class="d-inline-block" style="margin-top: 20px;">
									<h3>서비스 관리</h3>
								</a>
								<button onclick="location.href='serviceInsert.do'" class="genric-btn danger circle">서비스 등록</button>
								<hr class="hr" />
								<!-- <a href="" class="genric-btn danger" data-toggle="modal"
									data-target="#PowerModal">파워서비스 등록</a>  -->
								<!-- <a href="" class="genric-btn danger" data-toggle="modal"
									data-target="#payModal">결제 등록</a> -->

								<div class="blog_details">
									<div class="container">
										<nav class="fables-single-nav">
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<a
													class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after px-3 px-md-5 font-15 semi-font  border-0 rounded-0 py-3"
													id="nav-desc-tab"  href="sellerService.do"> 진행중인
													서비스</a> <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15  active semi-font rounded-0 py-3"
													id="nav-info-tab"  href="sellerServiceY.do">종료된
													서비스</a> <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
													id="nav-end-tab" href="sellerServiceU.do">종료예정
													서비스</a> 
											</div>
										</nav>
										<br /> <br />
										<div class="tab-content" id="nav-tabContent">
											<div class="tab-pane fade" id="nav-desc"
												role="tabpanel" aria-labelledby="nav-desc-tab">
											
													<div class="listing-details-area">
														<div class="container">
															<div class="row">

																
															</div>
														</div>
													</div>
												
											</div>
											<div class="tab-pane fade show" id="nav-end" role="tabpanel"
												aria-labelledby="nav-end-tab">
											
													<div class="listing-details-area">
														<div class="container">
															<div class="row">

															</div>
														</div>
													</div>
												
											</div>
											<div class="tab-pane fade show active" id="nav-info" role="tabpanel"
												aria-labelledby="nav-info-tab">
													<div class="listing-details-area">
														<div class="container">
															<div class="row">
																<c:if test="${empty sellerMainServiceList}">
																	<img src="resources/user/assets/img/nodata.jpg" style="width: 100%; height: 100%;">
																</c:if>
																<c:if test="${not empty sellerMainServiceList}">
																<c:forEach items="${sellerMainServiceList }" var="service">
																
																		<div class="col-lg-6">
																			<div class="single-listing mb-30">
																				<div class="list-img">
																					<img src="${service.ser_img }" alt="">
																				</div>
																				<div class="list-caption">
																					<div class="category">* ${service.category } > ${service.sub_category }</div>
																					<div class="line"> <div>${service.ser_line }</div>
																					<div>${service.reviewcount }개의 리뷰</div></div>
																					<br/>
																					<h3>
																						<a href="serviceDetail.do?ser_code=${service.ser_code }">${service.ser_title }</a>
																					</h3>
																					<div>서비스코드 : s${service.ser_code }</div>
																					<div>서비스 종료일: ${fn:substring(service.ser_end,0,10) }</div>
																					<c:if test="${not empty service.prodiscount }">
																						<div class="price">₩ <del><fmt:formatNumber value="${service.ser_price }" pattern="###,###"/></del> </div>
																						<div class="price" style="color:red;"><img src="resources/user/assets/img/promotion.png"> ₩<fmt:formatNumber value="${service.prodiscount }" pattern="###,###"/></div>
																			
																					</c:if>
																					<c:if test="${empty service.prodiscount }">
																						<div style="height: 37.5px;"></div>
																						<div class="price"> ₩ <fmt:formatNumber value="${service.ser_price }" pattern="###,###"/></div>
																					</c:if>
																					<div class="list-footer">
																						<ul>
																							<li>
																								<!-- <div style="margin-left: 210px;">
																							<a href="#" class="genric-btn danger-border circle" data-toggle="modal" data-target="#endModal">종료</a>
																						</div> -->
																								<div>* 종료된 서비스입니다.</div>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</div>
																		</div>
																</c:forEach>
																</c:if>
															</div>
														</div>
													</div>
												
											</div>
											
										</div>
										 
									</div>
								</div>
							</div>
						</article>
					</div>
					<div class="row justify-content-center mt-10">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
							  <c:if test="${paging.prev }">
								  <li class="page-item"><a class="page-link" href="sellerService.do?pageNum=${paging.startPage - 1 }&amount=${paging.amount}">&lt;</a></li>
							  </c:if>
							  <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								  <c:choose>
									  <c:when test="${p == paging.pageNum }">
										  <li class="page-item"><b class="page-link">${p }</b></li>
									  </c:when>
									  <c:when test="${p != paging.pageNum }">
										  <li class="page-item"><a class="page-link" href="sellerService.do?pageNum=${p }&amount=${paging.amount}">${p }</a></li>
									  </c:when>
								  </c:choose>
							  </c:forEach>
							  <c:if test="${paging.next }">
								  <li class="page-item"><a class="page-link" href="sellerService.do?pageNum=${paging.endPage+1 }&amount=${paging.amount}">&gt;</a></li>
							  </c:if>
						  </ul>
						</nav>
					</div>
					<!--Pagination End  -->
				</div>
			</div>
		</div>
	</section>
	


	<script>
		$(function() { // actvie 활성화 
			$(".nav-item > .active").css("color", "white");
			$('.nav-link').click(function() {
				// .nav-link 클릭시 이전의 active 값 해제 후, 
				$(".nav-item > .active").css("color", "#666");
				$('.nav-link').removeClass('active'); // 클릭한 위치 active 적용 
				$(this).addClass('active');
				$(".nav-item > .active").css("color", "white");
			});

			$("#ydate").click(function() {
				console.log($("#conference").attr("style", "display: block;"))
			})
			$("#ndate").click(function() {
				console.log($("#conference").attr("style", "display: none;"))
			})

			/* enddate(); */
			var paramDate = new Date();
			var day = paramDate.getDay();
			var diff = paramDate.getDate() - day + (day == 0 ? -6 : 1);
			var mon = new Date(paramDate.setDate(diff)).toISOString().substring(0, 10);
			$("#powerdate").attr('min', mon);
		});

		/* $("#nav-tab a").on("click", function(event) {
			event.preventDefault();
			$(this).tab("show");
		}) */

	
	</script>
</body>
</html>
