<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS here -->


<style>
      .container {
    max-width: 93.5rem;
    margin: 0 auto;
    padding: 0 2rem;
}

.bttn {
    display: inline-block;
    font: inherit;
    background: none;
    border: none;
    color: inherit;
    padding: 0;
    cursor: pointer;
}

.bttn:focus {
    outline: 0.5rem auto #4d90fe;
}

.visually-hidden {
    position: absolute !important;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px, 1px, 1px, 1px);
}

/* Profile Section */

.profile {
    padding: 5rem 0;
    padding-bottom: 1rem;
}

.profile::after {
    content: "";
    display: block;
    clear: both;
}

.profile-image {
    float: left;
    width: calc(33.333% - 1rem);
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 3rem;
}

.profile-image img {
    border-radius: 50%;
}

.profile-user-settings,
.profile-stats,
.profile-bio {
    float: left;
    width: calc(66.666% - 2rem);
}

.profile-user-settings {
    margin-top: 1.1rem;
}

.profile-user-name {
    display: inline-block;
    font-size: 3.2rem;
    font-weight: 300;
}

.profile-edit-bttn {
    font-size: 1.4rem;
    line-height: 1.8;
    border: 0.1rem solid #dbdbdb;
    border-radius: 0.3rem;
    padding: 0 2.4rem;
    margin-left: 2rem;
}

.profile-settings-bttn {
    font-size: 2rem;
    margin-left: 1rem;
}

.profile-stats {
    margin-top: 2.3rem;
}

.profile-stats li {
    display: inline-block;
    font-size: 1.6rem;
    line-height: 1.5;
    margin-right: 4rem;
    cursor: pointer;
}

.profile-stats li:last-of-type {
    margin-right: 0;
}

.profile-bio {
    font-size: 1.6rem;
    font-weight: 400;
    line-height: 1.5;
    margin-top: 2.3rem;
}

.profile-real-name,
.profile-stat-count,
.profile-edit-bttn {
    font-weight: 600;
}



/* Gallery Section */

.gallery {
    display: flex;
    flex-wrap: wrap;
    margin: -1rem -1rem;
    padding-bottom: 3rem;
}

.gallery-item {
    position: relative;
    flex: 1 0 22rem;
    margin: 1rem;
    color: #fff;
    cursor: pointer;
}

.gallery-item:hover .gallery-item-info,
.gallery-item:focus .gallery-item-info {
    display: flex;
    justify-content: center;
    align-items: center;
    position: absolute;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.3);
}

.gallery-item-info {
    display: none;
}

.gallery-item-info li {
    display: inline-block;
    font-size: 1.7rem;
    font-weight: 600;
}

.gallery-item-likes {
    margin-right: 2.2rem;
}

.gallery-item-type {
    position: absolute;
    top: 1rem;
    right: 1rem;
    font-size: 2.5rem;
    text-shadow: 0.2rem 0.2rem 0.2rem rgba(0, 0, 0, 0.1);
}

.fa-clone,
.fa-comment {
    transform: rotateY(180deg);
}

.gallery-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* Loader */

.loader {
    width: 5rem;
    height: 5rem;
    border: 0.6rem solid #999;
    border-bottom-color: transparent;
    border-radius: 50%;
    margin: 0 auto;
    animation: loader 500ms linear infinite;
}

/* Media Query */

