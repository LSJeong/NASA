<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>



<div class="page-breadcrumb">
	<div class="row">
		<div class="col-7 align-self-center">
			<div class="mb-3 ">
				<h6>
					<i class="fas fa-chart-line mr-1"></i>매출조회 <i class="fas fa-chevron-right mx-2"></i>카테고리별매출
				</h6>
			</div>
		</div>
	</div>
</div>


<!-- ============================================================== -->
<!-- End Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Container fluid  -->
<!-- ============================================================== -->
<div class="container-fluid">

	<!-- *************************************************************** -->
	<!-- Start First Cards -->
	<!-- *************************************************************** -->
	<!-- <select class="custom-select  form-control custom-shadow " name="chart" id="selectchart" size="1"
		style="width: 200px;">
		<option value="선택">선택</option>
		<c:forEach items="${names }" var="name">
			<option value="${name }">${name }
		</c:forEach>
	</select>
	<button type="button" class="chartbtn btn btn-outline-info" onclick="createChart()">확인</button> -->
<!-- 월별 -->
<ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#monthchart">월별매출</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#yearchart">연도별 매출</a>
    </li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane fade show active" id="monthchart">
        
	<div class="row my-5">
		<div class="col-lg-12">
			<h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">월별 매출 조회
			</h5>
			<div class="card">
				<div class="card-body">
					<h4 class="card-title"></h4>
					<div style="width: 100%;">
						<!--차트가 그려질 부분-->
						<canvas id="myChart"></canvas>
					</div>
					<table class="mt-4 table table-hover table-bordered thead-light  text-center">
						<thead>
							<tr>
								<th></th>
								<th class="table-active">1월</th>
								<th class="table-active">2월</th>
								<th class="table-active">3월</th>
								<th class="table-active">4월</th>
								<th class="table-active">5월</th>
								<th class="table-active">6월</th>
								<th class="table-active">7월</th>
								<th class="table-active">8월</th>
								<th class="table-active">9월</th>
								<th class="table-active">10월</th>
								<th class="table-active">11월</th>
								<th class="table-active">12월</th>
							</tr>
						</thead>
						<tbody>
							<tr class="totalsum">
								<td class="table-primary">누적판매수량</td>
								<td class="count1"></td>
								<td class="count2"></td>
								<td class="count3"></td>
								<td class="count4"></td>
								<td class="count5"></td>
								<td class="count6"></td>
								<td class="count7"></td>
								<td class="count8"></td>
								<td class="count9"></td>
								<td class="count10"></td>
								<td class="count11"></td>
								<td class="count12"></td>

							</tr>
							<tr>
								<td class="table-primary">누적판매금액</td>
								<td id="sum1"></td>
								<td id="sum2"></td>
								<td id="sum3"></td>
								<td id="sum4"></td>
								<td id="sum5"></td>
								<td id="sum6"></td>
								<td id="sum7"></td>
								<td id="sum8"></td>
								<td id="sum9"></td>
								<td id="sum10"></td>
								<td id="sum11"></td>
								<td id="sum12"></td>

							</tr>
							<tr>
								<td class="table-primary">누적판매수수료</td>
								<td id="susu1"></td>
								<td id="susu2"></td>
								<td id="susu3"></td>
								<td id="susu4"></td>
								<td id="susu5"></td>
								<td id="susu6"></td>
								<td id="susu7"></td>
								<td id="susu8"></td>
								<td id="susu9"></td>
								<td id="susu10"></td>
								<td id="susu11"></td>
								<td id="susu12"></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
    </div>
    <div class="tab-pane fade" id="yearchart">
        
	<div class="row my-5">
		<div class="col-lg-12">
			<h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">연별 매출 조회
			</h5>
			<div class="card">
				<div class="card-body">
					<h4 class="card-title"></h4>
					<canvas id="yearChart"></canvas>
					<table class="mt-4 table table-hover table-bordered thead-light  text-center">
						<thead>
							<tr>
								<th></th>
								<th class="table-active">2020년</th>
								<th class="table-active">2021년</th>
								<th class="table-active">2022년</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="350px" class="table-primary">누적판매수량</td>
								<td id="yearcount1"></td>
								<td id="yearcount2"></td>
								<td id="yearcount3"></td>

							</tr>
							<tr>
								<td class="table-primary">누적판매금액</td>
								<td id="yearseller1"></td>
								<td id="yearseller2"></td>
								<td id="yearseller3"></td>

							</tr>
							<tr>
								<td class="table-primary">누적판매수수료</td>
								<td id="yearsusu1"></td>
								<td id="yearsusu2"></td>
								<td id="yearsusu3"></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
    </div>
  </div>




	<script type="text/javascript">
		var myChart;
		createChart();

		function createChart() {
			if (myChart != null) {
				myChart.destory();
			}

		}


		var context = document.getElementById('myChart').getContext('2d');

		var myChart = new Chart(context, {
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

		//차트 데이터 추가


		function testFnc() {
			// var temp = $("select[name='chart'] option:Selected").val();

			// if ($("select[name='chart'] option:selected").val() == "선택") {
				var ret = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

				const url = "ajaxchartData.do";
				$.ajax({
						url,
						dataType: "json",
						async: false
					})
					.done(function (datas) {
						var sum = 0;
						for (let data of datas) {
							var month = data["pay_date"].substring(5).substring(0, 2);
							ret[month - 1] += parseInt(data["pay_price"]);
							sum += parseInt(data["pay_price"]);

						}

					})
				return ret;
			// }
		}
		//수수료 계산
		function testFnc02() {
			// var temp = $("select[name='chart'] option:Selected").val();

			// if ($("select[name='chart'] option:selected").val() == "선택") {
				var ret = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

				const url = "ajaxchartData.do";
				$.ajax({
						url,
						dataType: "json",
						async: false
					})
					.done(function (datas) {
						var sum = 0;
						for (let data of datas) {
							var month = data["pay_date"].substring(5).substring(0, 2);
							ret[month - 1] += parseInt(data["pay_price"]) * 0.1;
							sum += parseInt(data["pay_price"]);

						}

					})
				return ret;
			// }
		}
		//여기는 페이지가 그려주면서 ajax 동시에 시작
		window.addEventListener('load', function () {
			$.ajax({
				url: "ajaxsalesTable.do",
				dataType: "json",
				type: "POST",
				success: function (data) {
					document.querySelector("#sum1").innerHTML = data[0]
					document.querySelector("#sum2").innerHTML = data[1]
					document.querySelector("#sum3").innerHTML = data[2]
					document.querySelector("#sum4").innerHTML = data[3]
					document.querySelector("#sum5").innerHTML = data[4]
					document.querySelector("#sum6").innerHTML = data[5]
					document.querySelector("#sum7").innerHTML = data[6]
					document.querySelector("#sum8").innerHTML = data[7]
					document.querySelector("#sum9").innerHTML = data[8]
					document.querySelector("#sum10").innerHTML = data[9]
					document.querySelector("#sum11").innerHTML = data[10]
					document.querySelector("#sum12").innerHTML = data[11]

					//여기부터는 수수료 계산
					document.querySelector("#susu1").innerHTML = data[0] * 0.1;
					document.querySelector("#susu2").innerHTML = data[1] * 0.1;
					document.querySelector("#susu3").innerHTML = data[2] * 0.1;
					document.querySelector("#susu4").innerHTML = data[3] * 0.1;
					document.querySelector("#susu5").innerHTML = data[4] * 0.1;
					document.querySelector("#susu6").innerHTML = data[5] * 0.1;
					document.querySelector("#susu7").innerHTML = data[6] * 0.1;
					document.querySelector("#susu8").innerHTML = data[7] * 0.1;
					document.querySelector("#susu9").innerHTML = data[8] * 0.1;
					document.querySelector("#susu10").innerHTML = data[9] * 0.1;
					document.querySelector("#susu11").innerHTML = data[10] * 0.1;
					document.querySelector("#susu12").innerHTML = data[11] * 0.1;
				},
				error: function (data) {
					console.log(data);
				}
			})
			$.ajax({
				url: "ajaxcountService.do",
				dataType: "json",
				type: "POST",
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
				url: "selectYearchart.do",
				dataType: "json",
				type: "POST",
				success: function (data) {
					console.log(data);
					document.querySelector("#yearseller1").innerHTML = data[0];
					document.querySelector("#yearseller2").innerHTML = data[1];
					document.querySelector("#yearseller3").innerHTML = data[2];

					//연도별 수수료 계산
					document.querySelector("#yearsusu1").innerHTML = data[0] * 0.1;
					document.querySelector("#yearsusu2").innerHTML = data[1] * 0.1;
					document.querySelector("#yearsusu3").innerHTML = data[2] * 0.1;
				}
			})

			$.ajax({
				url: "countYearChart.do",
				dataType: "json",
				type: "POST",
				success: function (data) {
					console.log("카운트 data",data);
					document.querySelector("#yearcount1").innerHTML = data[0];
					document.querySelector("#yearcount2").innerHTML = data[1];
					document.querySelector("#yearcount3").innerHTML = data[2];
				}
			})


		})
		// /////////////////////////////////////////////// 연도별 차트 입력

		var context = document.getElementById('yearChart').getContext('2d');
		var myChart = new Chart(context, {
			type: 'bar', // 차트의 형태
			data: { // 차트에 들어갈 데이터
				labels: [
					//x 축
					'2020년', '2021년', '2022년'
				],
				datasets: [{ //데이터
						label: '연도별 차트', //차트 제목
						fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data: yearfunction(), //x축 label에 대응되는 데이터 값
						backgroundColor: [
							//색상
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
						],
						borderColor: [
							//경계선 색상
							'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)',
						],
						borderWidth: 1 //경계선 굵기
					}
					/* ,
					                        {
					                            label: 'test2',
					                            fill: false,
					                            data: [
					                                8, 34, 12, 24
					                            ],
					                            backgroundColor: 'rgb(157, 109, 12)',
					                            borderColor: 'rgb(157, 109, 12)'
					                        } */
				]
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

		var yearChart;
		createChart();

		function createChart() {
			if (yearChart != null) {
				yearChart.destory();
			}

		}

		function yearfunction() {
			// var temp = $("select[name='chart'] option:Selected").val();

			// if ($("select[name='chart'] option:selected").val() == "선택") {
				var ret = [0, 0, 0];

				const url = "ajaxyearChart.do"
				$.ajax(url, {
					dataType: "json",
					async: false
				}).done(function (datas) {
					var sum = 0;
					for (let data of datas) {
						var year = data["pay_date"].substring(2, 4);
                        console.log("year찍어보기" ,year)
						if (year == "20") {
							ret[0] += data["pay_price"];
						} else if (year == "21") {
							ret[1] += data["pay_price"];
						} else if (year == "22") {
							ret[2] += data["pay_price"];
						}
					}
				});
				return ret;
			// }
		}
	</script>







	<!--
	
	<script src="resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="resources/admin/assets/libs/raphael/raphael.min.js"></script>
	<script src="resources/admin/assets/libs/morris.js/morris.min.js"></script>
	<script src="resources/admin/dist/js/pages/morris/all-month-data.js"></script>
	<script src="resources/admin/dist/js/pages/morris/all-year-data.js"></script>
-->