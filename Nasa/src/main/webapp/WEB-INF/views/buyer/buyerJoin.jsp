<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<div>&nbsp;&nbsp;1. 이 약관은 이용자가 주식회사 브레이브모바일(이하 "회사")이 운영하는
							인터넷 서비스 사이트(이하 "사이트" 또는 "NASA")를 통해 제공하는 인터넷 전자상거래 관련 서비스(이하
							"서비스")와 관련하여 회사와 이용자의 권리, 의무, 책임사항을 규정함을 목적으로 합니다. 또한 본 약관은 유무선
							PC통신, 태블릿 PC, 스마트폰(아이폰, 안드로이드폰 등) 어플리케이션 및 모바일웹 등을 이용하는 전자상거래 등에
							대해서도 그 성질에 반하지 않는 한 준용됩니다. 본 약관이 규정한 내용 이외의 회사와 이용자 간의 권리, 의무 및
							책임사항에 관하여서는 전기통신사업법 기타 대한민국의 관련 법령과 상관습에 의합니다.</div>
					</div>
					<div class="form-group mt-3 d-flex justify-content-center align-items-center">
						<div>
							<button type="button" class="genric-btn primary-border e-large" data-dismiss="modal"
								onclick="checkagree()">동의합니다.</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="genric-btn primary e-large" onclick="main()">동의하지 않습니다.</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function checkagree() {
			$("#primary-checkbox").attr("checked", true);
		}

		function main() {
			alert("약관에 동의하지 않으면 가입할 수 없습니다.");
		}
	</script>

	<!-- Hero Start-->
	<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>회원가입</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Hero End -->

	<div id="page1" class="container" style="margin-top: 60px; margin-bottom: 100px;">
		<div class="row justify-content-center align-items-center">
			<div class="col-5">
				<form class="form-contact contact_form" id="buyerJoin-form" method="POST">
					<div>
						<div>
							<div id="namediv" class="form-group">
								이름
								<input class="form-control valid" name="b_name" id="b_name" type="text" placeholder="이름(실명)을 입력해주세요">
							</div>
							<c:if test="${name eq null}">
								<div id="nickdiv" class="form-group">
									닉네임
									<input class="form-control valid" name="b_nickname" id="b_nickname" placeholder="사용할 닉네임을 입력해주세요">
									<input type="button" value="확인" id="nickCheckbtn" class="position-relative genric-btn primary radius"
										onclick="nicknameCheck()" style="float: right; bottom: 45px;">
								</div>
							</c:if>
							<c:if test="${name ne null}">
								<div id="nickdiv" class="form-group">
									닉네임
									<input class="form-control valid" name="b_nickname" id="b_nickname" value="${name}">
									<input type="button" value="확인" id="nickCheckbtn"class="position-relative genric-btn primary radius"
										onclick="nicknameCheck()" style="float: right; bottom: 45px;">
								</div>
							</c:if>
							<c:if test="${email eq null}">
								<div id="emaildiv" class="form-group">
									이메일
									<input class="form-control valid" name="b_email" id="b_email" type="email"
										placeholder="example@nasa.com">
									<input type="button" value="전송" class="position-relative genric-btn primary radius"
										onclick="emailCheck()" style="float: right; bottom: 45px;">
								</div>
							</c:if>
							<c:if test="${email ne null}">
								<div id="emaildiv" class="form-group">
									이메일
									<input class="form-control valid" name="b_email" id="b_email" type="email"
										value="${email}" readonly style="background-color: #e5e8eb">
									<input type="button" value="완료" class="position-relative genric-btn primary radius" style="float: right; bottom: 45px;">
									<label id="emaillabelok">인증번호를 발송했습니다.</label>
								</div>
							</c:if>
							<c:if test="${email eq null}">
								<div id="emailchkdiv" class="form-group">
									이메일 인증
									<input disabled class="form-control valid" name="emailchk" id="emailchk" placeholder="인증코드를 확인해주세요">
									<input type="button" value="확인" class="position-relative genric-btn primary radius"
										onclick="emailSendCheck()" style="float: right; bottom: 45px;">
								</div>
							</c:if>
							<c:if test="${email ne null}">
								<div id="emailchkdiv" class="form-group">
									이메일 인증
									<input disabled class="form-control valid" name="emailchk" id="emailchk" readonly style="background-color: #e5e8eb">
									<input type="button" value="완료" class="position-relative genric-btn primary radius" style="float: right; bottom: 45px;">
									<label id="emailchklabelok">인증번호가 확인되었습니다.</label>
								</div>
							</c:if>
							<div id="pwdiv" class="form-group">
								비밀번호
								<input class="form-control valid" name="b_password" id="b_password" type="password" placeholder="영문+숫자 조합 8자리 이상 입력해주세요">
							</div>
							<div id="pwchkdiv" class="form-group">
								비밀번호 확인
								<input disabled class="form-control valid" name="pwchk" id="pwchk" type="password" placeholder="비밀번호를 다시 입력해주세요">
							</div>
							<div id="phonediv" class="form-group">
								연락처
								<input class="form-control valid" name="b_tel" id="b_tel" placeholder="연락가능한 휴대전화번호를 입력해주세요">
							</div>
							<div id="addressdiv" class="form-group">
								주소
								<div class="d-flex">
									<input disabled class="form-control valid" id="b_zipcode" name="b_zipcode"
										placeholder="우편번호를 검색하세요."> <input type="button" id="addressSearch" value="검색"
										class="genric-btn primary radius" style="float: right;">
								</div>
								<input disabled class="form-control valid" id="b_address" name="b_address"
									placeholder="주소"> <input disabled class="form-control valid" id="b_detailaddress"
									name="b_detailaddress" placeholder="상세 주소">
							</div>
							<c:choose>
								<c:when test="${not empty id }">
									<input type="hidden" id="token" name="token" value="naver">
								</c:when>
								<c:when test="${not empty token }">
									<input type="hidden" id="token" name="token" value="kakao">
								</c:when>
								<c:when test="${empty id && empty token }">
									<input type="hidden" id="token" name="token" value="nasa">
								</c:when>
							</c:choose>
							<div class="d-flex">
								<div class="primary-checkbox">
									<input type="checkbox" id="primary-checkbox"> <label for="primary-checkbox"></label>
								</div>
								&nbsp;<a class="hover-btn-new log orange" href="#" data-toggle="modal"
									data-target="#login" style="color: #1f2b7b;"> 이용 약관, 개인정보 수집 및 이용 동의 (필수) </a>
							</div>
						</div>
						<div style="text-align: center;">
							<div style="margin-top: 100px;">
								<button type="button" class="genric-btn primary e-large"
									onclick="buyerJoin()">가입하기</button>
							</div>
							<div style="margin-top: 40px;">
								<a href="sellerJoin.do" style="color: #1f2b7b;">판매자로 가입하시나요?</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="page2" class="container" style="margin-top: 60px; margin-bottom: 100px;">
		<div class="row d-flex justify-content-center align-items-center">
			<div style="margin: 100px;">
				<img src="resources/user/assets/img/mainroket.png" alt="">
				<div class="section-tittle text-center">
					<h1>NASA에 오신 것을 환영합니다!</h1>
				</div>
				<div style="text-align: center; margin-top: 50px; margin-bottom: 30px;">
					<button type="button" class="genric-btn primary-border e-large" onclick="location.href='home.do'">
						메인으로 돌아가기</button>
				</div>				
			</div>
		</div>
	</div>
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function () {
		$('#b_name').focus();
		document.getElementById("page2").style.display = "none";
		document.getElementById("addressSearch").addEventListener("click",function () { //주소입력칸을 클릭하면
			$("#b_zipcode").attr("disabled", false);
			$("#b_address").attr("disabled", false);
			$("#b_detailaddress").attr("disabled", false);
			//카카오 지도 발생
			new daum.Postcode({
				oncomplete: function (data) { //선택시 입력값 세팅
					document.getElementById("b_zipcode").value = data.zonecode;
					document.getElementById("b_address").value = data.address; // 주소 넣기
					document.querySelector("input[id=b_detailaddress]").focus(); //상세입력 포커싱
				}
			}).open();
		});
	};

	// 페이지 이동
	function nextPage() {
		document.getElementById("page1").style.display = "none";
		document.getElementById("page2").style.display = "block";
	};

	// 이름 필수 입력		
	$("#b_name").blur(function () {
		if (!($("#b_name").val())) {
			$("label").remove('#namelabel');
			$("#namediv").append('<label id="namelabel">이름(실명)은 필수 입력값입니다.</label>');
			$("#namelabel").css("color", "red");
			$('#s_name').focus();
		} else {
			$("label").remove('#namelabel');
		}
	});

	// 닉네임 필수 입력
	$("#b_nickname").blur(function () {
		if (!($("#b_nickname").val())) { // 닉네임에 아무것도 적혀있지 않으면
			$("label").remove('#nicklabel');
			$("label").remove('#nicklabelok');
			$("#nickdiv").append('<label id="nicklabel">닉네임은 필수 입력값입니다.</label>');
			$("#nicklabel").css("color", "red");
		} else { // 뭐라도 적혀있으면
			$("label").remove('#nicklabel');
			$("label").remove('#nicklabelok');
		}
	});

	// 닉네임 중복 체크
	function nicknameCheck() {
		var nickname = $('#b_nickname').val();
		if (nickname == "") { // 닉네임에 아무것도 적혀있지 않으면
			$("label").remove('#nicklabel');
			$("label").remove('#nicklabelok');
			$("#nickdiv").append('<label id="nicklabel">닉네임은 필수 입력값입니다.</label>');
			$("#nicklabel").css("color", "red");
		} else {
			$.ajax({
				url: "ajaxBnickCheck.do",
				type: "post",
				data: { b_nickname: nickname },
				dataType: "text",
				success: function (data) {
					console.log(data);
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
	$("#b_email").blur(function () {
		if (!($("#b_email").val())) {
			$("label").remove('#emaillabel');
			$("label").remove('#emaillabelok');
			$("#emaildiv").append(
				'<label id="emaillabel">이메일은 필수 입력값입니다.</label>');
			$("#emaillabel").css("color", "red");
		} else {
			$("label").remove('#emaillabel');
			$("label").remove('#emaillabelok');
		}
	});

	// 이메일 인증번호 전송
	var emailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var code = "";

	function emailCheck() {
		// 이메일 형식 체크
		var emailchk = emailreg.test($("#b_email").val());
		if (!emailchk) {
			$("label").remove('#emaillabel');
			$("label").remove('#emaillabelok');
			$("#emaildiv").append('<label id="emaillabel">올바른 이메일을 입력해 주세요.</label>');
			$("#emaillabel").css("color", "red");
		} else {
			var email = ($('#b_email').val());
			console.log(email);
			// 이메일 중복 체크
			$.ajax({
				url: "ajaxBemailCheck.do",
				type: "post",
				data: { b_email: email },
				dataType: "text",
				success: function (data) {
					if (data == "T") { // 중복된 이메일이 없으면 인증번호 메일 보내기
						$.ajax({
							type: "post",
							url: "ajaxBemailSend.do",
							data: { b_email: email },
							success: function (data) {
								$("label").remove('#emaillabel');
								$("label").remove('#emaillabelok');
								$("#emaildiv").append('<label id="emaillabelok">인증번호를 발송했습니다.</label>');
								code = data;
							}
						});
						$("#emailchk").attr("disabled", false);
						$('#emailchk').focus();
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
			$("#emailchkdiv").append('<label id="emailchklabel">인증번호를 입력해주세요.</label>');
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
			$("#emaillabel").css("color", "red");
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

	$("#b_password").blur(function () {
		var pwchk = pwreg.test($("#b_password").val());
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
			$("#pwchkdiv").append('<label id="pwchklabel">비밀번호를 한 번 더 입력해주세요.</label>');
			$("#pwchklabel").css("color", "red");
		} else if ($("#b_password").val() == $("#pwchk").val()) {
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

	$("#b_tel").blur(function () {
		var phonechk = phonereg.test($("#b_tel").val());
		if (!phonechk) {
			$("label").remove('#phonelabel');
			$("#phonediv").append('<label id="phonelabel">올바른 휴대전화번호를 입력해주세요.</label>');
			$("#phonelabel").css("color", "red");
		} else {
			$("label").remove('#phonelabel');
		}
	});

	$("#b_detailaddress").blur(function () {
		$("label").remove('#addresslabel');
	})

	// 회원가입
	function buyerJoin() {
		if (!($("#nicklabelok").length)) {
			$("label").remove('#nicklabel');
			$("#nickdiv").append('<label id="nicklabel">닉네임 중복체크를 해주세요.</label>');
			$("#nicklabel").css("color", "red");
			$("#b_nickname").focus();
		// } else if (!($("#emaillabelok").length)) {
		// 	$("label").remove('#emaillabel');
		// 	$("#emaildiv").append('<label id="emaillabel">이메일 인증이 필요합니다.</label>');
		// 	$("#nicklabel").css("color", "red");
		// 	$("#b_email").focus();
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
			$("#b_password").focus();
		} else if (!($("#b_tel").val())) {
			$("label").remove('#phonelabel');
			$("#phonediv").append('<label id="phonelabel">연락처는 필수 입력값입니다.</label>');
			$("#phonelabel").css("color", "red");
			$("#b_tel").focus();
		} else if (!($("#b_address").val())) {
			$("label").remove('#addresslabel');
			$("#addressdiv").append('<label id="addresslabel">주소는 필수 입력값입니다.</label>');
			$("#addresslabel").css("color", "red");
		} else if (!($('#primary-checkbox').is(':checked'))) {
			alert("약관에 동의하지 않으면 가입할 수 없습니다.");
		} else {
			$.ajax({
				url: "ajaxBjoin.do",
				type: "post",
				data: $("#buyerJoin-form").serialize(),
				success: function (data) {
					if (data == "T") {
						nextPage();
						console.log("등록 성공");
					}
				}
			});
		}
	};
</script>

</html>