<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.pageClick {
			font-weight: 900;
		}

		tr:hover {
			background-color: rgb(206, 206, 206);
		}
	</style>
	<link rel="stylesheet" href="resources/user/assets/css/buyHistoryCard.css">
</head>

<body>

<!-- Hero Start-->
<div class="hero-area2short  slider-height2 hero-overly2 d-flex align-items-center ">
</div>
<!--Hero End -->
<!-- buyHistory main start  -->
<section class="blog_area section-padding">
	<div class="container">
		<div class="row">
			<div class="col-3">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget post_category_widget">
						<h4 class="widget_title">MENU</h4>
						<ul class="list cat-list">
							<li>
								<a href="buyHistory.do" class="d-flex">
									<p style="font-weight: bold;">구매내역</p>
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
			<div class="col-9">				
				<div class="blog_left_sidebar">					
					<div class="blog_details">
					<a class="d-inline-block">
                    	<h2>구매내역</h2>
                  	</a>
						<div class="blog-card">
							<div class="meta">
								<c:choose>
									<c:when test="${buyerinfo.b_rank  eq '1'}">
										<div class="photo" style="background-image: url(resources/user/assets/img/grade/star.png)"></div>
									</c:when>
									<c:when test="${buyerinfo.b_rank  eq '2'}">
										<div class="photo" style="background-image: url(resources/user/assets/img/grade/moon.png)"></div>
									</c:when>
									<c:when test="${buyerinfo.b_rank  eq '3'}">
										<div class="photo" style="background-image: url(resources/user/assets/img/grade/sun.png)"></div>
									</c:when>
									<c:when test="${buyerinfo.b_rank  eq '4'}">
										<div class="photo" style="background-image: url(resources/user/assets/img/grade/earth.png)"></div>
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
								<ul class="details">
									<c:choose>
										<c:when test="${buyerinfo.b_rank  eq '1'}">
											<li>별 등급</li>
											<li>2% 할인 혜택</li>
										</c:when>
										<c:when test="${buyerinfo.b_rank  eq '2'}">
											<li>달 등급</li>
											<li>5% 할인 혜택</li>
										</c:when>
										<c:when test="${buyerinfo.b_rank  eq '3'}">
											<li>태양 등급</li>
											<li>7% 할인 혜택</li>
										</c:when>
										<c:when test="${buyerinfo.b_rank  eq '4'}">
											<li>지구 등급</li>
											<li>10% 할인 혜택</li>
										</c:when>
									</c:choose>
								</ul>
							</div>
							<div class="description">
								<c:choose>
									<c:when test="${buyerinfo.b_rank  eq '1'}">
										<h1>별 등급</h1>
										<h2>STAR GRADE</h2>
									</c:when>
									<c:when test="${buyerinfo.b_rank  eq '2'}">
										<h1>달 등급</h1>
										<h2>MOON GRADE</h2>
									</c:when>
									<c:when test="${buyerinfo.b_rank  eq '3'}">
										<h1>태양 등급</h1>
										<h2>SUN GRADE</h2>
									</c:when>
									<c:when test="${buyerinfo.b_rank  eq '4'}">
										<h1>지구 등급</h1>
										<h2>EARTH GRADE</h2>
									</c:when>
								</c:choose>
								<p>
									<br>현재 누적 금액 ${paysum }원<br>다음 등급 까지 ${upgrademoney }
								</p>
							</div>
						</div>
						<br>
						<br>
						<div><p style="margin-bottom : 5px;">*검색 기준 : 결제일</p></div>
						<div class="row justify-content-center">
							<button class="genric-btn primary-border small" onclick="location.href = 'buyHistory.do'">전체</button>							
							<button class="genric-btn primary-border small" style="margin-left: 5px;" onclick="location.href = 'monthSearch.do'">1개월</button>
							<button class="genric-btn primary-border small" style="margin-left: 5px;" onclick="location.href = 'sixmonthSearch.do'">6개월</button>
							<button class="genric-btn primary-border small" style="margin-left: 5px;" onclick="location.href = 'yearSearch.do'">1년</button>
							<form action="selectdateSearch.do" method="get" onsubmit="return selectdate()">
								<input id="firstDate" name="firstDate" type="date" style="margin-left: 10px; margin-bottom: 5px;">&nbsp;~&nbsp;<input id="secondDate" name="secondDate" type="date"> 
								<button type="submit" class="genric-btn danger">검색</button>
							</form>
						</div>
						<div class="row justify-content-center" style="margin-top: 10px;">
							<table id="paymentTable" class="table" style="width: 100%; text-align: center;">
								<thead>
									<tr>
										<th scope="col">결제일</th>
										<th scope="col">판매자</th>
										<th scope="col">거래기간</th>
										<th scope="col">금액</th>
										<th scope="col">진행상황</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${fn:length(paymentList) == 0}">
										<tr>
											<td colspan="5">결제한 서비스가 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach items="${paymentList }" var="payment">
										<tr onclick="location.href='serviceDetail.do?ser_code=${payment.s_code}'" data-toggle="tooltip" data-placement="top" title="구매한 서비스로 이동" style="cursor: pointer;">
											<td class="paymentdate">${fn:substring(payment.pay_date,0,10) }</td>
											<td>${payment.s_email }</td>
											<td>
												<c:choose>
													<c:when test="${empty payment.pay_enddate }">
														${fn:substring(payment.pay_date,0,10) } ~
													</c:when>
													<c:otherwise>
														${fn:substring(payment.pay_date,0,10) } ~ ${fn:substring(payment.pay_enddate,0,10) }
													</c:otherwise>
												</c:choose>
											</td>
											<td><fmt:formatNumber value="${payment.pay_price }" pattern="###,###"/></td>
											<td onclick = "event.cancelBubble = true;">
												<c:choose>
													<c:when test="${payment.event_end eq 'notend'}">
														<button class = "genric-btn primary-border small" onclick="paycomplete('${payment.pay_code}')">구매확정</button>
													</c:when>
													<c:when test="${empty payment.pay_enddate }">
														거래중
													</c:when>
													<c:otherwise>
														거래완료
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
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
					
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	function paycomplete(code){
		$.ajax({
			url:"paycomplete.do",
			type : "GET",
			data : {pay_code : code},
			success : function() {
				location.reload();
			}
		})
	}
	function selectdate() {
		var firstDate = $("#firstDate").val();
		var secondDate = $("#secondDate").val();
		console.log(firstDate);
		console.log(secondDate);
		
		// 직접 날짜 설정하는 input에서 설정 안해줬을 때 알리기
		if(firstDate == "") {
			window.alert("시작 날짜를 설정해주세요!");
			return false;
		} else if(secondDate == "") {
			window.alert("종료 날짜를 설정해 주세요!");
			return false;
		} else if(firstDate > secondDate) {
			window.alert("날짜를 올바르게 설정해주세요!");
			return false;
		}
	}

	// pagination
	
	 /* $(document).ready(function(){
		 var alltr = $("#paymentTable > tbody > tr").length;
		 var pagesize = 0;
		 var onepagesize = 10;
		 if (alltr % onepagesize == 0) {
			 pagesize = alltr / onepagesize;
		 } else if (alltr % onepagesize > 0) {
			 pagesize = alltr / onepagesize;
			 pagesize++;
			 pagesize = Math.floor(pagesize++);
		 }
		 
		 
		 //$(".pagination").append("<li class='page-item'><a class='page-link'>Prev</a></li>");
		 
		 for(var i = 1; i<= pagesize; i++) {
			 $(".pagination").append("<li class='page-item'><a class='page-link' onclick='movepage(this)'>" + i + "</a></li>")
		 }
		 
		 //$(".pagination").append("<li class='page-item'><a class='page-link'>Next</a></li>");
		 
		 $("#paymentTable > tbody > tr").hide();
		 
 		 for(var i = 1; i <= onepagesize; i++) {
			 $("#paymentTable > tbody > tr:nth-child("+i+")").show();
		 }
		 
      });
	
	function movepage(event) {
		$(".pageClick").removeClass("pageClick");
		$("#paymentTable > tbody > tr").hide();
		$(event).addClass("pageClick");
		console.log($(event).text());
		var pagingnum = $(event).text();
		var pagenumber = $(event).text() * 10;
		console.log(pagenumber);
		
		for(var i = pagenumber - 9; i <= pagenumber; i++) {
			$("#paymentTable > tbody > tr:nth-child("+i+")").show();
		}
	}
	
	//pagination

	// 1개월 거래내역 검색
	function oneMonthSearch() {
		$("#paymentTable > tbody > tr").removeAttr('class');
		$("#paymentTable > tbody > tr").hide();
		var now = new Date(); // 오늘 날짜
		var oneMonthAgo = new Date(now.setMonth(now.getMonth() - 1)); // 한달 전 날짜 구하기
		
		for (var i = 0; i  < $(".paymentdate").length; i++) {
			var paymentDate = new Date($($(".paymentdate")[i]).html());
			
			if (paymentDate >= oneMonthAgo) {
				//$($('#paymentTable > tbody > tr')[i]).removeAttr('style');
				$($('#paymentTable > tbody > tr')[i]).attr('class', 'onem');
			}
		}
		
		var onemtr = $(".onem").length;
		console.log("onem size : " + onemtr)
	 	var pagesize = 0;
	 	var onepagesize = 10;
	 	
	 	if (onemtr % 10 == 0) {
			 pagesize = onemtr / onepagesize;
	 	} else if (onemtr % onepagesize > 0) {
			 pagesize = onemtr / onepagesize;
			 pagesize++;
			 pagesize = Math.floor(pagesize++);
	 	}
	 	
	 	$(".pagination").children().remove();
	 	//$(".pagination").append("<li class='page-item'><a class='page-link'>Prev</a></li>");
		 
		for(var i = 1; i<= pagesize; i++) {
			$(".pagination").append("<li class='page-item'><a class='page-link' onclick='movepageonem(this)'>" + i + "</a></li>")
		}
		 
		//$(".pagination").append("<li class='page-item'><a class='page-link'>Next</a></li>");
		 
		$("#paymentTable > tbody > tr").hide();
		 
		for(var i = 0; i <= onepagesize; i++) {
			 $($(".onem")[i]).show();
		}
	}
	
	function movepageonem(event) {
		$("#paymentTable > tbody > tr").hide();
		console.log($(event).text());
		var pagingnum = $(event).text();
		var pagenumber = $(event).text() * 10;
		console.log(pagenumber);
		
		for(var i = pagenumber - 10; i < pagenumber; i++) {
			$($(".onem")[i]).show();
		}
	}
	
	function sixMonthSearch() {
		$("#paymentTable > tbody > tr").removeAttr('class');
		$("#paymentTable > tbody > tr").hide();
		var now = new Date(); // 오늘 날짜
		var sixMonthAgo = new Date(now.setMonth(now.getMonth() - 6)); // 6달 전 날짜 구하기
		
		for (var i = 0; i  < $(".paymentdate").length; i++) {
			var paymentDate = new Date($($(".paymentdate")[i]).html());
			
			if (paymentDate >= sixMonthAgo) {
				//$($('#paymentTable > tbody > tr')[i]).removeAttr('style');
				$($('#paymentTable > tbody > tr')[i]).attr('class', 'sixm');
			}
		}
		
		var sixmtr = $(".sixm").length;
		console.log("sixm size : " + sixmtr)
	 	var pagesize = 0;
	 	var onepagesize = 10;
	 	
	 	if (sixmtr % 10 == 0) {
			 pagesize = sixmtr / onepagesize;
	 	} else if (sixmtr % onepagesize > 0) {
			 pagesize = sixmtr / onepagesize;
			 pagesize++;
			 pagesize = Math.floor(pagesize++);
	 	}
	 	
	 	$(".pagination").children().remove();
	 	//$(".pagination").append("<li class='page-item'><a class='page-link'>Prev</a></li>");
		 
		for(var i = 1; i<= pagesize; i++) {
			$(".pagination").append("<li class='page-item'><a class='page-link' onclick='movepagesixm(this)'>" + i + "</a></li>")
		}
		 
		//$(".pagination").append("<li class='page-item'><a class='page-link'>Next</a></li>");
		 
		$("#paymentTable > tbody > tr").hide();
		 
		for(var i = 0; i <= onepagesize; i++) {
			 $($(".sixm")[i]).show();
		}
	}
	
	function movepagesixm(event) {
		$("#paymentTable > tbody > tr").hide();
		console.log($(event).text());
		var pagingnum = $(event).text();
		var pagenumber = $(event).text() * 10;
		console.log(pagenumber);
		
		for(var i = pagenumber - 10; i < pagenumber; i++) {
			$($(".sixm")[i]).show();
		}
	}
	
	function oneYearSearch() {
		$("#paymentTable > tbody > tr").removeAttr('class');
		$("#paymentTable > tbody > tr").hide();
		var now = new Date(); // 오늘 날짜
		var oneYearAgo = new Date(now.setMonth(now.getMonth() - 12)); // 12달 전 날짜 구하기
		
		for (var i = 0; i  < $(".paymentdate").length; i++) {
			var paymentDate = new Date($($(".paymentdate")[i]).html());
			
			if (paymentDate >= oneYearAgo) {
				//$($('#paymentTable > tbody > tr')[i]).removeAttr('style');
				$($('#paymentTable > tbody > tr')[i]).attr('class', 'oney');
			}
		}
		
		var oneytr = $(".oney").length;
		console.log("oney size : " + oneytr)
	 	var pagesize = 0;
	 	var onepagesize = 10;
	 	
	 	if (oneytr % 10 == 0) {
			 pagesize = oneytr / onepagesize;
	 	} else if (oneytr % onepagesize > 0) {
			 pagesize = oneytr / onepagesize;
			 pagesize++;
			 pagesize = Math.floor(pagesize++);
	 	}
	 	
	 	$(".pagination").children().remove();
	 	//$(".pagination").append("<li class='page-item'><a class='page-link'>Prev</a></li>");
		 
		for(var i = 1; i<= pagesize; i++) {
			$(".pagination").append("<li class='page-item'><a class='page-link' onclick='movepageoney(this)'>" + i + "</a></li>")
		}
		 
		//$(".pagination").append("<li class='page-item'><a class='page-link'>Next</a></li>");
		 
		$("#paymentTable > tbody > tr").hide();
		 
		for(var i = 0; i <= onepagesize; i++) {
			 $($(".oney")[i]).show();
		}
	}
	
	function movepageoney(event) {
		$("#paymentTable > tbody > tr").hide();
		console.log($(event).text());
		var pagingnum = $(event).text();
		var pagenumber = $(event).text() * 10;
		console.log(pagenumber);
		
		for(var i = pagenumber - 10; i < pagenumber; i++) {
			$($(".oney")[i]).show();
		}
	}
	
	function selectDateSearch() {
		$("#paymentTable > tbody > tr").removeAttr('class');
		var firstDate = $("#firstDate").val();
		var secondDate = $("#secondDate").val();
		console.log(firstDate);
		console.log(secondDate);
		
		// 직접 날짜 설정하는 input에서 설정 안해줬을 때 알리기
		if(firstDate == "") {
			window.alert("날짜를 설정해주세요!");
			return;
		} else if(secondDate == "") {
			window.alert("날짜를 설정해 주세요!");
			return;
		} else if(firstDate > secondDate) {
			window.alert("날짜를 올바르게 설정해주세요!");
			return;
		}
		
		// 일단 tr들 모두 display:none
		$("#paymentTable > tbody > tr").hide();
		
		// input type date 에 설정한 날짜 사이의 date를 가진 db 자료만 선별해서 display:none 이 돼있는 attribute를 지워주기
		for (var i = 0; i  < $(".paymentdate").length; i++) {
			var paymentDate = new Date($($(".paymentdate")[i]).html());
			var first = new Date(firstDate);
			var second = new Date(secondDate);
			
			if (paymentDate >= first && paymentDate <= second) {
				// $($('#paymentTable > tbody > tr')[i]).removeAttr('style');
				$($('#paymentTable > tbody > tr')[i]).attr('class', 'btwd');
			}
		}
		
		var btwdtr = $(".btwd").length;
		console.log("btwd size : " + btwdtr)
	 	var pagesize = 0;
	 	var onepagesize = 10;
	 	
	 	if (btwdtr % 10 == 0) {
			 pagesize = btwdtr / onepagesize;
	 	} else if (btwdtr % onepagesize > 0) {
			 pagesize = btwdtr / onepagesize;
			 pagesize++;
			 pagesize = Math.floor(pagesize++);
	 	}
	 	
	 	$(".pagination").children().remove();
	 	//$(".pagination").append("<li class='page-item'><a class='page-link'>Prev</a></li>");
		 
		for(var i = 1; i<= pagesize; i++) {
			$(".pagination").append("<li class='page-item'><a class='page-link' onclick='movepagebtwdtr(this)'>" + i + "</a></li>")
		}
		 
		//$(".pagination").append("<li class='page-item'><a class='page-link'>Next</a></li>");
		 
		$("#paymentTable > tbody > tr").hide();
		 
		for(var i = 0; i <= onepagesize; i++) {
			 $($(".btwd")[i]).show();
		}
		
	}
	
	function movepagebtwdtr(event) {
		$("#paymentTable > tbody > tr").hide();
		console.log($(event).text());
		var pagingnum = $(event).text();
		var pagenumber = $(event).text() * 10;
		console.log(pagenumber);
		
		for(var i = pagenumber - 10; i < pagenumber; i++) {
			$($(".btwd")[i]).show();
		}
	} */
</script>
</body>
</html>