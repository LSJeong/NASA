<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<script>
    window.onload = function() {
	        document.getElementById("searchAdderess").addEventListener("click", function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById("s_zipcode").value = data.zonecode;
                    document.getElementById("s_address").value = data.address;
                    document.getElementById("s_detailaddress").focus();
                }
            }).open();
        });
    }
</script>
</head>
<body>
	<div
		class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>정보 수정</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section>
		<div class="row justify-content-center" style="margin-top: 50px;">
			<div style="width: 550px;">
				<form method="post" id="sellerProfileU" enctype="multipart/form-data">
					<div id="profileThumnail" class="justify-content-center" style="text-align: center;">
						<c:if test="${empty sellerInfo.s_img }">
							<img id="prvimg" src="resources/user/assets/img/profile/search-default-profile.jpg" alt="" style="width: 150px; height: 150px; border-radius: 70%; overflow: hidden;"><br>
						</c:if>
						<c:if test="${not empty sellerInfo.s_img }">
							<img id="prvimg" src="${sellerInfo.s_img }" alt="" style="width: 150px; height: 150px; border-radius: 70%; overflow: hidden;"><br>
						</c:if>
						<input type="file" id="imgupload" name="imgupload" accept="image/*" style="display: none;"> 
						<label class="genric-btn primary radius" for="imgupload" style="margin-top: 7px;">사진 수정</label>
					</div>
					
					<div style="margin-top: 20px;" id="namediv">
						<p>이름</p>
						<div class="form-group">
							<input class="form-control" name="s_name" id="s_name" type="text"
								value="${sellerInfo.s_name }" required>
						</div>
					</div>
					
					<div style="margin-top: 20px;" id="nickdiv">
						<p>닉네임</p>
						<div class="form-group">
							<input class="form-control" name="s_nickname" id="s_nickname" type="text"
								 value="${sellerInfo.s_nickname }" required>
							
							<input type="button" value="확인" id="nickCheckbtn"
									class="position-relative genric-btn primary radius" onclick="nicknameCheck()"
									style="float: right; bottom: 40px; left: 10px;" >
						</div>
						<label id="nicklabelok">인증된 닉네임입니다.</label>
					</div>

					<div style="margin-top: 20px;">
						<p>이메일</p>
						<div class="form-group">
							<input class="form-control" name="s_email" id="s_email" type="text"
								value="${sellerInfo.s_email }" disabled required>
						</div>
					</div>
					
					<div style="margin-top: 20px;" id="phonediv">
						<p>연락처</p>
						<div class="form-group">
							<input class="form-control" name="s_tel" id="s_tel" type="text"
								value="${sellerInfo.s_tel }"  required>
						</div>
					</div>
				
					<div style="margin-top: 20px;" id="addressdiv">
						<p>주소</p>
						<div class="form-group">
							<input class="form-control col-8" name="s_zipcode" id="s_zipcode"
								value="${sellerInfo.s_zipcode }" type="text" style="display: inline;" readonly>
							<label id="searchAdderess" 
								class="genric-btn primary radius col-lg-3">주소조회</label> <input
								class="form-control col-lg-8" name="s_address" id="s_address"
								type="text" value="${sellerInfo.s_address }"
								style="display: inline; margin-top: 5px;" readonly> <input
								class="form-control col-lg-3" name="s_detailaddress"
								id="s_detailaddress" type="text" value="${sellerInfo.s_detailaddress }"
								style="display: inline; margin-top: 5px;" required>
						</div>
					</div>
					
					<div style="margin-top: 20px;">
						<p>비밀번호 변경</p>
						<input type="radio" name="pwCheck" id="basic" value="basic" checked="checked">기존 비밀번호 
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pwCheck" id="new" value="new">새로운 비밀번호
					</div>
					<div style="display: none;" id="newpwdiv">
						<div style="margin-top: 20px;" id="pwdiv">
							<p>새로운 비밀번호</p>
							<div class="form-group">
								<input class="form-control" name="s_password" id="s_password"
									type="password" placeholder="새로운 비밀번호" required>
							</div>
						</div>
	
						<div style="margin-top: 20px;" id="pwchkdiv">
							<p>새로운 비밀번호 확인</p>
							<div class="form-group">
								<input class="form-control" name="pwchk" id="pwchk"
									type="password" placeholder="새로운 비밀번호" required>
							</div>
						</div>
					</div>
					
					<div style="margin-top: 20px;">
						<p>판매자 소개</p>
						<div class="form-group">
							<textarea class="form-control" name="s_me" id="s_me" cols="60" rows="9">${sellerInfo.s_me }</textarea>
						</div>
					</div>

					<div style="margin-top: 20px;">
						<p>대학교 전공</p>
						<div class="form-group">
							<input class="form-control" name="s_school" id="s_school" type="text" value="${sellerInfo.s_school }">
							<input class="form-control" name="s_major" id="s_major" type="text" value="${sellerInfo.s_major }">
							<div class="d-flex" style="margin-top: 10px;">
								<div class="switch-wrap d-flex justify-content-between">
									<div class="confirm-radio">
										<input type="radio" id="confirm-radio1" name="s_grad" <c:if test="${sellerInfo.s_grad eq '졸업' }">checked</c:if> value="졸업"> 
										<label for="confirm-radio1"></label>
									</div>
									&nbsp;
									<p>졸업</p>
								</div>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="switch-wrap d-flex justify-content-between">
									<div class="confirm-radio">
										<input type="radio" id="confirm-radio2" name="s_grad" <c:if test="${sellerInfo.s_grad eq '휴학' }">checked</c:if> value="휴학">
										<label for="confirm-radio2"></label>
									</div>
									&nbsp;
									<p>휴학</p>
								</div>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="switch-wrap d-flex justify-content-between">
									<div class="confirm-radio">
										<input type="radio" id="confirm-radio3" name="s_grad" <c:if test="${sellerInfo.s_grad eq '중퇴' }">checked</c:if> value="중퇴"> 
										<label for="confirm-radio3"></label>
									</div>
									&nbsp;
									<p>중퇴</p>
								</div>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="switch-wrap d-flex justify-content-between">
									<div class="confirm-radio">
										<input type="radio" id="confirm-radio4" name="s_grad" <c:if test="${sellerInfo.s_grad eq '졸업유예' }">checked</c:if> value="졸업유예"> 
										<label for="confirm-radio4"></label>
									</div>
									&nbsp;
									<p>졸업유예</p>
								</div>
							</div>
						</div>
					</div>
					
					<div style="margin-top: 20px;">
						<p>기타 경력사항</p>
						<div class="form-group">
							<textarea class="form-control" name="s_carrer" id="s_carrer" cols="60" rows="9">${sellerInfo.s_carrer }</textarea>
						</div>
					</div>
					
					<div class="row justify-content-center" style="margin-bottom: 50px;">
						<button type="button" id="updatebtn" class="genric-btn info-border">수정</button>
						<a href="goSellerMypage.do" class="genric-btn danger-border" style="margin-left: 10px;">취소</a>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script>
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
				$("label").remove('#nicklabelok2');
				$("#nickdiv").append('<label id="nicklabel">닉네임은 필수 입력값입니다.</label>');
				$("#nicklabel").css("color", "red");
			} else { // 뭐라도 적혀있으면
				$("label").remove('#nicklabel');
				$("label").remove('#nicklabelok');
				$("label").remove('#nicklabelok2');
			}
		})
		
		// 닉네임 중복 체크
		function nicknameCheck() {
			if($('#s_nickname').val() == "${sellerInfo.s_nickname}"){
				$("label").remove('#nicklabel');
				$("label").remove('#nicklabelok');
				$("#nickdiv").append('<label id="nicklabelok">사용 가능한 닉네임입니다.</label>');
				return;
			}
			var nickname = $('#s_nickname').val();
	
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
		};
		
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
			console.log($("#s_detailaddress").val());
			if (($("#s_detailaddress").val() != '')) {
				$("label").remove('#addresslabel');				
			}else{
				$("#addressdiv").append('<label id="addresslabel">상세주소는 필수 입력값입니다.</label>');
				$("#addresslabel").css("color", "red");
			}
		})
		
		// 비밀번호 설정
		var pwreg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

		$("#s_password").blur(function () {
			var pwchk = pwreg.test($("#s_password").val());
			if (!pwchk) {
				$("label").remove('#pwlabel');
				$("#pwdiv").append('<label id="pwlabel">비밀번호는 영문+숫자 조합 8자리 이상이어야 합니다.</label>');
				$("#pwlabel").css("color", "red");
			} else {
				$("label").remove('#pwlabel');
				$("#pwchk").attr("disabled", false);
				$('#pwchk').focus();
			}
		})

		// 비밀번호 확인
		$("#pwchk").blur(function () {
			if ($("#s_password").val() == $("#pwchk").val()) {
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
		
		$("#updatebtn").click(function(){
			if (!($("#nicklabelok").length)) {
				$("label").remove('#nicklabel');
				$("#nickdiv").append('<label id="nicklabel">닉네임 중복체크를 해주세요.</label>');
				$("#nicklabel").css("color", "red");
				$("#s_nickname").focus();
			}else if ($("input[name=pwCheck]:checked").val() == 'new' && !($("#pwchklabelok").length)) {
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
			} else if (!($("#s_detailaddress").val())) {
				$("label").remove('#addresslabel');
				$("#addressdiv").append('<label id="addresslabel">상세주소는 필수 입력값입니다.</label>');
				$("#addresslabel").css("color", "red");
				$("#s_detailaddress").focus();
			} else {
				console.log('111');
				var form = $('#sellerProfileU')[0];
				var data = new FormData(form);
				
				$.ajax({
					url: "SellerProfileUpdate.do",
					type: "post",					
					data: data,
					contentType : false,
	    			processData : false,
					success: function (data) {
						if (data == "T") {
							alert("수정 완료하였습니다.");
							location.href='goSellerMypage.do';
						} else {
							console.log("수정 실패");
						}
						
					}
				}) 
			}
			
		})
		
		
		$("input[name=pwCheck]").click(function(e){
			console.log($(e.target).val());
			if($(e.target).val() == 'new'){
				$("input:radio[id='new']").attr("checked", true); 
				$("input:radio[id='basic']").attr("checked", false);
				$('#newpwdiv').attr('style','display: block;');
			}else{
				$("input:radio[id='basic']").attr("checked", true); 
				$("input:radio[id='new']").attr("checked", false);
				$('#newpwdiv').attr('style','display: none;');
			}
		})
		
		
	</script>
</body>
</html>