@media screen and (max-width: 40rem) {
    .profile {
        display: flex;
        flex-wrap: wrap;
        padding: 4rem 0;
    }

    .profile::after {
        display: none;
    }

    .profile-image,
    .profile-user-settings,
    .profile-bio,
    .profile-stats {
        float: none;
        width: auto;
    }

    .profile-image img {
        width: 7.7rem;
    }

    .profile-user-settings {
        flex-basis: calc(100% - 10.7rem);
        display: flex;
        flex-wrap: wrap;
        margin-top: 1rem;
    }

    .profile-user-name {
        font-size: 2.2rem;
    }

    .profile-edit-bttn {
        order: 1;
        padding: 0;
        text-align: center;
        margin-top: 1rem;
    }

    .profile-edit-bttn {
        margin-left: 0;
    }

    .profile-bio {
        font-size: 1.4rem;
        margin-top: 1.5rem;
    }

    .profile-edit-bttn,
    .profile-bio,
    .profile-stats {
        flex-basis: 100%;
    }

    .profile-stats {
        order: 1;
        margin-top: 1.5rem;
    }

    .profile-stats ul {
        display: flex;
        text-align: center;
        padding: 1.2rem 0;
        border-top: 0.1rem solid #dadada;
        border-bottom: 0.1rem solid #dadada;
    }

    .profile-stats li {
        font-size: 1.4rem;
        flex: 1;
        margin: 0;
    }

    .profile-stat-count {
        display: block;
    }
}
	.modal-open {
		padding-right:0px !important;
	}

/* Spinner Animation */

@keyframes loader {
    to {
        transform: rotate(360deg);
    }
}

/*

The following code will only run if your browser supports CSS grid.

Remove or comment-out the code block below to see how the browser will fall-back to flexbox & floated styling. 

*/

@supports (display: grid) {
    .profile {
        display: grid;
        grid-template-columns: 1fr 2fr;
        grid-template-rows: repeat(3, auto);
        grid-column-gap: 3rem;
        align-items: center;
    }

    .profile-image {
        grid-row: 1 / -1;
    }

    .gallery {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(22rem, 1fr));
        grid-gap: 2rem;
    }

    .profile-image,
    .profile-user-settings,
    .profile-stats,
    .profile-bio,
    .gallery-item,
    .gallery {
        width: auto;
        margin: 0;
    }

    @media (max-width: 40rem) {
        .profile {
            grid-template-columns: auto 1fr;
            grid-row-gap: 1.5rem;
        }

        .profile-image {
            grid-row: 1 / 2;
        }

        .profile-user-settings {
            display: grid;
            grid-template-columns: auto 1fr;
            grid-gap: 1rem;
        }

        .profile-edit-bttn,
        .profile-stats,
        .profile-bio {
            grid-column: 1 / -1;
        }

        .profile-user-settings,
        .profile-edit-bttn,
        .profile-settings-bttn,
        .profile-bio,
        .profile-stats {
            margin: 0;
        }
    }
}

/* 직접 설정한 스타일들!!!!!!!! */

