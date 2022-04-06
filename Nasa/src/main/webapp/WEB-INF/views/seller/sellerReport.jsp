<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
.table thead th{
	background-color : #e0d6f2 !important;
}
.powerbtn, .modal-header {
	background-color: #d5c9ea !important;
}

.modal-footer {
	display: block !important;
	text-align: center;
}
                
</style>
</head>
<body>
	<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>신고 내역</h2>
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
										<p style="font-weight: bold;">신고 관리</p>
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
										<h3>신고내역</h3>
									</a>
								<hr class="hr"/>
								<div class="blog_details">
								<c:if test="${empty reports}">
									<img src="resources/user/assets/img/nodata.jpg" style="width: 100%">
								</c:if>
								<c:if test="${not empty reports}">
									
								
								<table class="table caption-top table-bordered thead-light  text-center" style="margin-top:40px; font-size:12px;">
									<thead class="thead-light">
										<tr>
											<th>순번</th>
											<th>신고일</th>
											<th>신고대상</th>
											<th>신고유형</th>
											<th>신고내용</th>
											<th>신고결과</th>
											<th>신고처리날짜</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${reports }" var="report" varStatus="status">
										<tr style="font-size:12px;">
											<th scope="row">${fn:length(reports)-status.index }</th>
											<td>${fn:substring(report.re_date,0,11) }</td>
											<td>${report.re_res }</td>
											<td>${report.re_type }</td>
											<td>${report.re_subject }</td>
											<c:if test="${empty report.re_result }">
												<td>대기</td>
											</c:if>
											<c:if test="${report.re_result eq 'Y'}">
												<td>완료</td>
											</c:if>
											<c:if test="${report.re_result eq 'D'}">
												<td data-toggle="modal" 
												data-target="#re_deniedmodal" data-sub="${report.re_denied}" style="cursor: pointer; color:red;">반려</td>
											</c:if>
											<td>${fn:substring(report.re_rpoertdate,0,11) }</td>
										</tr>
									</c:forEach>
										
									</tbody>
								</table>
								<div class="row justify-content-center mt-10">
									<nav aria-label="Page navigation example">
									  <ul class="pagination">
										  <c:if test="${paging.prev }">
											  <li class="page-item"><a class="page-link" href="sellerPayment.do?pageNum=${paging.startPage - 1 }&amount=${paging.amount}">&lt;</a></li>
										  </c:if>
										  <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
											  <c:choose>
												  <c:when test="${p == paging.pageNum }">
													  <li class="page-item"><b class="page-link">${p }</b></li>
												  </c:when>
												  <c:when test="${p != paging.pageNum }">
													  <li class="page-item"><a class="page-link" href="sellerPayment.do?pageNum=${p }&amount=${paging.amount}">${p }</a></li>
												  </c:when>
											  </c:choose>
										  </c:forEach>
										  <c:if test="${paging.next }">
											  <li class="page-item"><a class="page-link" href="sellerPayment.do?pageNum=${paging.endPage+1 }&amount=${paging.amount}">&gt;</a></li>
										  </c:if>
									  </ul>
									</nav>
								</div>
								</c:if>
							</div>
							 
							</div>
                    	</article>
                    </div>
                 
	        	</div>
	        </div>
	    </div>
	</section>
	
	<div class="modal fade" id="re_deniedmodal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title">반려 사유</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="modal-body">
		  <p id="denied"></p>
		</div>
		<div class="modal-footer">
			<button class="genric-btn primary  radius powerbtn" data-dismiss="modal">닫기</button>
		</div>
	  </div>
	</div>
  </div>
  
  
  
  
<script>
$(document).ready(function () {
	$("#re_deniedmodal").on("show.bs.modal", function (event) {
		sub = $(event.relatedTarget).data("sub");
		$("#denied").html(sub);
	});
});
</script>	
</body>
</html>