<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.nice-select {
	width: 200px;
}

td:first-child:not(.sertb) {
	background-color: rgb(229, 231, 253);
	color: #1f2b7b;
}

td {
	height: 50px;
	padding: 10px;
}

.sercate {
	width: 150px;
}

#sname, input[type="number"] {
	width: 600px;
}

.spanstar {
	color: rgb(250, 70, 70);
}

input[type="radio"] {
	margin-left: 20px;
}

.btnbox {
	background-color: rgb(229, 231, 253) !important;
}

#btn-upload {
	border: 1px solid #ddd;
	outline: none;
	color: black;
}

.hr {
	background-color: #d5c9ea !important;
	margin: 10px !important;
}
</style>
</head>
<body>
	<div
		class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>서비스 수정</h2>
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
									<p style="font-weight: bold;">서비스 관리</p>
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
								<a class="d-inline-block" style="margin-top: 20px;">
									<h3>서비스 수정</h3>
								</a>
								<hr class="hr" />
								<div class="blog_details">
									<form name="dataForm" id="dataForm"
										enctype="multipart/form-data"
										onsubmit="return registerAction()" accept-charset="UTF-8"
										method="post">
										<table id="servtb" border="1"
											style="border-color: rgb(229, 232, 255); width: 800px;">
											<tbody>
												<tr>
													<td>서비스명 <span class="spanstar">*</span></td>
													<td colspan="3"><input type="text" id="sname"
														value="${service.ser_title }" name="ser_title" required>
														<input type="hidden" name="ser_code" value="${service.ser_code }">
														</td>
												</tr>
												<tr>
													<td>1차 카테고리<span class="spanstar">*</span></td>
													<td><select name="ser_cate" id="ser_cate"
														class="sercate" disabled="disabled">
															<option value="">선택하세요.</option>
															<option value="CAT1" <c:if test="${service.ser_cate eq 'CAT1' }">selected</c:if>>앱</option>
															<option value="CAT2" <c:if test="${service.ser_cate eq 'CAT2' }">selected</c:if>>웹</option>
															<option value="CAT3" <c:if test="${service.ser_cate eq 'CAT3' }">selected</c:if>>게임</option>
															<option value="CAT4" <c:if test="${service.ser_cate eq 'CAT4' }">selected</c:if>>보안</option>
															<option value="CAT5" <c:if test="${service.ser_cate eq 'CAT5' }">selected</c:if>>기술지원</option>
															<option value="CAT6" <c:if test="${service.ser_cate eq 'CAT6' }">selected</c:if>>기획</option>
															
													</select></td>
													<td style="background-color: rgb(229, 231, 253);">2차
														카테고리<span class="spanstar">*</span>
													</td>
													<td><select name="ser_sub_cate" id="ser_sub_cate"
														class="ser_sub_cate" disabled="disabled">
															<option value="">선택하세요.</option>
													</select></td>
												</tr>
												<tr>
													<td rowspan="5">서비스타입</td>
													<td>기술수준<span class="spanstar">*</span></td>
													<td colspan="2"><select name="ser_skill"
														id="ser_skill">
															<option value="초급" <c:if test="${service.ser_skill eq '초급'}">selected</c:if>>초급</option>
															<option value="중급" <c:if test="${service.ser_skill eq '중급'}">selected</c:if>>중급</option>
															<option value="고급" <c:if test="${service.ser_skill eq '고급'}">selected</c:if>>고급</option>
													</select></td>
												</tr>
												<tr>
													<td class="sertb">팀 규모<span class="spanstar">*</span></td>
													<td colspan="2"><select name="ser_team" id="ser_team">
															<option value="개인" <c:if test="${service.ser_team eq '개인'}">selected</c:if>>개인</option>
															<option value="2인이상 5인미만" <c:if test="${service.ser_team eq '2인이상 5인미만'}">selected</c:if>>2인이상 5인미만</option>
															<option value="5인이상 20인 미만" <c:if test="${service.ser_team eq '5인이상 20인 미만'}">selected</c:if>>5인이상 20인 미만</option>
															<option value="20인 이상" <c:if test="${service.ser_team eq '20인 이상'}">selected</c:if>>20인 이상</option>
													</select></td>
												</tr>
												<tr>
													<td class="sertb">개발 언어</td>
													<td colspan="2"><input type="text" id="ser_lang"
														value="${service.ser_lang }" name="ser_lang"
														placeholder="Java/C/Python"></td>
												</tr>
												<tr>
													<td class="sertb">프레임워크</td>
													<td colspan="2"><input type="text" id="ser_frame"
														value="${service.ser_frame }" name="ser_frame"
														placeholder="Spring/Django/Angular"></td>
												</tr>
												<tr>
													<td class="sertb">DBMS</td>
													<td colspan="2"><input type="text" id="ser_dbms"
														value="${service.ser_dbms }" name="ser_dbms"
														placeholder="Oracle/MongoDB/Mysql"></td>
												</tr>
												<tr>
													<td>서비스방식<span class="spanstar">*</span></td>
													<td colspan="3">
														<input type="radio" name="ser_line" value="온라인" <c:if test="${service.ser_line eq '온라인'}">checked="checked"</c:if>>온라인 
														<input type="radio" name="ser_line" value="오프라인"  <c:if test="${service.ser_line eq '오프라인'}">checked="checked"</c:if>>오프라인 
														<input type="radio" name="ser_line" value="온/오프라인" <c:if test="${service.ser_line eq '온/오프라인'}">checked="checked"</c:if>>온/오프라인</td>
												</tr>
												<tr>
													<td>서비스 기본가격<span class="spanstar">*</span></td>
													<td colspan="3">
														<input type="number" id="ser_price" name="ser_price" value="${service.ser_price }" required>
													</td>
												</tr>
												<tr>
													<td>서비스 설명<span class="spanstar">*</span></td>
													<td colspan="3">
														<textarea cols="78" rows="4" id="ser_sub" name="ser_sub" required>${service.ser_sub }</textarea>
													</td>
												</tr>
												<tr>
													<td>서비스 제공절차</td>
													<td colspan="3">
														<textarea cols="78" rows="4" id="ser_offer" name="ser_offer">${service.ser_offer }</textarea>
													</td>
												</tr>
												<tr>
													<td>서비스 메인이미지<span class="spanstar">*</span></td>
													<td colspan="3">
														<input type="file" name="file" id="file">
														<c:if test="${service.ser_imgorigin ne null}">
															<span class="fileChange">기존 파일: ${service.ser_imgorigin }</span>
														</c:if>
													</td>
												</tr>
												<tr>
													<td>서비스 상세이미지</td>
													<td colspan="3">
														<span style="font-size: 10px; color: gray;">※첨부파일은 최대 3개까지 등록이 가능합니다.</span>
														<br />														
														<input id="subfile" name="subfile" type="file" >
														<br />
														<input id="subfile2" name="subfile2" type="file">
														<br />							
														<input id="subfile3" name="subfile3" type="file" > 
														<br />
														
														<c:if test="${service.ser_originsub ne null}">
															<span class="subfile">${service.ser_originsub }</span>
															<span class="subfile" style="color:red;font-size:12px;cursor:pointer;" onclick="fileDelete(1)">삭제</span>
															&nbsp;
														</c:if> 
															<input type="hidden" id="subfilex" name="subfilex" value="${service.ser_originsub }">
														<c:if test="${service.ser_originsub2 ne null}">
															<span class="subfile2">${service.ser_originsub2 }</span> 
															<span class="subfile2" style="color:red;font-size:12px;cursor:pointer;" onclick="fileDelete(2)">삭제</span>
															&nbsp;
														</c:if>
															<input type="hidden" id="subfilex2" name="subfilex2" value="${service.ser_originsub2 }">
														<c:if test="${service.ser_originsub3 ne null}">
															<span class="subfile3">${service.ser_originsub3 }</span>
															<span class="subfile3" style="color:red;font-size:12px;cursor:pointer;" onclick="fileDelete(3)">삭제</span>
														</c:if>
															<input type="hidden" id="subfilex3" name="subfilex3" value="${service.ser_originsub3 }">
													</td>
												</tr>
											</tbody>
										</table>
										<br />
										<div
											class="row d-flex justify-content-center align-items-center">
											<button class="genric-btn primary circle arrow btnbox">수정</button>
											&nbsp;&nbsp;&nbsp;
											<button class="genric-btn primary circle arrow btnbox"
												onclick="history.back();">취소</button>
										</div>
									</form>
								</div>
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
	
		/**
		 * 첨부파일로직
		 */
		$(function() {
			
			
			
			$('#btn-upload').click(function(e) {
				e.preventDefault();
				$('#input_file').click();
			});
			
			$('#ser_cate').on("change", function(){
				$.ajax({
					type : "POST",
					url : "subcategoryCall.do",
					data : {cat_no : $('#ser_cate').val()},
					dataType : "json",
					success : function(datas) {
						$('#ser_sub_cate').empty();
						let ul = document.getElementsByClassName('list')[2];
						while(ul.hasChildNodes()){
							ul.removeChild(ul.firstChild);
						}
						ul.innerHTML = "<li data-value class='option selected'>선택하세요.</li>";
						for(data of datas){
							$('#ser_sub_cate').append("<option value='"+ data.sub_no+"'>" + data.sub_name + "</option>");
							
							let ul = document.getElementsByClassName('list')[2];
							
							ul.innerHTML += "<li data-value='"+data.sub_no+"' class='option'>"+data.sub_name+"</li>";
						}
						document.getElementsByClassName('current')[1].innerHTML='선택하세요.';
					},
					error : function(xhr, status, error) {
						alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
						return false;
					}
				});
			})
			
			$.ajax({
				type : "POST",
				url : "subcategoryCall.do",
				data : {cat_no : $('#ser_cate').val()},
				dataType : "json",
				success : function(datas) {
					$('#ser_sub_cate').empty();
					let ul = document.getElementsByClassName('list')[2];
					while(ul.hasChildNodes()){
						ul.removeChild(ul.firstChild);
					}
					ul.innerHTML = "<li data-value class='option'>선택하세요.</li>";
					for(data of datas){
						if('${service.ser_sub_cate}' == data.sub_no){
							$('#ser_sub_cate').append("<option value='"+ data.sub_no+"' selected>" + data.sub_name + "</option>");
						}else{
							$('#ser_sub_cate').append("<option value='"+ data.sub_no+"'>" + data.sub_name + "</option>");							
						}
						
						let ul = document.getElementsByClassName('list')[2];
						if('${service.ser_sub_cate}' == data.sub_no){
							ul.innerHTML += "<li data-value='"+data.sub_no+"' class='option selected'>"+data.sub_name+"</li>";
							document.getElementsByClassName('current')[1].innerHTML=data.sub_name;
						}else{
							ul.innerHTML += "<li data-value='"+data.sub_no+"' class='option'>"+data.sub_name+"</li>";							
						}
					}
					
				},
				error : function(xhr, status, error) {
					alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
					return false;
				}
			})
		});

		

		/*
		 * 폼 submit 로직
		 */
		function registerAction() {
			
			if($("#sname").val() == ''){
				alert('서비스명을 입력해주세요!');
				return;
			}else if($('#ser_cate').val() == '' ){
				alert('1차 카테고리를 선택해주세요!');
				return;
			}else if($('#ser_sub_cate').val() == '' ){
				alert('2차 카테고리를 선택해주세요!');
				return;
			}else if($('#ser_price').val() == '' ){
				alert('가격을 입력해주세요!');
				return;
			}else if($('#ser_sub').val() == '' ){
				alert('서비스에 대한 설명을 입력해주세요!');
				return;
			}
			
			var form = $("form")[0];
			var formData = new FormData(form);
			
			
			 $.ajax({
				type : "POST",
				enctype : "multipart/form-data",
				url : "serviceUpdate.do",
				data : formData,
				processData : false,
				contentType : false,
				success : function(data) {
					if (data == "OK") {
						alert("수정이 완료되었습니다.");
						location.href="sellerService.do";
					} else
						alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
				},
				error : function(xhr, status, error) {
					alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
					return false;
				}
			}); 
			return false;
		}
		
		$('#file').on("change", function(){
			$('.fileChange').remove();
		})
		
		$('#subfile').on("change", function(){
			$('.subfile').remove();
		})
	
		$('#subfile2').on("change", function(){
			$('.subfile2').remove();
		})
		
		$('#subfile3').on("change", function(){
			$('.subfile3').remove();
		})
		
		function fileDelete(num){
			if(num == 1){
				$("#subfilex").val('');
				$('.subfile').remove();
			}else if(num == 2){
				$("#subfilex2").val('');
				$('.subfile2').remove();
			}else{
				$("#subfilex3").val('');
				$('.subfile3').remove();
			}
			
		}
		
	</script>
</body>
</html>