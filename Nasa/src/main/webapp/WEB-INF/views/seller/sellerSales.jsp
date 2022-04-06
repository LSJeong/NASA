<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.nice-select {
	width: 500px;
}

.fables-counter {
	position: relative;
	z-index: 1;
	color: #fff;
	text-align: center;
}

.fables-forth-text-color {
	color: #5C6A77;
}

.fables-second-border-color {
	border-color: #E54D42 !important;
}

.font-40 {
	font-size: 40px;
}
hr{
 	border-bottom : 1px solid #d5c9ea !important;
   	margin: 10px !important;
}
.sales{
	color : red;
	font-size: 13px;
}
.table-primary{
	background-color: #d5c9ea !important;
}
.genric-btn.danger-border:hover {
	background-color: #d5c9ea !important;
	color: white !important;
	border: 1px solid #d5c9ea !important;
}
.genric-btn.danger-border{
	background-color: white;
	color:#9e68ff !important;
	border: 1px solid #9e68ff !important;
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
						<h2>매출 확인</h2>
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
										<p style="font-weight: bold;">매출 확인</p>
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
									<h3>매출 확인</h3>
								</a>
								<hr class="hr"/>
								<div class="blog_details">
												<table class="table caption-top table-bordered  text-center">
													<tbody>
														<tr>
															<th class="align-middle table-primary">서비스 선택</th>
															<td><select name="service" id="service">
																<c:forEach items="${serviceList }" var="service">
																	<option value="${service.ser_code }">${service.ser_title }</option>
																</c:forEach>
															</select></td>

														</tr>
														<tr>
															<th class="align-middle table-primary">연도 선택</th>
															<td style="text-align: left;"><select name="chart" id="chart">
																	<option value="2022">2022년</option>
																	<option value="2021">2021년</option>
																	<option value="2020">2020년</option>
															</select><br />
															</td>
														</tr>
													</tbody>
												</table>


												<div class="d-flex justify-content-end my-4">
													<button class="genric-btn danger-border circle" onclick="changeChart()">검색</button>
												</div>
											
										
								

									<c:if test="${empty serviceList }">
										<img src="resources/user/assets/img/nodata.jpg" style="width: 100%; height: 100%">
									</c:if>
									<c:if test="${not empty serviceList }">
									<div style="margin-top: 40px;">
										<div class="card">
											<div class="card-body" id="myChartContainer">
												<h4 class="card-title"></h4>
												<div style="width: 100%;">
													<canvas id="myChart"></canvas>
													<br /><br />
													<span class="sales">* 판매금액 및 수수료는 구매자가 구매확정한 거래에 대해서만 합산됩니다.</span>
													<table class="table table-bordered thead-light  text-center">
													<thead>
														<tr>
															<th></th>
															<th colspan="4" class="table-primary">판매수량(건)</th>
															<th colspan="4" class="table-primary">판매금액(원)</th>
															<th colspan="4" class="table-primary">판매수수료(원)</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="table-active">1월</td>
															<td class="count1" colspan="4"></td>
															<td id="sum1" colspan="4"></td>
															<td id="susu1" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">2월</td>
															<td class="count2" colspan="4"></td>
															<td id="sum2" colspan="4"></td>
															<td id="susu2" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">3월</td>
															<td class="count3" colspan="4"></td>
															<td id="sum3" colspan="4"></td>
															<td id="susu3" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">4월</td>
															<td class="count4" colspan="4"></td>
															<td id="sum4" colspan="4"></td>
															<td id="susu4" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">5월</td>
															<td class="count5" colspan="4"></td>
															<td id="sum5" colspan="4"></td>
															<td id="susu5" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">6월</td>
															<td class="count6" colspan="4"></td>
															<td id="sum6" colspan="4"></td>
															<td id="susu6" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">7월</td>
															<td class="count7" colspan="4"></td>
															<td id="sum7" colspan="4"></td>
															<td id="susu7" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">8월</td>
															<td class="count8" colspan="4"></td>
															<td id="sum8" colspan="4"></td>
															<td id="susu8" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">9월</td>
															<td class="count9" colspan="4"></td>
															<td id="sum9" colspan="4"></td>
															<td id="susu9" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">10월</td>
															<td class="count10" colspan="4"></td>
															<td id="sum10" colspan="4"></td>
															<td id="susu10" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">11월</td>
															<td class="count11" colspan="4"></td>
															<td id="sum11" colspan="4"></td>
															<td id="susu11" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">12월</td>
															<td class="count12" colspan="4"></td>
															<td id="sum12" colspan="4"></td>
															<td id="susu12" colspan="4"></td>
														</tr>
														<tr>
															<td class="table-active">총 합</td>
															<td class="totalcount" colspan="4"></td>
															<td class="totalsum" colspan="4"></td>
															<td class="totalsusu" colspan="4"></td>
														</tr>
													</tbody>
												</table> 
												</div>
											</div>
										</div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript">
		var myChart;
		createChart();
		
		
		function changeChart() {
			createChart();
		}
		
		
		/* function createChart() {
			if (myChart != null) {
				myChart.destory();
			}

		} */

		function createChart() {
			if (myChart != null) {
				myChart.destory();
			}
			/* $("#myChart").remove(); */
			$("#myChartContainer").append('<canvas id="myChart"></canvas>');
			var ctx = $("#myChart");
			var context = document.getElementById('myChart').getContext('2d');
		
			var myChart = new Chart(ctx, {
			type: 'bar', // 차트의 형태
			data: { // 차트에 들어갈 데이터
				//x 축
				labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				datasets: [{ //데이터
					label: '매출', //차트 제목
					fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data: testFnc(), //x축 label에 대응되는 데이터 값

					backgroundColor: [
						//색상
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						//경계선 색상
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)',
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1 //경계선 굵기
				}, { //데이터
					label: '수수료', //차트 제목
					fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data: testFnc02(), //x축 label에 대응되는 데이터 값

					backgroundColor: [
						//색상
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						//경계선 색상
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)',
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1 //경계선 굵기
				}]
			},
			options: {
				
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});
			
			var temp = $("select[name='service'] option:Selected").val();
			var temp2 = $("select[name='chart'] option:Selected").val();
			
			$.ajax({
				url: "sellerajaxcountService.do",
				dataType: "json",
				type: "POST",
				data: {scode:temp, year:temp2},
				success: function (data) {
					document.querySelector(".count1").innerText = data[0];
					document.querySelector(".count2").innerText = data[1];
					document.querySelector(".count3").innerText = data[2];
					document.querySelector(".count4").innerText = data[3];
					document.querySelector(".count5").innerText = data[4];
					document.querySelector(".count6").innerText = data[5];
					document.querySelector(".count7").innerText = data[6];
					document.querySelector(".count8").innerText = data[7];
					document.querySelector(".count9").innerText = data[8];
					document.querySelector(".count10").innerText = data[9];
					document.querySelector(".count11").innerText = data[10];
					document.querySelector(".count12").innerText = data[11];
				},
				error: function (data) {
					console.log(data);
				}
			})
			
			$.ajax({
				url: "sellerTotalservice.do",
				dataType: "json",
				type: "POST",
				data: {scode:temp, year:temp2},
				success: function (data) {
					document.querySelector(".totalcount").innerText = data.totalcount;
				},
				error: function (data) {
					console.log(data);
				}
			})
			
			$.ajax({
				url: "sellerTotalservice2.do",
				dataType: "json",
				type: "POST",
				data: {scode:temp, year:temp2},
				success: function (data) {
					document.querySelector(".totalsum").innerText = data.totalsum.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					document.querySelector(".totalsusu").innerText = data.totalsusu.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					
				},
				error: function (data) {
					console.log(data);
				}
			})
				
		}
		//차트 데이터 추가
		function testFnc() {
			var list = [];
			var temp = $("select[name='service'] option:Selected").val();
			var temp2 = $("select[name='chart'] option:Selected").val();
	    	$.ajax({
	    			url: "sellerSalesData.do",
	    			data : {scode:temp, pay_enddate:temp2},
	    			type : "post",
	    			async : false,
	    			dataType : "json",
	    			success: function (datas) {
	    				for(data of Object.keys(datas)){
	    					list.push(datas[data]);
	    				}
	    			}
	    		});	
	    		console.log("list = " + list);
	    		document.querySelector("#sum1").innerHTML = list[0].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum2").innerHTML = list[1].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum3").innerHTML = list[2].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum4").innerHTML = list[3].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum5").innerHTML = list[4].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum6").innerHTML = list[5].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum7").innerHTML = list[6].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum8").innerHTML = list[7].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum9").innerHTML = list[8].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum10").innerHTML = list[9].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum11").innerHTML = list[10].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				document.querySelector("#sum12").innerHTML = list[11].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
	    		return list;
			
		}
		//수수료 계산
		function testFnc02() {
			
			var list2 = [];
			var temp = $("select[name='service'] option:Selected").val();
			var temp2 = $("select[name='chart'] option:Selected").val();
			$.ajax({
    			url: "sellerCommData.do",
    			data : {scode:temp, pay_enddate:temp2},
    			type : "post",
    			async : false,
    			dataType : "json",
    			success: function (datas) {
    				for(data of Object.keys(datas)){
    					list2.push(datas[data]);
    				}
    				
    			}
    		});	
			console.log("list2 = " + list2);
			
			document.querySelector("#susu1").innerHTML = list2[0].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu2").innerHTML = list2[1].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu3").innerHTML = list2[2].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu4").innerHTML = list2[3].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu5").innerHTML = list2[4].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu6").innerHTML = list2[5].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu7").innerHTML = list2[6].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu8").innerHTML = list2[7].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu9").innerHTML = list2[8].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu10").innerHTML = list2[9].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu11").innerHTML = list2[10].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			document.querySelector("#susu12").innerHTML = list2[11].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			
			return list2;
		}
	
	
	</script>
</body>
</html>