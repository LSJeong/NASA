<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .card {
            border-color: darkgrey;
            cursor: pointer;
        }
        .card-body:hover {
            background: white;
        }
        .card-body {
            padding: 11rem;
            background-color: #c1a7d3;
        }
        .card-font {            
            margin-top: 1em;
            text-align: center;
            color: black;
            font-size: 2em;
            font-weight: bold;
        }
    </style>
</head>
<body>
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

	<!-- ================ contact section start ================= -->
	<section class="contact-section">
		<div class="container">
			<div class="row d-flex justify-content-center align-items-center">
				<div class="col-lg-12">
					<div class="row d-flex justify-content-between mx-5">
						<div class="card" onClick="location.href='sellerPersonjoin.do'">
							<div class="card-body">
								<img src="resources/user/assets/img/buyerjoin1.png" alt=""
									style="width: 150px;">
								<p class="card-font">개인판매자</p>
							</div>
						</div>
						<div class="card" onClick="location.href='sellerCompanyjoin.do'">
							<div class="card-body">
								<img src="resources/user/assets/img/buyerjoin2.png" alt=""
									style="width: 150px;">
								<p class="card-font">기업판매자</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container"></div>
</body>
</html>