.des{
	color: gray;
	font-size: 15px;
}
</style>
</head>
<body>
	<!-- Hero Start-->
	<div class="hero-area2short  slider-height2 hero-overly2 d-flex align-items-center ">
	</div>
	<!--Hero End -->
	<section class="mypage-section justify-content-center">
		<div class="container">
			<div class="row justify-content-center">
				<div class="profile">
					<div class="profile-image">
						<c:choose>
							<c:when test="${empty sellerInfo.s_img }">
								<img src="resources/user/assets/img/profile/search-default-profile.jpg" alt="" style="width: 155px; height: 155px;">
							</c:when>
							<c:otherwise>
								<img src="${sellerInfo.s_img }" alt="" style="width: 155px; height: 155px;">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="profile-user-settings">
						<h1 class="profile-user-name">${sellerInfo.s_nickname }</h1>
						<a href="sellerUpdate.do" class="bttn profile-edit-bttn" style="height: 30px; font-size: 15px;">정보 수정</a>
					</div>
					<div class="profile-stats">
						<ul>
							<li id="gradeinfo" style="font-size: 15px;">
								<c:choose>
									<c:when test="${sellerInfo.s_rank eq '1' }">
										<span class="profile-real-name" >등급 : 별</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="des">수수료 2% 감면혜택</span> 
									</c:when>
									<c:when test="${sellerInfo.s_rank eq '2' }">
										<span class="profile-real-name" >등급 : 달</span>&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;<span class="des">수수료 5% 감면혜택</span> 
									</c:when>
									<c:when test="${sellerInfo.s_rank eq '3' }">
										<span class="profile-real-name" >등급 : 태양</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="des">수수료 7% 감면혜택</span> 
									</c:when>
									<c:when test="${sellerInfo.s_rank eq '4' }">
										<span class="profile-real-name" >등급 : 지구</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="des">수수료 10% 감면혜택</span> 
									</c:when>
									<c:otherwise>
										<span class="profile-real-name" >등급 : 등급확인불가</span>&nbsp;&nbsp; 
									</c:otherwise>
								</c:choose>
								</li>
						</ul>
					</div>
					<div class="profile-bio">
						<p>
							<span class="profile-real-name">Email : </span> ${sellerInfo.s_email } <br />
							<c:if test="${empty rank }">
								<span class="profile-real-name">인기순위 : </span> -등
							</c:if>
							<c:if test="${not empty rank }">
								<span class="profile-real-name">인기순위 : </span> ${rank }등
							</c:if>
							
						</p>
					</div>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="blog_right_sidebar col-6" style="margin-top: 30px;">
					<aside class="single_sidebar_widget post_category_widget">
						<h4 class="widget_title">MYPAGE MENU</h4>
						<ul class="list cat-list">
							<li><a href="sellerService.do" class="d-flex">
									<p>서비스 관리</p>
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
							<li><a href="" class="d-flex" data-toggle="modal" data-target="#WithdrawalModal">
									<p>회원 탈퇴</p>
							</a></li>
						</ul>
					</aside>
				</div>
			</div>
		</div>
		<!-- End of profile section -->
	</section>
	<!-- Modal Start -->

	<!-- 탈퇴 경고 모달 -->
	<div class="modal fade" id="WithdrawalModal" tabindex="-1" role="dialog" aria-labelledby="WithdrawalModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">탈퇴하시겠습니까?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">회원정보가 삭제됩니다!</div>
				<div class="modal-footer">
					<a href="#" class="genric-btn danger radius" data-toggle="modal" data-target="#passConfirmModal" data-dismiss="modal">탈퇴</a>
					<a href="#" class="genric-btn primary radius"  data-dismiss="modal">취소</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 탈퇴 경고 모달 -->
	<!-- 탈퇴 비밀번호 확인 모달 -->
	<div class="modal fade" id="passConfirmModal" tabindex="-1" role="dialog" aria-labelledby="passConfirmModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">비밀번호를 입력해주세요:</label>
							<input type="password" class="form-control" id="passwordconfirm">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a href="#" type="submit" onclick="passconfirm()" class="genric-btn danger radius">탈퇴</a>
					<a href="#" class="genric-btn primary radius"  data-dismiss="modal">취소</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 탈퇴 비밀번호 확인 모달 -->
	
	<!-- 진행 서비스 있으면 탈퇴 못함 -->
	<div class="modal fade" id="noservice" tabindex="-1" role="dialog" aria-labelledby="noservice" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">탈퇴 불가</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					진행중인 서비스가 있으면 탈퇴가 불가능합니다.
				</div>
				<div class="modal-footer">
					<a href="#" class="genric-btn info radius" data-dismiss="modal">확인</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 진행 서비스 있으면 탈퇴 못함 -->
	
	
	<script>
	 $(document).ready(function(){
         $('[data-toggle="tooltip"]').tooltip();   
     });
	 
     function passconfirm() {
			var pcfrm = $("#passwordconfirm").val()
			console.log(pcfrm);       
            if(pcfrm == "") {
            	alert("비밀번호를 입력해주세요");
            }else {
	            $.ajax ({
	            	url: "deleteSeller.do",
	            	type: "POST",
	            	data: {
	            		dPassword: pcfrm
	            	},
	            	dataType: "text",
	            	success: function(data) {
	            		console.log(data);
	            		if(data == "codeP") {
	            			alert("비밀번호가 틀렸습니다.");
	            		} else if(data == "codeS") {
	            			$("#passConfirmModal").modal('hide');
	                    	$("#noservice").modal('show');
	                    	$("#passwordconfirm").val("");
	            		} else if(data == "codeD") {
	            			sessionStorage.clear();
	            			location.href = "home.do"
	            			alert("탈퇴되었습니다.");
	            		}
	            	}
	            })            	
            }
            
		}
	</script>
<!-- Modal End -->
</body>
</html>