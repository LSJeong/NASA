<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link rel="stylesheet" href="resources/user/assets/css/buyHistoryCard.css">
   <link rel="stylesheet" href="resources/user/assets/css/coupons.css">
</head>

<body>
<!-- Hero Start-->
<div class="hero-area2short  slider-height2 hero-overly2 d-flex align-items-center ">
</div>
<!--Hero End -->
<!-- buyerCoupons Body Start -->
<section class="blog_area section-padding">
   <div class="container">
      <div class="row">
         <!-- sidebar Start -->
         <div class="col-3">
            <div class="blog_right_sidebar">
               <aside class="single_sidebar_widget post_category_widget">
                  <h4 class="widget_title">Menu</h4>
                  <ul class="list cat-list">
                     <li>
                        <a href="buyHistory.do" class="d-flex">
                           <p>구매내역</p>
                        </a>
                     </li>
                     <li>
                        <a href="buyerCalendar.do" class="d-flex">
                           <p>일정관리</p>
                        </a>
                     </li>
                     <li>
                        <a href="buyerCoupons.do" class="d-flex">
                           <p style="font-weight: bold;">보유쿠폰</p>
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
         <!-- sidbar End -->
         <div class="col-9">
            <!-- <div style="margin-top: 40px; border-bottom: 1px solid #eee;">
               <p><a href="goBuyerMypage.do" style="color: black;">마이페이지</a> > 보유쿠폰</p>
            </div> -->
            <div class="blog_left_sidebar">
               <div class="blog_details">
               <a class="d-inline-block">
                     <h2>보유쿠폰</h2>
                  </a>
                  <!-- GradeCard Start -->
                  <div class="blog-card">
                     <div class="meta">
                        <div class="photo" style="background-image: url(resources/user/assets/img/test/sun.png)">
                        </div>
                        <ul class="details">
							<c:choose>
								<c:when test="${buyerinfo.b_rank  eq '1'}">
									<li>별 등급</li>
								</c:when>
								<c:when test="${buyerinfo.b_rank  eq '2'}">
									<li>달 등급</li>
								</c:when>
								<c:when test="${buyerinfo.b_rank  eq '3'}">
									<li>태양 등급</li>
								</c:when>
								<c:when test="${buyerinfo.b_rank  eq '4'}">
									<li>지구 등급</li>
								</c:when>
							</c:choose>
							<li>10% 할인 혜택</li>
							<li><a href="#">등급에 대해서 궁금하다면?</a></li>
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
                        <!-- <h1>태양 등급</h1>
                        <h2>SUN GRADE</h2> -->
                        <p><br>현재 누적 금액 10,000,000원<br>다음 등급 까지 2,000,000원</p>
                     </div>
                  </div>
                  <!-- GradeCard End -->   
                  <!-- Coupons Start -->
                  <div class="row justify-content-center" style="margin-top:20px">
                     <div class="coupons" style="width:700px;">
                        <div class="coupon">
                           <div class="coupon-intro">
                              <h4>${couponinfo.cou_id }</h4>
                              <ul>
                                 <li>최대 200,000 할인</li>
                                 <li id="couponEndDate">2022-02-01 ~ 2022-03-01</li>
                              </ul>
                           </div>
                           <div class="coupon-value">${couponinfo.cou_discount } %</div>
                        </div>
   
                        <!-- <div class="coupon">
                           <div class="coupon-end-intro">
                              <h4>20% 할인 쿠폰</h4>
                              <ul>
                                 <li>최대 200,000 할인</li>
                                 <li>2022-02-01 ~ 2022-02-15</li>
                              </ul>
                           </div>
                           <div class="coupon-value">20 %</div>
                        </div> -->
                     </div>
                  </div>
                  <!-- Coupons End -->
               </div>
            </div>            
         </div>
      </div>
   </div>
   <!-- buyerCoupons Body End -->
</section>
   
</body>

</html>