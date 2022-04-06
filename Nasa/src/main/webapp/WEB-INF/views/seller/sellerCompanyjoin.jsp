<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<!-- Modal -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header tit-up">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body customer-box">
					<!-- Tab panes -->
					<div class="section-tittle text-center mb-80">
						<h1>이용약관</h1>
						<p>주식회사 나도 사장 이용 약관</p>
					</div>
					<div class="tab-content" style="padding: 30px;">
						<div>제 1 장 총칙</div>
						<br>
						<div>제 1 조 (목 적)</div>
						<br>
						<div>&nbsp;&nbsp;1. 이 약관은 이용자가 주식회사 브레이브모바일(이하 "회사")이 운영하는 인터넷 서비스 사이트(이하 "사이트" 또는 "NASA")를 통해
							제공하는 인터넷 전자상거래 관련 서비스(이하 "서비스")와 관련하여 회사와 이용자의 권리, 의무, 책임사항을 규정함을 목적으로 합니다.
							또한 본 약관은 유무선 PC통신, 태블릿 PC, 스마트폰(아이폰, 안드로이드폰 등) 어플리케이션 및 모바일웹 등을 이용하는 전자상거래 등에
							대해서도 그 성질에 반하지 않는 한 준용됩니다. 본 약관이 규정한 내용 이외의 회사와 이용자 간의 권리, 의무 및 책임사항에 관하여서는
							전기통신사업법 기타 대한민국의 관련 법령과 상관습에 의합니다.</div>
					</div>
					<div class="form-group mt-3 d-flex justify-content-center align-items-center">
						<div>
							<button type="button" class="genric-btn primary-border e-large" data-dismiss="modal"
								onclick="checkagree()">동의합니다.</button>&nbsp;&nbsp;&nbsp;
							<button type="button" class="genric-btn primary e-large" onclick="main()">동의하지
								않습니다.</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Hero Start-->
	<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>기업 판매자 회원가입</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Hero End -->

	<!-- ================ contact section start ================= -->

	<!-- 1단계 -->
	<div id="page1" class="container" style="margin-top: 60px; margin-bottom: 100px;">
		<div class="row d-flex justify-content-center align-items-center">
			<div class="col-5">
				<img class="position-relative" src="resources/user/assets/img/mainroket.png" alt="" style="top: 60px;">
				<div class="section-tittle text-center" style="margin-bottom: 70px;">
					<h1>사업자등록번호를<br>인증해주세요.</h1>
				</div>
				<form class="form-contact contact_form" id="bnumberform" method="POST">
					<div>
						<div>
							<div id="bnamediv" class="form-group">
								대표자 성명<input id="bname" class="form-control valid" type="text"
									placeholder="대표자 성명을 입력해주세요.">
							</div>
							<div id="bdatediv" class="form-group">
								개업일자<input id="bdate" class="form-control valid" type="text"
									placeholder="개업일자를 입력해주세요 'YYYYMMDD'.">
							</div>
							<div id="bchkdiv" class="form-group">
								사업자등록번호
								<input id="bnumber" class="form-control valid" type="number" placeholder="숫자만 입력">
								<button type="button" id="bChk" class="position-relative genric-btn primary radius"
								style="float: right; bottom: 45px;" onclick="testbt()">확인</button>
							</div>
						</div>
					</div>		
				</form>
			</div>
		</div>
		<div style="text-align: center;">
			<div style="margin: 30px;">
				<button type="button" class="genric-btn primary e-large" onclick="nextPage()">다음</button>
			</div>
			<div>
				<a href="sellerPersonjoin.do" style="color: #1f2b7b;">개인 판매자로 가입하시나요?</a>
			</div>					
		</div>
	</div>	
	
	<!-- 2단계 -->
	<div id="page2" class="container">
		<div class="row justify-content-center align-items-center" style="margin-top: 60px; margin-bottom: 100px;">
			<div class="col-5">
				<form class="form-contact contact_form" id="companyJoin-form" method="POST">
					<div>
						<div>
							<div id="namediv" class="form-group">
								이름<input class="form-control valid" name="s_name" id="s_name" type="text"
									placeholder="이름(실명)을 입력해주세요">
							</div>
							<div id="nickdiv" class="form-group">
								닉네임
								<input class="form-control valid" name="s_nickname" id="s_nickname"
									placeholder="사용할 닉네임을 입력해주세요">
								<input type="button" value="확인" id="nickCheckbtn"
									class="position-relative genric-btn primary radius" onclick="nicknameCheck()"
									style="float: right; bottom: 45px;">
							</div>
							<div id="emaildiv" class="form-group">
								이메일
								<input class="form-control valid" name="s_email" id="s_email" type="email"
									placeholder="example@nasa.com">
								<input type="button" value="전송" class="position-relative genric-btn primary radius"
									onclick="emailCheck()" style="float: right; bottom: 45px;">
							</div>
							<div id="emailchkdiv" class="form-group">
								이메일 인증
								<input disabled class="form-control valid" name="emailchk" id="emailchk"
									placeholder="인증코드를 확인해주세요">
								<input type="button" value="확인" class="position-relative genric-btn primary radius"
									onclick="emailSendCheck()" style="float: right; bottom: 45px;">
							</div>
							<div id="pwdiv" class="form-group">
								비밀번호
								<input class="form-control valid" name="s_password" id="s_password" type="password"
									placeholder="영문+숫자 조합 8자리 이상 입력해주세요">
							</div>
							<div id="pwchkdiv" class="form-group">
								비밀번호 확인
								<input disabled class="form-control valid" name="pwchk" id="pwchk" type="password"
									placeholder="비밀번호를 다시 입력해주세요">
							</div>
							<div id="phonediv" class="form-group">
								연락처
								<input class="form-control valid" name="s_tel" id="s_tel"
									placeholder="연락가능한 휴대전화번호를 입력해주세요">
							</div>
							<div id="addressdiv" class="form-group">
								주소<div class="d-flex">
									<input disabled class="form-control valid" id="s_zipcode" name="s_zipcode"
										placeholder="우편번호를 검색하세요.">
									<input type="button" id="addressSearch" value="검색" class="genric-btn primary radius"
										style="float: right;">
								</div>
								<input disabled class="form-control valid" id="s_address" name="s_address"
									placeholder="주소">
								<input disabled class="form-control valid" id="s_detailaddress" name="s_detailaddress"
									placeholder="상세 주소">
							</div>
							<div class="d-flex">
								<div class="primary-checkbox">
									<input type="checkbox" id="primary-checkbox">
									<label for="primary-checkbox"></label>
								</div>&nbsp;
								<a class="hover-btn-new log orange" href="#" data-toggle="modal" data-target="#login"
									style="color: #1f2b7b;">
									이용 약관, 개인정보 수집 및 이용 동의 (필수)
								</a>
							</div>
						</div>
						<div style="text-align: center;">
							<div style="margin-top: 100px;">
								<button type="button" class="genric-btn primary e-large"
									onclick="sellerPersonJoin()">가입하기</button>
							</div>
							<div style="margin-top: 40px;">
								<a href="sellerPersonjoin.do" style="color: #1f2b7b;">개인 판매자로 가입하시나요?</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 3단계 -->
	<div id="page3" class="container" style="margin-top: 60px; margin-bottom: 100px;">
		<div class="row d-flex justify-content-center align-items-center">
			<div>
				<img src="resources/user/assets/img/mainroket.png" alt="">
				<div class="section-tittle text-center">
					<h1>NASA에 오신 것을 환영합니다!</h1>
				</div>
				<div class="col-12" style="text-align: center; margin-top: 25px;">
					<span style="font-size: 20px;">판매자 추가 정보를 입력하세요.<br>마이페이지에서 언제든지 수정 가능합니다.</span>
				</div>
			</div>
		</div>
		<div class="row d-flex justify-content-center align-items-center" style="margin-top: 100px;">
			<div class="col-5">
				<!-- 수정 폼 시작-->		
				<form class="form-contact contact_form" method="post" id="personJoinUpdate-form">
					<div class="col-12">
						<div id="profileThumnail" class="justify-content-center" style="text-align: center;">
							<img id="prvimg" src="resources/user/assets/img/profile/defaultprofileimg.png" alt="" style="width: 150px; height:150px; border-radius: 70%; overflow: hidden;"><br>
							<input type="file" id="imgupload" name="imgupload" accept="image/*">
						</div>
					</div>
					<br>
					<br>
					<div class="col-12">
						<div><span style="font-weight: bold; font-size: 17px;">[판매자 자기소개]</span></div>
						<div class="form-group">
							<textarea class="form-control w-100" cols="60" rows="9" id="s_me" name="s_me"
								placeholder="판매자 자기소개 입력"></textarea>
						</div>
					</div>
					<div class="col-12">
						<div><span style="font-weight: bold; font-size: 17px;">[경력사항]</span></div>
						<div class="form-group">
							<textarea class="form-control w-100" cols="60" rows="9" id="s_carrer" name="s_carrer"
								placeholder="서비스 관련 경력사항을 입력해주세요"></textarea>
						</div>
					</div>										
					<div class="col-12">
						<div><span style="font-weight: bold; font-size: 17px;">[학력사항]</span></div>
						<div class="form-group">
							<div class="d-flex">
								<input class="form-control valid" placeholder="대학교 입력" id="s_school" name="s_school">
							</div>
							<input class="form-control valid" placeholder="전공 입력" id="s_major" name="s_major">
							<div class="d-flex" style="margin-top: 10px;">
								<div class="switch-wrap d-flex justify-content-between">
									<div class="confirm-radio">
										<input type="radio" id="confirm-radio1" name="s_grad" checked="checked" value="졸업">
										<label for="confirm-radio1"></label>
									</div>&nbsp;
									<p>졸업</p>
								</div>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="switch-wrap d-flex justify-content-between">
									<div class="confirm-radio">
										<input type="radio" id="confirm-radio2" name="s_grad" value="휴학">
										<label for="confirm-radio2"></label>
									</div>&nbsp;
									<p>휴학</p>
								</div>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="switch-wrap d-flex justify-content-between">
									<div class="confirm-radio">
										<input type="radio" id="confirm-radio3" name="s_grad" value="중퇴">
										<label for="confirm-radio3"></label>
									</div>&nbsp;
									<p>중퇴</p>
								</div>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="switch-wrap d-flex justify-content-between">
									<div class="confirm-radio">
										<input type="radio" id="confirm-radio4" name="s_grad" value="졸업유예">
										<label for="confirm-radio4"></label>
									</div>&nbsp;
									<p>졸업유예</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12" style="text-align: center; margin-top: 100px;">
						<button type="button" class="genric-btn primary e-large" style="width: 177.38px;" onclick="joinUpdate()">추가 정보 입력</button>
						<button type="button" class="genric-btn primary-border e-large" onclick="location.href='home.do'">나중에 입력하기</button>
					</div>
					<input type="hidden" id="next_email" name="s_email" value="">
				</form>
			</div>
		</div>
	</div>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function () {
			document.getElementById("page2").style.display = "none";
			document.getElementById("page3").style.display = "none";
			document.getElementById("addressSearch").addEventListener("click", function () { //주소입력칸을 클릭하면
				$("#s_zipcode").attr("disabled", false);
				$("#s_address").attr("disabled", false);
				$("#s_detailaddress").attr("disabled", false);
				//카카오 지도 발생
				new daum.Postcode({
					oncomplete: function (data) { //선택시 입력값 세팅
						document.getElementById("s_zipcode").value = data.zonecode;
						document.getElementById("s_address").value = data.address; // 주소 넣기
						document.querySelector("input[id=s_detailaddress]").focus(); //상세입력 포커싱
					}
				}).open();
			});
		};
		
		// 모달 약관 동의
		function checkagree() {
			$("#primary-checkbox").attr("checked", true);
		}
		function main() {
			alert("약관에 동의하지 않으면 가입할 수 없습니다.");
		}
		
		// 사업자등록번호 체크
		function testbt() {
			var data = {
				"businesses": [{
					"b_no": document.querySelector("#bnumber").value, // 사업자번호 "xxxxxxx" 로 조회 시,
					"start_dt": document.querySelector("#bdate").value,
					"p_nm": document.querySelector("#bname").value
				}]
			};

			$.ajax({
				url: "http://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=NFwkbzbbf2uEp1cOHXKWMIFV54Jy8gdGhbkTPMWP7BoQh715sxmepPFKRpsi70HzZ9BHOLvd23f%2BRzj781IjDw%3D%3D&returnType=JSON", // serviceKey 값을 xxxxxx에 입력
				type: "POST",
				data: JSON.stringify(data), // json 을 string으로 변환하여 전송
				dataType: "JSON",
				contentType: "application/json",
				accept: "application/json",
				success: function (result) {
					console.log(result.data[0].valid_msg);
					console.log(result);

					let datas = result.data[0].valid_msg;

					if (datas === '확인할 수 없습니다.') {
						$("label").remove('#bchklabel');
						$("#bchkdiv").append('<label id="bchklabel">[인증 실패] 입력한 정보를 다시 확인해주세요.</label>');
						$("#bchklabel").css("color", "red");					
					} else {
						$("label").remove('#bchklabel');
						$("#bchkdiv").append('<label id="bchklabel">[인증 완료]');
						$("#bchklabel").css("color", "blue");
						$('#bChk').attr('disabled', true);
						$('#bnumber').attr('readonly', true);
						$('#bnumber').css("background-color", "rgba(150, 205, 235, 0.521)");
					}
				},
				error: function (result) {
					console.log(result.responseText); //responseText의 에러메세지 확인
				}
			});
		}	
		
		// 페이지 이동
		function nextPage() {
			if (!($('#bChk').attr('disabled'))) {
				$("label").remove('#bchklabel');
				$("#bchkdiv").append('<label id="bchklabel">먼저 인증을 완료해주세요.</label>');
				$("#bchklabel").css("color", "red");				
			} else {
				document.getElementById("page1").style.display = "none";
				document.getElementById("page2").style.display = "block";
			}			
		}
		function nextPage2() {
			document.getElementById("page1").style.display = "none";
			document.getElementById("page2").style.display = "none";
			document.getElementById("page3").style.display = "block";
		}

		// 사업자 필수 입력		
		$("#bname").blur(function () {
			if (!($("#bname").val())) {
				$("label").remove('#bnamelabel');
				$("#bnamediv").append('<label id="bnamelabel">대표자 성명은 필수 입력값입니다.</label>');
				$("#bnamelabel").css("color", "red");
			} else {
				$("label").remove('#bnamelabel');
			}
		})
		$("#bdate").blur(function () {
			if (!($("#bdate").val())) {
				$("label").remove('#bdatelabel');
				$("#bdatediv").append('<label id="bdatelabel">개업일자는 필수 입력값입니다.</label>');
				$("#bdatelabel").css("color", "red");
			} else {
				$("label").remove('#bdatelabel');
			}
		})
		$("#bnumber").blur(function () {
			if (!($("#bnumber").val())) {
				$("label").remove('#bchklabel');
				$("#bchkdiv").append('<label id="bchklabel">사업자등록번호는 필수 입력값입니다.</label>');
				$("#bchklabel").css("color", "red");
			} else {
				$("label").remove('#bchklabel');
			}
		})
		
		// 이름 필수 입력		
		$("#s_name").blur(function () {
			if (!($("#s_name").val())) {
				$("label").remove('#namelabel');
				$("#namediv").append('<label id="namelabel">이름(실명)은 필수 입력값입니다.</label>');
				$("#namelabel").css("color", "red");
				$('#s_name').focus();
			} else {
				$("label").remove('#namelabel');
			}
		})

		// 닉네임 필수 입력
		$("#s_nickname").blur(function () {
			if (!($("#s_nickname").val())) { // 닉네임에 아무것도 적혀있지 않으면
				$("label").remove('#nicklabel');
				$("label").remove('#nicklabelok');
				$("#nickdiv").append('<label id="nicklabel">닉네임은 필수 입력값입니다.</label>');
				$("#nicklabel").css("color", "red");
			} else { // 뭐라도 적혀있으면
				$("label").remove('#nicklabel');
				$("label").remove('#nicklabelok');
			}
		})

		// 닉네임 중복 체크
		function nicknameCheck() {
			var nickname = $('#s_nickname').val();
			if (nickname == "") {
				$("label").remove('#nicklabel');
				$("label").remove('#nicklabelok');
				$("#nickdiv").append('<label id="nicklabel">닉네임은 필수 입력값입니다.</label>');
				$("#nicklabel").css("color", "red");
			} else {
				$.ajax({
					url: "ajaxnickCheck.do",
					type: "post",
					data: {
						s_nickname: nickname
					},
					dataType: "text",
					success: function (data) {
						if (data == 'T') {
							$("label").remove('#nicklabel');
							$("label").remove('#nicklabelok');
							$("#nickdiv").append('<label id="nicklabelok">사용 가능한 닉네임입니다.</label>');
						} else {
							$("label").remove('#nicklabel');
							$("label").remove('#nicklabelok');
							$("#nickdiv").append('<label id="nicklabel">이미 사용하고 있는 닉네임입니다.</label>');
							$("#nicklabel").css("color", "red");
						}
					},
					error: function () {
						console.log("실패");
					}
				});
			}			
		};

		// 이메일 필수 입력		
		$("#s_email").blur(function () {
			if (!($("#s_email").val())) {
				$("label").remove('#emaillabel');
				$("label").remove('#emaillabelok');
				$("#emaildiv").append('<label id="emaillabel">이메일은 필수 입력값입니다.</label>');
				$("#emaillabel").css("color", "red");
			} else {
				$("label").remove('#emaillabel');
				$("label").remove('#emaillabelok');
			}
		})

		// 이메일 인증번호 전송
		var emailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var code = "";

		function emailCheck() {
			// 이메일 형식 체크
			var emailchk = emailreg.test($("#s_email").val());
			if (!emailchk) {
				$("label").remove('#emaillabel');
				$("label").remove('#emaillabelok');
				$("#emaildiv").append('<label id="emaillabel">올바른 이메일을 입력해 주세요.</label>');
				$("#emaillabel").css("color", "red");
			} else {
				var email = ($('#s_email').val());
				console.log(email);
				// 이메일 중복 체크
				$.ajax({
					url: "ajaxemailCheck.do",
					type: "post",
					data: {
						s_email: email
					},
					dataType: "text",
					success: function (data) {
						if (data == "T") { // 중복된 이메일이 없으면 인증번호 메일 보내기
							$.ajax({
								type: "post",
								url: "ajaxemailSend.do",
								data: {
									s_email: email
								},
								success: function (data) {
									$("label").remove('#emaillabel');
									$("label").remove('#emaillabelok');
									$("#emaildiv").append(
										'<label id="emaillabelok">인증번호를 발송했습니다.</label>');
									code = data;
								}
							});
							$("#emailchkdiv").attr("disabled", false);
							$('#emailchkdiv').focus();
						} else {
							$("label").remove('#emaillabel');
							$("label").remove('#emaillabelok');
							$("#emaildiv").append('<label id="emaillabel">중복된 이메일입니다.</label>');
							$("#emaillabel").css("color", "red");
						}
					}
				})
			}

		};

		// 이메일 인증번호 필수 입력
		$("#emailchk").blur(function () {
			if (!($("#emailchk").val())) {
				$("label").remove('#emailchklabel');
				$("label").remove('#emailchklabelok');
				$("#emailchkdiv").append('<label id="emailchklabel">인증번호를 입력해 주세요.</label>');
				$("#emaillabel").css("color", "red");
			} else {
				$("label").remove('#emailchklabel');
				$("label").remove('#emailchklabelok');
			}
		})

		// 이메일 인증번호 확인
		function emailSendCheck() {
			if ($("#emailchk").val() == "") {
				$("label").remove('#emailchklabel');
				$("label").remove('#emailchklabelok');
				$("#emailchkdiv").append('<label id="emailchklabel">인증번호를 입력해 주세요.</label>');
				$("#emailchklabel").css("color", "red");
			} else if ($("#emailchk").val() == code) {
				$("label").remove('#emailchklabel');
				$("label").remove('#emailchklabelok');
				$("#emailchkdiv").append('<label id="emailchklabelok">인증번호가 확인되었습니다.</label>');
			} else {
				$("label").remove('#emailchklabel');
				$("label").remove('#emailchklabelok');
				$("#emailchkdiv").append('<label id="emailchklabel">인증번호가 일치하지 않습니다.</label>');
				$("#emailchklabel").css("color", "red");
			}
		}


		// 비밀번호 설정
		var pwreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

		$("#s_password").blur(function () {
			var pwchk = pwreg.test($("#s_password").val());
			if (!pwchk) {
				$("label").remove('#pwlabel');
				$("#pwdiv").append('<label id="pwlabel">비밀번호는 영문+숫자 또는 특수문자 조합 8자리 이상이어야 합니다.</label>');
				$("#pwlabel").css("color", "red");
			} else {
				$("label").remove('#pwlabel');
				$("#pwchk").attr("disabled", false);
				$('#pwchk').focus();
			}
		})

		// 비밀번호 확인
		$("#pwchk").blur(function () {
			if ($("#pwchk").val() == "") {
				$("label").remove('#pwchklabel');
				$("label").remove('#pwchklabelok');
				$("#pwchkdiv").append('<label id="pwchklabel">비밀번호를 입력해주세요.</label>');
				$("#pwchklabel").css("color", "red");
			} else if ($("#s_password").val() == $("#pwchk").val()) {
				$("label").remove('#pwchklabel');
				$("label").remove('#pwchklabelok');
				$("#pwchkdiv").append('<label id="pwchklabelok">비밀번호가 확인되었습니다.</label>');
			} else {
				$("label").remove('#pwchklabel');
				$("label").remove('#pwchklabelok');
				$("#pwchkdiv").append('<label id="pwchklabel">비밀번호가 일치하지 않습니다.</label>');
				$("#pwchklabel").css("color", "red");
			}
		})

		// 연락처 설정
		var phonereg = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

		$("#s_tel").blur(function () {
			var phonechk = phonereg.test($("#s_tel").val());
			if (!phonechk) {
				$("label").remove('#phonelabel');
				$("#phonediv").append('<label id="phonelabel">올바른 휴대전화번호를 입력해주세요.</label>');
				$("#phonelabel").css("color", "red");
			} else {
				$("label").remove('#phonelabel');
			}
		});

		$("#s_detailaddress").blur(function () {
			$("label").remove('#addresslabel');
		})

		// 회원가입
		function sellerPersonJoin() {
			if (!($("#nicklabelok").length)) {
				$("label").remove('#nicklabel');
				$("#nickdiv").append('<label id="nicklabel">닉네임 중복체크를 해주세요.</label>');
				$("#nicklabel").css("color", "red");
				$("#s_nickname").focus();
			// } else if (!($("#emaillabelok").length)) {
			// 	$("label").remove('#emaillabel');				
			// 	$("#emaildiv").append('<label id="emaillabel">이메일 인증이 필요합니다.</label>');
			// 	$("#nicklabel").css("color", "red");
			// 	$("#s_email").focus();
			// } else if (!($("#emailchklabelok").length)) {
			// 	$("label").remove('#emailchklabel');				
			// 	$("#emailchkdiv").append('<label id="emailchklabel">이메일 인증번호를 확인해주세요.</label>');
			// 	$("#emailchklabel").css("color", "red");
			// 	$("#emailchk").focus();
			} else if (!($("#pwchklabelok").length)) {
				$("label").remove('#pwlabel');
				$("label").remove('#pwchklabel');
				$("#pwdiv").append('<label id="pwlabel">비밀번호를 확인해주세요.</label>');
				$("#pwlabel").css("color", "red");
				$("#s_password").focus();
			} else if (!($("#s_tel").val())) {
				$("label").remove('#phonelabel');
				$("#phonediv").append('<label id="phonelabel">연락처는 필수 입력값입니다.</label>');
				$("#phonelabel").css("color", "red");
				$("#s_tel").focus();
			} else if (!($("#s_address").val())) {
				$("label").remove('#addresslabel');
				$("#addressdiv").append('<label id="addresslabel">주소는 필수 입력값입니다.</label>');
				$("#addresslabel").css("color", "red");
			} else if (!($('#primary-checkbox').is(':checked'))) {
				alert("약관에 동의하지 않으면 가입할 수 없습니다.");
			} else {
				$.ajax({
					url: "ajaxSCjoin.do",
					type: "post",
					data: $("#companyJoin-form").serialize(),
					success: function (data) {
						if (data == "T") {
							nextPage2();
							console.log("등록 성공");
							$('#next_email').val($('#s_email').val());
						}
					}
				});
			}
		};

		// 회원정보 추가 수정
		function joinUpdate() {
			console.log($('#next_email').val());
			var form = $('#personJoinUpdate-form')[0];
			var data = new FormData(form);
			
			$.ajax({
					url: "ajaxjoinUpdate.do",
					type: "post",					
					data: data,
					contentType : false,
        			processData : false,
					success: function (data) {
						if (data == "T") {
							console.log("수정 성공");
							alert("추가 정보 입력 완료! 메인 화면으로 이동합니다.");
							location.href='home.do';
						} else {
							console.log("수정 실패");
						}
						
					}
				});
		}

		// 프로필 사진 미리보기
		function readImage(input) {
			if(input.files && input.files[0]) {
				const reader = new FileReader();
				
				reader.onload = e => {
					const previewImage = document.getElementById("prvimg");
					previewImage.src = e.target.result;
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		const inputImage = document.getElementById("imgupload");
		inputImage.addEventListener("change", e => {
			readImage(e.target);
		});
	</script>
</body>

</html>