<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<style>
		.nice-select {
		    width: 50px;
		    margin-top: 8px;
		}
		.revimg {
			width: 200px;
			height: 100px;
		}

		.comment {
			width: 550px;
		}

		.btn-reply1 {
			background-color: transparent;
			color: #888888;
			font-size: 14px;
			font-weight: 400;
		}

		.revborder {
			margin-bottom: 50px;
		}

		.comments-area {
			margin-top: 0px;
		}

		.modal-open {
			padding-right: 0px !important;
		}

		body {
			padding-right: 0px !important;
		}
		
		.profileimg {
			width: 70px;
			height: 70px;
		}

		.revimg {
			width: 200px;
			height: 100px;
		}

		.comment {
			white-space: pre-line;
		}
	</style>
</head>

<body>
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
							<h4 class="widget_title">MENU</h4>
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
										<p>위시리스트</p>
									</a>
								</li>
								<li>
									<a href="buyerReview.do" class="d-flex">
										<p style="font-weight: bold;">리뷰확인</p>
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
				<!-- buyerReview Start -->
				<div class="col-9">
					<div class="blog_left_sidebar">
						<!-- <div style="margin-top: 40px;">
							<p><a href="goBuyerMypage.do" style="color: black;">마이페이지</a> > 리뷰</p>
						</div> -->
						<div class="blog_details" style="width:900px;">
							<a class="d-inline-block">
								<h2>리뷰확인</h2>
							</a>
							<div class="comments-area">
								<c:if test="${fn:length(reviewList) == 0}">
									<p>등록된 리뷰가 없습니다.</p>
								</c:if>
								<c:forEach items="${reviewList }" var="review">
								
									<div id="rvcode-${review.rev_code }" class="comment-list">
										<div class="single-comment justify-content-between d-flex">
											<div class="user justify-content-between d-flex">
												<c:choose>
													<c:when test="${not empty review.b_img }">
														<div class="thumb">
															<img class = "profileimg" src="${review.b_img }" alt="">
														</div>
													</c:when>
													<c:otherwise>
														<div class="thumb">
															<img class = "profileimg" src="resources/user/assets/img/profile/search-default-profile.jpg" alt="">
														</div>
													</c:otherwise>
												</c:choose>
												<div class="desc">
													<span style="font-weight: 800;">${review.rev_ser_name }</span><br>
													<span>${review.rev_name }</span>
													<span class="ml-4">평점 : ${review.rev_rate }</span>
													<span class="date">${fn:substring(review.rev_date, 0 , 10) } </span>
													<div style="word-break:break-all;">
														<p class="comment">${review.rev_sub }</p>
													</div>
													<c:choose>
														<c:when test="${not empty review.rev_img }">
															<span class="btn-reply1" style="cursor: pointer;" data-toggle="modal"
																data-target="#updateReviewModal" data-rvcode="${review.rev_code }" data-rvsub="${review.rev_sub }" 
																data-rvimg="${review.rev_img }">수정</span>
														</c:when>
														<c:otherwise>
															<span class="btn-reply1" style="cursor: pointer;" data-toggle="modal"
																data-target="#updateReviewModal" data-rvcode="${review.rev_code }" data-rvsub="${review.rev_sub }" 
																data-rvimg="none">수정</span>
														</c:otherwise>
													</c:choose>
													<span class="btn-reply1"
														style="cursor: pointer;" data-toggle="modal"
														data-target="#deleteReviewModal" data-rvcode="rvcode-${review.rev_code }">삭제</span>
												</div>
											</div>
											<c:if test="${not empty review.rev_img }">
												<div style="width:200px;height:100px; margin-left:10px;">
													<img class="revimg" src="${review.rev_img }" style="width:200px;height:100px;">
												</div>
											</c:if>
										</div>
									</div>
									<c:forEach items="${rclist }" var="rc">
										<c:if test="${review.rev_code eq rc.review_code}">
											<div id="rvcode-${rc.review_code }" class="comment-list left-padding">
												<div class="single-comment justify-content-between d-flex">
													<div class="user justify-content-between d-flex">
														<div style="margin-top:5px;">
															<img src="resources/user/assets/img/icon/review_comment_icon.png" alt="" style="width:70px;height:50px;">
														</div>
														<c:choose>
															<c:when test="${not empty rc.s_img }">
																<div class="thumb">
																	<img src="${rc.s_img}" class = "profileimg" alt="">
																</div>
															</c:when>
															<c:otherwise>
																<div class="thumb">
																	<img src="resources/user/assets/img/profile/search-default-profile.jpg" class = "profileimg" alt="">
																</div>
															</c:otherwise>
														</c:choose>
														<div class="desc">
															<span>${rc.rere_sel_name }</span>
															<span class="date">${fn:substring(rc.rere_date, 0 , 10) } </span>
															<div style="word-break:break-all;">
																<p class="comment">${rc.rere_sel_sub }</p>
															</div>
															<span class="btn-reply1" data-toggle="modal" data-target="#reportModal" data-rere_code="${rc.rere_code }"
																style="cursor: pointer;">신고</span>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								<div style="border-bottom: 1px solid rgb(202, 202, 202); margin-bottom:20px; width : 100%;"></div>
								</c:forEach>
								
								<div class="row justify-content-center mt-10">
									<nav aria-label="Page navigation example">
									  <ul class="pagination">
										  <c:if test="${paging.prev }">
											  <li class="page-item"><a class="page-link" href="buyerReview.do?pageNum=${paging.startPage - 1 }&amount=${paging.amount}">&lt;</a></li>
										  </c:if>
										  <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
											  <c:choose>
												  <c:when test="${p == paging.pageNum }">
													  <li class="page-item"><b class="page-link">${p }</b></li>
												  </c:when>
												  <c:when test="${p != paging.pageNum }">
													  <li class="page-item"><a class="page-link" href="buyerReview.do?pageNum=${p }&amount=${paging.amount}">${p }</a></li>
												  </c:when>
											  </c:choose>
										  </c:forEach>
										  <c:if test="${paging.next }">
											  <li class="page-item"><a class="page-link" href="buyerReview.do?pageNum=${paging.endPage+1 }&amount=${paging.amount}">&gt;</a></li>
										  </c:if>
									  </ul>
									</nav>
								</div>
							</div>
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
				<!-- buyeerReview End -->
			</div>
		</div>
	</section>

	<!-- Modal Start -->
	<!-- 신고 모달 -->
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신고</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label><input type="radio" name="reportType" value="욕설/비방" onclick="radiodisabled()" checked="checked"> 욕설/비방</label><br>
							<label><input type="radio" name="reportType" value="음란물" onclick="radiodisabled()"> 음란물</label><br>
							<label><input type="radio" name="reportType" value="스팸/부적절한 광고" onclick="radiodisabled()"> 스팸/부적절한 광고</label><br>
							<label><input type="radio" name="reportType" value="혐오/잔인한 사진" onclick="radiodisabled()"> 혐오/잔인한 사진</label><br>
							<div class="form-group">
								<label><input type="radio" name="reportType" value="기타사유" onclick="radioactive()"> 기타사유</label>
								<textarea class="form-control" id="reportSubject" name="reportSubject"
									disabled></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a href="#" class="genric-btn danger radius" data-dismiss="modal" onclick="reportReview()">신고</a>
					<a href="#" class="genric-btn primary radius" data-dismiss="modal" onclick="radiodisabled();disradio();">취소</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 신고 모달 -->

	<!-- 삭제 경고 모달 -->
	<div class="modal fade" id="deleteReviewModal" tabindex="-1" role="dialog" aria-labelledby="deleteReviewModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">리뷰 삭제</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">리뷰가 삭제됩니다!</div>
				<div class="modal-footer">
					<a href="#" class="genric-btn danger radius" onclick="deleteReview()" data-dismiss="modal">삭제</a>
					<a href="#" class="genric-btn primary radius" data-dismiss="modal">취소</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 삭제 경고 모달 -->
	
	<!-- 리뷰 업데이트 모달 -->
	<div class="modal fade bd-example-modal-lg" id="updateReviewModal" tabindex="-1" role="dialog" aria-labelledby="updateReviewModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">리뷰 수정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method = "post" action = "reviewUpdate.do" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="d-flex">
							<input type="hidden" id="hidden_revcode" name="rev_code">
                      		<h5 style="font-size:15px; margin-right:10px; margin-top:20px;">평점</h5>
                      		<select id="rev_rate" name = "rev_rate" style="width:50px;">
                      			<option value="1">1</option>
                      			<option value="2">2</option>
                      			<option value="3">3</option>
                      			<option value="4">4</option>
                      			<option value="5">5</option>
                      		</select>
                   		</div>
                   		<h5 style="font-size:15px; margin-top:20px;">내용</h5>
	              		<textarea id = "modal_rev_sub" name="rev_sub" style="width:100%; height:100px; margin-top:5px" required></textarea>
	              		<div class = "d-flex">
		              		<input type="file" id="reviewimg" name="revimg" accept="image/*" style="display:none;">
		                    <label class="genric-btn primary radius" for="reviewimg" style="margin-top: 7px;">사진 첨부</label>
		                    <img id="reviewimgpreview" alt="" style="width: 42px; height:42px; margin-left:10px;margin-top: 7px; overflow: hidden; border-color:white;">
	              		</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="genric-btn danger radius">수정</button>
						<button class="genric-btn primary radius" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 리뷰 업데이트 모달 -->


	<!-- Modal End -->
	<script>
		function readImage(input) {
			if(input.files && input.files[0]) {
				const reader = new FileReader();
				
				reader.onload = e => {
					const previewImage = document.getElementById("reviewimgpreview");
					previewImage.src = e.target.result;
				}
				reader.readAsDataURL(input.files[0]);                 
			}
		}
		
		const inputImage = document.getElementById("reviewimg");
		inputImage.addEventListener("change", e => {
			readImage(e.target);
		});
	
		var rvcode = "";
		var rvsub = "";
		/* 신고 사유 textarea 끄고 켜는 함수 */
		function radiodisabled() {
			$("#reportSubject").attr("disabled", true);
			$("#reportSubject").val("");
		}

		function radioactive() {
			$("#reportSubject").attr("disabled", false);
		}
		
		function disradio() {
			$("input:radio[name='reportType']").prop("checked", false);
			console.log("disradio");
		}
		/* 신고 사유 textarea 끄고 켜는 함수 */
		
		/* 리뷰 삭제 기능 test 함수 */
		$(document).ready(function () {
			$("#deleteReviewModal").on("show.bs.modal", function (event) {
				rvcode = $(event.relatedTarget).data("rvcode");
			});
			
			$("#updateReviewModal").on("show.bs.modal", function (event) {
				rvcode = $(event.relatedTarget).data("rvcode");
				rvsub = $(event.relatedTarget).data("rvsub");
				$("#hidden_revcode").val(rvcode);
				$("#modal_rev_sub").val(rvsub);			
			});
			
			$("#reportModal").on("show.bs.modal", function (event) {
				rere_code = $(event.relatedTarget).data("rere_code");
			});
		});
		
		function reportReview() {
			console.log(rere_code);
			var re_type = $('input[name="reportType"]:checked').val();
			console.log(re_type);
			var re_subject = $("#reportSubject").val();
			
						
			// reportcontroller
			$.ajax({
				url: "reportReview_comment.do",
				type:"post",
				data:{rere_code : rere_code,
					re_type : re_type,
					re_subject : re_subject},
				success: function() {
					console.log("신고함!");
					alert("신고하였습니다.");
				},
				error: function() {
					console.log("신고에러")
				}
			})
		}

		function deleteReview() {
			console.log(rvcode);
			var target = document.getElementById(rvcode);
			//arget.remove();
			
			target = document.getElementById(rvcode);
			
			var rev_code = rvcode.substr(7);
			console.log(rev_code);
			
			$.ajax({
				url:"deleteReview.do",
				type:"post",
				data:{rev_code:rev_code},
				success: function() {
					console.log("삭제함!");
					location.reload();
				},
				error: function() {
					console.log("에러");
				}
			})
		}
		/* 리뷰 삭제 기능 test 함수 */
	</script>
</body>

</html>