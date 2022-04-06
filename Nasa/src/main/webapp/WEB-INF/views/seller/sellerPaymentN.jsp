<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 조회</title>
<style>
.fables-single-item {
	color: rgb(64, 64, 64);
}

.fables-single-item:hover {
	background-color: tomato;
}

.nav-link.active {
	background-color: tomato !important;
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
.hr{
 	background-color : #d5c9ea !important;
   	margin: 10px !important;
}

td, th {
  text-align : center;
  vertical-align : middle !important;
}
.bemail{
	color: gray;
}
.nav-link.active{
	background-color: #d5c9ea !important;
	color: white !important;
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
						<h2>결제 조회</h2>
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
										<p style="font-weight: bold;">결제 조회</p>
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
				<div class="col-9">
					<div class="blog_left_sidebar">
						<article class="blog_item">
							<div class="justify-content-center">
								<a class="d-inline-block" style="margin-top:20px;">
										<h3>결제 조회</h3>
									</a>
								<hr class="hr"/>
								<div class="blog_details">
									<div>
										<div class="container" style="padding: 0;">
											<nav class="fables-single-nav">
												<div class="nav nav-tabs" id="nav-tab" role="tablist">
													<a
														class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after px-3 px-md-5 font-15 semi-font border-0  rounded-0 py-3"
														id="nav-info-tab" href="sellerPayment.do">정산
														완료</a><a
														class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font active rounded-0 py-3"
														id="nav-desc-tab" href="sellerPaymentN.do"
														>정산
														대기</a> 
												</div>
											</nav>
											<div class="tab-content" id="nav-tabContent">
												<div class="tab-pane fade show active" id="nav-desc" role="tabpanel" aria-labelledby="nav-desc-tab">
												<br />
												<br />
												<div class="row justify-content-center" style="margin-left:0px;">
												<c:if test="${empty sellerPayList}">
														<img src="resources/user/assets/img/nodata.jpg" style="width: 100%">
													</c:if>
													<c:if test="${not empty sellerPayList}">
													<table
														class="table table-bordered thead-light  text-center"
														style="padding: 1em;">
														<thead class="thead-light"  style="font-size: 12px;">
															<tr>
																<th>거래날짜</th>
																<th>서비스명</th>
																<th>구매자</th>
																<th>거래금액</th>
																<th>쿠폰</th>
																<th>수수료감면</th>
																<th>최종금액</th>
																<th>구매확정일</th>
															</tr>
														</thead>
														<tbody  style="font-size: 12px;">
															<c:forEach items="${sellerPayList }" var="sellerPay">
																	<tr>
																		<td >${fn:substring(sellerPay.pay_date,0,10) }</td>
																		<td>${sellerPay.ser_title }</td>
																		<td>${sellerPay.b_nickname } <br /><span class="bemail">${sellerPay.b_email }</span></td>
																		<td><fmt:formatNumber value="${sellerPay.pay_originp }" pattern="###,###"/>원</td>
																		<c:if test="${sellerPay.pay_coupon eq 'coupon'}">
																			<td>-</td>
																		</c:if>
																		<c:if test="${sellerPay.pay_coupon ne 'coupon'}">
																			<td>${sellerPay.pay_coupon }%</td>
																		</c:if>
																		<td><fmt:formatNumber value="${sellerPay.pay_com }" pattern="###,###"/>원</td>
																		<td><fmt:formatNumber value="${sellerPay.pay_price }" pattern="###,###"/>원</td>
																		<td>${fn:substring(sellerPay.pay_enddate,0,10) }</td>
																		
																	</tr>
															</c:forEach>
														</tbody>
													</table>
													</c:if>
													</div>
													<div class="row justify-content-center mt-10">
													<nav aria-label="Page navigation example">
													  <ul class="pagination">
														  <c:if test="${paging.prev }">
															  <li class="page-item"><a class="page-link" href="${address }?pageNum=${paging.startPage - 1 }&amount=${paging.amount}">&lt;</a></li>
														  </c:if>
														  <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
															  <c:choose>
																  <c:when test="${p == paging.pageNum }">
																	  <li class="page-item"><b class="page-link">${p }</b></li>
																  </c:when>
																  <c:when test="${p != paging.pageNum }">
																	  <li class="page-item"><a class="page-link" href="${address }?pageNum=${p }&amount=${paging.amount}">${p }</a></li>
																  </c:when>
															  </c:choose>
														  </c:forEach>
														  <c:if test="${paging.next }">
															  <li class="page-item"><a class="page-link" href="${address }?pageNum=${paging.endPage+1 }&amount=${paging.amount}">&gt;</a></li>
														  </c:if>
													  </ul>
													</nav>
												</div>
											</div>
											<div class="tab-pane fade " id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
												
												
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


</body>
</html>