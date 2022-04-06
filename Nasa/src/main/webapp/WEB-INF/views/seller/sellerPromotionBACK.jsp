<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

.category-listing {
	height: 300px !important;
}

.hr {
	background-color: #d5c9ea !important;
	margin: 10px !important;
}
.blog_details img{
	width: 354px;
	height: 256px;
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
						<h2>프로모션 관리</h2>
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
										<p>서비스관리</p>
								</a></li>
								<li><a href="sellerPromotion.do" class="d-flex">
										<p style="font-weight: bold;">프로모션관리</p>
								</a></li>
								<li><a href="sellerCalendar.do" class="d-flex">
										<p>일정관리</p>
								</a></li>
								<li><a href="sellerReview.do" class="d-flex">
										<p>리뷰관리</p>
								</a></li>
								<li><a href="sellerPayment.do" class="d-flex">
										<p>결제조회</p>
								</a></li>
								<li><a href="sellerSales.do" class="d-flex">
										<p>매출확인</p>
								</a></li>
								<li><a href="sellerReport.do" class="d-flex">
										<p>신고관리</p>
								</a></li>
								<li><a href="sellerKnowhow.do" class="d-flex">
										<p>판매자 노하우</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>

				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
				<div class="col-9">
					<div class="blog_left_sidebar">
						<article class="blog_item">
							<div class="justify-content-center">
								<a class="d-inline-block" style="margin-top: 20px;">
									<h3>프로모션 관리</h3>
								</a>
								<hr class="hr" />
								<a href="promotionInsert.do" class="genric-btn danger">프로모션 등록</a>
								<div class="blog_details">
									<div class="container">
										<nav class="fables-single-nav">
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<!-- <a
													class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after px-3 px-md-5 font-15 semi-font border-0 active rounded-0 py-3"
													id="nav-desc-tab" data-toggle="tab" href="#nav-desc"
													role="tab" aria-controls="nav-desc" aria-selected="true">진행중인
													프로모션</a><a
													class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
													id="nav-end-tab" data-toggle="tab" href="#nav-end"
													role="tab" aria-controls="nav-end" aria-selected="false">진행예정
													프로모션</a>  <a
													class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
													id="nav-info-tab" data-toggle="tab" href="#nav-info"
													role="tab" aria-controls="nav-info" aria-selected="false">종료된
													프로모션</a> -->
													<a
													class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after px-3 px-md-5 font-15 semi-font border-0 rounded-0 py-3"
													id="nav-desc-tab"  href="sellerPromotion.do" >진행중인
													프로모션</a><a
													class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
													id="nav-end-tab" href="sellerPromotionU.do"
													>진행예정
													프로모션</a>  <a
													class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font active rounded-0 py-3"
													id="nav-info-tab" href="sellerPromotionY.do" >종료된
													프로모션</a>
											</div>
										</nav>
										<br /> <br />
										<div class="tab-content" id="nav-tabContent">
											<div class="tab-pane fade show active" id="nav-desc" role="tabpanel" aria-labelledby="nav-desc-tab">
												<div class="listing-details-area">
													<div class="container">
														<div class="row">
														<c:forEach items="${promotions }" var="promotion">
														<c:if test="${promotion.pro_status eq 'N'}">
															<div class="col-lg-6 ">
																<div class="single-listing mb-30">
																	<div class="list-img">
																		<img src="fileupload/${promotion.ser_img }" alt="">
																		<!-- <span>Open</span> -->
																	</div>
																	<div class="list-caption">
																		<span style="cursor: pointer;" onclick="location.href='serviceDetail.do?ser_code=${promotion.pro_service }'">Open</span>
																		<h3>
																			<a href="serviceDetail.do?ser_code=${promotion.pro_service }">${promotion.ser_title }</a>
																		</h3>
																		<p>프로모션 코드 : p${promotion.pro_code }</p>
																		<p>프로모션 일자 : ${fn:substring(promotion.pro_start,0,10) } ~ ${fn:substring(promotion.pro_end,0,10) }</p>
																		<p>할인율: ${promotion.prodiscount }%</p>
																		<div class="list-footer" style="display: block;">
																			<ul>
																				<li>
																					<button type="button" class="genric-btn danger-border circle" onclick="promEnd('${promotion.pro_code }','${promotion.pro_service }')">종료</button>
																				</li>

																			</ul>
																		</div>
																	</div>
																</div>
															</div>
															</c:if>
														</c:forEach>
														
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane fade show" id="nav-end" role="tabpanel" aria-labelledby="nav-end-tab">
												
													<div class="listing-details-area">
														<div class="container">
															<div class="row">

																<c:forEach items="${promotions }" var="promotion">
																<c:if test="${promotion.pro_status eq 'U'}">
																		<div class="col-lg-6">
																			<div class="single-listing mb-30">
																				<div class="list-img">
																					<img src="fileupload/${promotion.ser_img }"
																						id="prvimg" alt="">
																				</div>
																				<div class="list-caption">
																					<span style="cursor: pointer;" onclick="location.href='serviceDetail.do?ser_code=${promotion.pro_service }'">Open</span>
																					<h3>
																						<a href="serviceDetail.do?ser_code=${promotion.pro_service }">${promotion.ser_title }</a>
																					</h3>
																					<p>프로모션 코드 : p${promotion.pro_code }</p>
																					<p>프로모션 일자 : ${fn:substring(promotion.pro_start,0,10) } ~ ${fn:substring(promotion.pro_end,0,10) }</p>
																					<p>할인율: ${promotion.prodiscount }%</p>
																					<div class="list-footer" style="display: block;">
																						<ul>
																							<li>
																								<button type="button" class="genric-btn danger-border circle" onclick="promCancel('${promotion.pro_code }','${promotion.pro_service }')">취소</button>
																							</li>

																						</ul>
																					</div>
																				</div>
																			</div>
																		</div>
																	</c:if>
																</c:forEach>
															</div>
														</div>
													</div>
												
											</div>
											<div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
												<div class="listing-details-area">
													<div class="container">
														<div class="row">
														<c:forEach items="${promotions }" var="promotion">
														<c:if test="${promotion.pro_status eq 'Y'}">
															<div class="col-lg-6 ">
																<div class="single-listing mb-30">
																	<div class="list-img">
																		<img src="fileupload/${promotion.ser_img }" alt="">
																		<!-- <span>Open</span> -->
																	</div>
																	<div class="list-caption">
																		
																		<h3>
																			<a href="serviceDetail.do?ser_code=${promotion.pro_service }">${promotion.ser_title }</a>
																		</h3>
																		<p>프로모션 코드 : p${promotion.pro_code }</p>
																		<p>프로모션 일자 : ${fn:substring(promotion.pro_start,0,10) } ~ ${fn:substring(promotion.pro_end,0,10) }</p>
																		<p>할인율: ${promotion.prodiscount }%</p>
																		<div class="list-footer" style="display: block;">
																			<ul>
																				<li>* 종료된 프로모션입니다.</li>
																			</ul>
																		</div>
																	</div>
																</div>
															</div>
															</c:if>
														</c:forEach>
														
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- listing Details End -->
									<!--Pagination Start  -->
									<div class="pagination-area pt-70 text-center">
										<div class="container">
											<div class="row">
												<div class="col-xl-12">
													<div class="single-wrap d-flex justify-content-center">
														<nav aria-label="Page navigation example">
															<ul class="pagination justify-content-start">
																<li class="page-item active"><a class="page-link"
																	href="#">01</a></li>
																<li class="page-item"><a class="page-link" href="#">02</a></li>
																<li class="page-item"><a class="page-link" href="#">03</a></li>
																<li class="page-item"><a class="page-link" href="#"><span
																		class="ti-angle-right"></span></a></li>
															</ul>
														</nav>
													</div>
												</div>
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
<script>

	function promCancel(pro_code, pro_service){
		if(confirm("프로모션을 취소하시겠습니까?")){
			$.ajax({
				url:"promotionCancel.do",
				type: "post",
				data: {pro_code:pro_code, pro_service : pro_service},
				dataType: "text",
				success: function(result){
					if(result == 'T'){
						alert('취소되었습니다.');
						location.href = "sellerPromotion.do";
					}else{
						alert('일시적 오류로 실패하였습니다.');
						return;
					}
				}
			})
		}else{
			return;
		}
	}
	
	
	function promEnd(pro_code,pro_service){
		if(confirm("프로모션을 종료하시겠습니까?" )){
			$.ajax({
				url:"promotionEnd.do",
				type: "post",
				data: {pro_code:pro_code, pro_service : pro_service},
				dataType: "text",
				success: function(result){
					if(result == 'T'){
						alert('종료되었습니다.');
						location.href = "sellerPromotion.do";
					}else{
						alert('일시적 오류로 실패하였습니다.');
						return;
					}
				}
			})
		}else{
			return;
		}
	}
</script>
</body>
</html>