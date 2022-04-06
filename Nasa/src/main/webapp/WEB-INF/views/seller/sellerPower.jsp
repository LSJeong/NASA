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
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.hr{
 	background-color : #d5c9ea !important;
   	margin: 10px !important;
}
.table thead th{
	background-color : #e0d6f2 !important;
}
.powertb td {
	width: 120px;
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
.nice-select{
	width: 350px;
}
.price{
	width: 124px;
	text-align: right;
}
</style>
</head>
<body>
	<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>파워서비스 내역</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
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
										<p style="font-weight: bold;">파워서비스 내역</p>
								</a></li>
								<li><a href="sellerCalendar.do" class="d-flex">
										<p>일정 관리</p>
								</a></li>
								<li><a href="sellerReview.do?scode=0" class="d-flex">
										<p>리뷰 관리</p>
								</a></li>
								<li><a href="sellerPayment.do" class="d-flex">
										<p >결제 조회</p>
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
										<h3>파워서비스 내역</h3>
									</a>
									<button class="genric-btn danger circle" data-toggle="modal"
									data-target="#PowerModal">파워서비스 등록</button> 
								<hr class="hr"/>
								<div class="blog_details">
								<c:if test="${empty powerList }">
									<img src="resources/user/assets/img/nodata.jpg" style="width: 100%; height: 100%">
								</c:if>
								<c:if test="${not empty powerList }">
								<table class="table caption-top table-bordered thead-light  text-center" style="margin-top:40px;">
									<thead class="thead-light">
										<tr>
											<th>결제일</th>
											<th>서비스코드</th>
											<th>서비스명</th>
											<th>시작일</th>
											<th>종료일</th>
											<th>가격</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
									
									
									<c:forEach items="${powerList }" var="power">
										<tr style="font-size:12px;">
											<td>${fn:substring(power.power_date,0,11) }</td>
											<td>s${power.ser_code }</td>
											<td>${power.ser_title }</td>
											<td>${fn:substring(power.power_start,0,11) }</td>
											<td>${fn:substring(power.power_end,0,11) }</td>
											<td><fmt:formatNumber value="${power.power_price }" pattern="###,###"/>원</td>
											<c:if test="${fn:substring(power.power_start,0,10) <= today && fn:substring(power.power_end,0,10) >= today}">
												<td>제공 중</td>
											</c:if>
											<c:if test="${fn:substring(power.power_start,0,10) > today }">
												<td>제공예정</td>
											</c:if>
											<c:if test="${fn:substring(power.power_start,0,10) < today && fn:substring(power.power_end,0,10) < today}">
												<td>제공완료</td>
											</c:if>
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
	
	<div class="modal fade" id="PowerModal" tabindex="-1" role="dialog"
		aria-labelledby="PowerModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"
						style="text-align: center;">파워서비스 신청</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="frm" action="powerserviceInsert.do" method="post">
					<div class="modal-body">
						<p>
							파워서비스란? <br /> 합리적 예산의 고효율형! <br /> 당신의 서비스를 메인 화면에 노출을 기대할 수
							있습니다. <br /> 저렴한 비용으로 상위 노출을 원하시는 분들에게 추천합니다.
						</p>
						<p class="powerp">
							*희망시작일로부터 일주일간 제공됩니다. <br /> *최종 결제 후 환불 불가합니다.<br /> <br />
						</p>

						<table class="powertb">
							<tr>
								<td>서비스선택</td>
								<td><div class="default-select" id="default-select">
										<select id="powerS"  name="ser_code" >
											<c:forEach items="${sellerMainServiceList }" var="service">
											<c:if test="${service.ser_status eq 'N'}">
												<option value="${service.ser_code }">${service.ser_title}</option>
												
											</c:if>
											</c:forEach>
										</select>
									</div>
									<c:forEach items="${sellerMainServiceList }" var="service">
										<c:if test="${service.ser_status eq 'N'}">
											<input type="hidden" id="${service.ser_code }" value="${fn:substring(service.ser_end,0,10) }">
										</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td>희망시작일</td>
								<td><input type="date" name="power_start" id="powerdate" min="" max="" step="7"></td>
							</tr>
							<tr>
								<td>비용</td>
								<td><input type="text" class="price" value="<fmt:formatNumber value="500000" pattern="###,###"/>"  disabled>
								<input type="hidden" name="power_price" value="500000">
								
								</td>
							</tr>
						</table>

					</div>
					<div class="modal-footer">
						<a href="#" class="genric-btn primary  radius powerbtn"
							id="check_module" data-toggle="modal">결제</a> <a href="#"
							class="genric-btn primary  radius powerbtn" data-dismiss="modal">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
            
     <script>
     $(function() { // actvie 활성화 
			
			var paramDate = new Date();
			var day = paramDate.getDay();
			var diff = paramDate.getDate() - day + (day == 0 ? -6 : 1);
			var mon = new Date(paramDate.setDate(diff)).toISOString().substring(0, 10);
			$("#powerdate").attr('min', mon);
		});
     
     $("#check_module").click(
 			
 			function() {
 				if($("#powerdate").val() == ''){
 					alert('시작일을 선택해주세요.');
 					return;
 				}
 				//파워서비스 시작일
 				var powerstart= $("#powerdate").val();
 				
 				var powerno = $("#powerS option:selected").val();
 				//서비스 종료예정일
 				var powerend = document.getElementById(powerno).value;
 				
 				//파워서비스 종료일
 				var paramDate = new Date($("#powerdate").val());
 				var day = paramDate.getDay();
 				var diff = paramDate.getDate()+6;
 				var dateString = new Date(paramDate.setDate(diff)).toISOString().substring(0, 10);
 				
 				if(powerend !='' && powerend < dateString){
 					alert('서비스 종료 예정일 : '+powerend+'\n파워 서비스 종료일 : '+dateString+'\n서비스 종료 예정일이 파워서비스 종료일보다 빠릅니다.');
 					return;
 				}
 				
 				$.ajax({
 					url: "powerServiceCount.do",
 					data: {power_start : powerstart, ser_code : powerno},
 					dataType: "text",
 					type:"post",
 					success: function(result){
 						if(result == 'full'){
 							alert('정원이 다 찼습니다. 다른 날짜를 선택해주세요.');
 							return;
 						}else if(result == 'overlap'){
 							alert('이미 해당날짜에 등록되어있습니다.');
 							return;
 						}else{

 							var IMP = window.IMP; // 생략가능
 							IMP.init('imp49718054');
 							// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
 							// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
 							IMP.request_pay({
 								pg : 'inicis', // version 1.1.0부터 지원.
 								/*
 								'kakao':카카오페이,
 								html5_inicis':이니시스(웹표준결제)
 								'nice':나이스페이
 								'jtnet':제이티넷
 								'uplus':LG유플러스
 								'danal':다날
 								'payco':페이코
 								'syrup':시럽페이
 								'paypal':페이팔
 								 */
 								pay_method : 'card',
 								/*
 								'samsung':삼성페이,
 								'card':신용카드,
 								'trans':실시간계좌이체,
 								'vbank':가상계좌,
 								'phone':휴대폰소액결제
 								 */
 								merchant_uid : 'merchant_'
 										+ new Date().getTime(),
 								/*
 								merchant_uid에 경우
 								https://docs.iamport.kr/implementation/payment
 								위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
 								참고하세요.
 								나중에 포스팅 해볼게요.
 								 */
 								name : '주문명:파워서비스 결제',
 								//결제창에서 보여질 이름
 								amount : 100,
 								//가격
 								//bank_name : null,
 								buyer_email : 'iamport@siot.do',
 								buyer_name : '구매자이름',
 								buyer_tel : '010-1234-5678',
 								buyer_addr : '서울특별시 강남구 삼성동',
 								buyer_postcode : '123-456',
 								m_redirect_url : 'https://www.yourdomain.com/payments/complete',
 							/*
 							모바일 결제시,
 							결제가 끝나고 랜딩되는 URL을 지정
 							(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
 							 */
 							}, function(rsp) {
 								console.log(rsp);
 								if (rsp.success) {
 									//$("#or_uid").val(rsp.imp_uid);
 									$("#frm").submit();
 									var msg = '결제가 완료되었습니다.';
 									/* msg += '고유ID : '
 											+ rsp.imp_uid; */
 									/* msg += '상점 거래ID : ' + rsp.merchant_uid;
 									msg += '결제 금액 : ' + rsp.paid_amount;
 									msg += '카드 승인번호 : ' + rsp.apply_num; */
 								} else {
 									var msg = '결제에 실패하였습니다.';
 									/*msg += '에러내용 : ' + rsp.error_msg;
 									msg += 'ㅜㅜ' + rsp.amount;
 									msg += rsp.imp_uid; */
 								}
 								alert(msg);
 							});
 						}
 					},error: function(){
 						alert("일시적 오류로 실패하였습니다.");
 						return;
 					}
 				})
 			})
     </script>       
</body>
</html>